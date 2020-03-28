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
        public Filters Filter;
        public PromotionListViewModel()
        {
            Promotions = new List<Promotion>();
        }
        public void Add(Promotion promo)
        {
            Promotions.Add(promo);
        }
        public void AddRange(IList<Promotion> promos)
        {
            Promotions.AddRange(promos);
        }
    }
}
