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
        public class PromotionAPI : IPromotionAPI
        {
            readonly Impl.PromotionAPI _service;
            readonly RepositoryServices _repo;

            public PromotionAPI(ApplicationDbContext context)
            {
                _repo = new RepositoryServices(context);
                _service = new Impl.PromotionAPI(_repo);
            }

            public Command AddCoupon(string PromotionCode, string CouponCode, string Holder, string User, DateTime? ExpireDate, CouponStatus Status)
            {
                return _service.AddCoupon(PromotionCode, CouponCode, Holder, User, ExpireDate, Status);
            }

            public Command AddCoupons(string PromotionCode, IList<Coupon> Coupons)
            {
                return _service.AddCoupons(PromotionCode, Coupons);
            }

            public IList<Promotion> Get(string Code, DateTime? ValidFrom, DateTime? ValidTo)
            {
                return _service.Get(Code, ValidFrom, ValidTo);
            }

            public Command Create(string Code, string Name, DateTime? ValidFrom, DateTime? ValidTo, bool Enabled, IList<PromotionProperty> PromotionProperties)
            {
                return _service.Create(Code, Name, ValidFrom, ValidTo, Enabled, PromotionProperties);
            }
        }

        public class CouponAPI : ICouponAPI{

            readonly Impl.CouponAPI _service;
            readonly RepositoryServices _repo;

            public CouponAPI(ApplicationDbContext context)
            {
                _repo = new RepositoryServices(context);
                _service = new Impl.CouponAPI(_repo);
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
