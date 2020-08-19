using CouponDatabase.Models;
using CouponDatabase.Properties;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;
using WebApp.Data;
using WebApp.Services;

namespace WebApp.ViewModels
{

    public class AccessHistoryFilters
    {
        private readonly RepositoryServices _repo;

        public AccessHistoryFilters(ApplicationDbContext context)
        {
            _repo = new RepositoryServices(context);
        }
        [Display(Name = "AccessHistory_ApplicationTypes", ResourceType = typeof(Resources))]
        public List<CheckedItem> ApplicationTypes{ get; set; }
        [Display(Name = "AccessHistory_AccessGrants", ResourceType = typeof(Resources))]
        public List<CheckedItem> AccessGrants {get; set;}
        [DisplayFormat(DataFormatString = "{0:dd.MM.yyyy HH:mm}", ApplyFormatInEditMode = true)]
        [DataType(DataType.Date)]
        [Display(Name = "Date_AccessFrom", ResourceType = typeof(Resources))]
        public Nullable<DateTime> AccessFrom { get; set; }
        [DisplayFormat(DataFormatString = "{0:dd.MM.yyyy HH:mm}", ApplyFormatInEditMode = true)]
        [DataType(DataType.Date)]
        [Display(Name = "Date_AccessTo", ResourceType = typeof(Resources))]
        public Nullable<DateTime> AccessTo { get; set; }

        public AccessHistoryFilters()
        {
            ApplicationTypes = new List<CheckedItem>();
            foreach(var type in AccessLog.GetApplicationTypes())
            {
                ApplicationTypes.Add(new CheckedItem() { Id = type.Id, Checked = true, Label = type.Name });
            }
            AccessGrants = new List<CheckedItem>
            {
                new CheckedItem() { Id = 0, Checked = true, Label = "Yes" },
                new CheckedItem() { Id = 1, Checked = false, Label = "No" }
            };
            AccessFrom = DateTime.Now.Date;
            AccessTo = DateTime.Now.Date.AddHours(23.99);
        }

        public List<AccessLog> GetFilteredAccessHistory(AccessHistoryFilters accessHistoryFilter)
        {
            List<AccessLog> accessLogs = _repo.GetAccessLogs(accessHistoryFilter.AccessFrom,
                                                                accessHistoryFilter.AccessTo, 
                                                                accessHistoryFilter.AccessGrants,
                                                                accessHistoryFilter.ApplicationTypes);
            List<AccessLog> f_ListOfAccessLog = accessLogs;

            /*if (accessHistoryFilter.AccessTypes[0].Checked)
            {
                f_ListOfAccessLog.AddRange(_repo.GetAllAccessLogs().Where(x => (int)x.ApplicationType == accessHistoryFilter.ApplicationTypes[0].Id));
            }
            if (accessHistoryFilter.ApplicationTypes[1].Checked)
            {
                f_ListOfAccessLog.AddRange(_repo.GetAllAccessLogs().Where(x => (int)x.ApplicationType == accessHistoryFilter.ApplicationTypes[1].Id));
            }

            if (accessHistoryFilter.AccessGrants[0].Checked)
                f_ListOfAccessLog = f_ListOfAccessLog.Where(x => x.Granted == true).ToList<AccessLog>();
            if (accessHistoryFilter.AccessGrants[1].Checked)
                f_ListOfAccessLog = f_ListOfAccessLog.Where(x => x.Granted == true).ToList<AccessLog>();


            if (accessHistoryFilter.AccessFrom != null && accessHistoryFilter.AccessTo != null)
            {
                f_ListOfAccessLog = f_ListOfAccessLog.Where(x => x.IssuedDate >= accessHistoryFilter.AccessFrom && x.IssuedDate <= accessHistoryFilter.AccessTo).ToList<AccessLog>();
            }
            else if (accessHistoryFilter.AccessFrom != null || accessHistoryFilter.AccessTo != null)
            {
                if (accessHistoryFilter.AccessFrom != null)
                    f_ListOfAccessLog = f_ListOfAccessLog.Where(x => x.IssuedDate >= accessHistoryFilter.AccessFrom).ToList<AccessLog>();
                if (accessHistoryFilter.AccessTo != null)
                    f_ListOfAccessLog = f_ListOfAccessLog.Where(x => x.IssuedDate <= accessHistoryFilter.AccessTo).ToList<AccessLog>();
            }
            */

            return f_ListOfAccessLog;
        }
    }
}
