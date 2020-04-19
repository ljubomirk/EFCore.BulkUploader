using CouponDatabase.Lifecycle;
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

        public class CurrentStatus : BaseDefs { }

        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public long Id { get; set; }
        //[System.ComponentModel.DataAnnotations.MaxLength(20,ErrorMessageResourceName = , ErrorMessageResourceType = 1]
        [DataType(DataType.Text)]
        public string Code { get; set; }

        public string Holder { get; set; }
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

        public Command Assign(string Holder, string User)
        {
            Command response = new Command(CommandStatus.ErrorInvalidStatus);
            return response;
        }
        public Command Redeem(string User)
        {
            Command response = new Command(CommandStatus.ErrorInvalidUser);
            return response;
        }
        public Command Cancel()
        {
            Command response = new Command(CommandStatus.Valid);
            return response;
        }
        public Command UndoRedeem()
        {
            Command response = new Command(CommandStatus.Valid);
            return response;
        }
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
            var cr3 = (DateTime.Now.CompareTo(AquireFrom) >= 0) ? true : false;
            var cr4 = (DateTime.Now.CompareTo(AquireFrom) >= 0) ? true : false;

            return cr1 && cr2 && cr3 && cr4 && pValid;
        }
        #region Relations
        public IList<CouponHistory> CouponHistories { get; set; }
        #endregion
    }
}
