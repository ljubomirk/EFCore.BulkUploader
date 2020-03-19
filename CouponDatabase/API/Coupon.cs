using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Models;

namespace API
{
    public class Coupon
    {
        /* Model properties */
        public string Code { get; set; }
        public Enumerators.CouponStatus CouponStatus { get; set; }
        public DateTime AquireFrom { get; set; }
        public DateTime AquireTo { get; set; }

        public DateTime AwardFrom { get; set; }
        public DateTime AwardTo { get; set; }

        /* API properties */
        public bool Active { get; set; }
    }
}
