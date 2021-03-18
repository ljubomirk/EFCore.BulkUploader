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
        public PromotionFilter Filter;
        public UpdatePromotionObj UpdatePromotionObj { get; set; }

        public PromotionListViewModel()
        {
            Promotions = new List<Promotion>();
        }
        public PromotionListViewModel(string username, string group) : base(username, group)
        {
            Promotions = new List<Promotion>();
            PromotionList = new PromotionList();
            PromotionList.Promotions = new List<Promotion>();
        }
        public void Add(Promotion promo)
        {
            Promotions.Add(promo);
        }
        public void AddRange(IList<Promotion> promos)
        {
            Promotions.AddRange(promos);
        }
        public PromotionList PromotionList { get; set; }
    }
}
