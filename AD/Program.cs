using Microsoft.IdentityModel.Clients.ActiveDirectory;
using System;
using System.DirectoryServices.Protocols;
using System.Net;

namespace AD
{
    class Program
    {
        public static bool ValidateUserByBind(string username, string password, string ldap)
        {
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

            conn.Dispose();

            return result;
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

            var usr = args.GetValue(0).ToString();
            var pwd = args.GetValue(1).ToString();
            var ldap = args.Length>2 ? args.GetValue(2).ToString() : "wdc2t.simobil.tst";
            Console.Out.WriteLine("Testing for {0}.", usr);
            /* Validate credentials */
            if (!ValidateUserByBind(usr, pwd, ldap))
            {
                Console.Error.WriteLine("Can not connect for {0}.", usr);
                ret = 1;
            }
            /* return status */
            Console.Out.WriteLine("User {0} ready.", usr);
            return ret;
        }

    }
}
