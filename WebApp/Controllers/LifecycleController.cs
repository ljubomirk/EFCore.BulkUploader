using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using CouponDatabase.Lifecycle;
using CouponDatabase.Models;
using CouponDatabase.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Controllers;
using Microsoft.AspNetCore.Mvc.Filters;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.Extensions.Logging;
using WebApp.Data;
using WebApp.Services;
using WebApp.ViewModels;
using static CouponDatabase.Models.Coupon;

namespace WebApp.Controllers
{

    //[Authorize]
    [Route("Lifecycle/[action]")]
    public class LifecycleController : BaseController
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

        public override void OnActionExecuting(ActionExecutingContext context)
        {
            base.OnActionExecuting(context);
            _repo.LogAppAccess(((ControllerActionDescriptor)context.ActionDescriptor).ActionName, _contextData.AgentUsername, true);
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
            
            // Set object to new instance of the model before commiting to a (new) search action
            lmm = new LifecycleManagementModel();
            HttpContext.Session.SetObject("LMM", lmm);
            
            LifecycleSearchViewModel initModel = initLifecycleFilters();

            return View("LifecycleSearch", initModel);
        }

        [HttpGet]
        public IActionResult Back()
        {
            // Check if LMM object exists in session
            LifecycleManagementModel lmm = HttpContext.Session.GetObject<LifecycleManagementModel>("LMM");
            LifecycleSearchViewModel model = initLifecycleFilters();
            if (lmm == null)
            {
                // Set object to new instance of the model before commiting to a (new) search action
                lmm = new LifecycleManagementModel();
                lmm.PromotionFilter = model.PromotionFilter;
                lmm.CouponFilter = model.CouponFilter;
                HttpContext.Session.SetObject("LMM", lmm);
            } else
            {
                model.PromotionFilter = lmm.PromotionFilter;
                model.CouponFilter = lmm.CouponFilter;
            }

            return View("LifecycleSearch", model);
        }

        // <summary>
        /// View List of promotions
        /// </summary>
        /// <returns>Opens list of filtered promotions</returns>
        [HttpPost]
        public IActionResult Search(PromotionFilter promotionFilter, CouponFilters couponFilter)
        {
            Filters filters = new Filters(_context); // Filter model instance with filter methods
            LifecycleUpdateViewModel model = new LifecycleUpdateViewModel(_contextData.AgentUsername, _contextData.AgentGroup);

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
            f_ListOfCoupons = f_ListOfCoupons.Take<Coupon>(100).ToList();

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

            model.DropPromoCodes = lmm.DropPromoCodes;

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
                // Populate with all matching promotion codes from initially filtered result
                lmm.SelectedPromoCode = model.SelectedPromoCode;
            } else
            {
                if(lmm.SelectedPromoCode != model.SelectedPromoCode)
                {
                    lmm.SelectedCouponSeries = null;
                    model.SelectedCouponSeries = null;
                }
                // Get promo with ID and add into list
                promotion = _repo.GetPromotionWithId(Convert.ToInt64(model.SelectedPromoCode));
                promotionCoupons = promotion.Coupons.ToList();
                filter_ListOfPromotions.Add(promotion);

                // Set selected dropdown item
                List<SelectListItem> promoSelectList = new List<SelectListItem>();
                // Manage promotion code dropdown
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
                lmm.DropPromoCodes = promoSelectList;
                model.DropPromoCodes = promoSelectList;
            }

            // Filtered coupons to be displayed in table view
            List<Coupon> filter_ListOfCoupons = filters.GetFilteredCouponListForPromotions(promotionCoupons, couponFilter);
            // Store coupons filtered by promotion to allow proper display of coupon series for that promotion in dropdown list
            List<Coupon> drop_ListOfCoupons = filter_ListOfCoupons; 


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

            lmm.DropCouponSeries = couponSelectList;
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
            /*
             * TODO:
             * - improve error reporting format and output
             */

            LifecycleUpdateViewModel modelCopy = new LifecycleUpdateViewModel(_contextData.AgentUsername, _contextData.AgentGroup){ 
                Customer = model.Customer,
                RedeemTo = model.RedeemTo,
                SelectedPromoCode = model.SelectedPromoCode,
                SelectedCouponSeries = model.SelectedCouponSeries,
                SelectedEnabled = model.SelectedEnabled,
                SelectedCouponStatus = model.SelectedCouponStatus,
            };
            CouponList couponList = model.CouponList;

            // Session management
            LifecycleManagementModel lmm = HttpContext.Session.GetObject<LifecycleManagementModel>("LMM");
            if(lmm == null)
            {
                lmm = new LifecycleManagementModel();
            } else
            {
                modelCopy.DropPromoCodes = lmm.DropPromoCodes;
                modelCopy.DropCouponSeries = lmm.DropCouponSeries;
                modelCopy.DropEnabled = lmm.DropEnabled;
                modelCopy.DropCouponStatus = lmm.DropCouponStatus;
                modelCopy.SelectedPromoCode = lmm.SelectedPromoCode;
                modelCopy.SelectedCouponSeries = lmm.SelectedCouponSeries;

                if (modelCopy.SelectedCouponStatus != null)
                {
                    lmm.SelectedCouponStatus = modelCopy.SelectedCouponStatus;
                } else
                {
                    modelCopy.SelectedCouponStatus = lmm.SelectedCouponStatus;
                }

                if (modelCopy.SelectedEnabled != null)
                {
                    lmm.SelectedEnabled = modelCopy.SelectedEnabled;
                }
                else
                {
                    modelCopy.SelectedEnabled = lmm.SelectedEnabled;
                }
            }

            List<long> updateCouponIds = new List<long>();
            List<long> uncheckedCouponIds = new List<long>();
            
            if (couponList.SelectAllCoupons)
            {                
                updateCouponIds = couponList.CouponItems.Select( c => c.Id ).Distinct().ToList();
            } else
            {
                updateCouponIds = couponList.CouponItems.Where( c => c.Checked ).Select( c => c.Id ).ToList();
                //uncheckedCouponIds = model.CouponList.CouponItems.Where( c => !updateCouponIds.Contains(c.Id) ).Select(c => c.Id).Distinct().ToList();
            }
            couponList.SelectAllCoupons = model.CouponList.SelectAllCoupons;

            // Find Coupon objects for checked coupons
            List<Coupon> coupons = new List<Coupon>();
            foreach (long id in updateCouponIds)
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
                if (modelCopy.Customer != null)
                {
                    ICoupon cmd = new ICoupon(coupon);
                    Command response = cmd.AssignUser(modelCopy.Customer);
                    if (response.Status == CommandStatus.Valid)
                    {
                        passedChecks++;
                    }
                    else
                    {
                        // Store coupons and action types to report errors on action finish
                        if (!failedCouponIds.Contains(coupon.Id))
                        {
                            //put in viewModel response.Coupon = coupon;
                            failedCouponIds.Add(coupon.Id);
                            failedCouponCommands.Add(response);
                        }
                    }
                } else
                {
                    passedChecks++;
                }

                // Execute coupon redeem until update
                if (modelCopy.RedeemTo != null)
                {
                    if (coupon.Promotion == null)
                    {
                        coupon.Promotion = _repo.GetPromotionWithId(coupon.PromotionId);
                    }

                    ICoupon cmd = new ICoupon(coupon);                    
                    Command response = cmd.Prolong(modelCopy.RedeemTo);
                    if (response.Status == CommandStatus.Valid)
                    {
                        passedChecks++;
                    }
                    else
                    {
                        // Store coupons and action types to report errors on action finish
                        if (!failedCouponIds.Contains(coupon.Id))
                        {
                            //put in viewModel response.Coupon = coupon;
                            failedCouponIds.Add(coupon.Id);
                            failedCouponCommands.Add(response);
                        }
                    }
                } else
                {
                    passedChecks++;
                }

                // Execute coupon enable update
                if (modelCopy.SelectedEnabled != null)
                {
                    ICoupon cmd = new ICoupon(coupon);
                    Command response = new Command(CommandStatus.Valid);
                    if((CouponEnableEnum)Int32.Parse(modelCopy.SelectedEnabled) == CouponEnableEnum.Yes)
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
                            //put in viewModel response.Coupon = coupon;
                            failedCouponIds.Add(coupon.Id);
                            failedCouponCommands.Add(response);
                        }
                    }
                } else
                {
                    passedChecks++;
                }

                // Execute coupon status update
                if (modelCopy.SelectedCouponStatus != null)
                {
                    ICoupon cmd = new ICoupon(coupon);
                    Command response = cmd.UpdateStatus((CouponStatus)Int32.Parse(modelCopy.SelectedCouponStatus));
                    if (response.Status == CommandStatus.Valid)
                    {
                        passedChecks++;

                    }
                    else
                    {
                        // Store coupons and action types to report errors on action finish
                        if (!failedCouponIds.Contains(coupon.Id))
                        {
                            //put in viewModel response.Coupon = coupon;
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
                }
            }

            // Return failed coupon checkboxes as preselected
            // TODO: method returns correct result butu the view doesn't deselect checkboxes of updated coupons
            couponList.CouponItems = updateModelCouponList(couponList.CouponItems, updatedCoupons);
            couponList.CouponItems = preselectModelCouponList(couponList.CouponItems, failedCouponIds);

            lmm.CouponItems = couponList.CouponItems;
            modelCopy.CouponList = couponList;

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
            return View("LifecycleCoupons", modelCopy);
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


        public LifecycleSearchViewModel initLifecycleFilters()
        {
            LifecycleSearchViewModel model = new LifecycleSearchViewModel(_contextData.AgentUsername, _contextData.AgentGroup);
            
            model.PromotionFilter = new PromotionFilter() { ShowActive = true, ShowInactive = false, ValidFrom = DateTime.Today, ValidTo = DateTime.Today.AddMonths(1) };
            model.PromotionFilter.Properties = setModelProperties(_repo.GetAllProperties(), new List<Property>());

            model.CouponFilter = new CouponFilters() { ShowActive = true, ShowInactive = false, ValidFrom = DateTime.Today, ValidTo = DateTime.Today.AddMonths(1) };
            model.CouponFilter.AwardChannels = setModelAwardChannels(_repo.GetAllAwardChannels(), new List<AwardChannel>());
            model.CouponFilter.IssuerChannels = setModelIssuerChannels(_repo.GetAllIssuerChannels(), new List<IssuerChannel>());
            model.CouponFilter.CurrentStatus = setModelCurrentStatus(_repo.GetCouponStatuses(), new List<CurrentStatus>());
            model.CouponFilter.Properties = setModelProperties(_repo.GetAllProperties(), new List<Property>());
            
            return model;
        }
        



        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel(_contextData.AgentUsername, _contextData.AgentGroup) { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
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
                    Active = coupon.Active,
                    AquireTo = coupon.AquireTo,
                    AquireFrom = coupon.AquireFrom,
                    AwardFrom = coupon.AwardFrom,
                    AwardTo = coupon.AwardTo
                });
            }
            return checkedItems;
        }

        private List<CheckedCouponItem> updateModelCouponList(List<CheckedCouponItem> items, List<Coupon> coupons)
        {
            List<CheckedCouponItem> updatedItems = new List<CheckedCouponItem>();
            for(var i = 0; i < items.Count(); i++)
            {
                Coupon coupon = coupons.Where(c => c.Id == items[i].Id).FirstOrDefault();
                if (coupon != null)
                {
                    updatedItems.Add(new CheckedCouponItem(){
                        Active = coupon.Active,
                        Checked = false,
                        Code = coupon.Code,
                        Enabled = coupon.Enabled,
                        Holder = coupon.Holder,
                        User = coupon.User,
                        Label = coupon.Code,
                        Id = coupon.Id,
                        Status = coupon.Status,
                        AquireFrom = coupon.AquireFrom,
                        AquireTo = coupon.AquireTo,
                        AwardFrom  = coupon.AwardFrom,
                        AwardTo = coupon.AwardTo
                    });
                } else
                {
                    updatedItems.Add(new CheckedCouponItem()
                    {
                        Active = items[i].Active,
                        Checked = false,
                        Code = items[i].Code,
                        Enabled = items[i].Enabled,
                        Holder = items[i].Holder,
                        User = items[i].User,
                        Label = items[i].Code,
                        Id = items[i].Id,
                        Status = items[i].Status,
                        AquireFrom = items[i].AquireFrom,
                        AquireTo = items[i].AquireTo,
                        AwardFrom = items[i].AwardFrom,
                        AwardTo = items[i].AwardTo
                    });
                }
            }
            
            return updatedItems;
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
