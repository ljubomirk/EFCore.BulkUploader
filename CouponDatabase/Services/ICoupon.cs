using System;
using System.Collections.Generic;
using System.Text;
using CouponDatabase.Models;
using System.Resources;
using CouponDatabase.Lifecycle;

namespace CouponDatabase.Services
{
    public abstract class ICoupon
    {
        Coupon coupon { get; set; }
        public ICoupon(Coupon coupon) { this.coupon = coupon;  }

        /// <summary>
        /// Fetch Coupon for API call
        /// </summary>
        /// <returns>Coupon</returns>
        public API.Coupon Get() {
            DateTime now = DateTime.Now;
            API.Coupon result = new API.Coupon
            {
                Code = this.coupon.Code,
                Status = (CouponStatus)this.coupon.CouponStatus
            };
            return result;
        }

        ///
        /// <summary>Business rule for validating coupon change from status Issued to Redeem </summary>
        /// 
        ///<param name="coupon">Coupon to validate</param>
        ///
        public Lifecycle.Command Validate(Coupon coupon, string user)
        {
            Lifecycle.Command result = new Lifecycle.Command();
            if (coupon.CouponStatus != (int)CouponStatus.Issued)
                result.Status = CommandStatus.ErrorInvalidStatus;
            if (result.Status != CommandStatus.Valid)
            {
                var builder = new ResourceManager(this.GetType());
                result.Message = builder.GetString(result.Status.ToString() + "Message");
            }
            return result;
        }
        /// <summary>
        /// Business rule for redeeming coupon change from status Issued to Redeem
        /// </summary>
        /// <param name="coupon">Coupon to redeem</param>
        /// <param name="user">User to redeem coupon (mandatory)</param>
       /// <returns>LifecycleCommandStatus</returns>

        public Lifecycle.Command Redeem(Coupon coupon, string user)
        {
            Lifecycle.Command result = Validate(coupon, user);
            if (result.Status == CommandStatus.Valid && /*coupon.Promotion.Properties.Named &&*/ coupon.User != user)
                result.Status = CommandStatus.ErrorInvalidUser;
            return result;
        }

    }
}
