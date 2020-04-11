using CouponDatabase.Lifecycle;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebApp.ViewModels
{
    /// <summary>
    /// CouponCommand status of update
    /// </summary>
    public class CouponCommand
    {
        /// <summary>
        /// Id of Coupon that should be updated
        /// </summary>
        public long CouponId { get; set; }

        /// <summary>
        /// Status of executed command
        /// </summary>
        public CommandStatus Status { get; set; }
        /// <summary>
        /// Message of execution error
        /// </summary>
        public string Message { get; set; }
    }
}
