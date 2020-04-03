using CouponDatabase.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebApp.ViewModels
{
    public class PromotionDetailsViewModel : ContextData
    {
        public List<Property> Properties { get; set; }
        public List<AwardChannel> AwardChannels { get; set; }
        public List<IssuerChannel> IssuerChannels { get; set; }
        public Promotion Promotion { get; set; }
    }

}
