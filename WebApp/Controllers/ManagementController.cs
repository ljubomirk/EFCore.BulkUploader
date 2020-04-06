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
                Promotion = _repo.GetPromotionWithId(Id),
                Properties = setModelProperties(_repo.GetAllProperties() , _repo.GetPromotionProperties(Id)),
                AwardChannels = setModelAwardChannels(_repo.GetAllAwardChannels() ,_repo.GetPromotionAwardChannels(Id)),
                IssuerChannels = setModelIssuerChannels(_repo.GetAllIssuerChannels() , _repo.GetPromotionIssuerChannels(Id))
            };
            return View("PromotionDetails", model);
        }

        private List<CheckedItem> setModelIssuerChannels(List<IssuerChannel> allIssuerChannels, List<IssuerChannel> promotionIssuerChannels)
        {
            List<CheckedItem> checkedItems = new List<CheckedItem>();
            foreach (IssuerChannel issuerChannel in allIssuerChannels)
            {
                if (promotionIssuerChannels.Contains(issuerChannel))
                {
                    checkedItems.Add(new CheckedItem { Checked = true, Label = issuerChannel.Name });
                }
                else
                {
                    checkedItems.Add(new CheckedItem { Checked = false, Label = issuerChannel.Name });
                }
            }
            return checkedItems;
        }

        private List<CheckedItem> setModelAwardChannels(List<AwardChannel> allAwardChannels, List<AwardChannel> promotionAwardChannels)
        {
            List<CheckedItem> checkedItems = new List<CheckedItem>();
            foreach (AwardChannel awardChannels in allAwardChannels)
            {
                if (promotionAwardChannels.Contains(awardChannels))
                {
                    checkedItems.Add(new CheckedItem { Checked = true, Label = awardChannels.Name });
                }
                else
                {
                    checkedItems.Add(new CheckedItem { Checked = false, Label = awardChannels.Name });
                }
            }
            return checkedItems;
        }

        private List<CheckedItem> setModelProperties(List<Property> allProperties, List<Property> promotionProperties)
        {
            List<CheckedItem> checkedItems = new List<CheckedItem>();
            foreach (Property property in allProperties)
            {
                if (promotionProperties.Contains(property))
                {
                    checkedItems.Add(new CheckedItem { Checked = true, Label = property.Name });
                }
                else
                {
                    checkedItems.Add(new CheckedItem { Checked = false, Label = property.Name });
                }
            }
            return checkedItems;
        }

        [HttpPost]
        public IActionResult SavePromotion(PromotionDetailsViewModel viewModel)
        {

            var promo = _repo.GetPromotionWithId(viewModel.Promotion.Id);
            if (promo == null) 
            {
                _repo.CreatePromotion(viewModel.Promotion);
                ViewBag.CommandStatus = "[OK]";
                ViewBag.CommandMessage = "Promotion created.";
            }
            else
            {
                _repo.UpdatePromotion(promo);
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
