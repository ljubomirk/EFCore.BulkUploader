using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace CouponDatabase.Models
{
    public class Coupon
    {
        public Coupon() { }
        public Coupon(string code, string holder, string user, CouponDatabase.Lifecycle.CouponStatus status, Promotion promo)
        {
            Code = code;
            Holder = holder;
            User = user;
            Status = (int)status;
            Promotion = promo;
        }

        public class CurrentCouponStatus : BaseDefs { }

        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public long Id { get; set; }
        //[System.ComponentModel.DataAnnotations.MaxLength(20,ErrorMessageResourceName = , ErrorMessageResourceType = 1]
        [DataType(DataType.Text)]
        public string Code { get; set; }

        public string Holder { get; set; }
        public string User { get; set; }

        public int Status { get; set; }
        public DateTime AquireFrom { get; set; }
        public DateTime AquireTo { get; set; }

        public DateTime AwardFrom { get; set; }
        public DateTime AwardTo { get; set; }

        public long PromotionId { get; set; }
        public Promotion Promotion { get; set; }
        public int CouponSeries { get; set; }

        /* Active is virtua value, read from other values */
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
            if (Promotion != null)
                return Promotion.Active;
            else
                return false;
        }
        #region Relations
        public IList<CouponHistory> CouponHistories { get; set; }
        #endregion
    }
}
