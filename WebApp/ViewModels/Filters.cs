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
             *  
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
             * - Test method with award, issuer, and status data to apply related filters.
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
            foreach (Coupon coup in coupons)
            {
                couponRemove = false;

                // Filter based on award channel
                if (f_AwardChannel.Count() > 0 && !couponRemove)
                {
                    List<long> awardChannels = _repo.GetPromotionAwardChannels(coup.Promotion.Id).Select(a => a.Id).ToList();
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
                    List<long> issuerChannels = _repo.GetPromotionIssuerChannels(coup.Promotion.Id).Select(a => a.Id).ToList();
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

    }
}