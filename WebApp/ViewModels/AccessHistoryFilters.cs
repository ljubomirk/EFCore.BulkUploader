using CouponDatabase.Models;
using CouponDatabase.Properties;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace WebApp.ViewModels
{

    public class AccessHistoryFilters
    {
        public List<CheckedItem> AccessTypes{ get; set; }
        public List<CheckedItem> AccessGrants {get; set;}
        [DisplayFormat(DataFormatString = "{0:dd.MM.yyyy}", ApplyFormatInEditMode = true)]
        [DataType(DataType.Date)]
        [Display(Name = "Date_AccessFrom", ResourceType = typeof(Resources))]
        public Nullable<DateTime> AccessFrom { get; set; }
        [DisplayFormat(DataFormatString = "{0:dd.MM.yyyy}", ApplyFormatInEditMode = true)]
        [DataType(DataType.Date)]
        [Display(Name = "Date_AccessTo", ResourceType = typeof(Resources))]
        public Nullable<DateTime> AccessTo { get; set; }

        public AccessHistoryFilters()
        {
            AccessTypes = new List<CheckedItem>();
            foreach(var type in User.GetAccessTypes())
            {
                AccessTypes.Add(new CheckedItem() { Id = type.Id, Checked = true, Label = type.Name });
            }
            AccessGrants = new List<CheckedItem>
            {
                new CheckedItem() { Id = 0, Checked = true, Label = "Yes" },
                new CheckedItem() { Id = 1, Checked = false, Label = "No" }
            };
            AccessFrom = DateTime.Now.AddMonths(-1);
            AccessTo = DateTime.Now;
        }
    }
}
