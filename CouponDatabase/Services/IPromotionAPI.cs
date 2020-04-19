using System;
using System.Collections.Generic;
using System.ServiceModel;
using CouponDatabase.Lifecycle;
using CouponDatabase.API;
using System.Xml.Serialization;

namespace CouponDatabase.Services
{

    public class CouponList
    {
        [XmlElement("Items")]
        public List<Coupon> Items { get; set; }
    }
    /* Interface for API object with all DataGovernance data */
    [ServiceContract(Name = "Promotion", Namespace = "http://www.triple-innovations.com/WS/COMMANDO/")]
    public interface IPromotionAPI
    {
        [OperationContract]
        IList<Promotion> Get(string Code, Nullable<DateTime> ValidFrom, Nullable<DateTime> ValidTo);

        [OperationContract]
        Command Create(string Code, string Name, Nullable<DateTime> ValidFrom, Nullable<DateTime> ValidTo, bool Enabled, IList<PromotionProperty> Properties );

        [OperationContract]
        Command AddCoupon(string PromotionCode, string CouponCode, string Holder, string User, Nullable<DateTime> ExpireDate, CouponStatus Status);

        [OperationContract]
        Command AddCoupons(string PromotionCode, IList<Coupon> Coupons);

    }
}

