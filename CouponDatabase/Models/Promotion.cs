using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;
using CouponDatabase.Properties;

namespace CouponDatabase.Models
{
    public class Promotion
    {
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public long Id { get; set; }
        //[System.ComponentModel.DataAnnotations.MaxLength(20,ErrorMessageResourceName = , ErrorMessageResourceType = 1]
        [StringLength(20, ErrorMessageResourceName = "Promotion.Code.Length", ErrorMessageResourceType = typeof(Resources))]
        [Required(ErrorMessageResourceName = "Promotion.Code.Required", ErrorMessageResourceType = typeof(Resources))]
        [Display(Name = "Promotion.Code", ResourceType = typeof(Resources))]
        [DataType(DataType.Text)]
        public string Code { get; set; }

        public DateTime ValidFrom { get; set; }
        public DateTime ValidTo { get; set; }

    }
}
