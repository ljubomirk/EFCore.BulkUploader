using CouponDatabase.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebApp.ViewModels
{
    public class LifecycleUpdateViewModel : ContextData
    {
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
