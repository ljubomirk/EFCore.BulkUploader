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
        NamedHolders = 1,
        [EnumMember]
        HolderIsOnlyConsumer = 2,
        [EnumMember]
        AllowMultipleRedeem = 3,
        [EnumMember]
        AllowCouponSeries = 4,
    }
    [DataContract(Name = "PromotionProperty", Namespace = "http://www.triple-innovations.com/WS/COMMANDO/")]
    public class PromotionProperty
    {
        [DataMember(IsRequired = true, EmitDefaultValue = true)]
        public PromotionPropertyEnum Name { get; set; }
    }
}
