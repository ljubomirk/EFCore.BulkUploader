using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WebApp.Data;
using WebApp.Services;
using CouponDatabase.Services;
using CouponDatabase.Lifecycle;
using CouponDatabase.API;
using System.Runtime.Serialization;

namespace Web.Services.Soap
{
    public class CouponSoapService
    {
        readonly RepositoryServices _repo;
        ICouponAPI _couponAPI;
        IPromotionAPI _promotionAPI;

        public CouponSoapService(ApplicationDbContext context)
        {
            _repo = new RepositoryServices(context);
            _couponAPI = new CouponAPI();
            _promotionAPI = new PromotionAPI();

        }
        public class PromotionAPI : IPromotionAPI
        {
            public Command AddCoupon(string PromotionCode, string CouponCode, string Holder, string User)
            {
                throw new NotImplementedException();
            }
            //[CollectionDataContract(Name ="ArrayOfCoupons", ItemName = "Coupon")]
            public Command AddCoupons(string PromotionCode, ICollection<Coupon> coupons)
            {
                throw new NotImplementedException();
            }

            public Promotion Create(string Code, string Name, DateTime? ValidFrom, DateTime? ValidTo)
            {
                throw new NotImplementedException();
            }

            public IList<Promotion> Get(string Code, DateTime? ValidFrom, DateTime? ValidTo)
            {
                throw new NotImplementedException();
            }
        }

        public class CouponAPI : ICouponAPI{

            public Command Assign(string PromotionCode, string CouponCode, string Holder, string User)
            {
                throw new NotImplementedException();
            }

            public Command Cancel()
            {
                throw new NotImplementedException();
            }

            public ICollection<Coupon> Get(string PromotionCode, string CouponCode)
            {
                throw new NotImplementedException();
            }

            public Command Redeem()
            {
                throw new NotImplementedException();
            }

            public Command UndoRedeem()
            {
                throw new NotImplementedException();
            }

            public ICollection<Coupon> Validate(string PromotionCode, string CouponCode)
            {
                throw new NotImplementedException();
            }
        }
    }
}
