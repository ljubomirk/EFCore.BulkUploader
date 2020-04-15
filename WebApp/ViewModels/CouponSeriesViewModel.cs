using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using CouponDatabase.Properties;
using System.Web;

namespace WebApp.ViewModels
{
    public class CouponSeriesViewModel : ContextData
    {
        public long Id { get; set; }
        //[Required(ErrorMessageResourceName = "Promotion_Code_Required", ErrorMessageResourceType = typeof(Resources))]
        public long PromotionId { get; set; }
        public int NumberOfCoupons { get; set; }
        //[DisplayFormat(DataFormatString = "{0:dd.MM.yyyy}", ApplyFormatInEditMode = true)]
        //[Required(ErrorMessageResourceName = "Coupon_AssignableFrom_Required", ErrorMessageResourceType = typeof(Resources))]
        //[DataType(DataType.Date)]
        public DateTime AssignableFrom { get; set; }
        //[DisplayFormat(DataFormatString = "{0:dd.MM.yyyy}", ApplyFormatInEditMode = true)]
        //[DataType(DataType.Date)]
        public DateTime AssignableUntil { get; set; }
        //[DisplayFormat(DataFormatString = "{0:dd.MM.yyyy}", ApplyFormatInEditMode = true)]
        //[Required(ErrorMessageResourceName = "Coupon_RedeemableFrom_Required", ErrorMessageResourceType = typeof(Resources))]
        //[DataType(DataType.Date)]
        public DateTime RedeemableFrom { get; set; }
        //[DisplayFormat(DataFormatString = "{0:dd.MM.yyyy}", ApplyFormatInEditMode = true)]
        //[DataType(DataType.Date)]
        public DateTime RedeemableUntil { get; set; }
        public int Status { get; set; }
        //public string CouponFormat { get; set; }
        public string Prefix { get; set; }
        public string Suffix { get; set; }
        public int CouponMaxLength { get; set; }
        public bool CouponWithLetters { get; set; }
        public bool CouponWithNumbers { get; set; }
        //public HttpPostedFileBase file { get; set; }
    }
}
