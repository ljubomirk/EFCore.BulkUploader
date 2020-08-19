using CouponDatabase.Properties;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace CouponDatabase.Models
{

    public class NotifyList
    {
        [Display(Name = "NotifyList_Channel", ResourceType = typeof(Resources))]
        public IssuerChannel Channel { get; set; }
        public long ChannelId { get; set; }
        [Display(Name = "NotifyList_System", ResourceType = typeof(Resources))]
        public System System { get; set; }
        public long SystemId { get; set; }

        [DataType(DataType.Url)]
        [Display(Name = "NotifyList_Url", ResourceType = typeof(Resources))]
        public string Url { get; set; }
    }

}
