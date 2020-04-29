using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace CouponDatabase.Models
{
    public enum ApplicationEnum
    {
        API,
        WebApp
    }

    public class AccessLog
    {
        public AccessLog() { }
        public AccessLog(ApplicationEnum appType, string channel, string action, string username, Boolean granted)
        {
            ApplicationType = appType;
            Channel = channel;
            Action = action;
            Username = username;
            Granted = granted;
            IssuedDate = DateTime.Now;
        }

        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public long Id { get; set; }
        //[System.ComponentModel.DataAnnotations.MaxLength(20,ErrorMessageResourceName = , ErrorMessageResourceType = 1]
        [DataType(DataType.Text)]
        public ApplicationEnum ApplicationType { get; set; }

        public string Channel { get; set; }
        public string Action { get; set; }
        public string Username { get; set; }
        public bool Granted { get; }
        [DisplayFormat(DataFormatString = "{0:dd.MM.yyyy}", ApplyFormatInEditMode = true)]
        [DataType(DataType.Date)]
        public DateTime IssuedDate { get; set; }

    }

}
