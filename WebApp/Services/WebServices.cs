using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WebApp.Data;
using WebApp.Services;
using CouponDatabase.Services;
using CouponDatabase.Lifecycle;
using CouponDatabase.API;
using Microsoft.Extensions.Logging;

namespace Web.Services.Soap
{
    public class CouponService
    {
        public class PromotionAPI : IPromotionAPI
        {
            readonly Impl.PromotionAPI _service;
            readonly RepositoryServices _repo;
            readonly ILogger _logger;

            public PromotionAPI(ApplicationDbContext context, ILogger<PromotionAPI> logger)
            {
                _repo = new RepositoryServices(context, logger);
                _service = new Impl.PromotionAPI(_repo);
                _logger = logger;
            }

            public Command AddCoupon(string PromotionCode, string CouponCode, string Holder, string User, DateTime? ExpireDate, CouponStatus Status)
            {
                return _service.AddCoupon(PromotionCode, CouponCode, Holder, User, ExpireDate, Status);
            }

            public Command AddCoupons(string PromotionCode, IList<Coupon> Coupons)
            {
                return _service.AddCoupons(PromotionCode, Coupons);
            }

            public IList<Promotion> Get(string Name, Nullable<DateTime> ValidFrom, Nullable<DateTime> ValidTo)
            {
                return _service.Get(Name, ValidFrom, ValidTo);
            }

            public Command Create(string Code, DateTime? ValidFrom, DateTime? ValidTo, bool Enabled, IList<PromotionProperty> PromotionProperties)
            {
                return _service.Create(Code, ValidFrom, ValidTo, Enabled, PromotionProperties);
            }
        }

        public class CouponAPI : ICouponAPI{

            readonly Impl.CouponAPI _service;
            readonly RepositoryServices _repo;
            private readonly ILogger<CouponAPI> _logger;

            public CouponAPI(ApplicationDbContext context, ILogger<CouponAPI> logger)
            {
                _repo = new RepositoryServices(context, logger);
                _service = new Impl.CouponAPI(_repo);
                _logger = logger;
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

            public Command Validate(string PromotionCode, string CouponCode, string User, string Channel)
            {
                return _service.Validate(PromotionCode, CouponCode, User, Channel);
            }
        }
    }
}
