using CouponDatabase.Models;
using Microsoft.AspNetCore.Mvc.Rendering;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;
using CouponSystem = CouponDatabase.Models.System;

namespace WebApp.ViewModels
{
    public class ExternalSystemsViewModel : ContextData
    {
        public List<CouponSystem> Systems { get; private set; }
        public List<IssuerChannel> Channels { get; private set; }
        public List<SelectListItem> DropSystems { get; private set; }
        public List<SelectListItem> DropChannels { get; private set; }
        public List<NotifyList> NotifyLists { get; private set; }
        public string ChannelId { get; set; }
        public string SystemId { get; set; }
        [DataType(DataType.Url)]
        public string Url { get; set; }

        public void AddSystems(IList<CouponSystem> systems)
        {
            Systems = systems.ToList<CouponSystem>();
        }
        public void AddDropSystems(IList<CouponSystem> systems)
        {
            DropSystems = getSelectListSystems(systems.ToList<CouponSystem>());
        }

        private List<SelectListItem> getSelectListSystems(List<CouponSystem> CouponSystems)
        {
            List<SelectListItem> selectList = new List<SelectListItem>();
            foreach (CouponSystem p in CouponSystems)
            {
                selectList.Add(new SelectListItem
                {
                    Text = p.Name,
                    Value = p.Id.ToString()
                });
            }
            return selectList;
        }

        public void AddNotifyLists(IList<NotifyList> notifyLists)
        {
            NotifyLists = notifyLists.ToList<NotifyList>();
        }
        public void AddChannels(IList<IssuerChannel> channelList)
        {
            Channels = channelList.ToList<IssuerChannel>();
        }


        public void AddDropChannels(IList<IssuerChannel> channelList)
        {
            DropChannels = getSelectListChannels(channelList.ToList<IssuerChannel>());
        }

        private List<SelectListItem> getSelectListChannels(List<IssuerChannel> IssuerChannels)
        {
            List<SelectListItem> selectList = new List<SelectListItem>();
            foreach (IssuerChannel p in IssuerChannels)
            {
                selectList.Add(new SelectListItem
                {
                    Text = p.Name,
                    Value = p.Id.ToString()
                });
            }
            return selectList;
        }

        public List<SelectListItem> getSelectListPromotions(List<Promotion> promotions)
        {
            List<SelectListItem> selectList = new List<SelectListItem>();
            foreach (Promotion p in promotions)
            {
                selectList.Add(new SelectListItem
                {
                    Text = p.Code,
                    Value = p.Id.ToString()
                });
            }
            return selectList;
        }
    }
}
