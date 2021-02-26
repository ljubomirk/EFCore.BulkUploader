using CouponDatabase.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebApp.ViewModels
{
    public class PromotionList
    {
        public Promotion Promotion { get; set; }
        public List<Promotion> Promotions { get; set; }
        public List<CheckedPromotionItem> PromotionItems { get; set; }
        public bool SelectAllPromotions { get; set; }
    }
}
