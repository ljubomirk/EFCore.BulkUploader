using System;
using System.Collections.Generic;
using System.Text;

namespace TripleI.CouponDatabase.API
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
    class PromotionProperty
    {
        public PromotionPropertyEnum Name { get; set; }
        public object Value { get; set; } 
        public ValueType ValueType { get; set; }
    }
}
