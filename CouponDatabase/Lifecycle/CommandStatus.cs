using CouponDatabase.Models;
using System;
using System.Resources;
using System.Runtime.Serialization;

namespace CouponDatabase.Lifecycle
{
    [DataContract]
    public class Command
    {
        [DataMember]
        public CommandStatus Status { get; set; }
        [DataMember]
        public string Message { get; set; }
        public Command(CommandStatus status)
        {
            Status = status;
            var builder = new ResourceManager(typeof(CouponDatabase.Properties.Resources));
            try
            {
                Message = builder.GetString(Status.ToString() + "_Message");
            }
            catch(Exception ex)
            {
                Console.WriteLine("Exception: " + ex.Message);
            }
        }
    }
}
