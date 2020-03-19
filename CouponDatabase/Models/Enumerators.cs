using System;
using System.Collections.Generic;
using System.Text;

namespace Enumerators
{
    public enum CouponStatus
    {
        Created = 1,
        Issued = 2,
        Redeemed = 3,
        Canceled = 4
    }
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
