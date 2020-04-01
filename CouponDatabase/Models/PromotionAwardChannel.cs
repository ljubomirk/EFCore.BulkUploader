using System;
using System.Collections.Generic;
using System.Text;

namespace CouponDatabase.Models
{
    public class PromotionAwardChannel
    {

        public long PromotionId { get; set; }
        public Promotion Promotion { get; set; }
        public long AwardChannelId { get; set; }
        public AwardChannel AwardChannel { get; set; }

    }
}
