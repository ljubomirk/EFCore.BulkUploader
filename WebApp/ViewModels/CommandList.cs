using System;
using CouponDatabase.Models;
using System.Collections.Generic;
using WebApp.Services;

namespace WebApp.ViewModels
{
    public enum LifecycleCommandTypeEnum
    {
        Customer,
        ValidTo,
        Enabled,
        Status
    }
    public class LifecycleCommand
    {
        public LifecycleCommandTypeEnum Command { get; set; }
        public string Value { get; set; }

        public LifecycleCommand()
        {
        }


    }
}