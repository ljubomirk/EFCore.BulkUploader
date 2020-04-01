using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace CouponDatabase.Models
{
    public class CouponHistory
    {
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public long CouponHistoryId { get; set; }

        public DateTime UpdateDate { get; set; }
        public int Status { get; set; }
        public long CouponId { get; set; }
        public Coupon Coupon { get; set; }

        public CouponHistory()
        {

        }
        public CouponHistory(Coupon Coupon)
        {
            CouponId = Coupon.Id;
            Status = Coupon.Status;
            UpdateDate = DateTime.Now;
        }
    }
}
