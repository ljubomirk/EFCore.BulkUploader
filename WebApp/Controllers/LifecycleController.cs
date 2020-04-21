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
        public LifecycleController(ApplicationDbContext context)
        {      
             _repo = new RepositoryServices(context);
           
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

            //var employee = new LifecycleManagementModel();
            //employee.lifecycleManagement.Pro = "1";
            //employee.DesignationId = "2";

            //HttpContext.Session.SetObjectAsJson("EmployeeDetails", employee);

            List<Promotion> f_ListOfPromotions = _repo.GetFilteredPromotionList(promotionFilter, true);

            //List<Coupon> f_ListOfCoupons = new List<Coupon>();
            List<Coupon> f_ListOfCoupons = _repo.GetFilteredCouponListForPromotions(_repo.GetCouponsForPromotions(f_ListOfPromotions), couponFilter);

            // Dropdown data
            model.DropPromoCodes = getSelectListPromotions(f_ListOfPromotions);
            model.DropCouponSeries = getSelectListSeries(f_ListOfCoupons); 
            model.DropCouponStatus = getSelectListStatus(_repo.GetCouponStatusList());
            model.DropEnabled = getSelectListEnabled();
            
            // Create CheckedItem elements from filtered Coupons
            // CouponList is used to bind data change on view
            // CouponList is populated from submit form with CheckedItem elements and passed into CouponUpdate
            model.CouponList.CouponItems = setModelCouponList(f_ListOfCoupons);
            model.CouponList.Coupon = new Coupon();

            /*
             * TODO:
             * Store PromotionCodes, CouponSeries and filtered coupons into session and view model
             */
            model.CouponList.Coupons = f_ListOfCoupons;
            model.ValidTo = ""; // prevents default activation of Update Selection button on LifecycleCoupons view
            model.CouponList.Coupons.Add(new Coupon() { Code = "EASTER12343566", Id = 1, AquireFrom = DateTime.Today, AquireTo = DateTime.Today.AddMonths(1), CouponSeries = 1, PromotionId = 1, User = "38640440480", Status = (int)CouponStatus.Created });

            /*
             * TODO:
             * If no coupons found, return error / no results view
             * If coupons found, return LifecycleCoupons view
             */

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
         * Updates filter results with selection from DropDown element.
         * Called on submit (DropDown change) from LifecycleCoupons view.
         */
        [HttpPost]
        public IActionResult UpdateSearchFilter(LifecycleUpdateViewModel model)
        {
            /*
             * TODO:
             * - get from session everything required for the update (selected promotion code and selected coupon series, coupons ...)
             * - apply model filters of SelectedPromoCode and SelectedCouponSeries if possible
             * - return new coupon list
             * - return list of promotion codes from session and new coupon series (after filtering)
             * - store new list into session
             */
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
                    Value = p.Code
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
