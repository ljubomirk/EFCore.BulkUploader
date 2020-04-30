using CouponDatabase.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebApp.ViewModels
{
    public class UsersViewModel : ContextData
    {
        public List<User> Users { get; }
        public List<CheckedItem> AccessTypes { get; set; }

        public UsersViewModel() { }
        public UsersViewModel(IList<User> users)
        {
            foreach (var type in User.GetAccessTypes())
            {
                AccessTypes.Add(new CheckedItem() { Id = type.Id, Checked = true, Label = type.Name });
            }
            Users = users.ToList<User>();
        }
    }
}
