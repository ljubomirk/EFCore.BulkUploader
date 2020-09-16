using Microsoft.AspNetCore.Mvc.Rendering;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;
using WebApp.ViewModels;

namespace WebApp.Services
{
    public class LifecycleManagementModel
    {
        // Filters
        public PromotionFilter PromotionFilter { get; set; }
        public CouponFilters CouponFilter { get; set; }

        // Dropdown filters, droplist
        public List<SelectListItem> DropPromoNames{ get; set; }
        public List<SelectListItem> DropCouponSeries { get; set; }
        public List<SelectListItem> DropCouponStatus { get; set; }
        public List<SelectListItem> DropEnabled { get; set; }
        public List<SelectListItem> DropApplyTo { get; set; }
        // Dropdown filters, selection
        [Display(Name = "Promotion Name")]
        public string SelectedPromoName { get; set; }
        [Display(Name = "Coupon Series")]
        public string SelectedCouponSeries { get; set; }
        [Display(Name = "Status")]
        public string SelectedCouponStatus { get; set; }
        [Display(Name = "Enabled")]
        public string SelectedEnabled { get; set; }
        [Display(Name = "Apply to")]
        public string SelectedApplyTo { get; set; }
        // Coupon checkboxes
        public List<CheckedCouponItem> CouponItems { get; set; }
    }
}
