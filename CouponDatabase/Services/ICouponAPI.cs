using System.Collections.Generic;
using System.ServiceModel;
using CouponDatabase.API;

namespace CouponDatabase.Services
{
    /* Interface for CouponAPI */
    [ServiceContract(Name = "Coupon", Namespace = "http://www.triple-innovations.com/WS/COMMANDO/")]
    public interface ICouponAPI
    {
        [OperationContract]
        ICollection<Coupon> Get(string PromotionCode, string CouponCode);

        [OperationContract]
        Lifecycle.Command Assign(string PromotionCode, string CouponCode, string Holder, string User);

        [OperationContract]
        ICollection<Coupon> Validate(string PromotionCode, string CouponCode);

        [OperationContract]
        Lifecycle.Command Redeem();

        [OperationContract]
        Lifecycle.Command UndoRedeem();

        [OperationContract]
        Lifecycle.Command Cancel();

    }
}

