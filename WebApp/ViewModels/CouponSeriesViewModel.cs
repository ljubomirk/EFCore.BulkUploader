﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using CouponDatabase.Properties;
using System.Web;
using Microsoft.AspNetCore.Http;
using CouponDatabase.Models;
using System.IO;
using ExcelDataReader;
using System.Data;
using CouponDatabase.Lifecycle;
using CouponDatabase.Services;

namespace WebApp.ViewModels
{
    public class CouponSeriesViewModel : ContextData
    {
        public long Id { get; set; }
        //[Required(ErrorMessageResourceName = "Promotion_Code_Required", ErrorMessageResourceType = typeof(Resources))]
        [Display(Name = "Coupon_Series", ResourceType = typeof(Resources))]
        public int CouponSeries { get; set; }
        public Promotion _promo { get; set; }
        [Display(Name = "Number_OfCoupons", ResourceType = typeof(Resources))]
        public int NumberOfCoupons { get; set; }
        [DisplayFormat(DataFormatString = "{0:dd.MM.yyyy}", ApplyFormatInEditMode = true)]
        //[Required(ErrorMessageResourceName = "Coupon_AssignableFrom_Required", ErrorMessageResourceType = typeof(Resources))]
        [DataType(DataType.Date)]
        [Display(Name = "Date_AssignableFrom", ResourceType = typeof(Resources))]
        public Nullable<DateTime> AssignableFrom { get; set; }
        [DisplayFormat(DataFormatString = "{0:dd.MM.yyyy}", ApplyFormatInEditMode = true)]
        [DataType(DataType.Date)]
        [Display(Name = "Date_AssignableTo", ResourceType = typeof(Resources))]
        public Nullable<DateTime> AssignableUntil { get; set; }
        [DisplayFormat(DataFormatString = "{0:dd.MM.yyyy}", ApplyFormatInEditMode = true)]
        //[DisplayFormat(DataFormatString = Resources.Promotion_Date_Format, ApplyFormatInEditMode = true)]
        //[Required(ErrorMessageResourceName = "Coupon_RedeemableFrom_Required", ErrorMessageResourceType = typeof(Resources))]
        [DataType(DataType.Date)]
        [Display(Name = "Date_RedeemableFrom", ResourceType = typeof(Resources))]
        public Nullable<DateTime> RedeemableFrom { get; set; }
        [DisplayFormat(DataFormatString = "{0:dd.MM.yyyy}", ApplyFormatInEditMode = true)]
        [DataType(DataType.Date)]
        [Display(Name = "Date_RedeemableTo", ResourceType = typeof(Resources))]
        public Nullable<DateTime> RedeemableUntil { get; set; }
        public CouponStatus Status { get; set; }
        [Display(Name = "Coupon_Prefix", ResourceType = typeof(Resources))]
        public string Prefix { get; set; }
        [Display(Name = "Coupon_Suffix", ResourceType = typeof(Resources))]
        public string Suffix { get; set; }
        [Range(8, 20)]
        [Display(Name = "Coupon_MaxLength", ResourceType = typeof(Resources))]
        public int CouponMaxLength { get; set; }
        public bool CouponWithLetters { get; set; }
        public bool CouponWithNumbers { get; set; }
        public CouponCreationEnum CouponCreation { get; set; }
        public IFormFile file { get; set; }
        [Display(Name = "Coupon_MaximumRedeem", ResourceType = typeof(Resources))]
        public Nullable<Int32> MaximumRedeem { get; set; }
        
        public CouponSeriesViewModel() : base() { }
        public CouponSeriesViewModel(ContextData contextData, DateTime? PromotionValidFrom, DateTime? PromotionValidTo):base(contextData.AgentUsername, contextData.AgentGroup)
        {
            AssignableFrom = PromotionValidFrom;
            AssignableUntil = PromotionValidTo;
            RedeemableFrom = PromotionValidFrom;
            RedeemableUntil = PromotionValidTo;
        }
        
        public List<Coupon> GenerateCoupons(List<Coupon> pottentialySameCoupons)
        {
            DataSet resultFromFile = new DataSet();
            List<Coupon> listOfCoupons = new List<Coupon>();

            //Check if Excel/csv file is loaded
            if (file != null)
            {
                if (file.Length > 0)
                {
                  
                    string extension = Path.GetExtension(file.FileName);

                    using(var stream = file.OpenReadStream())
                    {
                        if(extension == ".xls" || extension == ".xlsx")
                        {
                            using (IExcelDataReader reader = ExcelReaderFactory.CreateReader(stream))
                            {
                                resultFromFile = reader.AsDataSet();
                            }
                        }
                        else if (extension == ".csv")
                        {
                            using (IExcelDataReader reader = ExcelReaderFactory.CreateCsvReader(stream))
                            {
                                resultFromFile = reader.AsDataSet();
                            }
                        }
                    }
                    if(CouponCreation == CouponCreationEnum.Import)
                    {
                        //Read first sheet of Excel file
                        if (resultFromFile.Tables[0] != null)
                        {
                            foreach (DataRow row in resultFromFile.Tables[0].Rows)
                            {
                                //Check if CouponUser are defined
                                string CouponUser = row.ItemArray[1].ToString();

                                //Get coupon code for import
                                string couponCode = row.ItemArray[0].ToString();
                                MaximumRedeem = MaximumRedeem == null ? 1 : MaximumRedeem;

                                Coupon coupon = new Coupon(couponCode, CouponStatus.Created, _promo, AssignableFrom, AssignableUntil, RedeemableFrom, RedeemableUntil, CouponSeries, (int)MaximumRedeem)
                                {
                                    Holder = CouponUser
                                };

                                ICoupon cpn = new ICoupon(coupon);

                                switch (Status)
                                {
                                    case CouponStatus.Created:
                                        break;
                                    case CouponStatus.Issued:
                                        cpn.Assign("", CouponUser);
                                        break;
                                    case CouponStatus.Redeemed:
                                        cpn.Assign("", CouponUser);
                                        cpn.Redeem(CouponUser);
                                        break;
                                    case CouponStatus.Canceled:
                                        cpn.Assign("", CouponUser);
                                        cpn.Cancel();
                                        break;
                                    default:
                                        break;

                                }

                                listOfCoupons.Add(cpn.Coupon);
                            }
                        }
                    }
                    else if (CouponCreation == CouponCreationEnum.Generate)
                    {
                        int couponsMade = 0;
                        foreach (DataRow row in resultFromFile.Tables[0].Rows)
                        {
                            //Check if CouponUser are defined
                            string CouponUser = row.ItemArray[0].ToString();
                            string CouponCode = getCouponCode(couponsMade);

                            while((pottentialySameCoupons != null && pottentialySameCoupons.Any(x => x.Code == CouponCode)) || listOfCoupons.Any(x => x.Code == CouponCode))
                            {
                                CouponCode = getCouponCode(couponsMade);
                            }
                            MaximumRedeem = MaximumRedeem == null ? 1 : MaximumRedeem;

                            Coupon coupon = new Coupon(CouponCode, CouponStatus.Created, _promo, AssignableFrom, AssignableUntil, RedeemableFrom, RedeemableUntil, CouponSeries, (int)MaximumRedeem)
                            {
                                Holder = CouponUser
                            };

                            ICoupon cpn = new ICoupon(coupon);

                            switch (Status)
                            {
                                case CouponStatus.Created:
                                    break;
                                case CouponStatus.Issued:
                                    cpn.Assign("", CouponUser);
                                    break;
                                case CouponStatus.Redeemed:
                                    cpn.Assign("", CouponUser);
                                    cpn.Redeem(CouponUser);
                                    break;
                                case CouponStatus.Canceled:
                                    cpn.Assign("", CouponUser);
                                    cpn.Cancel();
                                    break;
                                default:
                                    break;
                            }
                            
                                listOfCoupons.Add(coupon);
                                couponsMade++;
                        }
                    }


                }
            }
            else if ((CouponWithLetters || CouponWithNumbers) && NumberOfCoupons != 0)
            {
                for (int i = 0; i < NumberOfCoupons; i++)
                {
                    string code = getCouponCode(i);
                    if (code != "")
                    {
                        
                        if (!MaximumRedeem.HasValue)
                        {
                            MaximumRedeem = 1;
                        }
                         Coupon coupon = new Coupon(code, CouponStatus.Created, _promo, AssignableFrom, AssignableUntil, RedeemableFrom, RedeemableUntil, (int)CouponSeries, (int)MaximumRedeem);
                        //Add coupon to service class
                        ICoupon cpn = new ICoupon(coupon);

                        switch (Status)
                        {
                            case CouponStatus.Created:
                                break;
                            case CouponStatus.Issued:
                                cpn.Assign("", "");
                                break;
                            case CouponStatus.Redeemed:
                                cpn.Assign("", "");
                                cpn.Redeem("");
                                break;
                            case CouponStatus.Canceled:
                                cpn.Assign("", "");
                                cpn.Cancel();
                                break;
                            default:
                                break;
                        }
                        if (pottentialySameCoupons != null && pottentialySameCoupons.Any(x => x.Code == coupon.Code))
                        {
                            NumberOfCoupons++;
                        }
                        else if (listOfCoupons.Any(x => x.Code == coupon.Code))
                        {
                            NumberOfCoupons++;
                        }
                        else
                        {
                            listOfCoupons.Add(coupon);
                        }
                    }
                }

            }
            return listOfCoupons;
        }

        static long countPermutations(int N, int B)
        {
            return Convert.ToInt64(Math.Pow(B, N));
        }

        private string getCouponCode(int createdCoupons)
        {

            string chars = "";
            var result = "";
            if (CouponWithLetters)
            {
                chars += "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
            }
            if (CouponWithNumbers)
            {
                chars += "0123456789";
            }

            /*int couponLength = 0;
            for (int i = 8; i < CouponMaxLength; i++)
            {
              if(countPermutations(i, chars.Length) > NumberOfCoupons)
                {
                    couponLength = i;
                    break;
                }
            }*/
            var prefixLength = Prefix == null? 0 : Prefix.Length;
            int suffixLength = Suffix == null? 0 : Suffix.Length;
            
            if (NumberOfCoupons <= ( countPermutations(CouponMaxLength - prefixLength - suffixLength, chars.Length) - createdCoupons ) )
            {
            var random = new Random();
            result = new string(
                Enumerable.Repeat(chars,(CouponMaxLength - prefixLength - suffixLength))
                          .Select(s => s[random.Next(s.Length)])
                          .ToArray());
                result = Prefix != null ? Suffix != null ? Prefix + result + Suffix : Prefix + result : Suffix != null ? result + Suffix : result;
            }
            else
            {
                result += "";
            }
            return result;
        }
    }
}
