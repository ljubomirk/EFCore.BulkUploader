using CouponDatabase.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebApp.ViewModels
{
    public class ContextData
    {
        public string AgentUsername { get; private set; }
        public string AgentGroup { get; private set; }
        public ContextData()
        {
            AgentUsername = "";
            AgentGroup = "";
        }
        public ContextData(string username, string group)
        {
            AgentUsername = username;
            AgentGroup = (group!=null)? group: "";
        }
    }
}
