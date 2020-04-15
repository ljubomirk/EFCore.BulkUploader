using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Options;
using WebApp.Data;
using CouponDatabase.Models;
using System.Collections.Generic;
using System.Linq;
using CouponDatabase.Services;
using static CouponDatabase.Models.Coupon;
using System;
using CouponDatabase.Lifecycle;

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
            Promotion promotion = new Promotion();
                promotion = Context.Promotion.First(x => x.Id == id);
                //List<Property> promotionProperties = GetPromotionProperties(promotion.Id);
                //foreach (var property in promotionProperties)
                //{
                //    promotion.PromotionProperties.Add(new PromotionProperty() { Promotion = promotion, PromotionId = promotion.Id, Property = property, PropertyId = property.Id });
                //}
                //List<AwardChannel> promotionAwardChannels = GetPromotionAwardChannels(promotion.Id);
                //foreach (var awardChannel in promotionAwardChannels)
                //{
                //    promotion.PromotionAwardChannels.Add(new PromotionAwardChannel() { Promotion = promotion, PromotionId = promotion.Id, AwardChannel = awardChannel, AwardChannelId = awardChannel.Id });
                //}
                //List<IssuerChannel> promotionIssuerChannels = GetPromotionIssuerChannels(promotion.Id);
                //foreach (var issuerChannel in promotionIssuerChannels)
                //{
                //    promotion.PromotionIssuerChannels.Add(new PromotionIssuerChannel() { Promotion = promotion, PromotionId = promotion.Id, IssuerChannel = issuerChannel, IssuerChannelId = issuerChannel.Id });
                //}
                return promotion;
        }
        public List<Property> GetAllProperties()
        {
            return Context.Property.ToList<Property>();
        }

        /*
         * Generate list of CurrentStatus class instances from CouponStatus.
         * Assign CouponStatus enum's values and names to instances.
         * Used for populating CouponFilter view.
         */
        public List<CurrentStatus> GetCouponStatuses()
        {
            List<string> enumNames = Enum.GetNames(typeof(CouponStatus)).ToList();
            List<CurrentStatus> statusList = new List<CurrentStatus>();
            for (var i = 0; i < enumNames.Count(); i++)
            {
                statusList.Add(new CurrentStatus()
                {
                    Id = i+1,
                    Name = enumNames[i]
                });
            }
            return statusList;
        }

        public List<Property> GetPromotionProperties(long idPromotion)
        {
            List<Property> properties = GetAllProperties();
            Promotion promo = GetPromotionWithId(idPromotion);
            List<PromotionProperty> promotionPropertiesMap = Context.PromotionProperty.Where(x => x.PromotionId == idPromotion).ToList<PromotionProperty>();
            List<Property> promotionProperties = new List<Property>();
            if (promotionPropertiesMap != null && promotionPropertiesMap.Count > 0)
            {
                foreach (var promotionProperty in promotionPropertiesMap)
                    {
                     promotionProperties.Add(properties.Where(x => x.Id == promotionProperty.PropertyId).First<Property>());
                    }
            }
            return promotionProperties;
        }
        public List<AwardChannel> GetAllAwardChannels()
        {
            return Context.AwardChannel.ToList<AwardChannel>();
        }
        public List<AwardChannel> GetPromotionAwardChannels(long idPromotion)
        {
            List<AwardChannel> awardChannels = GetAllAwardChannels();
            Promotion promo = GetPromotionWithId(idPromotion);
            List<PromotionAwardChannel> awardChannelsMap = Context.PromotionAwardChannel.Where(x => x.PromotionId == idPromotion).ToList<PromotionAwardChannel>();

            List<AwardChannel> promotionAwardChannels = new List<AwardChannel>();
            if (awardChannelsMap != null && awardChannelsMap.Count > 0)
            {
                foreach (var awardChannel in awardChannelsMap)
                {
                    promotionAwardChannels.Add(awardChannels.Where(x => x.Id == awardChannel.AwardChannelId).First<AwardChannel>());
                }
            }
            return promotionAwardChannels;

        }
        public List<IssuerChannel> GetAllIssuerChannels()
        {
            return Context.IssuerChannel.ToList<IssuerChannel>();
        }
        public List<IssuerChannel> GetPromotionIssuerChannels(long idPromotion)
        {
            List<IssuerChannel> issuerChannels = GetAllIssuerChannels();
            Promotion promo = GetPromotionWithId(idPromotion);
            List<PromotionIssuerChannel> issuerChannelsMap = Context.PromotionIssuerChannel.Where(x => x.PromotionId == idPromotion).ToList<PromotionIssuerChannel>();

            List<IssuerChannel> promotionIssuerChannels = new List<IssuerChannel>();
            if (issuerChannelsMap != null && issuerChannelsMap.Count > 0)
            {
                foreach (var issuerChannel in issuerChannelsMap)
                {
                    promotionIssuerChannels.Add(issuerChannels.Where(x => x.Id == issuerChannel.IssuerChannelId).First<IssuerChannel>());
                }
            }
            return promotionIssuerChannels;
        }
        public long CreatePromotion(Promotion promotion)
        {
            Context.Promotion.Add(promotion);
            Context.SaveChanges();
            return promotion.Id;
        }
        public bool UpdatePromotion(Promotion promotion)
        {
            Promotion selectedPromotion = Context.Promotion.First(x => x.Id == promotion.Id);
            PromotionFactory pf = new PromotionFactory(selectedPromotion);
            pf.UpdateDetails(promotion);
            int returnValue = Context.SaveChanges();
            return returnValue > 0 ? true : false;
        }

        public IList<Coupon> GetUserCoupons(string user)
        {
            return null;
        }

        public bool updatePromotionFields(long id, List<PromotionProperty> promotionProperties, List<PromotionAwardChannel> awardChannels, List<PromotionIssuerChannel> issuerChannels)
        {
            foreach (PromotionProperty item in Context.PromotionProperty.Where(x => x.PromotionId == id).ToList<PromotionProperty>())
            {
                Context.PromotionProperty.Remove(item);
            }
            foreach (PromotionProperty item in promotionProperties)
            {
                PromotionProperty prop = new PromotionProperty() { PromotionId = id, PropertyId = item.PropertyId };
                Context.PromotionProperty.Add(prop);
            }

            foreach (PromotionAwardChannel item in Context.PromotionAwardChannel.Where(x => x.PromotionId == id).ToList<PromotionAwardChannel>())
            {
               Context.PromotionAwardChannel.Remove(item);
            }
            foreach (PromotionAwardChannel item in awardChannels)
            {
                PromotionAwardChannel awardChannel = new PromotionAwardChannel() { PromotionId = id, AwardChannelId = item.AwardChannelId };
                Context.PromotionAwardChannel.Add(awardChannel);
            }

            foreach (PromotionIssuerChannel item in Context.PromotionIssuerChannel.Where(x => x.PromotionId == id).ToList<PromotionIssuerChannel>())
            {
               Context.PromotionIssuerChannel.Remove(item) ;
            }
            foreach (PromotionIssuerChannel item in issuerChannels)
            {
                PromotionIssuerChannel issuerChannel = new PromotionIssuerChannel() { PromotionId = id, IssuerChannelId = item.IssuerChannelId };
                Context.PromotionIssuerChannel.Add(issuerChannel);
            }

            int returnValue = Context.SaveChanges();
            return returnValue > 0 ? true : false;
        }

        internal bool insertCoupons(List<Coupon> listOfCoupons)
        {
            foreach (Coupon coupon in listOfCoupons)
            {
                Context.Coupon.Add(coupon);
            }
            int returnValue = Context.SaveChanges();
            return returnValue > 0 ? true : false;
        }
    }

    public class PromotionFactory : IPromotion
    {
        public PromotionFactory(Promotion promo) : base(promo)
        {

        }
    }
}
