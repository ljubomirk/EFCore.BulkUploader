using CouponDatabase.Models;
using System;
using System.Collections.Generic;
using System.Text;

namespace CouponDatabase.Services
{
    public abstract class IPromotion
    {
        Promotion promo { get; set; }
        public IPromotion(Promotion promo) { this.promo = promo; }

        /// <summary>
        /// Fetch Coupon for API call
        /// </summary>
        /// <returns>Coupon</returns>
        public ICollection<IPromotion> Get()
        {
            ICollection<IPromotion> ret = new List<IPromotion>();
            return ret;
        }
    }
}
