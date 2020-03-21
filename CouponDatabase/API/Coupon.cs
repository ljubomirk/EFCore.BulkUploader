using System;
using System.Runtime.Serialization;

namespace CouponDatabase.API
{
    [DataContract(Name = "Coupon", Namespace = "http://www.triple-innovations.com/WS/COMMANDO/Types/")]
    public class Coupon
    {
        /* Model properties */
        [DataMember(Name ="Coupon")]
        public string Code { get; set; }
        [DataMember(Name = "CouponStatus")]
        public Lifecycle.CouponStatus CouponStatus { get; set; }
        [DataMember(Name = "AquireFrom")]
        public DateTime AquireFrom { get; set; }
        [DataMember(Name = "AquireTo")]
        public DateTime AquireTo { get; set; }

        [DataMember(Name = "AwardFrom")]
        public DateTime AwardFrom { get; set; }
        [DataMember(Name = "AwardTo")]
        public DateTime AwardTo { get; set; }

        [DataMember(Name = "Holder")]
        public String Holder { get; set; }
        [DataMember(Name = "User")]
        public String User { get; set; }

        /* API properties */
        [DataMember(Name = "Active")]
        public bool Active { get; set; }
    }
}
