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
using Microsoft.Extensions.Logging;
using System.Runtime.CompilerServices;
using Microsoft.CodeAnalysis.CSharp.Syntax;
using Microsoft.AspNetCore.Identity;
using System.Data.SqlClient;

namespace WebApp.Services
{
    public class RepositoryServices
    {
        readonly ApplicationDbContext Context;
        private readonly ILogger _logger;

        public RepositoryServices(ApplicationDbContext context)
        {
            Context = context;
            _logger = new LoggerFactory().CreateLogger("RepositoryService");
        }
        public RepositoryServices(ApplicationDbContext context, ILogger logger)
        {
            Context = context;
            _logger = logger;
        }
        public Command Add(IList<Coupon> coupons,ref Command cmd)
        {
            Command result = new Command(CommandStatus.Valid);
            _logger.LogDebug("Import start at {0}", DateTime.Now.ToLocalTime());
           
            try { 

                var transaction = Context.Database.BeginTransaction();
                //BulkSize 
                const int BulkSize = 4000;
                int recordSaved = 0;
                int recordNumber = coupons.Count;
                //Update references to Promotion                
                foreach (Coupon coupon in coupons) {
                    //removed Promotion reference, if already exists
                    if (coupon.Promotion?.Id != 0) { 
                        coupon.PromotionId = coupon.Promotion.Id;
                        coupon.Promotion = null;
                    }
                }
                //Insert coupons by range BulkSize
                for(int idx=0; idx<=(int)(coupons.Count/BulkSize); idx++) { 
                    using(var lContext = ApplicationDbContext.Factory(transaction)) {
                        var recordCount = ((idx + 1) * BulkSize) > recordNumber ? recordNumber - recordSaved : BulkSize;
                        var insertCoupons = coupons.ToList<Coupon>().GetRange(idx * BulkSize, recordCount);
                        lContext.Coupon.AddRange(insertCoupons);
                        foreach(var coupon in insertCoupons)
                        {
                            if(coupon.CouponHistories!=null)
                            foreach (CouponHistory ch in coupon.CouponHistories)
                            {
                                if (lContext.CouponHistory.Find(ch.Id) == null)
                                    lContext.CouponHistory.Add(ch);
                            }
                        }
                        recordSaved += lContext.SaveChanges();
                        _logger.LogDebug("Save {0} records at {1}, now at {2}", BulkSize, DateTime.Now, recordSaved);
                    }
                }
                if (recordSaved != recordNumber) { 
                    result.Status = CommandStatus.DataError_CouponInsertFailed;
                    result.Message = String.Format("Invalid record number stored {0}:{1}", recordSaved, recordNumber);
                }
                else if (cmd.Status==CommandStatus.ErrorSelectOneCheckbox) {
                            result = new Command(CommandStatus.ErrorSelectOneCheckbox);
                            result.Message = String.Format(result.Message);
                }
                else if (cmd.Status == CommandStatus.Error_DuplicateCouponExists){
                    result = new Command(CommandStatus.Error_DuplicateCouponExists);
                    result.Message = String.Format(result.Message);
                }
                Context.Database.CommitTransaction();
            }
            catch (DbUpdateException update)
            {
                if (Context.Database.CurrentTransaction != null)
                    Context.Database.RollbackTransaction();
                result.Status = CommandStatus.ErrorSystem;
                result.Message = update.Message;
            }
            catch (Exception exc)
            {
                if (Context.Database.CurrentTransaction != null)
                    Context.Database.RollbackTransaction();
                result.Status = CommandStatus.ErrorSystem;
                result.Message = exc.Message;
            }
            return result;
        }

        internal List<AccessLog> GetAccessLogs(DateTime? accessFrom, DateTime? accessTo, List<CheckedItem> grantedItems, List<CheckedItem> applTypes)
        {
            List<long> grantFilter = new List<long>();
            foreach(var granted in grantedItems)
            {
                if(granted.Checked)
                    grantFilter.Add(granted.Id);
            }
            List<long> accessFilter = new List<long>();
            foreach (var access in applTypes)
            {
                if (access.Checked)
                    accessFilter.Add(access.Id);
            }
            var ret = Context.AccessLog
                    .Where(item => item.IssuedDate >= accessFrom);
            ret = ret.Where(item => item.IssuedDate <= accessTo);
            ret = ret.Where(item => grantFilter.Contains(item.Granted ? 0 : 1));
            ret = ret.Where(item => accessFilter.Contains((long)item.ApplicationType));
            return ret.ToList();
        }

        public bool isPromotionEnabled(string promotionCode)
        {
            return Context.Promotion.Where(x => x.Code == promotionCode).FirstOrDefault().Enabled;
        }

        public Coupon GetCoupon(string PromotionCode, string CouponCode)
        {
            if (PromotionCode != null && CouponCode != null)
            {
                Promotion promotion;
                Coupon coupon;
                if (PromotionCode.Length > 0)
                {
                    promotion = Context.Promotion.Where(p => p.Code == PromotionCode).FirstOrDefault();
                    coupon = Context.Coupon.Where(c => c.Code == CouponCode && c.PromotionId == promotion.Id).FirstOrDefault();
                    return coupon;
                }
            }

            return null;
        }

        internal List<User> GetAllUsers()
        {
            return Context.ApplUser.ToList<User>();
        }

        public Coupon GetCouponById(long id)
        {
            Coupon coupon = Context.Coupon.Find(id);
            return Context.Coupon.Include(c => c.Promotion).Where(c => c.Id == id).First();
        }

        public List<Coupon> GetAllCoupons()
        {
            return Context.Coupon.ToList();
        }

        public Command UpdateCoupon(Coupon coupon)
        {
            Command result;
            try
            {
                Context.Database.BeginTransaction();
                Context.Coupon.Update(coupon);
                foreach(CouponHistory ch in coupon.CouponHistories)
                {
                    if (Context.CouponHistory.Find(ch.Id) == null)
                        Context.CouponHistory.Add(ch);
                }
                int saved = Context.SaveChanges();
                Context.Database.CommitTransaction();
                result = new Command(CommandStatus.Valid);
            }
            catch (DbUpdateConcurrencyException concurrent)
            {
                if (Context.Database.CurrentTransaction != null)
                    Context.Database.RollbackTransaction();
                result = new Command(CommandStatus.DataError_CouponUpdateFailed);
                _logger.LogError("Exception DBUpdate:{0}", concurrent.Message);
            }
            catch (DbUpdateException update)
            {
                if (Context.Database.CurrentTransaction != null)
                    Context.Database.RollbackTransaction();
                result = new Command(CommandStatus.ErrorSystem);
                //store to log update.Message;
                _logger.LogError("Exception DBUpdate:{0}", update.Message);
            }
            catch (Exception exc)
            {
                if (Context.Database.CurrentTransaction != null)
                    Context.Database.RollbackTransaction();
                result = new Command(CommandStatus.ErrorSystem);
                //store to log result.Message = exc.Message;
                _logger.LogError("Exception DBUpdate:{0}", exc.Message);
            }
            return result;
        }

        internal List<CouponDatabase.Models.System> getAllSystems()
        {
            return Context.Coupon_System.ToList<CouponDatabase.Models.System>();
        }

        internal int GetCouponSeriesVal(long id)
        {
            return GetPromotionWithId(id).CouponSeries;
        }

        #region PromotionCommands
        public List<Promotion> GetAllPromotions()
        {
            _logger.LogDebug(Utils.GetLogFormat() + "GetAllPromotions");
            List<Promotion> allPromotions = Context.Promotion.ToList<Promotion>();
            allPromotions.ForEach(p => 
                {
                    //_logger.LogDebug(Utils.GetLogFormat() + "Loading hasCoupons {0}", p.Id);
                    p.HasCoupons = getHasCouponsForPromotion(p.Id);
                    GetPromotionData(p);
                }
            );
            _logger.LogDebug(Utils.GetLogFormat() + "Return promotion");
            return allPromotions;
        }
        /*
         * Returns promotions with HasCoupons property true.
         */
        public List<Promotion> GetPromotionsWithCoupons()
        {
            return Context.Promotion.Where(p => p.HasCoupons).ToList();
        }

        internal bool UpdateCouponSeriesNum(long promotionId)
        {
            Promotion promotion = GetPromotionWithId(promotionId);
            promotion.CouponSeries += 1;
            return UpdatePromotion(promotion);
        }


        /*
         * Get coupons for target promotions.
         */
        public List<Coupon> GetCouponsForPromotions(List<Promotion> promotions)
        {
            List<Coupon> promotionCoupons = new List<Coupon>();
            foreach(Promotion p in promotions)
            {
                if(p.Coupons.Count() > 0){
                    promotionCoupons.AddRange(p.Coupons);
                } else
                {
                    List<Coupon> tmpCoupons = GetPromotionCoupons(p);
                    promotionCoupons.AddRange(tmpCoupons);
                }
            }
            return promotionCoupons;
        }

        /*
         * Get promotion by promotion id.
         */
        public Promotion GetPromotionWithId(long id)
        {
            Promotion promotion = Context.Promotion.Find(id);
            if(promotion!=null)
                GetPromotionData(promotion);
            return promotion;
        }

        /*
         * Get promotion by promotion code.
         */
        public Promotion GetPromotionByCode(String code)
        {
            Promotion promotion = new Promotion();
            promotion = Context.Promotion.Where(p=> p.Code == code).First();
            if (promotion != null)
                GetPromotionData(promotion);
            return promotion;
        }

        public Promotion GetPromotionData(Promotion promotion)
        {
            _logger.LogDebug(Utils.GetLogFormat()+"Loading promotion {1}:{2}", promotion.Id,promotion.Code);
            Context.Entry(promotion).Collection(p => p.PromotionProperties).Load();
            //_logger.LogDebug(Utils.GetLogFormat() + "GetPromotionData {1}:props", promotion.Id);
            Context.Entry(promotion).Collection(p => p.PromotionAwardChannels).Load();
            //_logger.LogDebug(Utils.GetLogFormat() + "GetPromotionData {1}:awardCh", promotion.Id);
            Context.Entry(promotion).Collection(p => p.PromotionIssuerChannels).Load();
            //_logger.LogDebug(Utils.GetLogFormat() + "GetPromotionData {1}:issuerCh", promotion.Id);
            //Context.Entry(promotion).Collection(p => p.Coupons).Load();
            _logger.LogDebug(Utils.GetLogFormat() + "GetPromotionData {1}:has&Load", promotion.Id);
            foreach (var promProp in promotion.PromotionProperties)
            {
                promProp.Property = Context.Property.Find(promProp.PropertyId);
            }
            //_logger.LogDebug(Utils.GetLogFormat() + "GetPromotionData {1}:props&Load", promotion.Id);
            foreach (var awardChannel in promotion.PromotionAwardChannels)
            {
                awardChannel.AwardChannel = Context.AwardChannel.Find(awardChannel.AwardChannelId);
            }
            //_logger.LogDebug(Utils.GetLogFormat() + "GetPromotionData {1}:award&Load", promotion.Id);
            foreach (var channel in promotion.PromotionIssuerChannels)
            {
                channel.IssuerChannel = Context.IssuerChannel.Find(channel.IssuerChannelId);
            }
            _logger.LogDebug(Utils.GetLogFormat() + "GetPromotionData {1}:issuer&Load", promotion.Id);

            return promotion;
        }

        public bool getHasCouponsForPromotion(long id)
        {
            return Context.Coupon.Any(c => c.PromotionId == id);
        }
        #endregion

        public List<Property> GetAllProperties()
        {
            return Context.Property.ToList<Property>();
        }

        internal List<Coupon> getCoupons()
        {
            return Context.Coupon.ToList<Coupon>();
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
        /*
         * Get list of apply to list. Generated from enum.
         */
        public List<string> GetApplyToList()
        {
            return Enum.GetNames(typeof(ApplyTo)).ToList();
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

        public List<CouponAwardChannel> GetCouponAwardChannels(long idCoupon)
        {
            return Context.CouponAwardChannel.Where(c => c.CouponId == idCoupon).ToList();
        }
        public bool CheckPromotionCode(string code)
        {
            if( Context.Promotion.Where(c => c.Code == code).Count() == 0){
                return true;
            }
            return false;

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

        public List<CouponIssuerChannel> GetCouponIssuerChannels(long idCoupon)
        {
            return Context.CouponIssuerChannel.Where(c => c.CouponId == idCoupon).ToList();
        }

        public long CreatePromotion(Promotion promotion)
        {
            string code = "";
            do
            {
                var random = new Random();
                string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
                code = new string(Enumerable.Repeat(chars, 8)
                          .Select(s => s[random.Next(s.Length)])
                          .ToArray());
            } while (!CheckPromotionCode(code));
            promotion.Code = code;
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

        /// <summary>
        /// Returns found User coupons that Promotion is Active
        /// </summary>
        /// <param name="user">User assigned for Promotion</param>
        /// <returns></returns>
        public List<Coupon> GetUserCoupons(string user, CouponStatus? status, DateTime? validFrom, DateTime? validTo)
        {
            List<Coupon> coupons = Context.Coupon
                .Include(c => c.Promotion)
                    .Where(p => p.Promotion.Active == true)
                    .Where(item => item.User == user || item.Holder == user)
                .ToList();

            if (status.HasValue)
                coupons = coupons.Where(c => c.Status == (int)status).ToList();
            if (validFrom.HasValue)
                coupons = coupons.Where(c => DateTime.Now.CompareTo(c.AwardFrom) >= 0).ToList();
            if (validTo.HasValue)
                coupons = coupons.Where(c => DateTime.Now.CompareTo(c.AwardTo) < 0).ToList();

            return coupons;
        }

        public List<Coupon> GetPromotionCoupons(Promotion promotion)
        {
            return Context.Coupon.Where(c => c.PromotionId == promotion.Id).ToList();
        }

        /*
         * Returns coupons for promotion.
         */
        public List<Coupon> GetPromotionCoupons(Coupon coupon)
        {
            return Context.Coupon.Where(p => p.PromotionId == coupon.PromotionId).ToList();
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

        internal Command UpdateCoupons(List<Coupon> couponsForUpdate)
        {
            Command result = new Command(CommandStatus.Valid);
            var transaction = Context.Database.BeginTransaction();
            try
            {
                using (var lContext = ApplicationDbContext.Factory(transaction))
                {
                    foreach (Coupon coupon in couponsForUpdate)
                    {
                        lContext.Coupon.Update(coupon);
                        foreach (CouponHistory ch in coupon.CouponHistories)
                            {
                                if (Context.CouponHistory.Find(ch.Id) == null)
                                    Context.CouponHistory.Add(ch);
                            }
                        int saved = lContext.SaveChanges();
                        result = new Command(CommandStatus.Valid);
                    }
                }
                
            }
            catch (DbUpdateConcurrencyException concurrent)
            {
                if (Context.Database.CurrentTransaction != null)
                    Context.Database.RollbackTransaction();
                result = new Command(CommandStatus.DataError_CouponUpdateFailed);
                _logger.LogError("Exception DBUpdate:{0}", concurrent.Message);
            }
            catch (DbUpdateException update)
            {
                if (Context.Database.CurrentTransaction != null)
                    Context.Database.RollbackTransaction();
                result = new Command(CommandStatus.ErrorSystem);
                //store to log update.Message;
                _logger.LogError("Exception DBUpdate:{0}", update.Message);
            }
            catch (Exception exc)
            {
                if (Context.Database.CurrentTransaction != null)
                    Context.Database.RollbackTransaction();
                result = new Command(CommandStatus.ErrorSystem);
                //store to log result.Message = exc.Message;
                _logger.LogError("Exception DBUpdate:{0}", exc.Message);
            }
            return result;
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

        public bool LogAppAccess (string action, string username, bool granted)
        {
            AccessLog log = new AccessLog(ApplicationEnum.WebApp, "", action, username, granted);
            Context.AccessLog.Add(log);
            int returnValue = Context.SaveChanges();
            return returnValue > 0 ? true : false;
        }
        public bool LogAPIAccess(string action, string channel, string username, bool granted)
        {
            AccessLog log = new AccessLog(ApplicationEnum.API, channel, action, username, granted);
            Context.AccessLog.Add(log);
            int returnValue = Context.SaveChanges();
            return returnValue > 0 ? true : false;
        }

        internal Command AddSystem(ViewSystem vSystem)
        {
            Command result = new Command(CommandStatus.Valid);
            try
            {
                PasswordHasher<string> hasher = new PasswordHasher<string>();
                CouponDatabase.Models.System model =
                    new CouponDatabase.Models.System()
                    {
                        Name = vSystem.Name,
                        Login = vSystem.Username,
                        PwdHash = hasher.HashPassword(vSystem.Username, vSystem.Password)
                    };
                Context.Coupon_System.Add(model);
                int saved = Context.SaveChanges();
                if (saved == 1)
                    result.Status = CommandStatus.Valid;
                else
                    result.Status = CommandStatus.ErrorSystem;
            }
            catch (Exception exc)
            {
                result.Status = CommandStatus.ErrorSystem;
                result.Message = exc.Message;
            }
            return result;
        }
        internal dynamic UpdateSystem(ViewSystem vSystem)
        {
            Command result = null;
            try
            {
                PasswordHasher<string> hasher = new PasswordHasher<string>();
                CouponDatabase.Models.System model =
                    new CouponDatabase.Models.System()
                    {
                        Id = vSystem.Id,
                        Name = vSystem.Name,
                        Login = vSystem.Username,
                        PwdHash = hasher.HashPassword(vSystem.Username, vSystem.Password)
                    };
                Context.Coupon_System.Update(model);
                int saved = Context.SaveChanges();
                result = new Command(CommandStatus.Valid);
            }
            catch (Exception exc)
            {
                result = new Command(CommandStatus.ErrorSystem);
                //store to log result.Message = exc.Message;
                _logger.LogError("Exception DBUpdate:{0}", exc.Message);
            }
            return result;
        }

        internal dynamic DeleteSystem(long id)
        {
            Command result = null;
            
            try
            {
                Context.Coupon_System.Remove(Context.Coupon_System.Find(id));
                int saved = Context.SaveChanges();
                result = new Command(CommandStatus.Valid);
            }
            catch (Exception exc)
            {
                result = new Command(CommandStatus.ErrorSystem);
                //store to log result.Message = exc.Message;
                _logger.LogError("Exception DBUpdate:{0}", exc.Message);
            }
            return result;
        }

        internal dynamic AddNotifyList(ExternalSystemsViewModel model)
        {
            Command result = new Command(CommandStatus.Valid);

            try
            {
                Context.NotifyList.Add(new NotifyList() {ChannelId = Int32.Parse(model.ChannelId), SystemId = Int32.Parse(model.SystemId), Url = model.Url });
                int saved = Context.SaveChanges();
                if (saved == 1)
                    result.Status = CommandStatus.Valid;
                else
                    result.Status = CommandStatus.ErrorSystem;
            }
            catch (Exception exc)
            {
                result.Status = CommandStatus.ErrorSystem;
                result.Message = exc.Message;
            }
            return result;
        }

        internal dynamic UpdateNotifyList(ExternalSystemsViewModel model)
        {
            Command result = null;
            NotifyList notifyList = new NotifyList() { ChannelId = Int32.Parse(model.ChannelId), SystemId = Int32.Parse(model.SystemId), Url = model.Url };
            NotifyList targetNotifyList = new NotifyList();
            try
            {
                targetNotifyList = Context.NotifyList.Where(x=> x.ChannelId == notifyList.ChannelId && x.SystemId == notifyList.SystemId).First();
                targetNotifyList.Url = notifyList.Url;
                int saved = Context.SaveChanges();
                result = new Command(CommandStatus.Valid);
            }
            catch (Exception exc)
            {
                result = new Command(CommandStatus.ErrorSystem);
                //store to log result.Message = exc.Message;
                _logger.LogError("Exception DBUpdate:{0}", exc.Message);
            }
            return result;
        }

        internal dynamic deleteNotifyList(long channelId, long systemId)
        {
            Command result = null;

            try
            {
                Context.NotifyList.Remove(Context.NotifyList.Where(x => x.ChannelId == channelId && x.SystemId == systemId).First());
                int saved = Context.SaveChanges();
                result = new Command(CommandStatus.Valid);
            }
            catch (Exception exc)
            {
                result = new Command(CommandStatus.ErrorSystem);
                //store to log result.Message = exc.Message;
                _logger.LogError("Exception DBUpdate:{0}", exc.Message);
            }
            return result;
        }


        public Command UpdateUsers(IList<User> users)
        {
            Command result = new Command(CommandStatus.Valid);
            try
            {
                //Update users
                foreach(User usr in Context.ApplUser.AsEnumerable<User>())
                {
                    User found = users.First(u => u.Username == usr.Username);
                    if (found != null)
                    {
                        usr.Fullname = found.Fullname;
                        usr.AccessType = found.AccessType;
                        usr.Domain = found.Domain;
                    }
                    Context.ApplUser.Update(usr);
                }
                //Remove users not in new list
                Context.ApplUser.RemoveRange(Context.ApplUser.Except(users));
                //Insert new users
                Context.ApplUser.AddRange(users.Except(Context.ApplUser));
                int saved = Context.SaveChanges();
                if (saved == 1)
                    result.Status = CommandStatus.Valid;
                else
                    result.Status = CommandStatus.ErrorSystem;
            }
            catch (Exception exc)
            {
                result.Status = CommandStatus.ErrorSystem;
                result.Message = exc.Message;
            }
            return result;
        }

        public string getAllCouponUsers(long Id)
        {
            return string.Join(",", Context.CouponHistory.Where(x => x.CouponId == Id && x.Status == 3 && x.User != null).Select(o => o.User).ToList());
        }

        public bool IsMultipleRedeem(long promotionId)
        {
            long multipleRedeemId = Context.Property.Where(x => x.Name == "AllowMultipleRedeems").FirstOrDefault().Id;
            return Context.PromotionProperty.Where(x => x.PromotionId == promotionId && x.PropertyId == multipleRedeemId).Any();
        }

    }

    public class PromotionFactory : IPromotion
    {
        public PromotionFactory(Promotion promo) : base(promo)
        {

        }
    }
}
