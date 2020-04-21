using System.Collections.Generic;
using System.ServiceModel;
using CouponDatabase.API;
using CouponDatabase.Lifecycle;

namespace CouponDatabase.Services
{
    /* Interface for CouponAPI */
    [ServiceContract(Name = "Coupon", Namespace = "http://www.triple-innovations.com/WS/COMMANDO/")]
    public interface ICouponAPI
    {
        [OperationContract]
        Coupon Get(string PromotionCode, string CouponCode);

        [OperationContract]
        List<Coupon> GetUserCoupons(string User);

        [OperationContract]
        Command Assign(string PromotionCode, string CouponCode, string Holder, string User);

        [OperationContract]
        Command Validate(string PromotionCode, string CouponCode, string User);

        [OperationContract]
        Command Redeem(string PromotionCode, string CouponCode, string User);

        [OperationContract]
        Command UndoRedeem(string PromotionCode, string CouponCode);

        [OperationContract]
        Command Cancel(string PromotionCode, string CouponCode);

    }
}

