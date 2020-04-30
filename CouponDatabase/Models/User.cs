using System.Collections.Generic;
using CouponDatabase.Lifecycle;

namespace CouponDatabase.Models
{
    public class AccessType : BaseDefs {}
    public enum AccessTypeEnum
    {
        Manager,
        Administrator
    }

    public class User
    {
        public User() { }
        public User(AccessTypeEnum accessType, string username, string fullname)
        {
            AccessType = accessType;
            Username = username;
            Fullname = fullname;
        }

        public static List<AccessType> GetAccessTypes()
        {
            return BaseDefs.ArrayFrom<AccessType, AccessTypeEnum>();
        }
        public string Username { get; set; }
        public string Domain { get; set; }
        public string Fullname { get; set; }
        public AccessTypeEnum AccessType { get; set; }
    }
}
