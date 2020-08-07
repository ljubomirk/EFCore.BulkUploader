using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using CouponDatabase.Lifecycle;
using CouponDatabase.Properties;

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
        [Display(Name = "User_Username", ResourceType = typeof(Resources))]
        public string Username { get; set; }
        [MaxLength(20)]
        [Display(Name = "User_Domain", ResourceType = typeof(Resources))]
        public string Domain { get; set; }
        [MaxLength(80)]
        [Display(Name = "User_Fullname", ResourceType = typeof(Resources))]
        public string Fullname { get; set; }
        [Display(Name = "User_AccessType", ResourceType = typeof(Resources))]
        public AccessTypeEnum AccessType { get; set; }
    }
}
