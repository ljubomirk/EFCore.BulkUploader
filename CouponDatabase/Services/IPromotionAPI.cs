using System;
using System.Collections.Generic;
using System.ServiceModel;
using Models;

namespace Services
{
    /*public class PromotionCode
    {

    }*/
    /* Interface for API object with all DataGovernance data */
    [ServiceContract(Name = "Promotion", Namespace = "http://www.triple-innovations.com/WS/COMMANDO/Promotion/")]
    interface IPromotionAPI
    {
        [OperationContract]
        ICollection<Promotion> Get(DateTime ValidFrom, DateTime ValidTo);

        [OperationContract]
        Promotion Get(string Code);


        [OperationContract]
        Promotion Create(string Code, string Name, DateTime ValidFrom, DateTime ValidTo);

        int AddCoupon(string PromotionCode, string CouponCode, string Holder, string User);

        int AddCoupons();

    }
}

