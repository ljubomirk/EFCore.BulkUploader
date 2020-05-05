using System;
using CouponDatabase.Models;
using System.Collections.Generic;
using WebApp.Services;
using System.ComponentModel.DataAnnotations;
using CouponDatabase.Properties;
using WebApp.Data;
using System.Linq;

namespace WebApp.ViewModels
{
    public class Filters
    {
        private readonly RepositoryServices _repo;
        public Filters(ApplicationDbContext context)
        {
            _repo = new RepositoryServices(context);
        }

        public string Code { get; set; }
        public bool ShowActive { get; set; }
        public bool ShowInactive { get; set; }
        [DisplayFormat(DataFormatString = "{0:dd.MM.yyyy}", ApplyFormatInEditMode = true)]
        [DataType(DataType.Date)]
        [Display(Name = "Date_ValidFrom", ResourceType = typeof(Resources))]
        public Nullable<DateTime> ValidFrom { get; set; }
        [DisplayFormat(DataFormatString = "{0:dd.MM.yyyy}", ApplyFormatInEditMode = true)]
        [DataType(DataType.Date)]
        [Display(Name = "Date_ValidTo", ResourceType = typeof(Resources))]
        public Nullable<DateTime> ValidTo { get; set; }
        public List<CheckedItem> Properties { get; set; }

        public Filters()
        {
            ShowActive = true;
            ShowInactive = false;
            Properties = new List<CheckedItem>();
        }



        public List<Promotion> GetFilteredPromotionList(PromotionFilter promotionFilter, bool promotionsWithCoupons = false)
        {
            /*
             * TODO:
             *  - implement promotion filter via promotion properties
             *  - test method with properties set on promotion objects
             */

            List<Promotion> allPromotions = _repo.GetAllPromotions();
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

            if(promotionFilter.Properties?.Where(p => p.Checked).Count() > 0)
            {
                /*
                 * TODO: 
                 * check if it is enough for the promotion to have a single property assigned, among multiple selected for the filter, to be considered as valid for the applied filter
                 */
                List<Promotion> newFilterPromotions = new List<Promotion>();
                foreach (Promotion promo in f_ListOfPromotions)
                {
                    List<long> propertyIds = promo.PromotionProperties.Select(p => p.PropertyId).Distinct().ToList();
                    List<long> checkedProperties = promotionFilter.Properties.Where(p => p.Checked).Select(p => p.Id).Distinct().ToList();
                    foreach (long id in checkedProperties)
                    {
                        if (propertyIds.Contains(id))
                        {
                            if (!newFilterPromotions.Contains(promo))
                            {
                                newFilterPromotions.Add(promo);
                            }
                        }
                    }
                }
                f_ListOfPromotions = newFilterPromotions;
            }

            /* 
             * e.g.
             * f_ListOfPromotions = f_ListOfPromotions.Union(promotionsByCode).Union(promotionsByValidDate).Union(PromotionsByStatus).ToList();
             */

            // Return filtered list of promotions with existing coupons
            if (promotionsWithCoupons)
            {
                List<Promotion> new_filterList = new List<Promotion>();
                foreach (Promotion promo in f_ListOfPromotions)
                {
                    List<Coupon> coupons = _repo.GetPromotionCoupons(promo);
                    if (coupons.Count() > 0)
                    {
                        new_filterList.Add(promo);
                    }
                }
                f_ListOfPromotions = new_filterList;
                //f_ListOfPromotions.Where(p => p.HasCoupons).ToList();
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
             * - Test method with award, issuer, and status data to apply related filters.
             */

            if(couponFilter != null)
            {
                List<Coupon> f_ListOfCoupons = new List<Coupon>();
                List<long> f_AwardChannel = couponFilter.AwardChannels.Where(a => a.Checked).Select(a => a.Id).ToList();
                List<long> f_IssuerChannel = couponFilter.IssuerChannels.Where(a => a.Checked).Select(a => a.Id).ToList();
                List<long> f_CurrentStatus = couponFilter.CurrentStatus.Where(a => a.Checked).Select(a => a.Id).ToList();

                // Create method get filterActiveProducts(list, filter)
                if (couponFilter.ActiveCoupons)
                {
                    List<Coupon> tempCoupon = coupons.Where(x => x.Active == true).ToList();
                    f_ListOfCoupons.AddRange(tempCoupon);
                }
                if (couponFilter.InactiveCoupons)
                {
                    // Initial populating of list with inactive coupons
                    f_ListOfCoupons.AddRange(coupons.Where(x => x.Active == false).ToList<Coupon>());
                }

                // Apply Aquire From & To filters
                if (couponFilter.AssignableFrom != null && couponFilter.AssignableUntil != null)
                {
                    f_ListOfCoupons = f_ListOfCoupons.Where(x => x.AquireFrom >= couponFilter.AssignableFrom && x.AquireTo <= couponFilter.AssignableUntil).ToList<Coupon>();
                }
                else if (couponFilter.AssignableFrom != null || couponFilter.AssignableUntil != null)
                {
                    if (couponFilter.AssignableFrom != null)
                        f_ListOfCoupons = f_ListOfCoupons.Where(x => x.AquireFrom >= couponFilter.AssignableFrom).ToList<Coupon>();
                    if (couponFilter.AssignableUntil != null)
                        f_ListOfCoupons = f_ListOfCoupons.Where(x => x.AquireTo <= couponFilter.AssignableUntil).ToList<Coupon>();
                }

                // Apply Redeem From & To filters
                if (couponFilter.RedeemableFrom != null && couponFilter.RedeemableUntil != null)
                {
                    f_ListOfCoupons = f_ListOfCoupons.Where(x => x.AwardFrom >= couponFilter.RedeemableFrom && x.AwardTo <= couponFilter.RedeemableUntil).ToList<Coupon>();
                }
                else if (couponFilter.RedeemableFrom != null || couponFilter.RedeemableUntil != null)
                {
                    if (couponFilter.RedeemableFrom != null)
                        f_ListOfCoupons = f_ListOfCoupons.Where(x => x.AwardFrom >= couponFilter.RedeemableFrom).ToList<Coupon>();
                    if (couponFilter.RedeemableUntil != null)
                        f_ListOfCoupons = f_ListOfCoupons.Where(x => x.AwardTo <= couponFilter.RedeemableUntil).ToList<Coupon>();
                }


                // Filter using checkbox filters
                List<Coupon> newCouponList = new List<Coupon>();
                foreach (Coupon coup in f_ListOfCoupons)
                {
                    bool couponAdd = false;

                    // Filter based on award channel
                    if (f_AwardChannel.Count() > 0)
                    {
                        List<long> awardChannels = _repo.GetCouponAwardChannels(coup.Id).Select( c => c.AwardChannelId).Distinct().ToList();
                        foreach (long id in f_AwardChannel)
                        {
                            if (awardChannels.Contains(id))
                            {
                                // all awardChannel filters need to be met to return coupon ?
                                // if even single coupon 
                                couponAdd = true;
                            }
                        }
                    }

                    // Filter based on issuer channel
                    if (f_IssuerChannel.Count() > 0)
                    {
                        List<long> issuerChannels = _repo.GetCouponIssuerChannels(coup.Id).Select( c => c.IssuerChannelId).Distinct().ToList();
                        foreach (long ids in f_IssuerChannel)
                        {
                            if (issuerChannels.Contains(ids))
                            {
                                // all issuerChannel filters need to be met to return coupon ?
                                couponAdd = true;
                            }
                        }
                    }

                    // Filter based on coupon status
                    if (f_CurrentStatus.Count() > 0)
                    {
                        if (f_CurrentStatus.Contains(coup.Status))
                        {
                            // current coupon status needs to be in filter status list ?
                            couponAdd = true;
                        }
                    }

                    // Remove coupon from initial list if filter not passed
                    if (couponAdd)
                    {
                        newCouponList.Add(coup);
                    }
                }

                if(f_AwardChannel.Count() > 0 || f_IssuerChannel.Count() > 0 || f_CurrentStatus.Count() > 0)
                {
                    return newCouponList;
                } else
                {
                    return f_ListOfCoupons;
                }
            }
            return coupons;
        }

    }
}