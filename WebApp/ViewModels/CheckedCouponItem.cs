using CouponDatabase.Lifecycle;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebApp.ViewModels
{
    /// <summary>
    /// Used for ViewModel to support checkbox fields
    /// </summary>
    public class CheckedCouponItem : CheckedItem
    {   
        // Properties specific for coupon checkboxes
        public string Code { get; set; }
        public string Holder { get; set; }
        public string User { get; set; }
        public bool Enabled { get; set; }
        public int Status { get; set; }
        public bool Active { get; set; }
    }
}
