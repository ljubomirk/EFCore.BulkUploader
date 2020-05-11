using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Controllers;
using Microsoft.AspNetCore.Mvc.Filters;
using Microsoft.Extensions.Logging;
using WebApp.Data;
using WebApp.Services;
using WebApp.ViewModels;

namespace WebApp.Controllers
{
    //[Authorize]
    public class HomeController : BaseController
    {
        private readonly RepositoryServices _repo;
        private ILogger _logger;

        public override void OnActionExecuting(ActionExecutingContext context)
        {
            base.OnActionExecuting(context);
            _repo.LogAppAccess(((ControllerActionDescriptor)context.ActionDescriptor).ActionName, _contextData?.AgentUsername, true);
        }
        public HomeController(ApplicationDbContext context, ILogger<HomeController> logger)
        {
            _repo = new RepositoryServices(context, logger);
            _logger = logger;
        }

        public IActionResult Index()
        {
            HomeViewModel model = new HomeViewModel(_contextData.AgentUsername, _contextData.AgentGroup);
            return View(model);
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel(_contextData.AgentUsername, _contextData.AgentGroup) { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
