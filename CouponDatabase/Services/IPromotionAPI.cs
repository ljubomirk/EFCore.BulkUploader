using System;
using System.Collections.Generic;
using System.ServiceModel;
using CouponDatabase.Lifecycle;
using CouponDatabase.API;

namespace CouponDatabase.Services
{
    /* Interface for API object with all DataGovernance data */
    [ServiceContract(Name = "Promotion", Namespace = "http://www.triple-innovations.com/WS/COMMANDO")]
    public interface IPromotionAPI
    {
        [OperationContract]
        IList<Promotion> Get(string Code, Nullable<DateTime> ValidFrom, Nullable<DateTime> ValidTo);

        [OperationContract]
        Promotion Create(string Code, string Name, Nullable<DateTime> ValidFrom, Nullable<DateTime> ValidTo);

        [OperationContract]
        Command AddCoupon(string PromotionCode, string CouponCode, string Holder, string User);

        [OperationContract]
        Command AddCoupons(string PromotionCode, ICollection<Coupon> coupons);

    }
}

