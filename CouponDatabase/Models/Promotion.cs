using CouponDatabase.Lifecycle;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;
using CouponDatabase.Properties;
using System.Linq;

namespace CouponDatabase.Models
{
    /// <summary>
    /// Promotion main class
    /// </summary>
    public class Promotion
    {
        #region Properties 
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public long Id { get; set; }
       // [StringLength(20, ErrorMessageResourceName = "Promotion_Code_Length", ErrorMessageResourceType = typeof(Resources))]
        [Required(ErrorMessageResourceName = "Promotion_Code_Required", ErrorMessageResourceType = typeof(Resources))]
       // [Display(Name = "Promotion_Code", ResourceType = typeof(Resources))]
        [DataType(DataType.Text)]
        public String Code { get; set; }
        public Boolean Enabled { get; set; }
        [DisplayFormat(DataFormatString = "{0:dd.MM.yyyy}", ApplyFormatInEditMode = true)]
        [DataType(DataType.Date)]
        [Display(Name = "Date_ValidFrom", ResourceType = typeof(Resources))]
        public Nullable<DateTime> ValidFrom { get; set; }
        [DisplayFormat(DataFormatString = "{0:dd.MM.yyyy}", ApplyFormatInEditMode = true)]
        [DataType(DataType.Date)]
        [Display(Name = "Date_ValidTo", ResourceType = typeof(Resources))]
        public Nullable<DateTime> ValidTo { get; set; }
        public int CouponSeries { get; set; }
        public Boolean HasCoupons
        {
            get => this.GetHasCoupons();
        }
        #endregion
        #region Construction
        public Promotion()
        {
            
        }
        #endregion
        #region Behaviour
        /* Active is virtual value, read from other values */
        public Boolean Active
        {
            get => this.GetActive();
        }
        /// <summary>
        /// Returns Active property for Promotion
        /// </summary>
        /// <returns>Boolean value</returns>
        private Boolean GetActive()
        {
            var pr1 =ValidFrom != null? (DateTime.Now.CompareTo(ValidFrom) >= 0) ? true : false : false;
            var pr2 = ValidTo != null? (DateTime.Now.CompareTo(ValidTo) < 0) ? true : false : true;

            return Enabled && pr1 && pr2;
        }

        private Boolean GetHasCoupons()
        {
            // Can be property that is checked by fetching Coupons connected to Promotion (Count>0) or
            // Can be set in DB as true, when first coupons are added to Promotion
            /*
            if(Coupons.Count()>1)
                return true 
             */

            return Coupons!=null ? true : false;
        }

        #endregion
        #region Relations
        public IList<PromotionIssuerChannel> PromotionIssuerChannels { get; set; }
        public IList<PromotionAwardChannel> PromotionAwardChannels { get; set; }
        public IList<PromotionProperty> PromotionProperties { get; set; }
        public IList<Coupon> Coupons { get; set; }
        #endregion
    }
}
