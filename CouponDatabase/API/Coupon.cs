using System;
using System.Runtime.Serialization;
using CouponDatabase.Lifecycle;

namespace CouponDatabase.API
{
    [DataContract(Name = "Coupon", Namespace = "http://www.triple-innovations.com/WS/COMMANDO/")]
    public class Coupon
    {
        /* Model properties */
        public string Code { get; set; }
        public String Holder { get; set; }
        public String User { get; set; }
        public CouponStatus Status { get; set; }
        public DateTime ExpireDate { get; set; }
        public string PromotionCode { get; set; }
    }
}
