using CouponDatabase.Models;
using System.Collections.Generic;
using WebApp.Services;

namespace WebApp.ViewModels
{
    public class Filters
    {
        public string Code { get; set; }
        public bool ShowActive { get; set; }
        public bool ShowInactive { get; set; }
        public IList<Property> Properties { get; set; }

        public Filters()
        {
            ShowActive = true;
            ShowInactive = false;
            Properties = new List<Property>();
        }

        private IList<Promotion> getPromotionsFilteredByCode(List<Promotion> promotions, string Code, bool showInactive)
        {
            IList<Promotion> promotionsWithCode = new List<Promotion>();
            foreach (var item in promotions)
            {
                if ((item.Code.Contains(Code) && item.Enabled ) && ((item.Active && !showInactive)||(showInactive)))
                {
                    promotionsWithCode.Add(item);
                }
            }

            return promotionsWithCode;
        }

    }
}