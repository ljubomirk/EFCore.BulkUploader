using System;
using CouponDatabase.Models;
using System.Collections.Generic;
using WebApp.Services;

namespace WebApp.ViewModels
{
    public class CouponFilters : Filters
    {
        public List<CheckedItem> IssuerChannels { get; set; }
        public List<CheckedItem> AwardChannels { get; set; }
        public List<CheckedItem> CurrentStatus { get; set; }

        public CouponFilters()
        {
            ShowActive = true;
            ShowInactive = false;
            IssuerChannels = new List<CheckedItem>();
            AwardChannels = new List<CheckedItem>();
            CurrentStatus = new List<CheckedItem>();
            Properties = new List<CheckedItem>();
        }
    }
}