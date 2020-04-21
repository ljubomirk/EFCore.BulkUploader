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
using WebApp.ViewModels;
using Microsoft.AspNetCore.Mvc;

namespace WebApp.Services
{
    public class RepositoryServices
    {
        readonly ApplicationDbContext Context;

        public RepositoryServices(ApplicationDbContext context)
        {
            Context = context;
        }
        public Command Add(Coupon coupon)
        {
            Command result = new Command(CommandStatus.Valid);
            try {
                Context.Database.BeginTransaction();
                Context.Coupon.Add(coupon);
                int saved = Context.SaveChanges();
                if (saved == 1)
                    result.Status = CommandStatus.Valid;
                else
                    result.Status = CommandStatus.ErrorSystem;
                Context.Database.CommitTransaction();
            }
            catch(DbUpdateException update)
            {
                Context.Database.RollbackTransaction();
                result.Status = CommandStatus.ErrorSystem;
                result.Message = update.Message;
            }
            catch(Exception exc)
            {
                Context.Database.RollbackTransaction();
                result.Status = CommandStatus.ErrorSystem;
                result.Message = exc.Message;
            }
            return result;
        }

        public Coupon GetCoupon(string PromotionCode, string CouponCode)
        {
            Coupon coupon = Context.Coupon.Where(c => c.Code == CouponCode /*TODO && c.PromotionId == */).FirstOrDefault();
            return coupon;
        }

        public Command UpdateCoupon(Coupon coupon)
        {
            Command result = new Command(CommandStatus.Valid);
            try
            {
                Context.Database.BeginTransaction();
                Context.Coupon.Update(coupon);
                int saved = Context.SaveChanges();
                if (saved == 1)
                    result.Status = CommandStatus.Valid;
                else
                    result.Status = CommandStatus.ErrorSystem;
                Context.Database.CommitTransaction();
            }
            catch (DbUpdateException update)
            {
                Context.Database.RollbackTransaction();
                result.Status = CommandStatus.ErrorSystem;
                result.Message = update.Message;
            }
            catch (Exception exc)
            {
                Context.Database.RollbackTransaction();
                result.Status = CommandStatus.ErrorSystem;
                result.Message = exc.Message;
            }
            return result;
        }

        #region PromotionCommands
        public List<Promotion> GetAllPromotions()
        {
            return Context.Promotion.ToList<Promotion>();
        }

        /*
         * Returns promotions with HasCoupons property true.
         */
        public List<Promotion> GetPromotionsWithCoupons()
        {
            return Context.Promotion.Where(p => p.HasCoupons).ToList();
        }

        public List<Promotion> GetFilteredPromotionList(PromotionFilter promotionFilter, bool promotionsWithCoupons = false)
        {
            /*
             * TODO:
             *  - optimize promotion filtering
             *  
             */
            
            List<Promotion> allPromotions = GetAllPromotions();
            List<Promotion> f_ListOfPromotions = new List<Promotion>();

            List<Promotion> promotionsByStatus = new List<Promotion>();
            List<Promotion> promotionsByValidDate = new List<Promotion>();
            List<Promotion> promotionsByCode = new List<Promotion>();

            if (promotionFilter.ShowActive)
                f_ListOfPromotions.AddRange(allPromotions.Where(x => x.Active == true).ToList<Promotion>());
            if (promotionFilter.ShowInactive)
                f_ListOfPromotions.AddRange(allPromotions.Where(x => x.Active == false).ToList<Promotion>());

            if (promotionFilter.ValidFrom != null && promotionFilter.ValidTo != null)
            {
                f_ListOfPromotions = f_ListOfPromotions.Where(x => x.ValidFrom >= promotionFilter.ValidFrom && x.ValidTo <= promotionFilter.ValidTo).ToList<Promotion>();
            }
            else if (promotionFilter.ValidFrom != null || promotionFilter.ValidTo != null)
            {
                if (promotionFilter.ValidFrom != null)
                    f_ListOfPromotions = f_ListOfPromotions.Where(x => x.ValidFrom >= promotionFilter.ValidFrom).ToList<Promotion>();
                if (promotionFilter.ValidTo != null)
                    f_ListOfPromotions = f_ListOfPromotions.Where(x => x.ValidTo <= promotionFilter.ValidTo).ToList<Promotion>();
            }

            if (promotionFilter.Code != null)
            {
                if (f_ListOfPromotions.Count > 0)
                {
                    f_ListOfPromotions = f_ListOfPromotions.Where(x => x.Code.ToLower().Contains(promotionFilter.Code.ToLower())).ToList<Promotion>();
                }
                else
                {
                    f_ListOfPromotions = f_ListOfPromotions.Where(x => x.Code.ToLower().Contains(promotionFilter.Code.ToLower())).ToList<Promotion>();
                }
            }

            //f_ListOfPromotions = f_ListOfPromotions.Union(promotionsByCode).ToList();

            // Return filtered list of promotions with existing coupons
            if (promotionsWithCoupons)
            {
                f_ListOfPromotions.Where(p => p.HasCoupons).ToList();
            }
            
            return f_ListOfPromotions;
        }



        /*
         * Returns filtered list of coupons
         */
        public List<Coupon> GetFilteredCouponListForPromotions(List<Coupon> coupons, CouponFilters couponFilter)
        {
            /*
             * TODO:
             * - Implement received coupon filtering based on filtered coupon filters
             * - Implement method getFilteredPromotions() : filteredListOfPromotions, promotionFilters
             * - Implement getFilteredCoupons(): filteredListOfPromotions, filteredListOfCoupons, couponFilters
             * - TEST METHOD!
             */

            List<Coupon> f_ListOfCoupons = new List<Coupon>();
            bool couponRemove = false;
            List<long> f_AwardChannel = couponFilter.AwardChannels.Where(a => a.Checked).Select(a => a.Id).ToList();
            List<long> f_IssuerChannel = couponFilter.IssuerChannels.Where(a => a.Checked).Select(a => a.Id).ToList();
            List<long> f_CurrentStatus = couponFilter.CurrentStatus.Where(a => a.Checked).Select(a => a.Id).ToList();

            // Create method get filterActiveProducts(list, filter)
            if (couponFilter.ShowActive)
            {
                List<Coupon> tempCoupon = coupons.Where(x => x.Active == true).ToList();
                f_ListOfCoupons.AddRange(tempCoupon);
            }
            if (couponFilter.ShowInactive)
            {
                // Initial populating of list with inactive coupons
                f_ListOfCoupons.AddRange(coupons.Where(x => x.Active == false).ToList<Coupon>());
            }


            // Filter using checkbox filters
            foreach (Coupon coup in coupons)
            {
                couponRemove = false;

                // Filter based on award channel
                if (f_AwardChannel.Count() > 0 && !couponRemove)
                {
                    List<long> awardChannels = GetPromotionAwardChannels(coup.Promotion.Id).Select(a => a.Id).ToList();
                    foreach (long id in awardChannels)
                    {
                        if (!f_AwardChannel.Contains(id))
                        {
                            // all awardChannel filters need to be met to return coupon ?
                            // if even single coupon 
                            couponRemove = true;
                        }
                    }
                }

                // Filter based on issuer channel
                if (f_IssuerChannel.Count() > 0 && !couponRemove)
                {
                    List<long> issuerChannels = GetPromotionIssuerChannels(coup.Promotion.Id).Select(a => a.Id).ToList();
                    foreach (long ids in issuerChannels)
                    {
                        if (!f_IssuerChannel.Contains(ids))
                        {
                            // all issuerChannel filters need to be met to return coupon ?
                            couponRemove = true;
                        }
                    }
                }

                // Filter based on coupon status
                if (f_CurrentStatus.Count() > 0 && !couponRemove)
                {
                    if (!f_CurrentStatus.Contains(coup.Status))
                    {
                        // current coupon status needs to be in filter status list ?
                        couponRemove = true;
                    }
                }

                // Remove coupon from initial list if filter not passed
                if (couponRemove)
                {
                    var r_Coupon = f_ListOfCoupons.Find(x => x.Id == coup.Id);
                    f_ListOfCoupons.Remove(r_Coupon);
                }
            }


            return f_ListOfCoupons;
        }

        /*
         * Returns coupons for promotion.
         */
        public List<Coupon> GetPromotionCoupons(Coupon coupon)
        {
            return Context.Coupon.Where(p => p.PromotionId == coupon.PromotionId).ToList();
        }

        public List<Coupon> GetCouponsForPromotions(List<Promotion> promotions)
        {
            List<Coupon> promotionCoupons = new List<Coupon>();
            foreach(Promotion p in promotions)
            {
                List<Coupon> tmpCoupons = GetPromotionCoupons(p);
                promotionCoupons.AddRange(tmpCoupons);
            }
            return promotionCoupons;
        }

        public Promotion GetPromotionWithId(long id)
        {
            Promotion promotion = new Promotion();
                promotion = Context.Promotion.First(x => x.Id == id);
            Promotion promotionRef = promotion;
            List<Property> promotionProperties = GetPromotionProperties(promotion.Id);
            foreach (var property in promotionProperties)
            {
                promotion.PromotionProperties.Add(new PromotionProperty() { Promotion = promotionRef, PromotionId = promotion.Id, Property = property, PropertyId = property.Id });
            }
            List<AwardChannel> promotionAwardChannels = GetPromotionAwardChannels(promotion.Id);
            foreach (var awardChannel in promotionAwardChannels)
            {
                promotion.PromotionAwardChannels.Add(new PromotionAwardChannel() { Promotion = promotionRef, PromotionId = promotion.Id, AwardChannel = awardChannel, AwardChannelId = awardChannel.Id });
            }
            List<IssuerChannel> promotionIssuerChannels = GetPromotionIssuerChannels(promotion.Id);
            foreach (var issuerChannel in promotionIssuerChannels)
            {
                promotion.PromotionIssuerChannels.Add(new PromotionIssuerChannel() { Promotion = promotionRef, PromotionId = promotion.Id, IssuerChannel = issuerChannel, IssuerChannelId = issuerChannel.Id });
            }
            return promotion;
        }
        #endregion

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
            List<string> enumNames = GetCouponStatusList();
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

        /*
         * Get list of coupon status names. Generated from enum.
         */
        public List<string> GetCouponStatusList()
        {
            return Enum.GetNames(typeof(CouponStatus)).ToList();
        }

        public List<Property> GetPromotionProperties(long idPromotion)
        {
            List<Property> properties = GetAllProperties();
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

        public List<Coupon> GetPromotionCoupons(Promotion promotion)
        {
            return Context.Coupon.Where(c => c.PromotionId == promotion.Id).ToList();
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
