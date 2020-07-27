using CouponDatabase.Lifecycle;
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
        public long Id { get; set; }
        //[System.ComponentModel.DataAnnotations.MaxLength(20,ErrorMessageResourceName = , ErrorMessageResourceType = 1]
        [DataType(DataType.Text)]

        [MaxLength(40)]
        public string Code { get; set; }

        [MaxLength(20)]
        public string Holder { get; set; }
        [MaxLength(20)]
        public string User { get; set; }

        public int Status { get; set; }
        [DisplayFormat(DataFormatString = "{0:dd.MM.yyyy}", ApplyFormatInEditMode = true)]
        [DataType(DataType.Date)]
        public Nullable<DateTime> AquireFrom { get; set; }
        [DisplayFormat(DataFormatString = "{0:dd.MM.yyyy}", ApplyFormatInEditMode = true)]
        [DataType(DataType.Date)]
        public Nullable<DateTime> AquireTo { get; set; }

        [DisplayFormat(DataFormatString = "{0:dd.MM.yyyy}", ApplyFormatInEditMode = true)]
        [DataType(DataType.Date)]
        public Nullable<DateTime> AwardFrom { get; set; }
        [DisplayFormat(DataFormatString = "{0:dd.MM.yyyy}", ApplyFormatInEditMode = true)]
        [DataType(DataType.Date)]
        public Nullable<DateTime> AwardTo { get; set; }

        public long PromotionId { get; set; }
        public Promotion Promotion { get; set; }
        public int CouponSeries { get; set; }
        public int MaxRedeemNo { get; set; }
        public Boolean Enabled { get; set; }

        /* Active is virtual value, read from other values */
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
