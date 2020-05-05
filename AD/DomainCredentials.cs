using System;
using System.Collections.Generic;
using System.DirectoryServices.AccountManagement;
using System.Text;

namespace TripleI.ActiveDirectory
{
    public class DomainCredentials
    {
        private string _username;
        private string _domain;

        public DomainCredentials(string username, string domain)
        {
            _username = username;
            _domain = domain;
        }
        
        public List<string> ListUserGroups()
        {
            List<string> ret = new List<string>();
            Console.Out.WriteLine("ListUserGroups");
            try
            {
                Console.Out.WriteLine("UserPrincipal");
                UserPrincipal user = UserPrincipal.FindByIdentity(new PrincipalContext(ContextType.Domain, _domain), _username);
                Console.Out.WriteLine("UserPrincipal called");
                foreach (GroupPrincipal group in user.GetGroups())
                {
                    ret.Add(group.Name);
                    Console.Out.WriteLine("Group: " + group);
                }

            }
            catch (Exception ex)
            {
                Console.Error.WriteLine("Exception message: {0}", ex.Message);
            }
            return ret;
        }

    }
}
