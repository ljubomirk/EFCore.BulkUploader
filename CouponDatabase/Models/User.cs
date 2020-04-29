using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace CouponDatabase.Models
{
    public enum AccessType
    {
        Manager,
        Admininistrator
    }

    public class User
    {
        public User() { }
        public User(AccessType accessType, string username, string fullname)
        {
            AccessType = accessType;
            Username = username;
            Fullname = fullname;
        }

        public string Username { get; set; }
        public string Domain { get; set; }
        public string Fullname { get; set; }
        public AccessType AccessType { get; set; }
    }
}
