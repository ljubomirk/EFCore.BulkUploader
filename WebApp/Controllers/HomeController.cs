using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using WebApp.Data;
using WebApp.Models;
using WebApp.Services;

namespace WebApp.Controllers
{
    //[Authorize]
    public class HomeController : Controller
    {
        private readonly RepositoryServices _repo;

        public HomeController(ApplicationDbContext context)
        {
            _repo = new RepositoryServices(context);
        }

        public IActionResult Index()
        {
            return View();
        }
        public IActionResult Add(string code)
        {
            _repo.Add(code);
            return View();
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
