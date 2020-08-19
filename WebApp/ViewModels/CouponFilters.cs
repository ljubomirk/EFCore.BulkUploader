using System;
using CouponDatabase.Models;
using System.Collections.Generic;
using WebApp.Services;
using System.ComponentModel.DataAnnotations;
using CouponDatabase.Properties;
using WebApp.Data;

namespace WebApp.ViewModels
{
    public class CouponFilters : Filters
    {
        public bool ActiveCoupons { get; set; }
        public bool InactiveCoupons { get; set; }
        [Display(Name = "Promotion_IssuerChannels", ResourceType = typeof(Resources))]
        public List<CheckedItem> IssuerChannels { get; set; }
        [Display(Name = "Promotion_AwardChannels", ResourceType = typeof(Resources))]
        public List<CheckedItem> AwardChannels { get; set; }
        [Display(Name = "Promotion_CurrentStatus", ResourceType = typeof(Resources))]
        public List<CheckedItem> CurrentStatus { get; set; }

        // Aquire From & To
        [DisplayFormat(DataFormatString = "{0:dd.MM.yyyy}", ApplyFormatInEditMode = true)]
        //[Required(ErrorMessageResourceName = "Coupon_AssignableFrom_Required", ErrorMessageResourceType = typeof(Resources))]
        [DataType(DataType.Date)]
        [Display(Name = "Date_AssignableFrom", ResourceType = typeof(Resources))]
        public Nullable<DateTime> AssignableFrom { get; set; }

        [DisplayFormat(DataFormatString = "{0:dd.MM.yyyy}", ApplyFormatInEditMode = true)]
        [DataType(DataType.Date)]
        [Display(Name = "Date_AssignableTo", ResourceType = typeof(Resources))]
        public Nullable<DateTime> AssignableUntil { get; set; }

        // Redeem From & To
        [DisplayFormat(DataFormatString = "{0:dd.MM.yyyy}", ApplyFormatInEditMode = true)]
        //[DisplayFormat(DataFormatString = Resources.Promotion_Date_Format, ApplyFormatInEditMode = true)]
        //[Required(ErrorMessageResourceName = "Coupon_RedeemableFrom_Required", ErrorMessageResourceType = typeof(Resources))]
        [DataType(DataType.Date)]
        [Display(Name = "Date_RedeemableFrom", ResourceType = typeof(Resources))]
        public Nullable<DateTime> RedeemableFrom { get; set; }

        [DisplayFormat(DataFormatString = "{0:dd.MM.yyyy}", ApplyFormatInEditMode = true)]
        [DataType(DataType.Date)]
        [Display(Name = "Date_RedeemableTo", ResourceType = typeof(Resources))]
        public Nullable<DateTime> RedeemableUntil { get; set; }

        public CouponFilters()
        {
            ActiveCoupons = true;
            InactiveCoupons = false;
            IssuerChannels = new List<CheckedItem>();
            AwardChannels = new List<CheckedItem>();
            CurrentStatus = new List<CheckedItem>();
            Properties = new List<CheckedItem>();
        }
    }
}