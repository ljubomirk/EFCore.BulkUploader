﻿using System;
using CouponDatabase.Models;
using System.Collections.Generic;
using WebApp.Services;

namespace WebApp.ViewModels
{
    public class Filters
    {
        public string Code { get; set; }
        public bool ShowActive { get; set; }
        public bool ShowInactive { get; set; }
        public DateTime ValidFrom { get; set; }
        public DateTime ValidUntil { get; set; }
        public IList<Property> Properties { get; set; }

        public Filters()
        {
            ShowActive = true;
            ShowInactive = false;
            Properties = new List<Property>();
        }


    }
}