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
            return Context.Property.ToList<Property>();
        }
        public List<Property> GetPromotionProperties(long idPromotion)
        {
            List<Property> properties = GetAllProperties();
            Promotion promo = GetPromotionWithId(idPromotion);
            if (promo.PromotionProperties != null)
                return properties.Where(x => promo.PromotionProperties.FirstOrDefault(properties => properties.PromotionId == x.Id).PromotionId == x.Id).ToList<Property>();
            else
                return new List<Property>();
        }
        public List<AwardChannel> GetAllAwardChannels()
        {
            return Context.AwardChannel.ToList<AwardChannel>();
        }
        public List<AwardChannel> GetPromotionAwardChannels(long idPromotion)
        {
            List<AwardChannel> awardChannels = GetAllAwardChannels();
            Promotion promo = GetPromotionWithId(idPromotion);
            if (promo.PromotionAwardChannels != null)
                return awardChannels.Where(x => promo.PromotionAwardChannels.FirstOrDefault(awardChannels => awardChannels.AwardChannelId == x.Id).AwardChannelId == x.Id).ToList<AwardChannel>();
            else
                return new List<AwardChannel>();

        }
        public List<IssuerChannel> GetAllIssuerChannels()
        {
            return Context.IssuerChannel.ToList<IssuerChannel>();
        }
        public List<IssuerChannel> GetPromotionIssuerChannels(long idPromotion)
        {
            List<IssuerChannel> issuerChannels = GetAllIssuerChannels();
            Promotion promo = GetPromotionWithId(idPromotion);
            if (promo.PromotionIssuerChannels != null)
                return issuerChannels.Where(x => promo.PromotionIssuerChannels.FirstOrDefault(issuerChannel => issuerChannel.IssuerChannelId == x.Id).IssuerChannelId == x.Id).ToList<IssuerChannel>();
            else
                return new List<IssuerChannel>();
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
