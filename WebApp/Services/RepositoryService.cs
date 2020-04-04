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
        public Promotion GetPromotionWithId(long id)
        {
            return Context.Promotion.First(x => x.Id == id);
        }
        public List<Property> GetAllProperties()
        {
            return Context.Properties.ToList<Property>();
        }
        public List<Property> GetAllPromotionProperties(long idPromotion)
        {
            return Context.PromotionProperties.Where(x=>x.PromotionId==idPromotion).Select(c => c.Property).Distinct().ToList<Property>();
        }
        public List<AwardChannel> GetAllPromotionAwardChannels(long idPromotion)
        {
            List<AwardChannel> awardChannels = Context.AwardChannels.ToList<AwardChannel>();
            return awardChannels.Where(x => awardChannels.Contains(x)).ToList<AwardChannel>();
        }
        public List<IssuerChannel> GetAllPromotionIssuerChannels(long idPromotion)
        {
            List<IssuerChannel> issuerChannels = Context.IssuerChannels.ToList<IssuerChannel>();
            return issuerChannels.Where(x => issuerChannels.Contains(x)).ToList<IssuerChannel>();
        }
        public bool CreatePromotion(Promotion promotion)
        {
            Context.Promotion.Add(promotion);
            Context.SaveChanges();
            return true;
        }
        public bool UpdatePromotion(Promotion promotion)
        {
            Promotion selectedPromotion = Context.Promotion.First(x => x.Id == promotion.Id);
            selectedPromotion = promotion;
            Context.SaveChanges();
            return true;
        }
    }
}
