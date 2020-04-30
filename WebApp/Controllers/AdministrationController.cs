using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using CouponDatabase.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using WebApp.Data;
using WebApp.Services;
using WebApp.ViewModels;
using CouponSystem = CouponDatabase.Models.System;

namespace WebApp.Controllers
{
    public class AdministrationController : Controller
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
        public IActionResult Users(UsersViewModel model)
        {
            if(model==null)
                model = new UsersViewModel(_context.User.ToList<User>());
            return View("AdministrationUsers", model);
        }

        public IActionResult ExternalSystemsView()
        {
            ExternalSystemsViewModel model = new ExternalSystemsViewModel();
            model.AddSystems(_context.System.ToList<CouponSystem>());
            model.AddNotifyLists(_context.NotifyList.ToList<NotifyList>());
            model.AddChannels(_context.IssuerChannel.ToList<IssuerChannel>());
            return View("AdministrationChannels", model);
        }
        public IActionResult AddSystem(string name, string username, string password)
        {
            return ExternalSystemsView();
        }
        public IActionResult UpdateSystem(long id, string name, string username, string password)
        {
            return ExternalSystemsView();
        }
        public IActionResult DeleteSystem(long id)
        {
            return ExternalSystemsView();
        }
        public IActionResult AddNotifyList(long channelId, long systemId, string url)
        {
            return ExternalSystemsView();
        }
        public IActionResult UpdateNotifyList(long channelId, long systemId, string url)
        {
            return ExternalSystemsView();
        }
        public IActionResult DeleteNotifyList(long channelId, long systemId)
        {
            return ExternalSystemsView();
        }
        public IActionResult AccessHistory(AccessHistoryViewModel model)
        {
            if (model == null) {
                model = new AccessHistoryViewModel
                {
                    Filters = new AccessHistoryFilters()
                };
            }
            model.AddLogs(_context.AccessLog.ToList<AccessLog>());
            return View("AdministrationAccessHistory", model);
        }
    }
}