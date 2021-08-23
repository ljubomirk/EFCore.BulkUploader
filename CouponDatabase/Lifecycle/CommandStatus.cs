using CouponDatabase.Models;
using System;
using System.Resources;
using System.Runtime.Serialization;

namespace CouponDatabase.Lifecycle
{
    [DataContract(Name="Command", Namespace = "http://www.triple-innovations.com/WS/COMMANDO/Types/")]
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

    [DataContract(Name = "ValidationResponse", Namespace = "http://www.triple-innovations.com/WS/COMMANDO/Types/")]
    public class ValidationResponse
    {
        [DataMember]
        public Command Command { get; set; }
        [DataMember]
        public string PromotionCode { get; set; }
        public ValidationResponse(Command command)
        {
            Command = command;
        }
        public ValidationResponse(Command command, string promotionCode)
        {
            Command = command;
            PromotionCode = promotionCode;
        }
    }
}
