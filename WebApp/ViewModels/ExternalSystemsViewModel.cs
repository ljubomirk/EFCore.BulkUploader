using CouponDatabase.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using CouponSystem = CouponDatabase.Models.System;

namespace WebApp.ViewModels
{
    public class ExternalSystemsViewModel : ContextData
    {
        public List<CouponSystem> Systems { get; private set; }
        public List<CheckedItem> Channels { get; private set; }
        public List<NotifyList> NotifyLists { get; private set; }

        public ExternalSystemsViewModel() { }
        public void AddSystems(IList<CouponSystem> systems)
        {
            Systems = systems.ToList<CouponSystem>();
        }

        public void AddNotifyLists(IList<NotifyList> notifyLists)
        {
            NotifyLists = notifyLists.ToList<NotifyList>();
        }

        public void AddChannels(IList<IssuerChannel> channelList)
        {
            Channels = new List<CheckedItem>();
            foreach(var channel in channelList)
            {
                Channels.Add(new CheckedItem() { Id = channel.Id, Checked = false, Label = channel.Name });
            }
        }
    }
}
