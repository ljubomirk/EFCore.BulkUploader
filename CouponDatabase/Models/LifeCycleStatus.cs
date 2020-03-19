using System;
using System.Collections.Generic;
using System.Text;

namespace Lifecycle
{
    public class Command
    {
        public Enumerators.CommandStatus Status { get; set; }
        public string Message { get; set; }
    }
}
