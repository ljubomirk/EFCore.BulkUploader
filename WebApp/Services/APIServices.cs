using System;
using System.Collections.Generic;
using System.Linq;
using WebApp.Services;
using CouponDatabase.Services;
using CouponDatabase.Lifecycle;
using CouponDatabase.API;

namespace Web.Services.Impl
{
    public class PromotionAPI : IPromotionAPI
    {
        readonly RepositoryServices _repo;
        CouponDatabase.Models.Promotion _promo;

        public PromotionAPI(RepositoryServices repo)
        {
            _repo = repo;
        }

        Command CheckPromotion(string PromotionCode)
        {
            Command response;
            List <CouponDatabase.Models.Promotion> promos = _repo.GetAllPromotions();
            _promo = promos.Find(i => i.Code == PromotionCode);
            if (_promo == null)
                response = new Command(CommandStatus.ErrorPromotionNotFound);
            else
                response = new Command(CommandStatus.Valid);
            return response;
        }

        Command StoreCoupons(List<CouponDatabase.Models.Coupon> coupons)
        {
            Command response = _repo.Add(coupons);
            return response;
        }

        Command UpdateCouponStatus(CouponDatabase.Models.Coupon coupon, CouponStatus status)
        {
            Command response = new Command(CommandStatus.Valid);
            if (status != CouponStatus.Created)
            {
                ICoupon lifecycle = new ICoupon(coupon);
                if (response.Status == CommandStatus.Valid && status == CouponStatus.Issued)
                    response = lifecycle.Assign(coupon.Holder, coupon.User);
                if (response.Status == CommandStatus.Valid && status == CouponStatus.Canceled)
                {
                    response = lifecycle.Cancel();
                }
                if (response.Status == CommandStatus.Valid && status == CouponStatus.Redeemed)
                {
                    response = lifecycle.Assign(coupon.Holder, coupon.User);
                    if (response.Status == CommandStatus.Valid)
                        response = lifecycle.Redeem(coupon.User);
                }
            }
            return response;
        }
        /// <summary>
        /// PromotionAPI.AddCoupon - adds one coupons to promotion with PromotionCode
        /// </summary>
        /// <param name="PromotionCode"></param>
        /// <param name="CouponCode"></param>
        /// <param name="Holder"></param>
        /// <param name="User"></param>
        /// <param name="ExpireDate"></param>
        /// <param name="Status"></param>
        /// <returns></returns>
        public Command AddCoupon(string PromotionCode, string CouponCode, string Holder, string User, DateTime? ExpireDate, CouponStatus Status)
        {
            Command response = CheckPromotion(PromotionCode);
            if (response.Status == CommandStatus.Valid)
            {
                List<CouponDatabase.Models.Coupon> coupons = new List<CouponDatabase.Models.Coupon>();
                CouponDatabase.Models.Coupon coupon = new CouponDatabase.Models.Coupon(CouponCode, Holder, User, CouponStatus.Created, _promo);
                if(ExpireDate.HasValue)
                    coupon.AwardTo = ExpireDate;
                response = UpdateCouponStatus(coupon, Status);
                if (response.Status == CommandStatus.Valid) { 
                    coupons.Add(coupon);
                    response = StoreCoupons(coupons);
                }
            }
            return response;
        }

        /// <summary>
        /// PromotionAPI.AddCoupons - adds multiple Coupons to Promotion with PromotionCode
        /// </summary>
        /// <param name="PromotionCode">unique Promotion Code</param>
        /// <param name="coupons">list of coupons to add</param>
        /// <returns></returns>
        public Command AddCoupons(string PromotionCode, IList<Coupon> coupons)
        {
            Command response = CheckPromotion(PromotionCode);
            if (response.Status == CommandStatus.Valid)
            {
                List<CouponDatabase.Models.Coupon> storeCoupons = new List<CouponDatabase.Models.Coupon>();
                foreach (Coupon c in coupons)
                {
                    CouponDatabase.Models.Coupon coupon = new CouponDatabase.Models.Coupon(c.Code, c.Holder, c.User, CouponStatus.Created, _promo);
                    if (c.ExpireDate.HasValue)
                        coupon.AwardTo = c.ExpireDate;
                    response = UpdateCouponStatus(coupon, c.Status);
                    if (response.Status == CommandStatus.Valid)
                        storeCoupons.Add(coupon);
                    else
                        break;
                }
                if (response.Status == CommandStatus.Valid)
                    response = StoreCoupons(storeCoupons);
            }
            return response;
        }

        public IList<Promotion> Get(string Code, DateTime? ValidFrom, DateTime? ValidTo)
        {
            List<Promotion> result = new List<Promotion>();
            List<CouponDatabase.Models.Promotion> promos = _repo.GetAllPromotions();
            if (Code!=null && Code.Length > 0)
                promos = promos.FindAll(i => i.Code.Contains(Code));
            if (ValidFrom.HasValue && ValidTo.HasValue && ValidFrom < ValidTo)
            {
                if (ValidFrom.HasValue)
                    promos = promos.FindAll(i => (i.ValidTo.HasValue) ? i.ValidTo.Value > ValidFrom.Value : true);
                if (ValidTo.HasValue)
                    promos = promos.FindAll(i => (i.ValidFrom.HasValue) ? i.ValidFrom.Value < ValidTo.Value : true);
            }
            foreach (CouponDatabase.Models.Promotion promo in promos)
            {
                result.Add(new Promotion() { Code = promo.Code, ValidFrom = promo.ValidFrom, ValidTo = promo.ValidTo, Active = promo.Active });
            }
            return result;
        }

        public Command Create(string PromotionCode, DateTime? ValidFrom, DateTime? ValidTo, bool Enabled, IList<PromotionProperty> Properties)
        {
            Command response = new Command(CommandStatus.Valid);
            CouponDatabase.Models.Promotion promo = new CouponDatabase.Models.Promotion() { Code = PromotionCode, ValidFrom = ValidFrom, ValidTo = ValidTo, Enabled = Enabled };
            List<CouponDatabase.Models.Property> props = _repo.GetAllProperties();
            long promoId = _repo.CreatePromotion(promo);
            List<CouponDatabase.Models.PromotionProperty> promProps = new List<CouponDatabase.Models.PromotionProperty>();
            foreach (PromotionProperty prop in Properties)
            {
                CouponDatabase.Models.PromotionProperty pp = new CouponDatabase.Models.PromotionProperty();
                CouponDatabase.Models.Property p = props.Find(i => i.Name.Equals(prop.Name));
                if (p != null)
                {
                    pp.PropertyId = p.Id;
                    promProps.Add(pp);
                }
            }
            List<CouponDatabase.Models.PromotionAwardChannel> promAward = new List<CouponDatabase.Models.PromotionAwardChannel>();
            List<CouponDatabase.Models.PromotionIssuerChannel> promIssuer = new List<CouponDatabase.Models.PromotionIssuerChannel>();
            _repo.updatePromotionFields(promoId, promProps, promAward, promIssuer);
            return response;
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
            //CouponDatabase.Models.Promotion promo = _repo.GetAllPromotions().Find(p => p.Code == PromotionCode);
            CouponDatabase.Models.Coupon coupon = _repo.GetCoupon(PromotionCode, CouponCode);
            ICoupon cmd = new ICoupon(coupon);
            Command response = cmd.Assign(Holder, User);
            if (response.Status == CommandStatus.Valid)
                _repo.UpdateCoupon(coupon);
            return response;
        }

        public Command Cancel(string PromotionCode, string CouponCode)
        {
            CouponDatabase.Models.Coupon coupon = _repo.GetCoupon(PromotionCode, CouponCode);
            ICoupon cmd = new ICoupon(coupon);
            Command response = cmd.Cancel();
            if (response.Status == CommandStatus.Valid)
                _repo.UpdateCoupon(coupon);
            return response;
        }

        public Coupon Get(string PromotionCode, string CouponCode)
        {
            CouponDatabase.Models.Coupon coupon = _repo.GetCoupon(PromotionCode, CouponCode);
            return (new ICoupon(coupon)).Get();
        }

        public List<Coupon> GetUserCoupons(string User)
        {
            List<Coupon> result = new List<Coupon>();
            List<CouponDatabase.Models.Coupon> found = _repo.GetUserCoupons(User, null, null, null);
            foreach(var coupon in found)
            {
                result.Add((new ICoupon(coupon)).Get());
            }
            return result;
        }

        public Command Redeem(string PromotionCode, string CouponCode, string User)
        {
            CouponDatabase.Models.Coupon coupon = _repo.GetCoupon(PromotionCode, CouponCode);
            ICoupon cmd = new ICoupon(coupon);
            Command response = cmd.Redeem(User);
            if(response.Status == CommandStatus.Valid)
            {
                response = _repo.UpdateCoupon(coupon);
            }
            return response;
        }

        public Command UndoRedeem(string PromotionCode, string CouponCode)
        {
            CouponDatabase.Models.Coupon coupon = _repo.GetCoupon(PromotionCode, CouponCode);
            ICoupon cmd = new ICoupon(coupon);
            Command response = cmd.UndoRedeem();
            if (response.Status == CommandStatus.Valid)
                response = _repo.UpdateCoupon(coupon);
            return response;
        }

        public Command Validate(string PromotionCode, string CouponCode, string User)
        {
            Command response;
            CouponDatabase.Models.Coupon coupon = _repo.GetCoupon(PromotionCode, CouponCode);
            if (coupon == null)
            {
                response = new Command(CommandStatus.ErrorCouponNotFound);
            }
            else
            {
                response = (new ICoupon(coupon)).Validate(User);
            }
            return response;
        }
    }
}
