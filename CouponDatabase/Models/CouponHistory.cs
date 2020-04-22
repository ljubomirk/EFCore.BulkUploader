using CouponDatabase.Lifecycle;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace CouponDatabase.Models
{
    public class CouponHistory
    {
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public long Id { get; set; }
        public DateTime Date { get; set; }

        public string Action { get; set; }
        public int Status { get; set; }
        public long CouponId { get; set; }
        public string User { get; set; }
        public Coupon Coupon { get; set; }

        public CouponHistory()
        {

        }
        public CouponHistory(Coupon coupon, string action, string user)
        {
            Date = DateTime.Now;
            Action = action;
            CouponId = coupon.Id;
            Status = coupon.Status;
            User = user;
            Coupon = coupon;
        }
    }
}
