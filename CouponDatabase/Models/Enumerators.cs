using System;
using System.Collections.Generic;
using System.Runtime.Serialization;
using System.Text;

namespace CouponDatabase.Lifecycle
{
    [DataContract(Name = "CouponStatus", Namespace = "http://www.triple-innovations.com/WS/COMMANDO/Types/")]
    public enum CouponStatus
    {
        Created = 1,
        Issued = 2,
        Redeemed = 3,
        Canceled = 4
    }
    [DataContract(Name = "CommandStatus", Namespace = "http://www.triple-innovations.com/WS/COMMANDO/Types/")]
    public enum CommandStatus
    {
        Valid = 0,
        ErrorInvalidStatus = 1,
        ErrorPromotionNotFound = 2,
        ErrorCouponNotFound = 3,
        ErrorInvalidUser = 4,
        ErrorSystem = 99
    }
}
