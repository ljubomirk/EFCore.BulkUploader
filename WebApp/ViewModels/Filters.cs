using System;
using CouponDatabase.Models;
using System.Collections.Generic;
using WebApp.Services;
using System.ComponentModel.DataAnnotations;

namespace WebApp.ViewModels
{
    public class Filters
    {
        public string Code { get; set; }
        public bool ShowActive { get; set; }
        public bool ShowInactive { get; set; }
        [DisplayFormat(DataFormatString = "{0:dd.MM.yyyy}", ApplyFormatInEditMode = true)]
        [DataType(DataType.Date)]
        public DateTime ValidFrom { get; set; }
        [DisplayFormat(DataFormatString = "{0:dd.MM.yyyy}", ApplyFormatInEditMode = true)]
        [DataType(DataType.Date)]
        public DateTime ValidTo { get; set; }
        public List<CheckedItem> Properties { get; set; }

        public Filters()
        {
            ShowActive = true;
            ShowInactive = false;
            Properties = new List<CheckedItem>();
        }


    }
}