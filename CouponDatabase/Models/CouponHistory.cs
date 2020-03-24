using System;
using System.Collections.Generic;
using System.Text;

namespace CouponDatabase.Models
{
    class CouponHistory: Coupon
    {
        public CouponHistory() : base("", "", "", Lifecycle.CouponStatus.Created, null){ }

    }
}
