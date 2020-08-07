using CouponDatabase.Lifecycle;
using CouponDatabase.Properties;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace CouponDatabase.Models
{
    public class Coupon
    {
        public Coupon() {
            MaxRedeemNo = 1;
        }
        public Coupon(string code, string holder, string user, CouponDatabase.Lifecycle.CouponStatus status, Promotion promo, int  maxRedeemNo=1)
        {
            Code = code;
            Holder = holder;
            User = user;
            Status = (int)status;
            Promotion = promo;
            MaxRedeemNo = maxRedeemNo;
        }
        public Coupon(string code, CouponDatabase.Lifecycle.CouponStatus status, Promotion promo,DateTime? assignableFrom,DateTime? assignableUntil,DateTime? redeemableFrom,DateTime? redeemableUntil, int series=1 ,int maxRedeemNo = 1,bool enabled=true)
        {
            Code = code;
            Status = (int)status;
            Promotion = promo;
            MaxRedeemNo = maxRedeemNo;
            AquireFrom = assignableFrom;
            AquireTo = assignableUntil;
            AwardFrom = redeemableFrom;
            AwardTo = redeemableUntil;
            CouponSeries = series;
            Enabled = enabled;
        }

        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Display(Name = "Coupon_Id", ResourceType = typeof(Resources))]
        public long Id { get; set; }
        //[System.ComponentModel.DataAnnotations.MaxLength(20,ErrorMessageResourceName = , ErrorMessageResourceType = 1]
        [DataType(DataType.Text)]

        [MaxLength(40)]
        [Display(Name = "Coupon_Code", ResourceType = typeof(Resources))]
        public string Code { get; set; }

        [MaxLength(20)]
        [Display(Name = "Coupon_Holder", ResourceType = typeof(Resources))]
        public string Holder { get; set; }
        [MaxLength(20)]
        [Display(Name = "Coupon_User", ResourceType = typeof(Resources))]
        public string User { get; set; }
        [Display(Name = "Coupon_Status", ResourceType = typeof(Resources))]
        public int Status { get; set; }
        [DisplayFormat(DataFormatString = "{0:dd.MM.yyyy}", ApplyFormatInEditMode = true)]
        [DataType(DataType.Date)]
        [Display(Name = "Date_AquireFrom", ResourceType = typeof(Resources))]
        public Nullable<DateTime> AquireFrom { get; set; }
        [DisplayFormat(DataFormatString = "{0:dd.MM.yyyy}", ApplyFormatInEditMode = true)]
        [DataType(DataType.Date)]
        [Display(Name = "Date_AquireTo", ResourceType = typeof(Resources))]
        public Nullable<DateTime> AquireTo { get; set; }

        [DisplayFormat(DataFormatString = "{0:dd.MM.yyyy}", ApplyFormatInEditMode = true)]
        [DataType(DataType.Date)]
        [Display(Name = "Date_AwardFrom", ResourceType = typeof(Resources))]
        public Nullable<DateTime> AwardFrom { get; set; }
        [DisplayFormat(DataFormatString = "{0:dd.MM.yyyy}", ApplyFormatInEditMode = true)]
        [DataType(DataType.Date)]
        [Display(Name = "Date_AwardTo", ResourceType = typeof(Resources))]
        public Nullable<DateTime> AwardTo { get; set; }
        [Display(Name = "Promotion_Id", ResourceType = typeof(Resources))]
        public long PromotionId { get; set; }
        public Promotion Promotion { get; set; }
        [Display(Name = "Coupon_Series", ResourceType = typeof(Resources))]
        public int CouponSeries { get; set; }
        [Display(Name = "Coupon_MaximumRedeem", ResourceType = typeof(Resources))]
        public int MaxRedeemNo { get; set; }
        [Display(Name = "Promotion_StatusEnabled", ResourceType = typeof(Resources))]
        public Boolean Enabled { get; set; }

        /* Active is virtual value, read from other values */
        [Display(Name = "Promotion_Active", ResourceType = typeof(Resources))]
        public Boolean Active
        {
            get => this.GetActive();
        }
        /// <summary>
        /// Returns Active property for Coupon
        /// </summary>
        /// <returns>Boolean value</returns>
        private Boolean GetActive()
        {
            var pValid = (Promotion != null) ? Promotion.Active : false;
            var cr1 = (DateTime.Now.CompareTo(AquireFrom) >= 0) ? true : false;
            var cr2 = (DateTime.Now.CompareTo(AquireTo) < 0) ? true : false;
            var cr3 = (DateTime.Now.CompareTo(AwardFrom) >= 0) ? true : false;
            var cr4 = (DateTime.Now.CompareTo(AquireTo) < 0) ? true : false;

            return cr1 && cr2 && cr3 && cr4 && pValid && Enabled;
        }
        #region Relations
        public IList<CouponHistory> CouponHistories { get; set; }
        #endregion
    }
}
