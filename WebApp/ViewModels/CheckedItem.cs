using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebApp.ViewModels
{
    /// <summary>
    /// Used for ViewModel to support checkbox fields
    /// </summary>
    public class CheckedItem
    {
        public long Id { get; set; }
        public string Label { get; set; }
        public bool Checked { get; set; }
    }
}
