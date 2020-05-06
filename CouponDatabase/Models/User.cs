using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
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
        public User(AccessTypeEnum accessType, string username, string fullname, string domain)
        {
            AccessType = accessType;
            Username = username;
            Fullname = fullname;
            Domain = domain;
        }

        public static List<AccessType> GetAccessTypes()
        {
            return BaseDefs.ArrayFrom<AccessType, AccessTypeEnum>();
        }

        [MaxLength(20)]
        public string Username { get; set; }
        [MaxLength(20)]
        public string Domain { get; set; }
        [MaxLength(80)]
        public string Fullname { get; set; }
        public AccessTypeEnum AccessType { get; set; }
    }
}
