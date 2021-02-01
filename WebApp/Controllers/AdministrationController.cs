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
using TripleI.ActiveDirectory;
using Microsoft.Extensions.Configuration;

namespace WebApp.Controllers
{
    [Authorize(Roles = "Coupon Admins")]
    public class AdministrationController : BaseController
    {
        private readonly RepositoryServices _repo;
        private readonly ApplicationDbContext _context;
        private readonly ILogger<AdministrationController> _logger;
        private readonly IConfiguration _options;

        public AdministrationController(ApplicationDbContext context, ILogger<AdministrationController> logger, IConfiguration options)
        {
            _repo = new RepositoryServices(context, logger);
            _context = context;
            _logger = logger;
            _options = options;
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
            string usr = _options["LdapService:User"];
            string pwd = _options["LdapService:Password"];
            string host = _options["LdapService:Host"];
            string domain = _options["LdapService:Domain"];
            using (LdapAuthorization ldap = new LdapAuthorization(usr, pwd, host, domain, _logger))
            {
                if (ldap.Connect())
                {
                    List<User> fetchedUsers = new List<User>();
                    IList<LdapAuthorization.User> listAdmins = ldap.SearchUsersInGroup(Constants.CouponAdmins);
                    foreach (LdapAuthorization.User user in listAdmins)
                    {
                        fetchedUsers.Add(new User() { Username = user.Username, Fullname = user.Fullname, Domain = user.Domain, AccessType = AccessTypeEnum.Administrator });
                    }
                    IList<LdapAuthorization.User> listManagers = ldap.SearchUsersInGroup(Constants.CouponAdmins);
                    foreach (LdapAuthorization.User user in listManagers)
                        fetchedUsers.Add(new User() { Username = user.Username, Fullname = user.Fullname, Domain = user.Domain, AccessType = AccessTypeEnum.Manager });
                    ViewBag.Command = _repo.UpdateUsers(fetchedUsers);
                }
                else
                    ViewBag.Command = new Command(CommandStatus.ErrorSystem);
            }
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