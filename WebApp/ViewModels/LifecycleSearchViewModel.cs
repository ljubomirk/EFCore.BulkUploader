using CouponDatabase.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebApp.ViewModels
{
    public class LifecycleSearchViewModel : ContextData
    {
        public List<Promotion> Promotions { get; set; }
        public PromotionFilter PromotionFilter;
        public List<Coupon> Coupons { get; set; }
        public CouponFilters CouponFilter;
        public LifecycleSearchViewModel()
        {
            Coupons = new List<Coupon>();
            Promotions = new List<Promotion>();

        }
        public void AddPromotion(Promotion promo)
        {
            Promotions.Add(promo);
        }
        public void AddPromotionRange(IList<Promotion> promos)
        {
            Promotions.AddRange(promos);
        }
        public void AddCoupon(Coupon coupon)
        {
            Coupons.Add(coupon);
        }
        public void AddCouponRange(IList<Coupon> coupons)
        {
            Coupons.AddRange(coupons);
        }
    }
}
