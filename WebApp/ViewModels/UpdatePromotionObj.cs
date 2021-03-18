using CouponDatabase.Properties;
using System;
using System.ComponentModel.DataAnnotations;

namespace WebApp.ViewModels
{
    public class UpdatePromotionObj
    {
        public bool statusSwitch { get; set; }

        [DisplayFormat(DataFormatString = "{0:dd.MM.yyyy}", ApplyFormatInEditMode = true)]
        [DataType(DataType.Date)]
        [Display(Name = "Date_ValidTo", ResourceType = typeof(Resources))]
        public Nullable<DateTime> ValidTo { get; set; }

    }
}