using System;
using System.Collections.Generic;
using System.Text;
using CouponDatabase.Models;
using CouponDatabase.Lifecycle;
using System.Linq;

namespace CouponDatabase.Services
{
    public class ICoupon
    {
        int _loadStatus = 0; //used to check isf coupon is there >0
        public Coupon Coupon { get; }
        public ICoupon(Coupon coupon) { 
            Coupon = coupon;
            if (Coupon != null)
                _loadStatus = Coupon.Status;
        }

        /// <summary>
        /// Fetch Coupon for API call
        /// </summary>
        /// <returns>Coupon</returns>
        public API.Coupon Get() {
            API.Coupon result = null;
            if(_loadStatus>0)
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

        private Command StateChange(CouponStatus status)
        {
            Lifecycle.Command result;
            if (_loadStatus > 0) {
                switch (Coupon.Status)
                {
                    case (int)CouponStatus.Created:
                        if(status == CouponStatus.Issued || status == CouponStatus.Canceled || status == CouponStatus.Created)
                            result = new Lifecycle.Command(CommandStatus.Valid);
                        else
                            result = new Lifecycle.Command(CommandStatus.ErrorInvalidStatus);
                        break;
                    case (int)CouponStatus.Issued:
                        if (status == CouponStatus.Redeemed || status == CouponStatus.Canceled || status == CouponStatus.Issued)
                            result = new Lifecycle.Command(CommandStatus.Valid);
                        else
                            result = new Lifecycle.Command(CommandStatus.ErrorInvalidStatus);
                        break;
                    case (int)CouponStatus.Redeemed:
                        if (status == CouponStatus.Issued || status == CouponStatus.Canceled)
                            result = new Lifecycle.Command(CommandStatus.Valid);
                        else
                            result = new Lifecycle.Command(CommandStatus.ErrorInvalidStatus);
                        break;
                    default://Canceled is not allowed to change
                        result = new Lifecycle.Command(CommandStatus.ErrorInvalidStatus);
                        break;
                }
            }
            else
            {
                result = new Lifecycle.Command(CommandStatus.ErrorCouponNotFound);
            }
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
            if (_loadStatus > 0)
            {
                if (Coupon.Status != (int)CouponStatus.Issued)
                    if(Coupon.Status == (int)CouponStatus.Redeemed)
                    {
                        result = new Lifecycle.Command(CommandStatus.ErrorAlreadyUsed);
                    }
                    else
                    {
                        result = new Lifecycle.Command(CommandStatus.ErrorInvalidStatus);
                    }
                if (result.Status == CommandStatus.Valid)
                {
                    List<PropertyTypeEnum> props = Coupon.Promotion.GetProperties();
                    /**
                     * For multiple redeem coupons MaxRedeem counter must be greater than 0
                     */
                    if (props.Contains(PropertyTypeEnum.AllowMultipleRedeems) && Coupon.MaxRedeemNo == 0)
                        result = new Lifecycle.Command(CommandStatus.ErrorInvalidStatus);

                    /**
                     * Named coupons rules
                     */
                    if (props.Contains(PropertyTypeEnum.NamedHolders)) {
                        if (user == "")
                            result = new Lifecycle.Command(CommandStatus.ErrorInvalidUser);
                        /**
                         * For named coupons that holder is consumer, coupon Holder and user must macth
                         */
                        if (props.Contains(PropertyTypeEnum.HoldersOnlyConsumer) && Coupon.Holder != user)
                            result = new Lifecycle.Command(CommandStatus.ErrorInvalidUser);

                        /**
                         * For multiple redeem coupons user can use only once when named 
                         */
                        if (props.Contains(PropertyTypeEnum.AllowMultipleRedeems) && Coupon.CouponHistories.Any(i => i.User == user))
                            result = new Lifecycle.Command(CommandStatus.ErrorInvalidUser);

                    }
                }
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
            Lifecycle.Command result = StateChange(CouponStatus.Redeemed);
            if (result.Status == CommandStatus.Valid)
            {
                result = Validate(user);
                if (result.Status == CommandStatus.Valid)
                {
                    Coupon.MaxRedeemNo--;

                    //when MaxRedeemNo == 0 then Coupon.Status is Redeemed, otherwise should stay Issued
                    if (Coupon.MaxRedeemNo==0)  
                        Coupon.Status = (int)CouponStatus.Redeemed;
                    Coupon.User = user;
                    AddHistory("Redeem", user);
                }
            }
            return result;
        }

        public Lifecycle.Command UndoRedeem()
        {
            Lifecycle.Command result = StateChange(CouponStatus.Issued);
            if (result.Status == CommandStatus.Valid)
            {
                //CommandStatus status = (Coupon.User != null) ? CommandStatus.Valid : CommandStatus.ErrorInvalidStatus;
                //result = new Command(status);
                if(result.Status == CommandStatus.Valid) {
                    Coupon.MaxRedeemNo++;
                    Coupon.Status = (int)CouponStatus.Issued;
                    Coupon.User = "";
                    AddHistory("UndoRedeem", "");
                }
            }
            return result;
        }
        public Lifecycle.Command Assign(string Holder, string User)
        {
            Lifecycle.Command result = StateChange(CouponStatus.Issued);
            if(result.Status == CommandStatus.Valid)
            {
                List<PropertyTypeEnum> props = Coupon.Promotion.GetProperties();
                /**
                 * Named holder coupons rules
                 */
                if (props.Contains(PropertyTypeEnum.NamedHolders))
                {
                    if (Holder != "")
                        Coupon.Holder = Holder;
                    else
                        result = new Command(CommandStatus.ErrorInvalidUser);
                }
                if (result.Status == CommandStatus.Valid)
                {
                    Coupon.Status = (int)CouponStatus.Issued;
                    AddHistory("Assign", User);
                }
            }
            return result;
        }

        public Lifecycle.Command Cancel()
        {
            Lifecycle.Command result = StateChange(CouponStatus.Canceled);
            if (result.Status == CommandStatus.Valid)
            {
                CommandStatus status = (Coupon.Status != (int)CouponStatus.Canceled) ? CommandStatus.Valid : CommandStatus.ErrorInvalidStatus;
                result = new Command(status);
                if (result.Status == CommandStatus.Valid)
                {
                    Coupon.Status = (int)CouponStatus.Canceled;
                    AddHistory("Cancel", "");
                }
            }
            return result;
        }
        /**
         * 
         * Set new user on coupon as defined in Customer update field.
         */
        public Lifecycle.Command AssignUser(string user)
        {
            Lifecycle.Command result = new Command(CommandStatus.Valid);
            if ((CouponStatus)Coupon.Status == CouponStatus.Created || (CouponStatus)Coupon.Status == CouponStatus.Issued)
            {
                List<PropertyTypeEnum> props = Coupon.Promotion.GetProperties();
                /**
                 * Named holder coupons rules
                 */
                if (props.Contains(PropertyTypeEnum.NamedHolders))
                {
                    if (user != "")
                        Coupon.Holder = user;
                    else
                        result = new Command(CommandStatus.ErrorInvalidUser);
                }
                else
                {
                    result = new Command(CommandStatus.ErrorHolderWOProperty);
                }
                
                /**
                 * *COMMENTED OUT SINCE IT'S NOT USED ANYMORE*
                 * Named consumer coupons rules
               
                if (props.Contains(PropertyTypeEnum.NamedConsumers) && props.Contains(PropertyTypeEnum.HolderIsOnlyConsumer))
                {
                    Coupon.User = user;
                }
                **/
                if (result.Status == CommandStatus.Valid)
                {
                    if (user != "")
                        AddHistory("AssignUser", user);

                }
            }
            else
            {
                result = new Command(CommandStatus.ErrorInvalidCustomer);
                result.Message = String.Format(result.Message + " Code: " + Coupon.Code);
            }
            return result;
        }

        /*
         * Set new AwardTo date on coupon, as defined in ReedemableUntil update field.
         */
        public Lifecycle.Command Prolong(Nullable<DateTime> RedeemUntil)
        {
            Lifecycle.Command result;
            if ((CouponStatus)Coupon.Status == CouponStatus.Created || (CouponStatus)Coupon.Status == CouponStatus.Issued)
            {
                CommandStatus status = RedeemUntil <= this.Coupon.Promotion.ValidTo? CommandStatus.Valid : CommandStatus.ErrorInvalidRedeemDate;
                result = new Command(status);
                if (result.Status == CommandStatus.Valid)
                {
                    Coupon.AwardTo = RedeemUntil;
                    AddHistory("Prolong", RedeemUntil.ToString());
                } else
                {
                    result.Message = String.Format(result.Message + " Code: " + Coupon.Code);
                }
                return result;
            } else
            {
                result = new Command(CommandStatus.ErrorInvalidStatus);
                result.Message = String.Format(result.Message + " Code: " + Coupon.Code);
                AddHistory("Prolong", "");
            }
            return result;
        }

        /*
         * Set new enabled state on coupon, as defined in Enable update field.
         */
        public Lifecycle.Command Enable()
        {
            Lifecycle.Command result = new Command(CommandStatus.Valid);
            Coupon.Enabled = true;
            AddHistory("Enable", "");
            return result;
        }
        public Lifecycle.Command Disable()
        {
            Lifecycle.Command result = new Command(CommandStatus.Valid);
            Coupon.Enabled = false;
            AddHistory("Disable", "");
            return result;
        }

        /*
         * Set coupon status, as defined in dropdown list.
         */
        public Lifecycle.Command UpdateStatus(CouponStatus status)
        {
            Lifecycle.Command result = StateChange(status);
            if(result.Status == CommandStatus.Valid)
            {
                Coupon.Status = (int)status;
                AddHistory("UpdateStatus", status.ToString());
            } else
            {
                result.Message = String.Format(result.Message + " Code: " + Coupon.Code);
            }
            return result;
        }
    }
}
