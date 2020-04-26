using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using CouponDatabase.Lifecycle;
using CouponDatabase.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
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
        private readonly ApplicationDbContext _context;

        public LifecycleController(ApplicationDbContext context)
        {      
             _repo = new RepositoryServices(context);
            _context = context;
        }

        /// <summary>
        /// Show initial Lifecycle search page or after Back from list of coupons
        /// </summary>
        /// <returns>Opens Lifecycle search page</returns>
        [HttpGet]
        public IActionResult Index()
        {
            LifecycleSearchViewModel initModel = new LifecycleSearchViewModel();
            initModel.PromotionFilter = new PromotionFilter() { ShowActive = true, ShowInactive = false, ValidFrom = DateTime.Today, ValidTo = DateTime.Today.AddMonths(1) };
            initModel.PromotionFilter.Properties = setModelProperties(_repo.GetAllProperties(), new List<Property>());
            initModel.CouponFilter = new CouponFilters() { ShowActive = true, ShowInactive = false, ValidFrom = DateTime.Today, ValidTo = DateTime.Today.AddMonths(1) };

            initModel.CouponFilter.AwardChannels = setModelAwardChannels(_repo.GetAllAwardChannels(), new List<AwardChannel>());
            initModel.CouponFilter.IssuerChannels = setModelIssuerChannels(_repo.GetAllIssuerChannels(), new List<IssuerChannel>());
            initModel.CouponFilter.CurrentStatus = setModelCurrentStatus(_repo.GetCouponStatuses(), new List<CurrentStatus>());
            initModel.CouponFilter.Properties = setModelProperties(_repo.GetAllProperties(), new List<Property>());

            return View("LifecycleSearch", initModel);
        }

        // <summary>
        /// View List of promotions
        /// </summary>
        /// <returns>Opens list of filtered promotions</returns>
        [HttpPost]
        public IActionResult Search(PromotionFilter promotionFilter, CouponFilters couponFilter)
        {
            /*
             * TO DO: 
             *  - add coupon filtering
             *  - store filtered coupons into model
             *  - store filtered promotions and coupons into session before returning view
             *  - figure out session storage (WIP)
             */

            LifecycleUpdateViewModel model = new LifecycleUpdateViewModel();
            Filters filters = new Filters(_context); // Filter model instance with filter methods

            // Filter promotions and coupons
            List<Promotion> f_ListOfPromotions = filters.GetFilteredPromotionList(promotionFilter, true);
            List<Coupon> f_ListOfCoupons = filters.GetFilteredCouponListForPromotions(_repo.GetCouponsForPromotions(f_ListOfPromotions), couponFilter);

            // Filter promotions by retrieved coupons
            IEnumerable<long> couponPromotionIds = f_ListOfCoupons.Select(c => c.PromotionId).Distinct().ToList();
            List<Promotion> couponPromotions = new List<Promotion>();
            foreach(long id in couponPromotionIds)
            {
                Promotion promotion = _repo.GetPromotionWithId(id);
                if(couponPromotions.FindAll(p => p.Id == promotion.Id).Count() == 0)
                {
                    couponPromotions.Add(promotion);
                }
            }

            // Dropdown data
            model.DropPromoCodes = getSelectListPromotions(couponPromotions);
            model.DropCouponSeries = new List<SelectListItem>(); //getSelectListSeries(f_ListOfCoupons); 
            model.DropCouponStatus = getSelectListStatus(_repo.GetCouponStatusList());
            model.DropEnabled = getSelectListEnabled();
            
            // Create CheckedItem elements from filtered Coupons
            // CouponList is used to bind data change on view
            // CouponList is populated from submit form with CheckedItem elements and passed into CouponUpdate
            model.CouponList.Coupon = new Coupon();
            model.CouponList.Coupons = f_ListOfCoupons;
            model.CouponList.CouponItems = setModelCouponList(f_ListOfCoupons);
            model.ValidTo = ""; // prevents default activation of Update Selection button on LifecycleCoupons view

            /*
             * TODO:
             * - Store CouponList to local state to be retrieved in next action if needed
             */

            return View("LifecycleCoupons", model);
        }

        /*
         * Updates filter results with selection from DropDown element.
         * Called on submit (DropDown change) from LifecycleCoupons view.
         */
        [HttpPost]
        public IActionResult UpdateSearchFilter(LifecycleUpdateViewModel model)
        {
            /*
             * TODO:
             * - get from session everything required for the update 
             *      - selected promotion code value
             *      - selected coupon series
             *      - coupon list
             *      - checkedcouponitem list
             *      - dropenable
             *      - dropstatus
             *      - droppromo
             *      - dropseries
             * - !!! update object references below accordingly !!!
             * - store new lists into session
             */

            Filters filters = new Filters(_context);
            CouponFilters couponFilter = new CouponFilters();
            PromotionFilter promotionFilter = new PromotionFilter();
            promotionFilter.ValidFrom = new DateTime(2020, 4, 1);
            promotionFilter.ValidTo = new DateTime(2020, 6, 1);

            // Filter promotions and coupons
            List<Promotion> init_ListOfPromotions = filters.GetFilteredPromotionList(promotionFilter, true); // store promos from initial filter to display in dropdown list
            List<Promotion> filter_ListOfPromotions = new List<Promotion>();
            Promotion promotion = new Promotion();

            // 
            if (model.SelectedPromoCode == null)
            {
                filter_ListOfPromotions = filters.GetFilteredPromotionList(promotionFilter, true);
            } else
            {
                // Get promo with ID and add into list
                promotion = _repo.GetPromotionWithId(Convert.ToInt64(model.SelectedPromoCode));
                filter_ListOfPromotions.Add(promotion);
                //filter_ListOfPromotions = filter_ListOfPromotions.Where(p => p.Code == model.SelectedPromoCode).ToList();
            }

            List<Coupon> filter_ListOfCoupons = filters.GetFilteredCouponListForPromotions(_repo.GetCouponsForPromotions(filter_ListOfPromotions), couponFilter);
            List<Coupon> drop_ListOfCoupons = filter_ListOfCoupons; // store coupons filtered by promotion to allow proper display of coupon series for that promotion in dropdown list



            // -- THRESHOLD BORDER -- // 


            // Manage promotion code dropdown
            if (model.SelectedPromoCode == null)
            {
                // populate with all matching promotion codes from initially filtered result
                model.DropPromoCodes = getSelectListPromotions(filter_ListOfPromotions);
            } else
            {
                model.DropPromoCodes = getSelectListPromotions(init_ListOfPromotions);

                List<SelectListItem> slit = new List<SelectListItem>();
                foreach (SelectListItem s in model.DropPromoCodes)
                {
                    if (s.Value == model.SelectedPromoCode)
                    {
                        s.Selected = true;
                    }
                    else
                    {
                        s.Selected = false;
                    }
                    slit.Add(s);
                }
                model.DropPromoCodes = slit;
            }


            // Manage coupon series dropdown
            if (model.SelectedCouponSeries != null)
            {
                filter_ListOfCoupons = filter_ListOfCoupons.Where(c => c.CouponSeries == Int32.Parse(model.SelectedCouponSeries)).ToList();
            }

            model.DropCouponSeries = getSelectListSeries(drop_ListOfCoupons);

            List<SelectListItem> cslit = new List<SelectListItem>();
            foreach (SelectListItem s in model.DropCouponSeries)
            {
                if (s.Value == model.SelectedCouponSeries)
                {
                    s.Selected = true;
                }
                else
                {
                    s.Selected = false;
                }
                cslit.Add(s);
            }


            model.DropCouponSeries = cslit;


            model.DropCouponStatus = getSelectListStatus(_repo.GetCouponStatusList());
            model.DropEnabled = getSelectListEnabled();
            model.CouponList.Coupon = new Coupon();
            model.CouponList.Coupons = filter_ListOfCoupons;
            model.ValidTo = "";


            /* WIP CODE . requires local storage for completion */
            CouponList couponList = new CouponList();
            // Set coupons to work with
            if (model.CouponList != null)
            {
                couponList = model.CouponList; // contains previously filtered coupon list
            }
            
            couponList.Coupons = filter_ListOfCoupons;
            model.SelectedPromoCode = model.SelectedPromoCode;
            model.SelectedCouponSeries = model.SelectedCouponSeries;
            couponList.CouponItems = setModelCouponList(couponList.Coupons);
            model.CouponList = couponList;

            return View("LifecycleCoupons", model);
        }

        /*
         * Updates coupons.
         * Used on LifecycleCoupons view for UpdateSelected action.
         */
        [HttpPost]
        public IActionResult UpdateCoupons(LifecycleUpdateViewModel model)
        {
            /*
             * TODO: 
             */
            foreach(CouponCommand command in model.CouponsSelected)
            {
                command.Status = CommandStatus.Valid;
            }



            return View("LifecycleCoupons", model);
        }

        

        /*
         * Returns list of SelectListItems for promotions.
         * Used on LifecycleCoupons view for DropDown element.
         */
        public List<SelectListItem> getSelectListPromotions(List<Promotion> promotions)
        {
            List<SelectListItem> selectList = new List<SelectListItem>();
            foreach(Promotion p in promotions)
            {
                selectList.Add(new SelectListItem { 
                    Text = p.Code,
                    Value = p.Id.ToString()
                });
            }
            return selectList;
        }

        /*
         * Returns list of SelectedListItems for coupon series.
         * Used on LifecycleCoupons view for DropDown element.
         */
        public List<SelectListItem> getSelectListSeries(List<Coupon> coupons)
        {
            List<SelectListItem> seriesList = new List<SelectListItem>();
            List<int> availableSeries = new List<int>();
            foreach(Coupon c in coupons)
            {
                if(!availableSeries.Contains(c.CouponSeries))
                {
                    availableSeries.Add(c.CouponSeries);
                    seriesList.Add(new SelectListItem
                    {
                        Text = String.Format("Series #{0}", c.CouponSeries),
                        Value = c.CouponSeries.ToString()
                    });
                }
            }
            return seriesList;
        }

        /*
         * Returns list of SelectedListItems for coupon status.
         * Used on LifecycleCoupons view for DropDown element.
         */
        public List<SelectListItem> getSelectListStatus(List<string> statuses)
        {
            List<SelectListItem> statusList = new List<SelectListItem>();
            for (var i = 0; i < statuses.Count(); i++)
            {
                statusList.Add(new SelectListItem()
                {
                    Text = statuses[i],
                    Value = (i + 1).ToString()
                });
            }
            return statusList;
        }


        /*
         * Returns list of SelectListItems for coupon enabled status.
         * Used on LifecycleCoupons view for DropDown element.
         */
        public List<SelectListItem> getSelectListEnabled()
        {
            List<SelectListItem> selectList = new List<SelectListItem>();
            selectList.Add(new SelectListItem
            {
                Text = "Yes",
                Value = "1"
            });
            selectList.Add(new SelectListItem {
                Text = "No",
                Value = "0"
            });
            return selectList;
        }


        /*
         * Returns list of coupons for received list of promotions.
         */
        public List<Coupon> getCouponsForPromotions(List<Promotion> promotions)
        {
            List<Coupon> p_Coupons = new List<Coupon>();
            foreach(Promotion p in promotions)
            {

            }
            return p_Coupons;
        }


        



        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }

        /*
         * Generate properties checkboxes for issuer channels coupon filter.
         */
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

        /*
         * Generate properties checkboxes for award channels coupon filter.
         */
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

        /*
         * Generate property checkboxes for coupon filter.
         */
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

        /*
         * Generate coupon status checkboxes for issuer channels coupon filter.
         */
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

        /*
         * Generate coupon checkboxes for coupon list view.
         */
        private List<CheckedCouponItem> setModelCouponList(List<Coupon> coupons)
        {
            List<CheckedCouponItem> checkedItems = new List<CheckedCouponItem>();
            foreach (Coupon coupon in coupons)
            {
                checkedItems.Add(new CheckedCouponItem { 
                    Checked = false, 
                    Label = coupon.Code, 
                    Id = coupon.Id, 
                    Code = coupon.Code, 
                    Holder = coupon.Holder, 
                    User = coupon.User,
                    Status = coupon.Status, 
                    Active = coupon.Active 
                });
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
