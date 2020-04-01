using System;
using System.Collections.Generic;
using System.Text;

namespace CouponDatabase.Models
{
    public class PromotionProperties
    {
        public long PromotionId { get; set; }
        public Promotion Promotion { get; set; }
        public long PropertyId { get; set; }
        public Property Properties { get; set; }
    }
}
