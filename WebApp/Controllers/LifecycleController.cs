﻿using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using CouponDatabase.Lifecycle;
using CouponDatabase.Models;
using CouponDatabase.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.Extensions.Logging;
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
        private ILogger _logger;

        public LifecycleController(ApplicationDbContext context, ILogger<LifecycleController> logger)
        {      
             _repo = new RepositoryServices(context, logger);
            _context = context;
            _logger = logger;
        }

        /// <summary>
        /// Show initial Lifecycle search page or after Back from list of coupons
        /// </summary>
        /// <returns>Opens Lifecycle search page</returns>
        [HttpGet]
        public IActionResult Index()
        {
            // Check if LMM object exists in session
            LifecycleManagementModel lmm = HttpContext.Session.GetObject<LifecycleManagementModel>("LMM");
            if (lmm == null || lmm != null)
            {
                // Set object to new instance of the model before commiting to a (new) search action
                lmm = new LifecycleManagementModel();
                HttpContext.Session.SetObject("LMM", lmm);
            }

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
            Filters filters = new Filters(_context); // Filter model instance with filter methods
            LifecycleUpdateViewModel model = new LifecycleUpdateViewModel();

            // Check if LMM object exists in session
            LifecycleManagementModel lmm = HttpContext.Session.GetObject<LifecycleManagementModel>("LMM");
            if (lmm == null || lmm != null)
            {
                // Set object to new instance of the model before commiting to a (new) search action in case user pressed "Back" button.
                lmm = new LifecycleManagementModel();
                HttpContext.Session.SetObject("LMM", lmm);
            }
            
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
            model.DropCouponSeries = new List<SelectListItem>(); // initially empty as no series can be chosen without promotion code 
            model.DropPromoCodes = getSelectListPromotions(couponPromotions);
            model.DropCouponStatus = getSelectListStatus(_repo.GetCouponStatusList());
            model.DropEnabled = getSelectListEnabled();
            
            // Create CheckedItem elements from filtered Coupons
            // CouponList is used to bind data change on view
            // CouponList is populated from submit form with CheckedItem elements and passed into CouponUpdate
            model.CouponList.Coupon = new Coupon();
            model.CouponList.Coupons = f_ListOfCoupons;
            model.CouponList.CouponItems = setModelCouponList(f_ListOfCoupons);
            model.RedeemTo = null; // prevents default activation of Update Selection button on LifecycleCoupons view

            // Store filters, dropdowns, and chechboxes into session
            lmm.PromotionFilter = promotionFilter;
            lmm.CouponFilter = couponFilter;
            lmm.CouponItems = model.CouponList.CouponItems;
            
            lmm.DropPromoCodes = model.DropPromoCodes;
            lmm.DropCouponSeries = model.DropCouponSeries;
            lmm.DropEnabled = model.DropEnabled;
            lmm.DropCouponStatus = model.DropCouponStatus;
            
            HttpContext.Session.SetObject("LMM", lmm);

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
             * Improvement:
             *  - store SelectedPromoCode and SelectedCouponSeries into session
             *  - if any of the values present, use to filter session.CouponItems instead of reapplying filters from the previous view
             */

            Filters filters = new Filters(_context);

            // Get session stored object
            LifecycleManagementModel lmm = HttpContext.Session.GetObject<LifecycleManagementModel>("LMM");
            if (lmm == null)
            {
                lmm = new LifecycleManagementModel();
            }

            // Instance objects to be collected from session
            // We're reusing filters applied to previous results view
            PromotionFilter promotionFilter = new PromotionFilter();
            CouponFilters couponFilter = new CouponFilters();
            if (lmm.PromotionFilter != null)
            {
                promotionFilter = lmm.PromotionFilter;
            }
            if (lmm.CouponFilter != null)
            {
                couponFilter = lmm.CouponFilter;
            }

            // Filter promotions and coupons
            List<Promotion> init_ListOfPromotions = filters.GetFilteredPromotionList(promotionFilter, true); // Store promos for initial filter to display in dropdown list (after new filters are applied)
            List<Promotion> filter_ListOfPromotions = new List<Promotion>(); // Reference list for getting coupons
            Promotion promotion = new Promotion(); // Promotion selected via promo code dropdown
            List<Coupon> promotionCoupons = new List<Coupon>();
            // Get single promotion or all filtered promotions
            if (model.SelectedPromoCode == null)
            {
                filter_ListOfPromotions = filters.GetFilteredPromotionList(promotionFilter, true);
                foreach(Promotion p in filter_ListOfPromotions)
                {
                    if(p.Coupons.Count() > 0)
                    {
                        promotionCoupons.AddRange(p.Coupons);
                    }
                }
            } else
            {
                // Get promo with ID and add into list
                promotion = _repo.GetPromotionWithId(Convert.ToInt64(model.SelectedPromoCode));
                promotionCoupons = promotion.Coupons.ToList();
                filter_ListOfPromotions.Add(promotion);
            }

            // Filtered coupons to be displayed in table view
            List<Coupon> filter_ListOfCoupons = filters.GetFilteredCouponListForPromotions(promotionCoupons, couponFilter);
            // Store coupons filtered by promotion to allow proper display of coupon series for that promotion in dropdown list
            List<Coupon> drop_ListOfCoupons = filter_ListOfCoupons; 

            // Manage promotion code dropdown
            if (model.SelectedPromoCode == null)
            {
                // Populate with all matching promotion codes from initially filtered result
                model.DropPromoCodes = getSelectListPromotions(filter_ListOfPromotions);
                lmm.SelectedPromoCode = model.SelectedPromoCode;
            } else
            {
                model.DropPromoCodes = getSelectListPromotions(init_ListOfPromotions);
                
                // Set selected dropdown item
                List<SelectListItem> promoSelectList = new List<SelectListItem>();
                foreach (SelectListItem item in model.DropPromoCodes)
                {
                    if (item.Value == model.SelectedPromoCode)
                    {
                        item.Selected = true;
                    }
                    else
                    {
                        item.Selected = false;
                    }
                    promoSelectList.Add(item);
                }
                model.DropPromoCodes = promoSelectList;
            }


            // Manage coupon series dropdown
            if (model.SelectedCouponSeries != null)
            {
                filter_ListOfCoupons = filter_ListOfCoupons.Where(c => c.CouponSeries == Int32.Parse(model.SelectedCouponSeries)).ToList();
                lmm.SelectedCouponSeries = model.SelectedCouponSeries;
            }

            model.DropCouponSeries = getSelectListSeries(drop_ListOfCoupons);

            // Set selected dropdown item
            List<SelectListItem> couponSelectList = new List<SelectListItem>();
            foreach (SelectListItem item in model.DropCouponSeries)
            {
                if (item.Value == model.SelectedCouponSeries)
                {
                    item.Selected = true;
                }
                else
                {
                    item.Selected = false;
                }   
                couponSelectList.Add(item);
            }

            model.DropCouponSeries = couponSelectList;


            model.DropCouponStatus = getSelectListStatus(_repo.GetCouponStatusList());
            model.DropEnabled = getSelectListEnabled();
            model.RedeemTo = null;

            model.CouponList.Coupon = new Coupon();
            model.CouponList.Coupons = filter_ListOfCoupons;            
            model.CouponList.CouponItems = setModelCouponList(model.CouponList.Coupons);

            model.SelectedPromoCode = model.SelectedPromoCode;
            model.SelectedCouponSeries = model.SelectedCouponSeries;

            // Session management
            lmm.CouponItems = model.CouponList.CouponItems;
            HttpContext.Session.SetObject("LMM", lmm);

            return View("LifecycleCoupons", model);
        }

        /*
         * Updates coupons.
         * Used on LifecycleCoupons view for UpdateSelected action.
         */
        [HttpPost]
        public IActionResult UpdateCoupons(LifecycleUpdateViewModel model)
        {
            bool updateCustomer = false;
            if(model.Customer != null)
            {
                updateCustomer = true;
            }
            bool updateRedeemTo = false;
            if(model.RedeemTo != null)
            {
                updateRedeemTo = true;
            }
            bool updateEnabled = false;
            if (model.SelectedEnabled != null)
            {
                updateEnabled = true;
            }
            bool updateStatus = false;
            if (model.SelectedCouponStatus != null)
            {
                updateStatus = true;
            }
            
            LifecycleManagementModel lmm = HttpContext.Session.GetObject<LifecycleManagementModel>("LMM");
            if(lmm == null)
            {
                lmm = new LifecycleManagementModel();
            } else
            {
                model.DropPromoCodes = lmm.DropPromoCodes;
                model.DropCouponSeries = lmm.DropCouponSeries;
                model.DropEnabled = lmm.DropEnabled;
                model.DropCouponStatus = lmm.DropCouponStatus;
                
                model.SelectedPromoCode = lmm.SelectedPromoCode;
                model.SelectedCouponSeries = lmm.SelectedCouponSeries;

                if(model.SelectedCouponStatus != null)
                {
                    lmm.SelectedCouponStatus = model.SelectedCouponStatus;
                } else
                {
                    model.SelectedCouponStatus = lmm.SelectedCouponStatus;
                }
                if (model.SelectedEnabled != null)
                {
                    lmm.SelectedEnabled = model.SelectedEnabled;
                }
                else
                {
                    model.SelectedEnabled = lmm.SelectedEnabled;
                }
            }

            List<long> couponIds = new List<long>();
            if (model.CouponList.SelectAllCoupons)
            {
                couponIds = model.CouponList.CouponItems.Select( c => c.Id ).Distinct().ToList();
            } else
            {
                couponIds = model.CouponList.CouponItems.Where( c => c.Checked ).Select( c => c.Id ).ToList();
            }

            // Find Coupon objects for checked coupons
            List<Coupon> coupons = new List<Coupon>();
            foreach (long id in couponIds)
            {
                Coupon coupon = _repo.GetCouponById(id);
                if (coupon != null)
                {
                    coupons.Add(coupon);
                }                
            }
            
            List<Command> failedCouponCommands = new List<Command>();
            List<long> failedCouponIds = new List<long>();
            List<Coupon> updatedCoupons = new List<Coupon>();

            // Execute coupon user update
            foreach (Coupon coupon in coupons)
            {
                int passedChecks = 0;
                // Update customer (user) for coupons
                if (updateCustomer)
                {
                    ICoupon cmd = new ICoupon(coupon);
                    Command response = cmd.AssignUser(model.Customer);
                    if (response.Status == CommandStatus.Valid)
                    {
                        passedChecks++;
                    }
                    else
                    {
                        // Store coupons and action types to report errors on action finish
                        if (!failedCouponIds.Contains(coupon.Id))
                        {
                            response.Coupon = coupon;
                            failedCouponIds.Add(coupon.Id);
                            failedCouponCommands.Add(response);
                        }
                    }
                } else
                {
                    passedChecks++;
                }

                // Execute coupon redeem until update
                if (updateRedeemTo)
                {
                    if (coupon.Promotion == null)
                    {
                        coupon.Promotion = _repo.GetPromotionWithId(coupon.PromotionId);
                    }

                    ICoupon cmd = new ICoupon(coupon);                    
                    Command response = cmd.Prolong(model.RedeemTo);
                    if (response.Status == CommandStatus.Valid)
                    {
                        passedChecks++;
                    }
                    else
                    {
                        // Store coupons and action types to report errors on action finish
                        if (!failedCouponIds.Contains(coupon.Id))
                        {
                            response.Coupon = coupon;
                            failedCouponIds.Add(coupon.Id);
                            failedCouponCommands.Add(response);
                        }
                    }
                } else
                {
                    passedChecks++;
                }

                // Execute coupon enable update
                if (updateEnabled)
                {
                    ICoupon cmd = new ICoupon(coupon);
                    Command response = new Command(CommandStatus.Valid);
                    if((CouponEnableEnum)Int32.Parse(model.SelectedEnabled) == CouponEnableEnum.Yes)
                    {
                        response = cmd.Enable();
                    } else
                    {
                        response = cmd.Disable();
                    }
                    
                    if (response.Status == CommandStatus.Valid)
                    {
                        passedChecks++;
                    }
                    else
                    {
                        // Store coupons and action types to report errors on action finish
                        if (!failedCouponIds.Contains(coupon.Id))
                        {
                            response.Coupon = coupon;
                            failedCouponIds.Add(coupon.Id);
                            failedCouponCommands.Add(response);
                        }
                    }
                } else
                {
                    passedChecks++;
                }

                // Execute coupon status update
                if (updateStatus)
                {
                    ICoupon cmd = new ICoupon(coupon);
                    Command response = cmd.UpdateStatus((CouponStatus)Int32.Parse(model.SelectedCouponStatus));
                    if (response.Status == CommandStatus.Valid)
                    {
                        passedChecks++;

                    }
                    else
                    {
                        // Store coupons and action types to report errors on action finish
                        if (!failedCouponIds.Contains(coupon.Id))
                        {
                            response.Coupon = coupon;
                            failedCouponIds.Add(coupon.Id);
                            failedCouponCommands.Add(response);
                        }
                    }
                } else
                {
                    passedChecks++;
                }

                if(passedChecks == 4)
                {
                    _repo.UpdateCoupon(coupon);
                    updatedCoupons.Add(coupon);
                    // uncheck checked equivalent in CouponItems
                }
            }

            // Return failed coupon checkboxes as preselected
            // TODO: method returns correct result butu the view doesn't deselect checkboxes of updated coupons
            model.CouponList.CouponItems = preselectModelCouponList(lmm.CouponItems, failedCouponIds);

            lmm.CouponItems = model.CouponList.CouponItems;

            if (failedCouponCommands.Count() > 0)
            {
                // Having stored response from each update we can later use this information to report to the user which checks were invalid for the coupon
                ViewBag.Command = failedCouponCommands[0];
                String messages = "";
                foreach (Command cmd in failedCouponCommands)
                {
                    messages += cmd.Message + "<br>";
                }
                ViewBag.Command.Message = messages;
            } else
            {
                ViewBag.Command = new Command(CommandStatus.Valid);
                HttpContext.Session.SetObject("LMM", lmm);
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
                    Enabled = coupon.Enabled,
                    Status = coupon.Status, 
                    Active = coupon.Active 
                });
            }
            return checkedItems;
        }

        private List<CheckedCouponItem> preselectModelCouponList(List<CheckedCouponItem> items, List<long> preselected)
        {
            List<CheckedCouponItem> checkedItems = new List<CheckedCouponItem>();
            foreach (CheckedCouponItem cci in items)
            {
                bool check = false;
                if (preselected?.Count() > 0)
                {
                    if (preselected.Contains(cci.Id))
                    {
                        check = true;
                    }
                    cci.Checked = check;
                }
                checkedItems.Add(cci);
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
