using CouponDatabase.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebApp.ViewModels
{
    public class LifecycleSearchViewModel : ContextData
    {
        public List<Coupon> Coupons { get; set; }
        public Filters Filter;
        public LifecycleSearchViewModel()
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
