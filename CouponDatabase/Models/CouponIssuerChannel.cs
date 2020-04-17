using System;
using System.Collections.Generic;
using System.Text;

namespace CouponDatabase.Models
{
    public class CouponIssuerChannel
    {

        public long CouponId { get; set; }
        public Coupon Coupon { get; set; }
        public long IssuerChannelId { get; set; }
        public IssuerChannel IssuerChannel { get; set; }

    }
}
