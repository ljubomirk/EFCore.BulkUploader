using CouponDatabase.Models;
using CouponDatabase.Properties;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.ServiceModel.Security;
using System.Threading.Tasks;

namespace WebApp.ViewModels
{
    public class PromotionDetailsViewModel : ContextData
    {
        [Display(Name = "Promotion_Properties", ResourceType = typeof(Resources))]
        public List<CheckedItem> Properties { get; set; }
        [Display(Name = "Promotion_AwardChannels", ResourceType = typeof(Resources))]
        public List<CheckedItem> AwardChannels { get; set; }
        [Display(Name = "Promotion_IssuerChannels", ResourceType = typeof(Resources))]
        public List<CheckedItem> IssuerChannels { get; set; }
        public Promotion Promotion { get; set; }
        public bool hasEndDate { get; set; }

        public PromotionDetailsViewModel() : base() { }
        public PromotionDetailsViewModel(string username, string group) : base(username, group){ }
    }

}
