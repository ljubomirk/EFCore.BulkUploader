using System;
using System.Runtime.Serialization;
using CouponDatabase.Lifecycle;

namespace CouponDatabase.API
{
    [DataContract(Name = "Coupon", Namespace = "http://www.triple-innovations.com/WS/COMMANDO/")]
    public class Coupon
    {
        /* Model properties */
        [DataMember(IsRequired = true, EmitDefaultValue = true)]
        public string Code { get; set; }
        [DataMember(IsRequired = true, EmitDefaultValue = true)]
        public String Holder { get; set; }
        [DataMember(IsRequired = true, EmitDefaultValue = true)]
        public String User { get; set; }
        [DataMember(IsRequired = true, EmitDefaultValue = true)]
        public CouponStatus Status { get; set; }
        [DataMember(IsRequired = true, EmitDefaultValue = true)]
        public DateTime? ExpireDate { get; set; }
        [DataMember(IsRequired = true, EmitDefaultValue = true)]
        public string PromotionCode { get; set; }
    }
}
