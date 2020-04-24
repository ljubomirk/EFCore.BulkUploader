using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Threading.Tasks;
using CouponDatabase.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using WebApp.Data;
using WebApp.Models;
using WebApp.Services;
using WebApp.ViewModels;
using Microsoft.AspNetCore.Http;
using System.IO;
using ExcelDataReader;
using CouponDatabase.Lifecycle;

namespace WebApp.Controllers
{

    //[Authorize]
    [Route("Management/[action]")]
    public class ManagementController : Controller
    {
        private readonly RepositoryServices _repo;
        private readonly ApplicationDbContext _context;
        public ManagementController(ApplicationDbContext context)
        {      
             _repo = new RepositoryServices(context);
            _context = context;
           
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
            model.Filter = new PromotionFilter();
            model.Filter.Properties = setModelProperties(_repo.GetAllProperties(), new List<PromotionProperty>());
            return View("PromotionList",model);
        }

        // <summary>
        /// View List of promotions
        /// </summary>
        /// <returns>Opens list of filtered promotions</returns>
        [HttpPost]
        public IActionResult FilteredListPromotions(PromotionFilter filter)
        {
            PromotionListViewModel model = new PromotionListViewModel();
            Filters filters = new Filters(_context);

            List<Promotion> filteredListOfPromotions = filters.GetFilteredPromotionList(filter);

            model.Promotions.AddRange(filteredListOfPromotions);
            model.Filter = filter;
            return View("PromotionList", model);
        }

        /// <summary>
        /// Add coupon series
        /// </summary>
        /// <returns>Opens add coupon series form</returns>
        [Route("{Id}")]
        [HttpGet]
        public IActionResult AddCouponSeries(long id)
        {
            CouponSeriesViewModel model = new CouponSeriesViewModel();
            model.PromotionId = id;
            model.CouponSeries = _repo.GetCouponSeriesVal(id) + 1;
            return View("PromotionCouponSeries", model);
        }

        [HttpGet]
        public IActionResult Enable(long Id, bool enable)
        {
            PromotionListViewModel model = new PromotionListViewModel();
            Promotion promotion = _repo.GetPromotionWithId(Id);
            
            promotion.Enabled = enable;
            _repo.UpdatePromotion(promotion);

            //ViewBag.CommandStatus = "[OK]";
            //ViewBag.CommandMessage = "Promotion saved.";

            ViewBag.Command = new Command(CommandStatus.Valid);

            model.Promotions.AddRange(_repo.GetAllPromotions());
            model.Filter = new PromotionFilter();
            model.Filter.Properties = setModelProperties(_repo.GetAllProperties(), new List<PromotionProperty>());

            return View("PromotionList", model);
        }
        [HttpGet]
        public IActionResult CreatePromotion()
        {
            PromotionDetailsViewModel model = new PromotionDetailsViewModel
            {
                Promotion = new Promotion(),
                Properties = setModelProperties(_repo.GetAllProperties(), new List<PromotionProperty>()),
                AwardChannels = setModelAwardChannels(_repo.GetAllAwardChannels(), new List<PromotionAwardChannel>()),
                IssuerChannels = setModelIssuerChannels(_repo.GetAllIssuerChannels(), new List<PromotionIssuerChannel>())
            };
            return View("PromotionDetails", model);
        }

        [Route("{Id}")]
        [HttpGet]
        public IActionResult EditPromotion(long Id)
        {
            // if (promo == null) RedirectToAction("Error");
            string view = "PromotionDetails";
            var promotion = _repo.GetPromotionWithId(Id);
            if (promotion.HasCoupons)
            {
                view = "PromotionList";
                PromotionListViewModel model = new PromotionListViewModel();
                model.Promotions.AddRange(_repo.GetAllPromotions());
                model.Filter = new PromotionFilter();
                model.Filter.Properties = setModelProperties(_repo.GetAllProperties(), new List<PromotionProperty>());
                return View(view, model);
            }
            else
            {
                _repo.GetPromotionData(promotion);
                PromotionDetailsViewModel model = new PromotionDetailsViewModel
                {
                    Promotion = promotion,
                    Properties = setModelProperties(_repo.GetAllProperties(), promotion.PromotionProperties as List<PromotionProperty>),
                    AwardChannels = setModelAwardChannels(_repo.GetAllAwardChannels(), promotion.PromotionAwardChannels as List<PromotionAwardChannel>),
                    IssuerChannels = setModelIssuerChannels(_repo.GetAllIssuerChannels(), promotion.PromotionIssuerChannels as List<PromotionIssuerChannel>),
                    hasEndDate = promotion.ValidTo != null ? true : false
                };
                return View(view, model);
            }
            
        }

        [HttpPost]
        public IActionResult SavePromotion(PromotionDetailsViewModel viewModel)
        {
            Promotion promo = new Promotion();
            if (viewModel.Promotion.Id != 0)
                promo = _repo.GetPromotionWithId(viewModel.Promotion.Id);

            if (!viewModel.hasEndDate)
                viewModel.Promotion.ValidTo = null;
            
            if (viewModel.Promotion.Id == 0) 
            {
                long Id = _repo.CreatePromotion(viewModel.Promotion);
                bool fieldsUpdated = updatePromotionFields(viewModel, Id);
                if (Id>0 || fieldsUpdated)
                {
                    //ViewBag.CommandStatus = "[OK]";
                    //ViewBag.CommandMessage = "Promotion created.";

                    ViewBag.Command = new Command(CommandStatus.Valid);
                }
            }
            else
            {
                bool promotionUpdated = _repo.UpdatePromotion(viewModel.Promotion);
                bool fieldsUpdated = updatePromotionFields(viewModel, viewModel.Promotion.Id);

                if (promotionUpdated ||fieldsUpdated)
                {
                    //ViewBag.CommandStatus = "[OK]";
                    //ViewBag.CommandMessage = "Promotion saved.";

                    ViewBag.Command = new Command(CommandStatus.Valid);
                }
                else{
                    //ViewBag.CommandStatus = "[NOT OK]";
                    //ViewBag.CommandMessage = "Promotion didn't saved.";

                    ViewBag.Command = new Command(CommandStatus.PromotionUpdateFailed);
                }
            }
            return View("PromotionDetails", viewModel);
        }

        [HttpPost]
        public IActionResult GenerateCoupons(CouponSeriesViewModel model)
        {
            bool returnValue = _repo.insertCoupons(model.GenerateCoupons());
            if (returnValue)
            {
                //ViewBag.CommandStatus = "[OK]";
                //ViewBag.CommandMessage = "Coupons inserted.";

                ViewBag.Command = new Command(CommandStatus.Valid);
            }
            else
            {
                //ViewBag.CommandStatus = "[NOT OK]";
                //ViewBag.CommandMessage = "Coupons didn't inserted.";

                ViewBag.Command = new Command(CommandStatus.CouponInsertFailed);
            }
            model.CouponSeries++;
            return View("PromotionCouponSeries", model);
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

        #region Helpers
        private List<CheckedItem> setModelIssuerChannels(List<IssuerChannel> allIssuerChannels, List<PromotionIssuerChannel> promotionIssuerChannels)
        {
            List<CheckedItem> checkedItems = new List<CheckedItem>();
            foreach (IssuerChannel issuerChannel in allIssuerChannels)
            {
                if (promotionIssuerChannels.Where(p=>p.IssuerChannelId == issuerChannel.Id ).Count()>0 )
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

        private List<CheckedItem> setModelAwardChannels(List<AwardChannel> allAwardChannels, List<PromotionAwardChannel> promotionAwardChannels)
        {
            List<CheckedItem> checkedItems = new List<CheckedItem>();
            foreach (AwardChannel awardChannels in allAwardChannels)
            {
                if (promotionAwardChannels.Where(p => p.AwardChannelId == awardChannels.Id).Count() > 0)
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

        private List<CheckedItem> setModelProperties(List<Property> allProperties, List<PromotionProperty> promotionProperties)
        {
            List<CheckedItem> checkedItems = new List<CheckedItem>();
            foreach (Property property in allProperties)
            {
                if (promotionProperties.Where(p => p.PropertyId == property.Id).Count() > 0)
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

        #endregion
    }
}
