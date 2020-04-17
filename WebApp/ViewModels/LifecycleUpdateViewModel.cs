﻿using CouponDatabase.Lifecycle;
using CouponDatabase.Models;
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
        public string ValidTo { get; set; }
        public string Status { get; set; }
        public string Enabled { get; set; }

        public List<Promotion> Promotions { get; set; }
        public List<Coupon> Coupons { get; set; }
        public List<CouponCommand> CouponsSelected { get; set; }
        public List<LifecycleCommand> LifecycleCommands { get; set; }
    public LifecycleUpdateViewModel()
        {
            Coupons = new List<Coupon>();
        }
        public void Add(Coupon coupon)
        {
            Coupons.Add(coupon);
        }
        public void AddRange(IList<Coupon> coupons)
        {
            Coupons.AddRange(coupons);
        }
    }
}
