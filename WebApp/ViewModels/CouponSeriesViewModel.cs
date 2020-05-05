using System;
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
        public int CouponSeries { get; set; }
        public long PromotionId { get; set; }
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
        public string Prefix { get; set; }
        public string Suffix { get; set; }
        public int CouponMaxLength { get; set; }
        public bool CouponWithLetters { get; set; }
        public bool CouponWithNumbers { get; set; }
        public IFormFile file { get; set; }
        public Nullable<Int32> MaximumRedeem { get; set; }

        public List<Coupon> GenerateCoupons()
        {
            DataSet resultFromFile = new DataSet();
            List<Coupon> listOfCoupons = new List<Coupon>();

            if (file != null)
            {
                if (file.Length > 0)
                {
                    var filePath = "C:\\temp\\" + file.FileName;
                    string extension = Path.GetExtension(file.FileName);

                    using (var fileStream = new FileStream(filePath, FileMode.Create))
                    {
                        file.CopyToAsync(fileStream);
                    }

                    using (var stream = System.IO.File.Open(filePath, FileMode.Open, FileAccess.Read))
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
                    if(resultFromFile.Tables[0]!= null)
                    {
                        foreach (DataRow row in resultFromFile.Tables[0].Rows)
                        {
                            string CouponUser = row.ItemArray[1].ToString();

                            Coupon coupon = new Coupon()
                            {
                                Code = row.ItemArray[0].ToString(),
                                PromotionId = PromotionId,
                                AquireFrom = AssignableFrom,
                                AquireTo = AssignableUntil,
                                AwardFrom = RedeemableFrom,
                                AwardTo = RedeemableUntil,
                                Status = (int)CouponStatus.Created,
                                CouponSeries = CouponSeries,
                                User = CouponUser
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
            }
            else if ((CouponWithLetters || CouponWithNumbers) && NumberOfCoupons != 0)
            {
                for (int i = 0; i < NumberOfCoupons; i++)
                {
                    string code = getCouponCode();
                    if(code != "")
                    {
                        Coupon coupon = new Coupon()
                        {
                            Code = code,
                            PromotionId = PromotionId,
                            AquireFrom = AssignableFrom,
                            AquireTo = AssignableUntil,
                            AwardFrom = RedeemableFrom,
                            AwardTo = RedeemableUntil,
                            Status = (int)CouponStatus.Created,
                            CouponSeries = CouponSeries
                        };

                        ICoupon cpn = new ICoupon(coupon);

                        switch (Status)
                        {
                            case CouponStatus.Created:
                                break;
                            case CouponStatus.Issued:
                                cpn.Assign("","");
                                break;
                            case CouponStatus.Redeemed:
                                cpn.Assign("","");
                                cpn.Redeem("");
                                break;
                            case CouponStatus.Canceled:
                                cpn.Assign("","");
                                cpn.Cancel();
                                break;
                            default:
                                break;
                        }

                        listOfCoupons.Add(coupon);
                    }
                }
            }

            return listOfCoupons;
        }

        static long countPermutations(int N, int B)
        {
            return Convert.ToInt64(Math.Pow(B, N));
        }

        private string getCouponCode()
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

            int couponLength = 0;
            for (int i = 8; i < CouponMaxLength; i++)
            {
              if(countPermutations(i, chars.Length) > NumberOfCoupons)
                {
                    couponLength = i;
                    break;
                }
            }
     
            if (NumberOfCoupons < countPermutations(couponLength <= 8?8: couponLength, chars.Length))
            {
            var random = new Random();
            result = new string(
                Enumerable.Repeat(chars, CouponMaxLength<8?8:CouponMaxLength)
                          .Select(s => s[random.Next(s.Length)])
                          .ToArray());
            }
            else
            {
                result += "";
            }

            result = result != ""? 
                        Prefix != null ? Suffix != null ? Prefix + result + Suffix : Prefix + result : Suffix != null ? result + Suffix : result
                     : "";

            return result;
        }
    }
}
