using CouponDatabase.Lifecycle;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;
using CouponDatabase.Properties;

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
        //[System.ComponentModel.DataAnnotations.MaxLength(20,ErrorMessageResourceName = , ErrorMessageResourceType = 1]
        //[StringLength(20, ErrorMessageResourceName = "Promotion.Code.Length", ErrorMessageResourceType = typeof(Resources))]
        //[Required(ErrorMessageResourceName = "Promotion.Code.Required", ErrorMessageResourceType = typeof(Resources))]
        //[Display(Name = "Promotion.Code", ShortName = "Promotion.Code", ResourceType = typeof(Resources))]
        [DataType(DataType.Text)]
        public String Code { get; set; }
        public Boolean Enabled { get; set; }
        public DateTime ValidFrom { get; set; }
        public DateTime ValidTo { get; set; }
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
            var pr1 = (DateTime.Now.CompareTo(ValidFrom) >= 0) ? true : false;
            var pr2 = (DateTime.Now.CompareTo(ValidTo) < 0) ? true : false;

            return Enabled && pr1 && pr2;
        }

        public Boolean HasCoupons
        {
            get => true;
        }
        #endregion
        #region Relations
        public IList<PromotionIssuerChannel> PromotionIssuerChannels { get; set; }
        public IList<PromotionAwardChannel> PromotionAwardChannels { get; set; }
        public IList<PromotionProperties> PromotionProperties { get; set; }
        public IList<Coupon> Coupons { get; set; }
        #endregion
    }
}
