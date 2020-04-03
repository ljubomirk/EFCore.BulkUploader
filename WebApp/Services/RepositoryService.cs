using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Options;
using WebApp.Data;
using CouponDatabase.Models;
using System.Collections.Generic;
using System.Linq;

namespace WebApp.Services
{
    public class RepositoryServices
    {
        readonly ApplicationDbContext Context;

        public RepositoryServices(ApplicationDbContext context)
        {
            Context = context;
        }
        public void Add(string code)
        {
            Coupon coupon = new Coupon(code, null, null, CouponDatabase.Lifecycle.CouponStatus.Created, null);
            Context.Coupon.Add(coupon);
            Context.SaveChanges();
        }

        public List<Promotion> GetAllPromotions()
        {
            return Context.Promotion.ToList<Promotion>();
        }
        public List<Property> GetAllProperties()
        {
            return Context.Properties.ToList<Property>();
        }
        public List<Property> GetAllPromotionProperties(long idPromotion)
        {
            return Context.PromotionProperty.Where(x=>x.PromotionId==idPromotion).Select(c => c.Property).Distinct().ToList<Property>();
        }
        public List<AwardChannel> GetAllPromotionAwardChannels(long idPromotion)
        {
            return Context.PromotionAwardChannel.Where(x => x.PromotionId == idPromotion).Select(c => c.AwardChannel).Distinct().ToList<AwardChannel>();
        }
        public List<IssuerChannel> GetAllPromotionIssuerChannels(long idPromotion)
        {
            return Context.PromotionIssuerChannel.Where(x => x.PromotionId == idPromotion).Select(c => c.IssuerChannel).Distinct().ToList<IssuerChannel>();
        }
        public bool CreatePromotion(Promotion promotion)
        {
            Context.Promotion.Add(promotion);
            Context.SaveChanges();
            return true;
        }
    }
}
