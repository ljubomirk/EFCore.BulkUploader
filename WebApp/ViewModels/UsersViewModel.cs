using CouponDatabase.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WebApp.Migrations;

namespace WebApp.ViewModels
{
    public class UsersViewModel : ContextData
    {
        public List<User> Users { get; private set; }
        public List<CheckedItem> AccessTypes { get; set; }

        private void Init(IList<User> users)
        {
            AccessTypes = new List<CheckedItem>();
            foreach (var type in User.GetAccessTypes())
            {
                AccessTypes.Add(new CheckedItem() { Id = type.Id, Checked = true, Label = type.Name });
            }
            Users = users?.ToList<User>();
        }
        public UsersViewModel() { }
        public UsersViewModel(string username, string group,IList<User> users):base(username, group) 
        {
            Init(users);
        }
        public UsersViewModel(IList<User> users)
        {
            Init(users);
        }
    }
}
