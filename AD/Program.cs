using System;

namespace TripleI.ActiveDirectory
{
    class Program
    {
        static string username;
        static string password;
        static string ldap;
        static string dname;
        static string domain;

        static int Main(string[] args)
        {
            /*ClientCredential cred = new ClientCredential("abc", "def");
            var authContext = new AuthenticationContext("https://login.microsoftonline.com/common");
            var result = authContext.AcquireTokenAsync("https://graph.microsoft.com",
                 cred );*/

            /* 
             * Example usages:
             *  - Get group Coupon Managers
             *      AD.exe sizdit Ljubo.On20 "(&(objectClass=group)(sAMAccountName=Camp Managers))" "DC=simobil,DC=tst"
             *  - Get users by group
             *      AD.exe sizdit Ljubo.On20 "(&(objectClass=user)(memberOf=CN=Camp Designers,OU=Groups,DC=simobil,DC=tst))" "DC=simobil,DC=tst"
             *  - Get user data
             *      AD.exe sizdit Ljubo.On20 "(&(objectClass=user)(sAMAccountName=sizdit))" "DC=simobil,DC=tst"
             *  - Is user member of group
             *      AD.exe sizdit Ljubo.On20 "(&(objectClass=user)(sAMAccountName=lea)(memberOf=CN=Camp Designers,OU=Groups,DC=simobil,DC=tst))" "DC=simobil,DC=tst"
             */        
            int ret=0;
            if (args.Length < 2) {
                Console.Error.WriteLine("Invalid parameters: AD username password");
                ret = 2;
            }

            username = args.GetValue(0).ToString();
            password = args.GetValue(1).ToString();
            var searchFilter = args.Length > 2 ? args.GetValue(2).ToString() : "(objectClass=*)";
            dname = args.Length > 3 ? args.GetValue(3).ToString() : "DC=simobil,DC=test";
            domain = args.Length > 5 ? args.GetValue(4).ToString() : "simobil.tst";
            ldap = args.Length > 4 ? args.GetValue(5).ToString() : "wdc2t.simobil.tst:389";
            Console.Out.WriteLine("Testing for {0}.", username);
            /* List groups */
            LdapAuthorization ad = new LdapAuthorization(username, password, ldap, dname, null);
            /* Validate credentials */
            if (!ad.Connect())
            {
                Console.Error.WriteLine("Can not connect for {0}.", username);
                ret = 1;
            }
            else
            {
                Console.Out.WriteLine("User {0} ready.", username);
            }
            ad.Dispose();
            DomainCredentials dc = new DomainCredentials(username, domain);
            foreach(string groupName in dc.ListUserGroups())
                Console.Out.WriteLine("Group {0} ready.", groupName);

            /* return status */
            return ret;
        }

    }
}
