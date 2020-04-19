using System;
using System.Collections.Generic;
using System.Text;
using CouponDatabase.Models;
using CouponDatabase.Lifecycle;

namespace CouponDatabase.Services
{
    public class ICoupon
    {
        Coupon Coupon { get; }
        public ICoupon(Coupon coupon) { this.Coupon = coupon;  }

        /// <summary>
        /// Fetch Coupon for API call
        /// </summary>
        /// <returns>Coupon</returns>
        public API.Coupon Get() {
            DateTime now = DateTime.Now;
            API.Coupon result = new API.Coupon();
            if(Coupon!=null)
            {
                result.Code = this.Coupon.Code;
                result.Status = (CouponStatus)this.Coupon.Status;
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
            Lifecycle.Command result;
            if (Coupon != null)
            {
                if (coupon.Status != (int)CouponStatus.Issued)
                    result = new Lifecycle.Command(CommandStatus.ErrorInvalidStatus);
                else
                    result = new Lifecycle.Command(CommandStatus.Valid);
            }
            else
            {
                result = new Lifecycle.Command(CommandStatus.ErrorCouponNotFound);
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
