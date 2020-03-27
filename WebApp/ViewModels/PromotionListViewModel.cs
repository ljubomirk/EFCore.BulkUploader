using CouponDatabase.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebApp.ViewModels
{
    public class PromotionListViewModel : ContextData
    {
        public List<Promotion> Promotions { get; set; }
        public PromotionListViewModel()
        {
            Promotions = new List<Promotion>();
            Promotions.Add(new Promotion() { Code = "ABC" });
        }
    }
}
