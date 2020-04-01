using CouponDatabase.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebApp.ViewModels
{
    public class PromotionDetailsViewModel : ContextData
    {
        public List<Property> Properties { get; }
        public List<AwardChannel> AwardChannels { get; }
        public List<IssuerChannel> IssuerChannels { get; }
        public Promotion Promotion { get; set; }
    }

}
