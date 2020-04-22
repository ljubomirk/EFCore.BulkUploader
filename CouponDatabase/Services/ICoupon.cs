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
            API.Coupon result = null;
            if(Coupon!=null)
            {
                result = new API.Coupon
                {
                    Code = Coupon.Code,
                    Status = (CouponStatus)Coupon.Status,
                    ExpireDate = (this.Coupon.AwardTo.HasValue) ? Coupon.AwardTo.Value : DateTime.MaxValue,
                    PromotionCode = (this.Coupon.Promotion!=null) ? Coupon.Promotion.Code : "",
                    Holder = Coupon.Holder,
                    User = Coupon.User
                };
            };
            return result;
        }

        private void AddHistory(string action, string user)
        {
            if (Coupon.CouponHistories == null)
                Coupon.CouponHistories = new List<CouponHistory>();
            //add current coupon to history
            Coupon.CouponHistories.Add(new CouponHistory(Coupon, action, user));
        }
        ///
        /// <summary>Business rule for validating coupon change from status Issued to Redeem </summary>
        /// 
        ///<param name="coupon">Coupon to validate</param>
        ///
        public Lifecycle.Command Validate(string user)
        {
            Lifecycle.Command result = new Lifecycle.Command(CommandStatus.Valid);
            if (Coupon != null)
            {
                if (Coupon.Status != (int)CouponStatus.Issued)
                    result = new Lifecycle.Command(CommandStatus.ErrorInvalidStatus);
                if (result.Status == CommandStatus.Valid && Coupon.User != user)
                    result.Status = CommandStatus.ErrorInvalidUser;
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

        public Lifecycle.Command Redeem(string user)
        {
            Lifecycle.Command result = Validate(user);
            if (result.Status == CommandStatus.Valid)
            {
                Coupon.Status = (int)CouponStatus.Redeemed;
                AddHistory("Redeem", user);
            }
            return result;
        }

        public Lifecycle.Command UndoRedeem()
        {
            CommandStatus status = (Coupon.User != null) ? CommandStatus.Valid : CommandStatus.ErrorInvalidStatus;
            Lifecycle.Command result = new Command(status);
            if(result.Status == CommandStatus.Valid) {
                Coupon.Status = (int)CouponStatus.Issued;
                AddHistory("UndoRedeem", "");
            }
            return result;
        }
        public Lifecycle.Command Assign(string Holder, string User)
        {
            CommandStatus status = (Coupon.Holder != null) ? CommandStatus.Valid : CommandStatus.ErrorInvalidUser;
            Lifecycle.Command result = new Command(status);
            if (result.Status == CommandStatus.Valid)
            {
                Coupon.Holder = Holder;
                Coupon.User = User;
                Coupon.Status = (int)CouponStatus.Issued;
                AddHistory("Assign", User);
            }
            return result;
        }
        public Lifecycle.Command Cancel()
        {
            CommandStatus status =  CommandStatus.Valid;
            Lifecycle.Command result = new Command(status);
            if (result.Status == CommandStatus.Valid)
            {
                Coupon.Status = (int)CouponStatus.Canceled;
                AddHistory("Cancel", "");
            }
            return result;
        }

    }
}
