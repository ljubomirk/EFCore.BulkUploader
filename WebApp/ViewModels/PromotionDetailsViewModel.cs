using CouponDatabase.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebApp.ViewModels
{
    public class PromotionDetailsViewModel : ContextData
    {
        public Property Properties { get; }
        public AwardChannel AwardChannels { get; }
        public IssuerChannel IssuerChannels { get; }
        public Promotion Promotion { get; set; }
    }

}
