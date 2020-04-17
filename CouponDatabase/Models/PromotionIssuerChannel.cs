using System;
using System.Collections.Generic;
using System.Text;

namespace CouponDatabase.Models
{
    public class PromotionIssuerChannel
    {

        public long PromotionId { get; set; }
        public Promotion Promotion { get; set; }
        public long IssuerChannelId { get; set; }
        public IssuerChannel IssuerChannel { get; set; }

    }
}
