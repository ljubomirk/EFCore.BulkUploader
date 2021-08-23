using System.Collections.Generic;
using System.ServiceModel;
using CouponDatabase.API;
using CouponDatabase.Lifecycle;

namespace CouponDatabase.Services
{
    ///<summary>Interface for CouponAPI</summary>
    ///<remarks>
    ///  SoapCore WSDL generation will put arrays of objects to target namespace
    ///  --> also set all entity objects to same target namespace.
    ///</remarks>
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
        ValidationResponse Validate(string PromotionCode, string CouponCode, string User, string Channel);

        [OperationContract]
        Command Redeem(string PromotionCode, string CouponCode, string User);

        [OperationContract]
        Command UndoRedeem(string PromotionCode, string CouponCode);

        [OperationContract]
        Command Cancel(string PromotionCode, string CouponCode);

    }
}

