using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using CouponDatabase.Lifecycle;
using CouponDatabase.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using WebApp.Data;
using WebApp.Models;
using WebApp.Services;
using WebApp.ViewModels;
using static CouponDatabase.Models.Coupon;

namespace WebApp.Controllers
{

    //[Authorize]
    [Route("Lifecycle/[action]")]
    public class LifecycleController : Controller
    {
        private readonly RepositoryServices _repo;
        public LifecycleController(ApplicationDbContext context)
        {      
             _repo = new RepositoryServices(context);
           
        }

        /// <summary>
        /// Show initial Lifecycle search page or after Back from list of coupons
        /// </summary>
        /// <returns>Opens Lifecycle search page</returns>
        [HttpGet]
        public IActionResult Index(Filters filter)
        {
            LifecycleSearchViewModel model = new LifecycleSearchViewModel();
            model.PromotionFilter = new Filters() { ShowActive = true, ShowInactive = false, ValidFrom = DateTime.Today, ValidUntil = DateTime.Today.AddMonths(1) };
            model.PromotionFilter.Properties = setModelProperties(_repo.GetAllProperties(), new List<Property>());
            model.CouponFilter = new CouponFilters() { ShowActive = true, ShowInactive = false, ValidFrom = DateTime.Today, ValidUntil = DateTime.Today.AddMonths(1) };
            
            model.CouponFilter.AwardChannels = setModelAwardChannels(_repo.GetAllAwardChannels(), new List<AwardChannel>());
            model.CouponFilter.IssuerChannels = setModelIssuerChannels(_repo.GetAllIssuerChannels(), new List<IssuerChannel>());
            model.CouponFilter.CurrentStatus = setModelCurrentStatus(_repo.GetCouponStatuses(), new List<CurrentStatus>());
            model.CouponFilter.Properties = setModelProperties(_repo.GetAllProperties(), new List<Property>());

            return View("LifecycleSearch", model);
        }

        // <summary>
        /// View List of promotions
        /// </summary>
        /// <returns>Opens list of filtered promotions</returns>
        [HttpPost]
        public IActionResult Search(Filters promotionFilter, CouponFilters couponFilter)
        {
            LifecycleSearchViewModel model = new LifecycleSearchViewModel();

            List<Promotion> filteredListOfPromotions = new List<Promotion>();
            List<Coupon> filteredListOfCoupons = new List<Coupon>();

            if (promotionFilter.ShowActive)
                filteredListOfPromotions.AddRange(_repo.GetAllPromotions().Where(x => x.Active == true).ToList<Promotion>());
            if (promotionFilter.ShowInactive)
                filteredListOfPromotions.AddRange(_repo.GetAllPromotions().Where(x => x.Active == false).ToList<Promotion>());

            if (promotionFilter.ValidFrom != null && promotionFilter.ValidUntil != null)
            {
                filteredListOfPromotions.AddRange(_repo.GetAllPromotions().Where(x => x.ValidFrom >= promotionFilter.ValidFrom && x.ValidTo <= promotionFilter.ValidUntil).ToList<Promotion>());
            }
            else if (promotionFilter.ValidFrom != null || promotionFilter.ValidUntil != null)
            {
                if (promotionFilter.ValidFrom != null)
                    filteredListOfPromotions.AddRange(_repo.GetAllPromotions().Where(x => x.ValidFrom >= promotionFilter.ValidFrom).ToList<Promotion>());
                if (promotionFilter.ValidUntil != null)
                    filteredListOfPromotions.AddRange(_repo.GetAllPromotions().Where(x => x.ValidTo <= promotionFilter.ValidUntil).ToList<Promotion>());
            }

            if (promotionFilter.Code != null)
            {
                if (filteredListOfPromotions.Count > 0)
                {
                    filteredListOfPromotions = filteredListOfPromotions.Where(x => x.Code.Contains(promotionFilter.Code)).ToList<Promotion>();
                }
                else
                {
                    filteredListOfPromotions.AddRange(_repo.GetAllPromotions().Where(x => x.Code.Contains(promotionFilter.Code)).ToList<Promotion>());
                }
            }

            model.Promotions.AddRange(filteredListOfPromotions);


            model.Coupons.Add(new Coupon() { Code = "EASTER12343566", Id = 1, AquireFrom = DateTime.Today, AquireTo = DateTime.Today.AddMonths(1), CouponSeries = 1, PromotionId = 1, User = "38640440480", Status = (int)CouponStatus.Created });
            model.PromotionFilter = promotionFilter;

            return View("LifecycleCoupons", model);
        }

        [HttpPost]
        public IActionResult Update(LifecycleUpdateViewModel model)
        {
            foreach(CouponCommand command in model.CouponsSelected)
            {
                command.Status = CommandStatus.Valid;
            }
            return View("LifecycleCoupons", model);
        }

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
                    checkedItems.Add(new CheckedItem { Checked = true, Label = issuerChannel.Name, Id = issuerChannel.Id });
                }
                else
                {
                    checkedItems.Add(new CheckedItem { Checked = false, Label = issuerChannel.Name, Id = issuerChannel.Id });
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
                    checkedItems.Add(new CheckedItem { Checked = true, Label = awardChannels.Name, Id = awardChannels.Id });
                }
                else
                {
                    checkedItems.Add(new CheckedItem { Checked = false, Label = awardChannels.Name, Id = awardChannels.Id });
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
                    checkedItems.Add(new CheckedItem { Checked = true, Label = property.Name, Id = property.Id });
                }
                else
                {
                    checkedItems.Add(new CheckedItem { Checked = false, Label = property.Name, Id = property.Id });
                }
            }
            return checkedItems;
        }

        private List<CheckedItem> setModelCurrentStatus(List<CurrentStatus> allProperties, List<CurrentStatus> couponStatuses)
        {
            List<CheckedItem> checkedItems = new List<CheckedItem>();
            foreach (CurrentStatus property in allProperties)
            {
                if (couponStatuses.Contains(property))
                {
                    checkedItems.Add(new CheckedItem { Checked = true, Label = property.Name, Id = property.Id });
                }
                else
                {
                    checkedItems.Add(new CheckedItem { Checked = false, Label = property.Name, Id = property.Id });
                }
            }
            return checkedItems;
        }

        private bool updatePromotionFields(PromotionDetailsViewModel viewModel, long Id)
        {
            List<PromotionProperty> promotionProperties = new List<PromotionProperty>();
            List<PromotionAwardChannel> promotionAwardChannels = new List<PromotionAwardChannel>();
            List<PromotionIssuerChannel> promotionIssuerChannels = new List<PromotionIssuerChannel>();

            foreach (var item in viewModel.Properties.Where(x => x.Checked == true).ToList<CheckedItem>())
            {
                promotionProperties.Add(new PromotionProperty() { PromotionId = Id, PropertyId = item.Id });
            }
            foreach (var item in viewModel.AwardChannels.Where(x => x.Checked == true).ToList<CheckedItem>())
            {
                promotionAwardChannels.Add(new PromotionAwardChannel() { PromotionId = Id, AwardChannelId = item.Id });
            }
            foreach (var item in viewModel.IssuerChannels.Where(x => x.Checked == true).ToList<CheckedItem>())
            {
                promotionIssuerChannels.Add(new PromotionIssuerChannel() { PromotionId = Id, IssuerChannelId = item.Id });
            }

            return _repo.updatePromotionFields(viewModel.Promotion.Id, promotionProperties, promotionAwardChannels, promotionIssuerChannels);
        }

    }
}
