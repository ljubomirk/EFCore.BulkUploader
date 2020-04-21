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

namespace WebApp.ViewModels
{
    public class CouponSeriesViewModel : ContextData
    {
        public long Id { get; set; }
        //[Required(ErrorMessageResourceName = "Promotion_Code_Required", ErrorMessageResourceType = typeof(Resources))]
        public long PromotionId { get; set; }
        public int NumberOfCoupons { get; set; }
        [DisplayFormat(DataFormatString = "{0:dd.MM.yyyy}", ApplyFormatInEditMode = true)]
        //[Required(ErrorMessageResourceName = "Coupon_AssignableFrom_Required", ErrorMessageResourceType = typeof(Resources))]
        [DataType(DataType.Date)]
        public Nullable<DateTime> AssignableFrom { get; set; }
        [DisplayFormat(DataFormatString = "{0:dd.MM.yyyy}", ApplyFormatInEditMode = true)]
        [DataType(DataType.Date)]
        public Nullable<DateTime> AssignableUntil { get; set; }
        [DisplayFormat(DataFormatString = "{0:dd.MM.yyyy}", ApplyFormatInEditMode = true)]
        //[DisplayFormat(DataFormatString = Resources.Promotion_Date_Format, ApplyFormatInEditMode = true)]
        //[Required(ErrorMessageResourceName = "Coupon_RedeemableFrom_Required", ErrorMessageResourceType = typeof(Resources))]
        [DataType(DataType.Date)]
        public Nullable<DateTime> RedeemableFrom { get; set; }
        [DisplayFormat(DataFormatString = "{0:dd.MM.yyyy}", ApplyFormatInEditMode = true)]
        [DataType(DataType.Date)]
        public Nullable<DateTime> RedeemableUntil { get; set; }
        public int Status { get; set; }
        public string Prefix { get; set; }
        public string Suffix { get; set; }
        public int CouponMaxLength { get; set; }
        public bool CouponWithLetters { get; set; }
        public bool CouponWithNumbers { get; set; }
        public IFormFile file { get; set; }

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

                    foreach (DataRow row in resultFromFile.Tables[0].Rows)
                    {
                        listOfCoupons.Add(new Coupon()
                        {
                            Code = row.ItemArray[0].ToString(),
                            PromotionId = PromotionId,
                            AquireFrom = AssignableFrom,
                            AquireTo = AssignableUntil,
                            AwardFrom = RedeemableFrom,
                            AwardTo = RedeemableUntil,
                            Status = Status
                        });
                    }
                }
            }
            else if ((CouponWithLetters || CouponWithNumbers) && NumberOfCoupons != 0)
            {

                for (int i = 0; i < NumberOfCoupons; i++)
                {

                    listOfCoupons.Add(new Coupon()
                    {
                        Code = getCouponCode(),
                        PromotionId = PromotionId,
                        AquireFrom = AssignableFrom,
                        AquireTo = AssignableUntil,
                        AwardFrom = RedeemableFrom,
                        AwardTo = RedeemableUntil,
                        Status = Status
                    });
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
                chars += "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
            }
            if (CouponWithNumbers)
            {
                chars += "0123456789";
            }
     
            if (NumberOfCoupons < countPermutations(CouponMaxLength<=8?8:CouponMaxLength, chars.Length))
            {
            var random = new Random();
            result = new string(
                Enumerable.Repeat(chars, CouponMaxLength<8?8:CouponMaxLength)
                          .Select(s => s[random.Next(s.Length)])
                          .ToArray());
            }
            else
            {
                result += "INVALID";
            }


            return Prefix != null ? Suffix != null ? Prefix + result + Suffix : Prefix + result : Suffix != null ? result + Suffix : result;
        }
    }
}
