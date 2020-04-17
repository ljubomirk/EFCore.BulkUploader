using System;
using System.Collections.Generic;
using System.Text;

namespace CouponDatabase.Models
{
    public class CouponAwardChannel
    {

        public long CouponId { get; set; }
        public Coupon Coupon { get; set; }
        public long AwardChannelId { get; set; }
        public AwardChannel AwardChannel { get; set; }

    }
}
