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
using FoolProof.Core;
using Microsoft.CodeAnalysis.CSharp.Syntax;

namespace WebApp.ViewModels
{
    public class CouponSeriesViewModel : ContextData
    {
        private class CouponData
        {
            public string CouponCode;
            public string CouponUser;
            public string CouponHolder;

            public CouponData()
            {
                this.CouponCode = null;
                this.CouponUser = null;
                this.CouponHolder = null;
            }

            public CouponData(string code,string user,string holder)
            {
                this.CouponCode = code;
                this.CouponUser = user;
                this.CouponHolder = holder;
            }
        }
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
        [RequiredIfNot("CouponWithNumbers",true)]
        public bool CouponWithLetters { get; set; }
        [RequiredIfNot("CouponWithLetters",true)]
        public bool CouponWithNumbers { get; set; }
        public CouponCreationEnum CouponCreation { get; set; }
        public IFormFile file { get; set; }
        [Display(Name = "Coupon_MaximumRedeem", ResourceType = typeof(Resources))]
        public Nullable<Int32> MaximumRedeem { get; set; }
        public bool Holders { get; set; }
        public bool Users { get; set; }
        public bool Codes { get; set; }
        public CouponSeriesViewModel() : base() { }
        public CouponSeriesViewModel(ContextData contextData, DateTime? PromotionValidFrom, DateTime? PromotionValidTo):base(contextData.AgentUsername, contextData.AgentGroup)
        {
            AssignableFrom = PromotionValidFrom;
            AssignableUntil = PromotionValidTo;
            RedeemableFrom = PromotionValidFrom;
            RedeemableUntil = PromotionValidTo;
        }

        public List<Coupon> GenerateCoupons(List<Coupon> pottentialySameCoupons, ref Command cmd, CouponStatus status)
        {
            DataSet resultFromFile = new DataSet();
            List<Coupon> listOfCoupons = new List<Coupon>();
            
            //Check if Excel/csv file is loaded
            if (file != null && file.Length > 0)
            {
                resultFromFile = CheckFileUpload(file, ref listOfCoupons, ref cmd, ref pottentialySameCoupons);

                // If CouponCreationEnum is equal import --> file contains coupon codes and coupon users
                if (CouponCreation == CouponCreationEnum.Import)
                {
                    //Read data of Excel file and store it to list of CouponData structure
                    List<CouponData> excelData = ExtractExcelData(resultFromFile);
                   
                        foreach (CouponData cd  in excelData)
                        {
                            MaximumRedeem = MaximumRedeem == null ? 1 : MaximumRedeem;
                            //variable Holders is used in ManagementController to check if Holders are correctly defined
                            Holders = cd.CouponHolder != "" ? true : false;
                            //variable Users is used in ManagementController to check if Users are correctly defined
                            Users = cd.CouponUser != "" ? true : false;
                            //variable Users is used in ManagementController to check if Codes are correctly defined
                            Codes = cd.CouponCode != "" ? true : false;

                            Coupon coupon = new Coupon(cd.CouponCode, status, _promo, AssignableFrom, AssignableUntil, RedeemableFrom, RedeemableUntil, CouponSeries, (int)MaximumRedeem)
                            {
                              Holder = cd.CouponHolder,
                              User=cd.CouponUser
                            };

                            ICoupon cpn = new ICoupon(coupon);
                            
                            SwitchStatus(ref cpn, cd.CouponUser);

                            listOfCoupons.Add(cpn.Coupon);
                        }
                        if(!((status==CouponStatus.Created || status==CouponStatus.Issued)&& Codes && !Users || !Holders)&&!(status==CouponStatus.Redeemed && Codes && Users))
                        {
                            cmd = new Command(CommandStatus.InvalidDocumentError);
                            
                        }
                }

                // If CouponCreationEnum is equal generate --> file contains only coupon users, coupon code is generated using funtion getcouponCode for every user
                else if (CouponCreation == CouponCreationEnum.Generate)
                {
                    int couponsMade = 0;
                    //Read data of Excel file and store it to list of CouponData structure
                    List<CouponData> excelData = ExtractExcelData(resultFromFile);
                    
                    foreach (CouponData cd in excelData)
                    {
                        //variable Holders is used in ManagementController to check if Holders are correctly defined
                        Holders = cd.CouponHolder != ""? true : false;
                        Users = cd.CouponUser != "" ? true : false;
                        string CouponCode = getCouponCode(couponsMade, out cmd);

                        while ((pottentialySameCoupons != null && pottentialySameCoupons.Any(x => x.Code == CouponCode)) || listOfCoupons.Any(x => x.Code == CouponCode))
                        {
                            CouponCode = getCouponCode(couponsMade, out cmd);
                        }
                        MaximumRedeem = MaximumRedeem == null ? 1 : MaximumRedeem;

                        Coupon coupon = new Coupon(CouponCode, CouponStatus.Created, _promo, AssignableFrom, AssignableUntil, RedeemableFrom, RedeemableUntil, CouponSeries, (int)MaximumRedeem)
                        {
                            Holder = cd.CouponHolder
                        };

                        ICoupon cpn = new ICoupon(coupon);

                        SwitchStatus(ref cpn, cd.CouponUser);

                        listOfCoupons.Add(coupon);
                        couponsMade++;
                    }
                    if(!Holders || Users)
                    {
                        cmd = new Command(CommandStatus.InvalidDocumentError);
                        
                    }
                }
            }
            // Excel/csv file is not loaded, coupon code and user are generated through application
            else if (NumberOfCoupons != 0)
            {
                for (int i = 0; i < NumberOfCoupons; i++)
                {
                    string code = getCouponCode(i, out cmd);
                    if (code != "" && cmd.Status == CommandStatus.Valid)
                    {

                        if (!MaximumRedeem.HasValue)
                        {
                            MaximumRedeem = 1;
                        }
                        Coupon coupon = new Coupon(code, CouponStatus.Created, _promo, AssignableFrom, AssignableUntil, RedeemableFrom, RedeemableUntil, (int)CouponSeries, (int)MaximumRedeem);
                        //Add coupon to service class
                        ICoupon cpn = new ICoupon(coupon);

                        SwitchStatus(ref cpn, "");

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

        /// <summary>
        /// Function gets number of permutations
        /// </summary>
        /// <param name="N">length of coupon without suffix and prefix</param>
        /// <param name="B">length of characters that can be used to form coupon</param>
        /// <returns>long value as number of permutations</returns>
        static long countPermutations(int N, int B)
        {
            return Convert.ToInt64(Math.Pow(B, N));
        }

        /// <summary>
        ///  Funtion generate coupon code
        /// </summary>
        /// <param name="createdCoupons">number of created coupons</param>
        /// <returns>string value as coupon code,if result is null checkbox "use letters" and "use numbers" are not selected
        /// if result is "" coupon with code already exists</returns>
        private string getCouponCode(int createdCoupons, out Command cmd)
        {

            string chars = "";
            string result = null;
            //if chars stays "" that menas that both checkboxes "use letters" and "use numbers" are not selected and code cannot be generated, 
            //cmd is transported to Add function in RepositoryService
            cmd = new Command(CommandStatus.ErrorSelectOneCheckbox);
            if (CouponWithLetters)
            {
                chars += "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
            }
            if (CouponWithNumbers)
            {
                chars += "0123456789";
            }

            int prefixLength = Prefix == null ? 0 : Prefix.Length;
            int suffixLength = Suffix == null ? 0 : Suffix.Length;
            if (chars != "") {
                /* if NumberOfCoupons is less than number of permutations that can be made of selected characters minus createdCoupons, coupon cannot be made*/
                if (NumberOfCoupons <= (countPermutations(CouponMaxLength - prefixLength - suffixLength, chars.Length) - createdCoupons))
                {
                    var random = new Random();
                    result = new string(
                        Enumerable.Repeat(chars, (CouponMaxLength - prefixLength - suffixLength))
                                  .Select(s => s[random.Next(s.Length)])
                                  .ToArray());
                    // result = Prefix + result + Suffix
                    result = Prefix != null ? Suffix != null ? Prefix + result + Suffix : Prefix + result : Suffix != null ? result + Suffix : result;
                    cmd = new Command(CommandStatus.Valid);
                }
                else
                {
                    // code cannot be generated : all possible codes that can be generated already exist in database
                    result = "";
                    cmd = new Command(CommandStatus.Error_DuplicateCouponExists);
                }
            }
            return result;
        }

        public DataSet CheckFileUpload(IFormFile file, ref List<Coupon> listOfCoupons, ref Command cmd, ref List<Coupon> pottentialySameCoupons)
        {
            DataSet resultFromFile = new DataSet();
            string extension = Path.GetExtension(file.FileName);

            using (var stream = file.OpenReadStream())
            {
                if (extension == ".xls" || extension == ".xlsx")
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
            return resultFromFile;
        }


        public void SwitchStatus(ref ICoupon cpn, string CouponUser)
        {
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
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="resultFromFile"></param>
        /// <returns>stores data from Exell file in list of CouponData structure</returns>
        private List<CouponData> ExtractExcelData(DataSet resultFromFile)
        {
            List<CouponData> result = new List<CouponData>();
         
            if (resultFromFile.Tables[0] != null)
            {
                foreach (DataRow row in resultFromFile.Tables[0].Rows)
                {
                    string CouponUser = null;
                    string CouponCode = null;
                    string CouponHolder = null;

                    //Check if CouponHolder is defined
                    if (row.ItemArray.Length >= 3)
                        CouponHolder = row.ItemArray[2].ToString();

                    //Check if CouponUser is defined
                    if (row.ItemArray.Length >= 2)
                       CouponUser = row.ItemArray[1].ToString();


                    //Get coupon code for import
                    if (row.ItemArray.Length >= 1)
                         CouponCode = row.ItemArray[0].ToString();
                    CouponData cd = new CouponData(CouponCode, CouponUser,CouponHolder);

                    result.Add(cd);
                } 
            }
           return result;
         }
    
     }
}

