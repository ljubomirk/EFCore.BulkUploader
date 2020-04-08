using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebApp.ViewModels
{
    public class CouponSeriesViewModel : ContextData
    {
        public int NumberOfCoupons { get; set; }
        public DateTime AssignableFrom { get; set; }
        public DateTime AssigableUntil { get; set; }
        public DateTime RedeemableFrom { get; set; }
        public DateTime RedeemableUntil { get; set; }
        public int Status { get; set; }
        public string CouponFormat { get; set; }
        public int CouponMaxLength { get; set; }
        public bool CouponWithLetters { get; set; }
        public bool CouponWithNumbers { get; set; }
    }
}
