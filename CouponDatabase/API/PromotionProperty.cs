using System;
using System.Collections.Generic;
using System.Text;

namespace TripleI.CouponDatabase.API
{
    public enum PromotionPropertyEnum
    {
        RequestNamedConsumers,
        RequestNamedHolders,
        HolderOnlyConsumer,
        AllowedAwardChannels,
        AllowMultipleRedeem,
        AllowCouponSeries,
    }
    class PromotionProperty
    {
        public PromotionPropertyEnum Name { get; set; }
        public object Value { get; set; } 
        public ValueType ValueType { get; set; }
    }
}
