using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebApp.Services
{
    public class Utils
    {
        public static string GetLogFormat()
        {
            return DateTime.Now.ToString("dd.MM.yyyy hh:mm:ss") + " --> ";
        }
    }
}
