using CouponDatabase.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebApp.ViewModels
{
    public class CouponList
    {
        public Coupon Coupon {get; set;}
        public List<Coupon> Coupons { get; set; }
        public List<CheckedCouponItem> CouponItems { get; set; }
        public bool SelectAllCoupons { get; set; }
    }
}
