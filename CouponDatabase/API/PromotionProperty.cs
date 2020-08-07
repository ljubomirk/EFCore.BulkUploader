using System;
using System.Collections.Generic;
using System.Runtime.Serialization;
using System.Text;

namespace CouponDatabase.API
{
    [DataContract(Name = "PromotionPropertyEnum", Namespace = "http://www.triple-innovations.com/WS/COMMANDO/Types/")]
    public enum PromotionPropertyEnum
    {
        [EnumMember]
        NamedHolders = 3,
        [EnumMember]
        HolderOnlyConsumer = 4,
        [EnumMember]
        AllowMultipleRedeem = 5,
        [EnumMember]
        AllowCouponSeries = 6,
    }
    [DataContract(Name = "PromotionProperty", Namespace = "http://www.triple-innovations.com/WS/COMMANDO/")]
    public class PromotionProperty
    {
        [DataMember(IsRequired = true, EmitDefaultValue = true)]
        public PromotionPropertyEnum Name { get; set; }
    }
}
