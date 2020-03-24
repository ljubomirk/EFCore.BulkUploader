using System;
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
            CouponStatus = (int)status;
            Promotion = promo;
        }

        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public long Id { get; set; }
        //[System.ComponentModel.DataAnnotations.MaxLength(20,ErrorMessageResourceName = , ErrorMessageResourceType = 1]
        [DataType(DataType.Text)]
        public string Code { get; set; }

        public string Holder { get; set; }
        public string User { get; set; }

        public int CouponStatus { get; set; }
        public DateTime AquireFrom { get; set; }
        public DateTime AquireTo { get; set; }

        public DateTime AwardFrom { get; set; }
        public DateTime AwardTo { get; set; }

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
            var cr1 = (DateTime.Now.CompareTo(AquireFrom) >= 0) ? true : false;
            var cr2 = (DateTime.Now.CompareTo(AquireTo) < 0) ? true : false;
            var cr3 = (DateTime.Now.CompareTo(AquireFrom) >= 0) ? true : false;
            var cr4 = (DateTime.Now.CompareTo(AquireFrom) >= 0) ? true : false;
            var pr1 = (DateTime.Now.CompareTo(Promotion.ValidFrom) >= 0) ? true : false;
            var pr2 = (DateTime.Now.CompareTo(Promotion.ValidTo) < 0) ? true : false;
            
            return cr1 && cr2 && cr3 && cr4 && pr1 && pr2;
        }
    }
}
