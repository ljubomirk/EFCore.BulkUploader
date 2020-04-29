using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace CouponDatabase.Models
{

    public class NotifyList
    {
        public IssuerChannel Channel { get; set; }
        public long ChannelId { get; set; }
        public System System { get; set; }
        public long SystemId { get; set; }

        [DataType(DataType.Url)]
        public string Url { get; set; }
    }

}
