using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using CouponDatabase.Models;
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
        [HttpGet]
        public IActionResult ListPromotions()
        {
            PromotionListViewModel model = new PromotionListViewModel();
            model.Promotions.AddRange(_repo.GetAllPromotions());
            model.Filter = new Filters();
            return View("PromotionList",model);
        }

        [HttpGet]
        public IActionResult CreatePromotion(Promotion promotion)
        {
            PromotionDetailsViewModel model = new PromotionDetailsViewModel();
            _repo.CreatePromotion(promotion);
            return View("PromotionDetails", model);
        }

        [Route("{Id}")]
        [HttpGet]
        public IActionResult EditPromotion(long Id)
        {
           // if (promo == null) RedirectToAction("Error");
            PromotionDetailsViewModel model = new PromotionDetailsViewModel
            {
                Promotion = _repo.GetAllPromotions().Find(i => i.Id == Id),
                Properties = _repo.GetAllPromotionProperties(Id),
                AwardChannels = _repo.GetAllPromotionAwardChannels(Id),
                IssuerChannels = _repo.GetAllPromotionIssuerChannels(Id)
            };
            return View("PromotionDetails", model);
        }

        [HttpPost]
        public IActionResult SavePromotion(PromotionDetailsViewModel viewModel)
        {
            
            var promo = _repo.GetAllPromotions().Find(i => i.Id == viewModel.Promotion.Id);
            if (promo == null) 
            {
                ViewBag.CommandStatus = "[ERROR]";
                ViewBag.CommandMessage = "Promotion with that ID not found.";
            }
            else
            {
                ViewBag.CommandStatus = "[OK]";
                ViewBag.CommandMessage = "Promotion saved.";
            }
            return View("PromotionDetails", viewModel);
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
