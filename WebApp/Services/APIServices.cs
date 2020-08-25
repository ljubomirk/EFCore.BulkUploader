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
            Command cmd = new Command(CommandStatus.Valid);
            Command response = _repo.Add(coupons,ref cmd);
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
            _repo.LogAPIAccess("PromotionAPI.AddCoupon", "POS", "", true);
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
            _repo.LogAPIAccess("PromotionAPI.AddCoupons", "POS", "", true);
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

        public IList<Promotion> Get(string Name, Nullable<DateTime> ValidFrom, Nullable<DateTime> ValidTo)
        {
            _repo.LogAPIAccess("PromotionAPI.Get", "POS", "", true);
            List<Promotion> result = new List<Promotion>();
            List<CouponDatabase.Models.Promotion> promos = _repo.GetAllPromotions();
            if (Name!=null && Name.Length > 0)
                promos = promos.FindAll(i => i.Name.Contains(Name));

            if (ValidFrom != null && ValidTo != null)
            {
                promos = promos.FindAll(x => (x.ValidFrom <= ValidFrom && (x.ValidTo >= ValidTo || x.ValidTo == null))  
                                                            || (x.ValidFrom >= ValidFrom && x.ValidTo <= ValidTo) 
                                                            || (x.ValidFrom >=ValidFrom && (x.ValidTo == null || x.ValidTo >= ValidTo) && x.ValidFrom <= ValidTo) 
                                                            || (x.ValidFrom <= ValidFrom && x.ValidTo <= ValidTo && x.ValidTo >= ValidFrom)
                                                            || (x.ValidFrom== null && (x.ValidTo == null || x.ValidTo >= ValidFrom)));
            }
            else if (ValidFrom != null || ValidTo != null)
            {
                if (ValidFrom != null)
                    promos = promos.FindAll(x => x.ValidFrom <= ValidFrom && ( x.ValidTo >= ValidFrom || x.ValidTo== null) 
                                                                    || (x.ValidFrom >= ValidFrom)
                                                                    || (x.ValidFrom == null && (x.ValidTo == null || x.ValidTo >=ValidFrom)));
                if (ValidTo != null)
                {
                    promos = promos.FindAll(x => (x.ValidFrom <= ValidTo) 
                                                                    || (x.ValidTo >= ValidTo)
                                                                    || (x.ValidFrom == null ));
                }
            }
            foreach (CouponDatabase.Models.Promotion promo in promos)
            {
                result.Add(new Promotion() { Name = promo.Name, ValidFrom = promo.ValidFrom, ValidTo = promo.ValidTo, Active = promo.Active });
            }
            return result;
        }

        public Command Create(string PromotionName, DateTime? ValidFrom, DateTime? ValidTo, bool Enabled, IList<PromotionProperty> Properties)
        {
            _repo.LogAPIAccess("PromotionAPI.Create", "POS", "", true);
            Command response = new Command(CommandStatus.Valid);

            /* AUTO GENERATE PROMOTION CODE*/
            string code = "";
            do
            {
                var random = new Random();
                string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
                code = new string(Enumerable.Repeat(chars, 8)
                          .Select(s => s[random.Next(s.Length)])
                          .ToArray());
            } while (!_repo.CheckPromotionCode(code));
            /* END OF AUTO GENERATE PROMOTION CODE */
            CouponDatabase.Models.Promotion promo = new CouponDatabase.Models.Promotion() { Name = PromotionName, Code = code, ValidFrom = ValidFrom, ValidTo = ValidTo, Enabled = Enabled };
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
            _repo.LogAPIAccess("CouponAPI.Assign", "POS", "", true);
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
            _repo.LogAPIAccess("CouponAPI.Cancel", "POS", "", true);
            CouponDatabase.Models.Coupon coupon = _repo.GetCoupon(PromotionCode, CouponCode);
            ICoupon cmd = new ICoupon(coupon);
            Command response = cmd.Cancel();
            if (response.Status == CommandStatus.Valid)
                _repo.UpdateCoupon(coupon);
            return response;
        }

        public Coupon Get(string PromotionCode, string CouponCode)
        {
            _repo.LogAPIAccess("CouponAPI.Get", "POS", "", true);
            CouponDatabase.Models.Coupon coupon = _repo.GetCoupon(PromotionCode, CouponCode);
            return (new ICoupon(coupon)).Get();
        }

        public List<Coupon> GetUserCoupons(string User)
        {
            _repo.LogAPIAccess("CouponAPI.GetUserCoupons", "POS", "", true);
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
            _repo.LogAPIAccess("CouponAPI.Redeem", "POS", "", true);
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
            _repo.LogAPIAccess("CouponAPI.UndoRedeem", "POS", "", true);
            CouponDatabase.Models.Coupon coupon = _repo.GetCoupon(PromotionCode, CouponCode);
            ICoupon cmd = new ICoupon(coupon);
            Command response = cmd.UndoRedeem();
            if (response.Status == CommandStatus.Valid)
                response = _repo.UpdateCoupon(coupon);
            return response;
        }

        public Command Validate(string PromotionCode, string CouponCode, string User)
        {
            _repo.LogAPIAccess("CouponAPI.Validate", "POS", "", true);
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
