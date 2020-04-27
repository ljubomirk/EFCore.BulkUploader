using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WebApp.ViewModels;

namespace WebApp.Services
{
    public class LifecycleManagementModel
    {
        public PromotionFilter PromotionFilter { get; set; }
        public CouponFilters CouponFilter { get; set; }
        public string SelectedPromoCode { get; set; }
        public string SelectedCouponSeries { get; set; }
        public List<CheckedCouponItem> CouponItems { get; set; }
    }
}
