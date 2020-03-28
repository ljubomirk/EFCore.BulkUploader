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
using WebApp.ViewModels;

namespace WebApp.Controllers
{
    //[Authorize]
    [Route("Management/[action]")]
    public class ManagementController : Controller
    {
        private readonly RepositoryServices _repo;

        public ManagementController(ApplicationDbContext context)
        {
            _repo = new RepositoryServices(context);
        }

        /// <summary>
        /// View List of promotions
        /// </summary>
        /// <returns>Opens list of promotions</returns>
        public IActionResult ListPromotions()
        {
            PromotionListViewModel model = new PromotionListViewModel();
            return View("PromotionList",model);
        }

        public IActionResult CreatePromotion()
        {
            PromotionDetailsViewModel model = new PromotionDetailsViewModel();
            return View("PromotionDetails", model);
        }

        [Route("{Id}")]
        public IActionResult EditPromotion(long Id)
        {
            PromotionDetailsViewModel model = new PromotionDetailsViewModel();
            return View("PromotionDetails", model);
        }

        [Route("{Id}")]
        public IActionResult SavePromotion(long Id)
        {
            PromotionDetailsViewModel model = new PromotionDetailsViewModel();
            return View("PromotionDetails", model);
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
