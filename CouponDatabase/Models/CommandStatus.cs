using System;
using System.Collections.Generic;
using System.Text;

namespace CouponDatabase.Lifecycle
{
    public class Command
    {
        public CommandStatus Status { get; set; }
        public string Message { get; set; }
    }
}
