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

        List<Promotion> promos = new List<Promotion>();//test data
        public ManagementController(ApplicationDbContext context)
        {
            _repo = new RepositoryServices(context);
            //test data
            promos.Add(new Promotion()
            {
                Id = 1,
                Code = "BOBNewYear",
                ValidFrom = DateTime.Parse("01.01.2020"),
                ValidTo = DateTime.Parse("01.04.2020"),
            }
                    );
            promos.Add(new Promotion()
            {
                Id = 2,
                Code = "Easter2020",
                ValidFrom = DateTime.Parse("01.04.2020"),
                ValidTo = DateTime.Parse("01.06.2020")
            }
            );
            promos.Add(new Promotion()
            {
                Id = 3,
                Code = "Happy4thJuly",
                ValidFrom = DateTime.Parse("01.06.2020"),
                ValidTo = DateTime.Parse("01.09.2020"),
            }
            );
        }

        /// <summary>
        /// View List of promotions
        /// </summary>
        /// <returns>Opens list of promotions</returns>
        [HttpGet]
        public IActionResult ListPromotions()
        {
            PromotionListViewModel model = new PromotionListViewModel();
            model.Promotions = promos;
            return View("PromotionList",model);
        }

        [HttpGet]
        public IActionResult CreatePromotion()
        {
            PromotionDetailsViewModel model = new PromotionDetailsViewModel();
            return View("PromotionDetails", model);
        }

        [Route("{Id}")]
        [HttpGet]
        public IActionResult EditPromotion(long Id)
        {
            var promo = promos.Find(i => i.Id == Id);
            if (promo == null) RedirectToAction("Error");
            PromotionDetailsViewModel model = new PromotionDetailsViewModel
            {
                Promotion = promo
            };
            return View("PromotionDetails", model);
        }

        [HttpPost]
        public IActionResult SavePromotion(PromotionDetailsViewModel viewModel)
        {
            
            var promo = promos.Find(i => i.Id == viewModel.Promotion.Id);
            if (promo == null) RedirectToAction("Error");
            promo.ValidFrom = viewModel.Promotion.ValidFrom;
            promo.ValidTo = viewModel.Promotion.ValidFrom;
            return View("PromotionDetails", viewModel);
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
