using Microsoft.IdentityModel.Clients.ActiveDirectory;
using System;
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
            }
            catch (Exception ex)
            {
                Console.Error.WriteLine("Exception message: {0}", ex.Message);

                result = false;
            }

            ListUserGroups(conn, filter);
            conn.Dispose();

            return result;
        }

        public static void ListUserGroups(LdapConnection conn, string filter)
        {
            Console.Out.WriteLine("ListUserGroups");
            try
            {
                PageResultRequestControl pageRequestControl = new PageResultRequestControl(100);

                // used to retrieve the cookie to send for the subsequent request
                PageResultResponseControl pageResponseControl;
                SearchRequest searchRequest = new SearchRequest(username, filter, new SearchScope(), null);
                searchRequest.Controls.Add(pageRequestControl);

                while (true)
                {
                    var response = (SearchResponse)conn.SendRequest(searchRequest);
                    Console.Out.WriteLine(JsonSerializer.Serialize(response.ResultCode.ToString()));
                    pageResponseControl = (PageResultResponseControl)response.Controls[0];
                    if (pageResponseControl.Cookie.Length == 0)
                        break;
                    pageRequestControl.Cookie = pageResponseControl.Cookie;
                }
            }
            catch (Exception ex)
            {
                Console.Error.WriteLine("Exception message: {0}", ex.Message);

            }
        }

        static int Main(string[] args)
        {
            /*ClientCredential cred = new ClientCredential("abc", "def");
            var authContext = new AuthenticationContext("https://login.microsoftonline.com/common");
            var result = authContext.AcquireTokenAsync("https://graph.microsoft.com",
                 cred );*/
            int ret=0;
            if (args.Length < 2) {
                Console.Error.WriteLine("Invalid parameters: AD username password");
                ret = 2;
            }

            username = args.GetValue(0).ToString();
            password = args.GetValue(1).ToString();
            var searchFilter = args.Length > 2 ? args.GetValue(2).ToString() : "(objectCategory=person)(objectClass=user)";
            ldap = args.Length > 3 ? args.GetValue(3).ToString() : "wdc2t.simobil.tst";
            Console.Out.WriteLine("Testing for {0}.", username);
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
