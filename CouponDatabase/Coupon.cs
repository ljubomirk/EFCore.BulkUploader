using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace CouponDatabase
{
    public class Coupon
    {
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public long Id { get; set; }
        //[System.ComponentModel.DataAnnotations.MaxLength(20,ErrorMessageResourceName = , ErrorMessageResourceType = 1]
        [DataType(DataType.Text)]
        public string Code { get; set; }

        public Enumerators.CouponStatus CouponStatus { get; set; }
        public DateTime AquireFrom { get; set; }
        public DateTime AquireTo { get; set; }

        public DateTime AwardFrom { get; set; }
        public DateTime AwardTo { get; set; }
        
        public long PromotionId { get; set; }

    }
}
