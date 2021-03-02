using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace WebApp.ViewModels
{
    public class CheckedPromotionItem : CheckedItem
    {
        public string Code { get; set; }
        public string Name { get; set; }
        public bool Enabled { get; set; }
        public bool Active { get; set; }
        public bool HasCoupons { get; set; }


        [DisplayFormat(DataFormatString = "{0:dd.MM.yyyy}", ApplyFormatInEditMode = true)]
        [DataType(DataType.Date)]
        public Nullable<DateTime> ValidFrom { get; set; }
        [DisplayFormat(DataFormatString = "{0:dd.MM.yyyy}", ApplyFormatInEditMode = true)]
        [DataType(DataType.Date)]
        public Nullable<DateTime> ValidTo { get; set; }

    }
}
