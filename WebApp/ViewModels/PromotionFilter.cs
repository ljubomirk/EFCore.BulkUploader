using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebApp.ViewModels
{
    public class PromotionFilter : Filters
    {
        public long PromotionCode { get; set; }

        public int CouponSeries { get; set; }
    }
}
