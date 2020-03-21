﻿using System;
using System.Runtime.Serialization;

namespace CouponDatabase.API
{
    [DataContract(Name = "Promotion", Namespace = "http://www.triple-innovations.com/WS/COMMANDO/Types/")]
    public class Promotion
    {
        public string Code { get; set; }
        public DateTime ValidFrom { get; set; }
        public DateTime ValidTo { get; set; }
    }
}
