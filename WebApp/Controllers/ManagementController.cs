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

        // <summary>
        /// View List of promotions
        /// </summary>
        /// <returns>Opens list of filtered promotions</returns>
        [HttpGet]
        public IActionResult FilteredListPromotions(Filters filter)
        {
            PromotionListViewModel model = new PromotionListViewModel();
            List<Promotion> filteredListOfPromotions = new List<Promotion>();

            if (filter.ShowActive)
                filteredListOfPromotions.AddRange(_repo.GetAllPromotions().Where(x => x.Active == true).ToList<Promotion>());
            if (filter.ShowInactive)
                filteredListOfPromotions.AddRange(_repo.GetAllPromotions().Where(x => x.Active == false).ToList<Promotion>());

            if(filter.ValidFrom != null && filter.ValidUntil != null)
            {
                filteredListOfPromotions.AddRange(_repo.GetAllPromotions().Where(x => x.ValidFrom >= filter.ValidFrom && x.ValidTo <= filter.ValidUntil).ToList<Promotion>());
            }
            else if (filter.ValidFrom != null || filter.ValidUntil != null)
            {
                if (filter.ValidFrom != null)
                    filteredListOfPromotions.AddRange(_repo.GetAllPromotions().Where(x => x.ValidFrom>=filter.ValidFrom).ToList<Promotion>());
                if (filter.ValidUntil != null)
                    filteredListOfPromotions.AddRange(_repo.GetAllPromotions().Where(x => x.ValidTo <= filter.ValidUntil).ToList<Promotion>());
            }

            if (filter.Code != null)
            {
                if (filteredListOfPromotions.Count > 0)
                {
                    filteredListOfPromotions = filteredListOfPromotions.Where(x => x.Code.Contains(filter.Code)).ToList<Promotion>();
                }
                else
                {
                    filteredListOfPromotions.AddRange(_repo.GetAllPromotions().Where(x => x.Code.Contains(filter.Code)).ToList<Promotion>());
                }
            }

            model.Promotions.AddRange(filteredListOfPromotions);
            model.Filter = filter;
            return View("PromotionList", model);
        }

        /// <summary>
        /// Add coupon series
        /// </summary>
        /// <returns>Opens add coupon series form</returns>
        [HttpGet]
        public IActionResult AddCouponSeries()
        {
            CouponSeriesViewModel model = new CouponSeriesViewModel();
            return View("PromotionCouponSeries", model);
        }

        [HttpGet]
        public IActionResult Enable(long Id, bool enable)
        {
            Promotion promotion = _repo.GetPromotionWithId(Id);
            promotion.Enabled = enable;
            PromotionDetailsViewModel model = new PromotionDetailsViewModel
            {
                Promotion = promotion,
                Properties = setModelProperties(_repo.GetAllProperties(), _repo.GetPromotionProperties(Id)),
                AwardChannels = setModelAwardChannels(_repo.GetAllAwardChannels(), _repo.GetPromotionAwardChannels(Id)),
                IssuerChannels = setModelIssuerChannels(_repo.GetAllIssuerChannels(), _repo.GetPromotionIssuerChannels(Id))
            };
            _repo.UpdatePromotion(promotion);
            ViewBag.CommandStatus = "[OK]";
            ViewBag.CommandMessage = "Promotion saved.";

            return View("PromotionDetails", model);
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
                _repo.UpdatePromotion(viewModel.Promotion);
                ViewBag.CommandStatus = "[OK]";
                ViewBag.CommandMessage = "Promotion saved.";
            }
            return View("PromotionDetails", viewModel);
        }

        #region TEST
        [Route("{Id}")]
        [HttpGet]
        public IActionResult EditCouponSeries(long id)
        {
            ContextData user = new ContextData();
            return View("PromotionCouponSeries", user);
        }
        #endregion

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
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

    }
}
