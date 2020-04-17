using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using WebApp.ViewModels;

namespace WebApp.Controllers
{
    public class AdministrationController : Controller
    {
        public IActionResult Users()
        {
            ContextData user = new ContextData();
            return View("AdministrationUsers", user);
        }
        public IActionResult Channels()
        {
            ContextData user = new ContextData();
            return View("AdministrationChannels", user);
        }
        public IActionResult AccessHistory()
        {
            ContextData user = new ContextData();
            return View("AdministrationAccessHistory", user);
        }
    }
}