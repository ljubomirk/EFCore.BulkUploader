using CouponDatabase.Lifecycle;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
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

        [DisplayFormat(DataFormatString = "{0:dd.MM.yyyy}", ApplyFormatInEditMode = true)]
        [DataType(DataType.Date)]
        public Nullable<DateTime> AquireFrom { get; set; }
        [DisplayFormat(DataFormatString = "{0:dd.MM.yyyy}", ApplyFormatInEditMode = true)]
        [DataType(DataType.Date)]
        public Nullable<DateTime> AquireTo { get; set; }

        [DisplayFormat(DataFormatString = "{0:dd.MM.yyyy}", ApplyFormatInEditMode = true)]
        [DataType(DataType.Date)]
        public Nullable<DateTime> AwardFrom { get; set; }
        [DisplayFormat(DataFormatString = "{0:dd.MM.yyyy}", ApplyFormatInEditMode = true)]
        [DataType(DataType.Date)]
        public Nullable<DateTime> AwardTo { get; set; }

        public bool IsMultipleRedeem { get; set; }

        public long PromotionId { get; set; }
    }
}
