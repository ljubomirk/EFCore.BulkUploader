using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WebApp.Data;
using WebApp.Services;
using CouponDatabase.Services;
using CouponDatabase.Lifecycle;
using CouponDatabase.API;

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
            _couponAPI = new CouponAPI(new Impl.CouponAPI(_repo));
            _promotionAPI = new PromotionAPI(new Impl.PromotionAPI(_repo));

        }
        public class PromotionAPI : IPromotionAPI
        {
            readonly Impl.PromotionAPI _service;

            public PromotionAPI(Impl.PromotionAPI service)
            {
                _service = service;
            }

            public Command AddCoupon(string PromotionCode, string CouponCode, string Holder, string User, DateTime? ExpireDate)
            {
                return _service.AddCoupon(PromotionCode, CouponCode, Holder, User, ExpireDate);
            }

            public Command AddCoupons(string PromotionCode, IList<Coupon> Coupons)
            {
                return _service.AddCoupons(PromotionCode, Coupons);
            }

            public IList<Promotion> Get(string Code, DateTime? ValidFrom, DateTime? ValidTo)
            {
                return _service.Get(Code, ValidFrom, ValidTo);
            }

            Command IPromotionAPI.Create(string Code, string Name, DateTime? ValidFrom, DateTime? ValidTo)
            {
                return _service.Create(Code, Name, ValidFrom, ValidTo);
            }
        }

        public class CouponAPI : ICouponAPI{

            readonly Impl.CouponAPI _service;

            public CouponAPI(Impl.CouponAPI service)
            {
                _service = service;
            }
            public Command Assign(string PromotionCode, string CouponCode, string Holder, string User)
            {
                return _service.Assign(PromotionCode, CouponCode, Holder, User);
            }

            public Command Cancel(string PromotionCode, string CouponCode)
            {
                return _service.Cancel(PromotionCode, CouponCode);
            }

            public Coupon Get(string PromotionCode, string CouponCode)
            {
                return _service.Get(PromotionCode, CouponCode);
            }

            public List<Coupon> GetUserCoupons(string User)
            {
                return _service.GetUserCoupons(User);
            }

            public Command Redeem(string PromotionCode, string CouponCode, string User)
            {
                return _service.Redeem(PromotionCode, CouponCode, User);
            }

            public Command UndoRedeem(string PromotionCode, string CouponCode)
            {
                return _service.UndoRedeem(PromotionCode, CouponCode);
            }

            public Command Validate(string PromotionCode, string CouponCode)
            {
                return _service.Validate(PromotionCode, CouponCode);
            }
        }
    }
}
