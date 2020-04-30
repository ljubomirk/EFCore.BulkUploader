using System;
using System.Collections.Generic;
using System.ServiceModel;
using CouponDatabase.Lifecycle;
using CouponDatabase.API;
using System.Xml.Serialization;

namespace CouponDatabase.Services
{

    ///<summary>Interface for PromotionAPI</summary>
    ///<remarks>
    ///  SoapCore WSDL generation will put arrays of objects to target namespace
    ///  --> also set all entity objects to same target namespace.
    ///</remarks>
    [ServiceContract(Name = "Promotion", Namespace = "http://www.triple-innovations.com/WS/COMMANDO/")]
    public interface IPromotionAPI
    {
        [OperationContract]
        IList<Promotion> Get(string Code, Nullable<DateTime> ValidFrom, Nullable<DateTime> ValidTo);

        [OperationContract]
        Command Create(string Code, Nullable<DateTime> ValidFrom, Nullable<DateTime> ValidTo, bool Enabled, IList<PromotionProperty> Properties );

        [OperationContract]
        Command AddCoupon(string PromotionCode, string CouponCode, string Holder, string User, Nullable<DateTime> ExpireDate, CouponStatus Status);

        [OperationContract]
        Command AddCoupons(string PromotionCode, IList<Coupon> Coupons);

    }
}

