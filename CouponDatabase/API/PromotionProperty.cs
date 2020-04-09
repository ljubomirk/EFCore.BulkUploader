using System;
using System.Collections.Generic;
using System.Text;

namespace CouponDatabase.API
{
    public enum PromotionPropertyEnum
    {
        UniqueCoupons = 1,
        RequestNamedConsumers = 2,
        RequestNamedHolders = 3,
        HolderOnlyConsumer = 4,
        AllowMultipleRedeem = 5,
        AllowCouponSeries = 6,
    }
    public class PromotionProperty
    {
        public PromotionPropertyEnum Name { get; set; }
        public bool Checked { get; set; } 
    }
}
