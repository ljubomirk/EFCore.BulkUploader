using System;
using System.Runtime.Serialization;

namespace CouponDatabase.API
{
    [DataContract(Name = "Promotion", Namespace = "http://www.triple-innovations.com/WS/COMMANDO/")]
    public class Promotion
    {
        [DataMember(IsRequired = true, EmitDefaultValue = true)]
        public String Code { get; set; }
        public Nullable<DateTime> ValidFrom { get; set; }
        public Nullable<DateTime> ValidTo { get; set; }
        public Boolean Active { get; set; }
    }
}
