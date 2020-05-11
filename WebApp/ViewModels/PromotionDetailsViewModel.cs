using CouponDatabase.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.ServiceModel.Security;
using System.Threading.Tasks;

namespace WebApp.ViewModels
{
    public class PromotionDetailsViewModel : ContextData
    {
        public List<CheckedItem> Properties { get; set; }
        public List<CheckedItem> AwardChannels { get; set; }
        public List<CheckedItem> IssuerChannels { get; set; }
        public Promotion Promotion { get; set; }
        public bool hasEndDate { get; set; }

        public PromotionDetailsViewModel() : base() { }
        public PromotionDetailsViewModel(string username, string group) : base(username, group){ }
    }

}
