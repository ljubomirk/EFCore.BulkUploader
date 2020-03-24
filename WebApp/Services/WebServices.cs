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
using System.Collections;

namespace Web.Services.Soap
{
    public class CouponService
    {
        readonly RepositoryServices _repo;
        readonly ICouponAPI _couponAPI;
        readonly IPromotionAPI _promotionAPI;

        public CouponService(ApplicationDbContext context)
        {
            _repo = new RepositoryServices(context);
            _couponAPI = new CouponAPI(_repo);
            _promotionAPI = new PromotionAPI(_repo);

        }
        public class PromotionAPI : IPromotionAPI
        {
            readonly RepositoryServices _repo;

            public PromotionAPI(RepositoryServices repo)
            {
                _repo = repo;
            }

            public Command AddCoupon(string PromotionCode, string CouponCode, string Holder, string User, DateTime? ExpireDate)
            {
                Impl.PromotionAPI promo = new Impl.PromotionAPI(_repo);
                return promo.AddCoupon(PromotionCode, CouponCode, Holder, User, null);
            }

            public Command AddCoupons(string PromotionCode, IList<Coupon> Coupons)
            {
                throw new NotImplementedException();
            }

            public IList<Promotion> Get(string Code, DateTime? ValidFrom, DateTime? ValidTo)
            {
                throw new NotImplementedException();
            }

            Command IPromotionAPI.Create(string Code, string Name, DateTime? ValidFrom, DateTime? ValidTo)
            {
                throw new NotImplementedException();
            }
        }

        public class CouponAPI : ICouponAPI{

            readonly RepositoryServices _repo;

            public CouponAPI(RepositoryServices repo)
            {
                _repo = repo;
            }
            public Command Assign(string PromotionCode, string CouponCode, string Holder, string User)
            {
                throw new NotImplementedException();
            }

            public Command Cancel(string PromotionCode, string CouponCode)
            {
                throw new NotImplementedException();
            }

            public Coupon Get(string PromotionCode, string CouponCode)
            {
                throw new NotImplementedException();
            }

            public Command Redeem(string PromotionCode, string CouponCode, string User)
            {
                throw new NotImplementedException();
            }

            public Command UndoRedeem(string PromotionCode, string CouponCode)
            {
                throw new NotImplementedException();
            }

            public Command Validate(string PromotionCode, string CouponCode)
            {
                throw new NotImplementedException();
            }
        }
    }
}
