using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using CouponDatabase.Lifecycle;
using CouponDatabase.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Controllers;
using Microsoft.AspNetCore.Mvc.Filters;
using Microsoft.Extensions.Logging;
using WebApp.Data;
using WebApp.Services;
using WebApp.ViewModels;
using CouponSystem = CouponDatabase.Models.System;
using Microsoft.AspNetCore.Authorization;

namespace WebApp.Controllers
{
    [Authorize(Roles = "Coupon Admins")]
    public class AdministrationController : BaseController
    {
        private readonly RepositoryServices _repo;
        private readonly ApplicationDbContext _context;
        private readonly ILogger<AdministrationController> _logger;

        public AdministrationController(ApplicationDbContext context, ILogger<AdministrationController> logger)
        {
            _repo = new RepositoryServices(context, logger);
            _context = context;
            _logger = logger;
        }

        public override void OnActionExecuting(ActionExecutingContext context)
        {
            base.OnActionExecuting(context);
            _repo.LogAppAccess(((ControllerActionDescriptor)context.ActionDescriptor).ActionName, _contextData.AgentUsername, true);
        }
        public IActionResult Users()
        {
            List<User> users = _repo.GetAllUsers();
            UsersViewModel userModel = new UsersViewModel(_contextData.AgentUsername, _contextData.AgentGroup, users);
            return View("AdministrationUsers", userModel);
        }

        public IActionResult UpdateUsers(UsersViewModel model)
        {
            //_repo.ClearUsers();
            /*TripleI.ActiveDirectory.LdapAuthorization ldap = new TripleI.ActiveDirectory.LdapAuthorization();
            IList<string> list = ldap.SearchUsersInGroup(TripleI.ActiveDirectory.Constants.CouponAdmins);
            foreach (string user in list)
                _repo.AddUser(new CouponDatabase.Models.User(AccessTypeEnum.Administrator, user, "", ""));
            list = ldap.SearchUsersInGroup(TripleI.ActiveDirectory.Constants.CouponUsers);
            foreach (string user in list)
                _repo.AddUser(new CouponDatabase.Models.User(AccessTypeEnum.Manager, user, "", ""));*/
            ViewBag.Command = new Command(CommandStatus.Valid);
            return RedirectToAction("Users");
        }

        public IActionResult FilterUsers(UsersViewModel model)
        {
            List<User> users = new List<User>();
            if (model.Users == null)
            {
                foreach (CheckedItem item in model.AccessTypes)
                {
                    if (item.Checked)
                    {
                        foreach (User user in _repo.GetAllUsers().Where(y => (int)y.AccessType == item.Id))
                        {
                            users.Add(user);
                        }
                    }
                }
            }
            else
                users = model.Users;
            UsersViewModel userModel = new UsersViewModel(_contextData.AgentUsername, _contextData.AgentGroup, users);
            return View("AdministrationUsers", userModel);
        }

        public IActionResult ExternalSystemsView()
        {
            ExternalSystemsViewModel model = new ExternalSystemsViewModel(_contextData.AgentUsername, _contextData.AgentGroup);
            List<CouponSystem> systems = _repo.getAllSystems().ToList<CouponSystem>();
            List<ViewSystem> vSystems = new List<ViewSystem>();
            foreach(CouponSystem system in systems)
            {
                vSystems.Add(new ViewSystem() {
                    Id = system.Id, 
                    Name = system.Name, 
                    Username = system.Login, 
                    Password = "" 
                });
            }
            model.AddSystems(vSystems);
            model.AddNotifyLists(_context.NotifyList.ToList<NotifyList>());
            model.AddChannels(_context.IssuerChannel.ToList<IssuerChannel>());
            return View("AdministrationChannels", model);
        }
        public IActionResult SystemDetails(ViewSystem viewmodel)
        {
            return PartialView("_ChannelsSystemsModal", viewmodel);
        }
        public IActionResult AddSystem(ViewSystem viewmodel)
        {
            ViewBag.Command = _repo.AddSystem(viewmodel);
            return ExternalSystemsView();
        }
        public IActionResult UpdateSystem(ViewSystem viewmodel)
        {
            ViewBag.Command = _repo.UpdateSystem(viewmodel);
            return ExternalSystemsView();
        }
        public IActionResult DeleteSystem(long id)
        {
            ViewBag.Command = _repo.DeleteSystem(id);
            return ExternalSystemsView();
        }
        public IActionResult NotifyListDetails(ExternalSystemsViewModel model)
        {
            ExternalSystemsViewModel ret = new ExternalSystemsViewModel(_contextData.AgentUsername, _contextData.AgentGroup);
            if (model.Channels==null && model.Systems == null)
            {
                ret.AddDropChannels(_context.IssuerChannel.ToList<IssuerChannel>());
                ret.AddDropSystems(_context.Coupon_System.ToList<CouponSystem>());
                ret.AddNotifyLists(_context.NotifyList.ToList<NotifyList>());
            }
            return PartialView("_ChannelsNotifyListModal", ret);
        }
        public IActionResult AddNotifyList(ExternalSystemsViewModel model)
        {
            ViewBag.Command = _repo.AddNotifyList(model);
            return ExternalSystemsView();
        }
        public IActionResult UpdateNotifyList(ExternalSystemsViewModel model)
        {
            ViewBag.Command = _repo.UpdateNotifyList(model);
            return ExternalSystemsView();
        }
        public IActionResult DeleteNotifyList(long channelId, long systemId)
        {
            ViewBag.Command = _repo.deleteNotifyList(channelId, systemId);
            return ExternalSystemsView();
        }
        public IActionResult AccessHistory(AccessHistoryViewModel model)
        {
            if (model.Filters == null) {
                model = new AccessHistoryViewModel(_contextData.AgentUsername, _contextData.AgentGroup)
                {
                    Filters = new AccessHistoryFilters()
                };
            }
            model.AddLogs(_context.AccessLog.ToList<AccessLog>());
            return View("AdministrationAccessHistory", model);
        }
        public IActionResult FilteredListAccessHistory(AccessHistoryFilters filter)
        {
            AccessHistoryViewModel model = new AccessHistoryViewModel(_contextData.AgentUsername, _contextData.AgentGroup);
            //model.AddLogs(_context.AccessLog.ToList<AccessLog>());

            AccessHistoryFilters filters = new AccessHistoryFilters(_context);

            List<AccessLog> filteredListOfAccessLogs = filters.GetFilteredAccessHistory(filter);

            model.AddLogs(filteredListOfAccessLogs);
            model.Filters = filter;
            return View("AdministrationAccessHistory", model);
        }

        
    }
}