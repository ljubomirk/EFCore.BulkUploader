using CouponDatabase.Lifecycle;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace CouponDatabase.Models
{
    public enum ApplicationEnum
    {
        WebApp,
        API
    }

    public class ApplicationType : BaseDefs { }

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

        [MaxLength(20)]
        public string Channel { get; set; }
        [MaxLength(80)]
        public string Action { get; set; }
        [MaxLength(20)]
        public string Username { get; set; }
        public Boolean Granted { get; set; }
        [DisplayFormat(DataFormatString = "{0:dd.MM.yyyy HH:mm}", ApplyFormatInEditMode = true)]
        [DataType(DataType.Date)]
        public DateTime IssuedDate { get; set; }

        public static List<ApplicationType> GetApplicationTypes()
        {
            return BaseDefs.ArrayFrom<ApplicationType, ApplicationEnum>();
        }

    }

}
