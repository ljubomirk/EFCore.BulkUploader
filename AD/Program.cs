using Microsoft.AspNetCore.Authentication;
using Microsoft.IdentityModel.Clients.ActiveDirectory;
using System;
using System.DirectoryServices.AccountManagement;
using System.DirectoryServices.Protocols;
using System.Net;
using System.Text.Json;

namespace AD
{
    class Program
    {
        static string username;
        static string password;
        static string ldap;
        static string dname;
        static string domain;

        public static bool ValidateUserByBind(string filter)
        {
            Console.Out.WriteLine("ValidateUserByBind");
            bool result = true;
            var credentials = new NetworkCredential(username, password);
            var serverId = new LdapDirectoryIdentifier(ldap);

            var conn = new LdapConnection(serverId, credentials);
            try
            {
                conn.Bind();
                conn.Timeout = TimeSpan.FromSeconds(8);
            }
            catch (Exception ex)
            {
                Console.Error.WriteLine("Exception message: {0}", ex.Message);

                result = false;
            }

            SearchGroups(conn, filter);
            conn.Dispose();

            return result;
        }

        public static void ListUserGroups()
        {
            Console.Out.WriteLine("ListUserGroups");
            try
            {
                Console.Out.WriteLine("UserPrincipal");
                UserPrincipal user = UserPrincipal.FindByIdentity(new PrincipalContext(ContextType.Domain, domain), username);
                Console.Out.WriteLine("UserPrincipal called");
                foreach (GroupPrincipal group in user.GetGroups())
                {
                    Console.Out.WriteLine("Group: " + group);
                }

            }
            catch (Exception ex)
            {
                Console.Error.WriteLine("Exception message: {0}", ex.Message);

            }
        }
        public static void SearchGroups(LdapConnection conn, string filter)
        {
            Console.Out.WriteLine("SearchGroups");
            try
            {
                Console.Out.WriteLine("PageRequest");
                PageResultRequestControl pageRequestControl = new PageResultRequestControl(100);
                Console.Out.WriteLine("PageRequest called");

                // used to retrieve the cookie to send for the subsequent request
                Console.Out.WriteLine("SearchRequest");
                SearchRequest searchRequest = new SearchRequest();
                searchRequest.DistinguishedName = dname;
                searchRequest.Filter = filter;
                searchRequest.Controls.Add(pageRequestControl);

                Console.Out.WriteLine("SearchRequest call");
                var response = (SearchResponse)conn.SendRequest(searchRequest);
                Console.Out.WriteLine("SearchRequest called");
                Console.Out.WriteLine(JsonSerializer.Serialize(response.ResultCode.ToString()));
                foreach(SearchResultEntry entries in response.Entries)
                {
                    System.Console.WriteLine("Dname: {0}", entries.DistinguishedName);
                    foreach (string name in entries.Attributes.AttributeNames) {
                        DirectoryAttribute attribute = entries.Attributes[name];
                        foreach(string value in attribute.GetValues(name.GetType()))
                            System.Console.WriteLine("{0}={1}", name, value);
                    }
                }
            }
            catch (Exception ex)
            {
                Console.Error.WriteLine("Exception message: {0} {1}", ex.Message, ex.StackTrace);
                if(ex.InnerException!=null)
                    Console.Error.WriteLine("Exception message: {0}", ex.InnerException.Message);
            }
        }

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
            dname = args.Length > 3 ? args.GetValue(3).ToString() : "CN=Users,DN=simobil,DN=test";
            domain = args.Length > 5 ? args.GetValue(4).ToString() : "simobil.tst";
            ldap = args.Length > 4 ? args.GetValue(5).ToString() : "wdc2t.simobil.tst:389";
            Console.Out.WriteLine("Testing for {0}.", username);
            /* List groups */
            ListUserGroups();
            /* Validate credentials */
            if (!ValidateUserByBind(searchFilter))
            {
                Console.Error.WriteLine("Can not connect for {0}.", username);
                ret = 1;
            }
            else
            {
                Console.Out.WriteLine("User {0} ready.", username);
            }
            /* return status */
            return ret;
        }

    }
}
