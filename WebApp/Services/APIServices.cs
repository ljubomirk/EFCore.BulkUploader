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

namespace Web.Services.Impl
{
    public class PromotionAPI : IPromotionAPI
    {
        readonly RepositoryServices _repo;

        public PromotionAPI(RepositoryServices repo)
        {
            _repo = repo;
        }

        public Command AddCoupon(string PromotionCode, string CouponCode, string Holder, string User, DateTime? ExpireDate)
        {
            throw new NotImplementedException();
        }

        //[CollectionDataContract(Name ="ArrayOfCoupons", ItemName = "Coupon")]
        public Command AddCoupons(string PromotionCode, IList<Coupon> coupons)
        {
            throw new NotImplementedException();
        }

        public IList<Promotion> Get(string Code, DateTime? ValidFrom, DateTime? ValidTo)
        {
            throw new NotImplementedException();
        }

        public Command Create(string Code, string Name, DateTime? ValidFrom, DateTime? ValidTo)
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

        public List<Coupon> GetUserCoupons(string User)
        {
            return (List<Coupon>)_repo.GetUserCoupons(User);
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
