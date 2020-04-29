using CouponDatabase.Lifecycle;
using CouponDatabase.Models;
using CouponDatabase.Properties;
using Microsoft.AspNetCore.Mvc.Rendering;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace WebApp.ViewModels
{
    public class LifecycleUpdateViewModel : ContextData
    {
        // Dropdown filters, list
        public List<SelectListItem> DropPromoCodes { get; set; }
        public List<SelectListItem> DropCouponSeries { get; set; }
        public List<SelectListItem> DropCouponStatus { get; set; }
        public List<SelectListItem> DropEnabled{ get; set; }

        // Dropdown filters, selection
        [Display(Name = "Promotion Code")]
        public string SelectedPromoCode { get; set; }
        [Display(Name = "Coupon Series")]
        public string SelectedCouponSeries { get; set; }
        [Display(Name = "Status")]
        public string SelectedCouponStatus { get; set; }
        [Display(Name = "Enabled")]
        public string SelectedEnabled { get; set; }

        // Coupon update fields
        public string Customer { get; set; }
        [DisplayFormat(DataFormatString = "{0:dd.MM.yyyy}", ApplyFormatInEditMode = true)]
        [DataType(DataType.Date)]
        [Display(Name = "Date_RedeemableTo", ResourceType = typeof(Resources))]
        public Nullable<DateTime> RedeemTo { get; set; }
        public string Status { get; set; }
        public string Enabled { get; set; }

        // Coupons to update and update status
        public CouponList CouponList { get; set; }
        public bool CouponUpdateError { get; set; }

        // Coupons and commands
        public List<CouponCommand> CouponsSelected { get; set; }
        public List<LifecycleCommand> LifecycleCommands { get; set; }

        public LifecycleUpdateViewModel()
            {
                CouponList = new CouponList();
                CouponList.Coupons = new List<Coupon>();
            }
            public void Add(Coupon coupon)
            {
                CouponList = new CouponList();
                CouponList.Coupons.Add(coupon);
            }
            public void AddRange(IList<Coupon> coupons)
            {
                CouponList = new CouponList();
                CouponList.Coupons.AddRange(coupons);
            }
        }
}
