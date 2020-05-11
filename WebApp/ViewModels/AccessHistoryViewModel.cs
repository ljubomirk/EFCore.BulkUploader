using CouponDatabase.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebApp.ViewModels
{
    public class AccessHistoryViewModel : ContextData
    {
        public AccessHistoryFilters Filters { get; set; }
        public List<AccessLog> AccessLogs { get; private set; }
        public AccessHistoryViewModel() : base() { }
        public AccessHistoryViewModel(string username, string group) : base(username, group) { }
        public void AddLogs(List<AccessLog> logs) {
            AccessLogs = logs;
        }
    }
}
