using CouponDatabase.Models;
using Microsoft.AspNetCore.Mvc.Rendering;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebApp.ViewModels
{
    public class LifecycleUpdateViewModel : ContextData
    {
        // Dropdown filters, list
        public List<SelectListItem> PromotionCodes { get; set; }
        public List<SelectListItem> CouponSeries { get; set; }

        // Dropdown filters, selection
        public string SelectedPromoCode { get; set; }
        public string SelectedCouponSeries { get; set; }

        public List<Promotion> Promotions { get; set; }
        public List<Coupon> Coupons { get; set; }
        public List<CouponCommand> CouponsSelected { get; set; }
        public Filters Filter;
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
