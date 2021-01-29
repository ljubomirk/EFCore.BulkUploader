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
using WebApp.Services;
using WebApp.ViewModels;
using Microsoft.AspNetCore.Http;
using System.IO;
using ExcelDataReader;
using CouponDatabase.Lifecycle;
using Microsoft.Extensions.Logging;
using Microsoft.AspNetCore.Mvc.Filters;
using Microsoft.AspNetCore.Mvc.Controllers;

namespace WebApp.Controllers
{

    [Authorize(Roles = "Coupon Admins,Coupon Users")]
    [Route("Management/[action]")]
    public class ManagementController : BaseController
    {
        private readonly RepositoryServices _repo;
        private readonly ApplicationDbContext _context;
        private readonly ILogger<ManagementController> _logger;

        public override void OnActionExecuting(ActionExecutingContext context)
        {
            base.OnActionExecuting(context);
            _repo.LogAppAccess(((ControllerActionDescriptor)context.ActionDescriptor).ActionName, _contextData?.AgentUsername, true);
        }

        public ManagementController(ApplicationDbContext context, ILogger<ManagementController> logger)
        {      
             _repo = new RepositoryServices(context, logger);
            _context = context;
            _logger = logger;
        }

        /// <summary>
        /// View List of promotions
        /// </summary>
        /// <returns>Opens list of promotions</returns>
        [HttpGet]
        public IActionResult ListPromotions()
        {
            return FilteredListPromotions(new PromotionFilter());
        }

        // <summary>
        /// View List of promotions
        /// </summary>
        /// <returns>Opens list of filtered promotions</returns>
        [HttpPost]
        public IActionResult FilteredListPromotions(PromotionFilter filter)
        {
            PromotionListViewModel model = new PromotionListViewModel(_contextData.AgentUsername, _contextData.AgentGroup);
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
            Promotion promotion = _repo.GetPromotionWithId(id);
            if (TempData["CommandStatus"] != null)
                ViewBag.Command = new Command((CommandStatus)TempData["CommandStatus"]);
            CouponSeriesViewModel model = new CouponSeriesViewModel(_contextData, promotion.ValidFrom, promotion.ValidTo);
            model._promo= promotion;
            model.CouponWithLetters = true;
            model.CouponWithNumbers = true;
            model.CouponSeries = promotion.CouponSeries + 1;
            if (isPropertyChecked("AllowMultipleRedeems", promotion.PromotionProperties as List<PromotionProperty>))
            {
                model.MaximumRedeem = 1;
            }
            return View("PromotionCouponSeries", model);
        }

        [HttpGet]
        public IActionResult Enable(long Id, bool enable)
        {
            Promotion promotion = _repo.GetPromotionWithId(Id);

            promotion.Enabled = enable;
            _repo.UpdatePromotion(promotion);

            //ViewBag.CommandStatus = "[OK]";
            //ViewBag.CommandMessage = "Promotion saved.";

            ViewBag.Command = new Command(CommandStatus.Valid);

            PromotionListViewModel model = new PromotionListViewModel(_contextData.AgentUsername, _contextData.AgentGroup);
            model.Promotions.AddRange(_repo.GetAllPromotions());
            model.Filter = new PromotionFilter();
            model.Filter.Properties = setModelProperties(_repo.GetAllProperties(), new List<PromotionProperty>());

            return View("PromotionList", model);
        }
        [HttpGet]
        public IActionResult CreatePromotion()
        {
            /*string code = "";
            do
            {
                var random = new Random();
                string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
                code = new string(Enumerable.Repeat(chars, 8)
                          .Select(s => s[random.Next(s.Length)])
                          .ToArray());
            } while (!_repo.CheckPromotionCode(code));
            */
            PromotionDetailsViewModel model = new PromotionDetailsViewModel(_contextData.AgentUsername, _contextData.AgentGroup)
            {
                Promotion = new Promotion(),
                Properties = setModelProperties(_repo.GetAllProperties(), new List<PromotionProperty>()),
                AwardChannels = setModelAwardChannels(_repo.GetAllAwardChannels(), new List<PromotionAwardChannel>()),
                IssuerChannels = setModelIssuerChannels(_repo.GetAllIssuerChannels(), new List<PromotionIssuerChannel>())
            };
            // ValidFrom initially is set on today
            model.Promotion.ValidFrom = DateTime.Today;
            return View("PromotionDetails", model);
        }

        [Route("{Id}")]
        [HttpGet]
        public IActionResult EditPromotion(long Id)
        {
            // if (promo == null) RedirectToAction("Error");
            string view = "PromotionDetails";
            var promotion = _repo.GetPromotionWithId(Id);
            if (TempData["CommandStatus"] != null)
                ViewBag.Command = new Command((CommandStatus)TempData["CommandStatus"]);
            if (promotion.HasCoupons)
            {
                view = "PromotionList";
                PromotionListViewModel model = new PromotionListViewModel(_contextData.AgentUsername, _contextData.AgentGroup);
                model.Promotions.AddRange(_repo.GetAllPromotions());
                model.Filter = new PromotionFilter();
                model.Filter.Properties = setModelProperties(_repo.GetAllProperties(), new List<PromotionProperty>());
                return View(view, model);
            }
            else
            {
                _repo.GetPromotionData(promotion);
                PromotionDetailsViewModel model = new PromotionDetailsViewModel(_contextData.AgentUsername, _contextData.AgentGroup)
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

        [Route("{Id}")]
        [HttpGet]
        public IActionResult ViewPromotion(long Id)
        {
            // if (promo == null) RedirectToAction("Error");
            string view = "PromotionDisplay";
            var promotion = _repo.GetPromotionWithId(Id);
            if (TempData["CommandStatus"] != null)
                ViewBag.Command = new Command((CommandStatus)TempData["CommandStatus"]);
                _repo.GetPromotionData(promotion);
                PromotionDetailsViewModel model = new PromotionDetailsViewModel(_contextData.AgentUsername, _contextData.AgentGroup)
                {
                    Promotion = promotion,
                    Properties = setModelProperties(_repo.GetAllProperties(), promotion.PromotionProperties as List<PromotionProperty>),
                    AwardChannels = setModelAwardChannels(_repo.GetAllAwardChannels(), promotion.PromotionAwardChannels as List<PromotionAwardChannel>),
                    IssuerChannels = setModelIssuerChannels(_repo.GetAllIssuerChannels(), promotion.PromotionIssuerChannels as List<PromotionIssuerChannel>),
                    hasEndDate = promotion.ValidTo != null ? true : false
                };
                return View(view, model);
        }

        [HttpPost]
        public IActionResult StoreAddCouponSeries(PromotionDetailsViewModel viewModel)
        {
            return SavePromotion(viewModel, true);
        }
        [HttpPost]
        public IActionResult SavePromotion(PromotionDetailsViewModel viewModel, bool addSeries)
       {   
            Promotion promo = new Promotion();
            if (viewModel.Promotion.Id != 0)
                promo = _repo.GetPromotionWithId(viewModel.Promotion.Id);

            bool issuer = false;
            bool award = false;
            foreach (var item in viewModel.IssuerChannels)
            {
                if (item.Checked == true) issuer = true;
            }
            foreach (var item in viewModel.AwardChannels)
            {
                if (item.Checked == true) award = true;
            }
            //at least one issuer and one award channel must be checked
            if (!issuer || !award)
            {
                ViewBag.Command= new Command(CommandStatus.Error_PromotionWithoutChannel);
                return View("PromotionDetails",viewModel);
            }
            if (viewModel.Promotion.ValidFrom == null)
            {
                ViewBag.Command = new Command(CommandStatus.Error_PromotionWithoutValidFrom);
                return View("PromotionDetails", viewModel);
            }
            if (viewModel.Promotion.Id == 0) 
            {
                long Id = _repo.CreatePromotion(viewModel.Promotion);
                bool fieldsUpdated = updatePromotionFields(viewModel, Id);
                if (Id>0 || fieldsUpdated)
                {
                    TempData["CommandStatus"] = CommandStatus.Valid;
                }
                promo = _repo.GetPromotionWithId(viewModel.Promotion.Id);
            }
            else
            {
                bool promotionUpdated = _repo.UpdatePromotion(viewModel.Promotion);
                bool fieldsUpdated = updatePromotionFields(viewModel, viewModel.Promotion.Id);

                if (promotionUpdated ||fieldsUpdated)
                {
                    TempData["CommandStatus"] = CommandStatus.Valid;
                }
                else{
                    TempData["CommandStatus"] = CommandStatus.DataError_PromotionUpdateFailed;
                }
            }
            if (addSeries) //Create And Add Series
                return RedirectToAction("AddCouponSeries", new { id = promo.Id });
            else
                return RedirectToAction("EditPromotion", new { id = promo.Id });
        }


        [HttpPost]
        public IActionResult GenerateCoupons(CouponSeriesViewModel model)
        {
            Promotion promotion = _repo.GetPromotionWithId(model._promo.Id);
            model._promo = promotion;

            _logger.LogDebug(Utils.GetLogFormat() + "Debug Generate Coupons - num:{0}", model.NumberOfCoupons);
            Command cmd = new Command(CommandStatus.Valid);
            List<Coupon> potentiallySameCoupons = getPotentiallySameCoupons(model);
            _logger.LogDebug(Utils.GetLogFormat() + "Debug Generate Coupons - load current:{0}", potentiallySameCoupons.Count);
            if(model.Prefix != null ||model.Suffix != null)
            {
                if (model.NumberOfCoupons > 1)
                {
                    // system can't create more than one unique coupon
                    cmd.Status = model.Prefix != null ? model.Prefix.Length == model.CouponMaxLength ? CommandStatus.Error_LimitedNumberOfCoupons : CommandStatus.Valid : CommandStatus.Valid;
                    cmd.Status = cmd.Status == CommandStatus.Valid? model.Suffix != null ? model.Suffix.Length == model.CouponMaxLength ? CommandStatus.Error_LimitedNumberOfCoupons : CommandStatus.Valid : CommandStatus.Valid : cmd.Status;
                    cmd.Status = cmd.Status == CommandStatus.Valid ? model.Suffix != null && model.Prefix != null ? model.Suffix.Length + model.Prefix.Length == model.CouponMaxLength ? CommandStatus.Error_LimitedNumberOfCoupons : CommandStatus.Valid : CommandStatus.Valid : cmd.Status;
                    if (cmd.Status == CommandStatus.Error_LimitedNumberOfCoupons)
                    {
                        cmd = new Command(CommandStatus.Error_LimitedNumberOfCoupons);
                        model.Prefix = "";
                        model.Suffix = "";
                    }
                }
            }
            if (cmd.Status == CommandStatus.Valid)
            {
                List<Coupon> coupons = model.GenerateCoupons(potentiallySameCoupons,ref cmd, model.Status);
                Command command=checkIfStatusIsOk(model);
                if(cmd.Status==CommandStatus.Valid && command.Status==CommandStatus.Valid)
                {
                    _logger.LogDebug(Utils.GetLogFormat() + "Debug Generate Coupons - genereateCoupons:{0}", coupons.Count);
                    cmd = _repo.Add(coupons,ref cmd);
                    _logger.LogDebug(Utils.GetLogFormat() + "Debug Generate Coupons - store:{0}", cmd.Status);
                    if (cmd.Status == CommandStatus.Valid)
                    {
                        ViewBag.Command = new Command(CommandStatus.Valid);
                        _repo.UpdateCouponSeriesNum(model._promo.Id);
                        model.CouponSeries++;
                    }
                    TempData["CommandStatus"] = cmd.Status;
                    _logger.LogDebug(Utils.GetLogFormat() + "Debug Generate Coupons - new Series:{0}", model.CouponSeries);
                    return RedirectToAction("AddCouponSeries", new { id = model._promo.Id });
                }
                else{
                    ViewBag.Command =command.Status ==CommandStatus.Valid? cmd : command;
                    return View("PromotionCouponSeries", model);
                }
            }

            ViewBag.Command = cmd;
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
            return View(new ErrorViewModel(_contextData.AgentUsername, _contextData.AgentGroup) { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
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

        private bool isPropertyChecked(string propName, List<PromotionProperty> properties)
        {
            bool chk = false;
            foreach (var property in properties)
            {
                if (!chk)
                {
                    chk = property.Property.Name == propName ? true : false;
                }
                
            }
                return chk;
        }

        public Command checkIfStatusIsOk(CouponSeriesViewModel model)
        {
            Command result = new Command(CommandStatus.Error_SelectedStatusNotAllowed);
            switch (model.Status)
            {
                case CouponStatus.Created:
                    result = new Command(CommandStatus.Valid); 
                    break;
                case CouponStatus.Issued:
                    if((!isPropertyChecked("NamedHolders", model._promo.PromotionProperties as List<PromotionProperty>) && model.CouponCreation == CouponCreationEnum.Import) 
                    || (isPropertyChecked("NamedHolders", model._promo.PromotionProperties as List<PromotionProperty>) && model.Holders && model.CouponCreation == CouponCreationEnum.Import)
                    || (!model.Users && model.Holders && model.CouponCreation == CouponCreationEnum.Generate))
                    result = new Command(CommandStatus.Valid);
                    break;
                case CouponStatus.Redeemed:
                    if (model.Users && model.CouponCreation == CouponCreationEnum.Import)
                        result = new Command(CommandStatus.Valid);
                    break;
                case CouponStatus.Canceled:
                    result = new Command(CommandStatus.Valid);
                    break;
            }
            return result;
        }

        public List<Coupon> getPotentiallySameCoupons(CouponSeriesViewModel model)
        {
            List<Coupon> potentiallySameCoupons = new List<Coupon>();
            if (model.Prefix != null)
            {
                potentiallySameCoupons.AddRange(_repo.getCoupons().Where(x => x.Code.Length > model.Prefix.Length ? x.Code.Substring(0, model.Prefix.Length) == model.Prefix : x.Code == model.Prefix).ToList<Coupon>());
            }
            if (model.Suffix != null)
            {
                if (model.Prefix != null)
                {
                    potentiallySameCoupons = potentiallySameCoupons.Where(x => x.Code.Length > model.Suffix.Length ? x.Code.Substring((x.Code.Length - model.Suffix.Length), model.Suffix.Length) == model.Suffix : x.Code == model.Suffix).ToList<Coupon>();
                }
                else
                    potentiallySameCoupons.AddRange(_repo.getCoupons().Where(x => x.Code.Length > model.Suffix.Length ? x.Code.Substring((x.Code.Length - model.Suffix.Length), model.Suffix.Length) == model.Suffix : x.Code == model.Suffix).ToList<Coupon>());
            }
            return potentiallySameCoupons;
        }
        #endregion
    }
}
