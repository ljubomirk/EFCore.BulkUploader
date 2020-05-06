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
using CouponDatabase.Models;
using CouponSystem = CouponDatabase.Models.System;

namespace WebApp.Controllers
{
    public class AdministrationController : Controller
    {
        private readonly RepositoryServices _repo;
        private readonly ApplicationDbContext _context;
        private readonly ILogger<AdministrationController> _logger;
        private readonly ContextData _contextData;

        public AdministrationController(ApplicationDbContext context, ILogger<AdministrationController> logger)
        {
            _repo = new RepositoryServices(context, logger);
            _context = context;
            _logger = logger;
            _contextData = new ContextData();
        }

        public override void OnActionExecuting(ActionExecutingContext context)
        {
            _repo.LogAppAccess(((ControllerActionDescriptor)context.ActionDescriptor).ActionName, _contextData.AgentUsername, true);
            base.OnActionExecuting(context);
        }
        public IActionResult Users(UsersViewModel model)
        {
            if(model.Users==null)
                model = new UsersViewModel(_context.User.ToList<User>());
            return View("AdministrationUsers", model);
        }

        public IActionResult UpdateUsers(UsersViewModel model)
        {
            model = new UsersViewModel(_context.User.ToList<User>());
            model.Users.Add(new User() { AccessType = AccessTypeEnum.Manager, Username = "manga", Fullname = "Marko Menađerović", Domain = "MANGA-PC" });
            ViewBag.Command = new Command(CommandStatus.Valid);
            return Users(model);
        }

        public IActionResult ExternalSystemsView()
        {
            ExternalSystemsViewModel model = new ExternalSystemsViewModel();
            model.AddSystems(_context.System.ToList<CouponSystem>());
            model.AddNotifyLists(_context.NotifyList.ToList<NotifyList>());
            model.AddChannels(_context.IssuerChannel.ToList<IssuerChannel>());
            return View("AdministrationChannels", model);
        }
        public IActionResult SystemDetails(CouponSystem model)
        {
            return PartialView("_ChannelsSystemsModal", model);
        }
        public IActionResult AddSystem(CouponSystem model)
        {
            ViewBag.Command = _repo.AddSystem(model);
            return ExternalSystemsView();
        }
        public IActionResult UpdateSystem(CouponSystem model)
        {
            ViewBag.Command = _repo.UpdateSystem(model);
            return ExternalSystemsView();
        }
        public IActionResult DeleteSystem(long id)
        {
            ViewBag.Command = _repo.DeleteSystem(id);
            return ExternalSystemsView();
        }
        public IActionResult NotifyListDetails(ExternalSystemsViewModel model)
        {
            if(model.Channels==null && model.Systems == null)
            {
                model = new ExternalSystemsViewModel();
                model.AddDropChannels(_context.IssuerChannel.ToList<IssuerChannel>());
                model.AddDropSystems(_context.System.ToList<CouponSystem>());
                model.AddNotifyLists(_context.NotifyList.ToList<NotifyList>());
            }
            return PartialView("_ChannelsNotifyListModal", model);
        }
        public IActionResult AddNotifyList(NotifyList model)
        {
            ViewBag.Command = _repo.AddNotifyList(model);
            return ExternalSystemsView();
        }
        public IActionResult UpdateNotifyList(NotifyList model)
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
                model = new AccessHistoryViewModel
                {
                    Filters = new AccessHistoryFilters()
                };
            }
            model.AddLogs(_context.AccessLog.ToList<AccessLog>());
            return View("AdministrationAccessHistory", model);
        }
        public IActionResult FilteredListAccessHistory(AccessHistoryFilters filter)
        {
            AccessHistoryViewModel model = new AccessHistoryViewModel();
            //model.AddLogs(_context.AccessLog.ToList<AccessLog>());

            AccessHistoryFilters filters = new AccessHistoryFilters(_context);

            List<AccessLog> filteredListOfAccessLogs = filters.GetFilteredAccessHistory(filter);

            model.AddLogs(filteredListOfAccessLogs);
            model.Filters = filter;
            return View("AdministrationAccessHistory", model);
        }

        
    }
}