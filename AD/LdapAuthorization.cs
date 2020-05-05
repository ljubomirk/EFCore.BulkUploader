using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Logging.Abstractions;
using System;
using System.Collections.Generic;
using System.DirectoryServices.AccountManagement;
using System.DirectoryServices.Protocols;
using System.IO;
using System.Net;
using System.Text;
using System.Text.Json;
using System.Text.RegularExpressions;

namespace TripleI.ActiveDirectory
{
    public class LdapAuthorization : IDisposable
    {
        private string _username;
        private string _password;
        private string _ldap;
        private LdapConnection conn;
        private string _dname;
        private ILogger _logger;

        public string Domain { get => _dname; }

        public LdapAuthorization(string username, string password, string ldap, string dname, ILogger logger)
        {
            _username = username;
            _password = password;
            _ldap = ldap;
            _dname = dname;
            _logger = logger;
        }
        public LdapAuthorization(string username, string password, string ldap, string dname, ILogger<LdapAuthorization> logger)
        {
            _username = username;
            _password = password;
            _ldap = ldap;
            _dname = dname;
            _logger = logger;
        }
        public bool Connect()
        {
            bool result = true;
            var credentials = new NetworkCredential(_username, _password);
            var serverId = new LdapDirectoryIdentifier(_ldap);

            conn = new LdapConnection(serverId, credentials);
            try
            {
                conn.Bind();
                conn.Timeout = TimeSpan.FromSeconds(8);
            }
            catch (Exception ex)
            {
                _logger.LogError("Exception message: {0}", ex.Message);

                result = false;
            }
            return result;
        }
        public IList<string> SearchGroups(string groupName)
        {
            string filter = "(&(objectClass = group)(sAMAccountName = {0}))".Replace("{0}", groupName);
            IList<string> groups = new List<string>();
            foreach (SearchResultEntry found in SearchLdap(filter))
            {
                groups.Add((string)found.Attributes["Name"].GetValues(string.Empty.GetType())[0]);
            }
            return groups;
        }

        public IList<string> SearchUsers(string userName)
        {
            string filter = "(&(objectClass=user)(sAMAccountName={0}))".Replace("{0}", userName);
            IList<string> users = new List<string>();
            SearchLdap(filter);
            return users;
        }

        public IList<string> SearchUsersInGroup(string groupName)
        {
            string filter = "(&(objectClass=user)(memberOf=CN={0}, OU = Groups, {1}))".Replace("{0}", groupName).Replace("{1}", _dname);
            IList<string> users = new List<string>();
            SearchLdap(filter);
            return users;
        }

        public IList<string> IsUserInGroup(string userName, string groupName)
        {
            string filter = "(&(objectClass=user)(sAMAccountName={0})(memberOf=CN={1}, OU = Groups, {2}))".Replace("{0}", userName).Replace("{1}", groupName).Replace("{2}", _dname);
            IList<string> users = new List<string>();
            SearchLdap(filter);
            return users;
        }
        
        private SearchResultEntryCollection SearchLdap(string filter)
        {
            SearchResultEntryCollection ret = null;
            _logger.LogDebug("SearchGroups: {0}", filter);
            try
            {
                PageResultRequestControl pageRequestControl = new PageResultRequestControl(100);

                // used to retrieve the cookie to send for the subsequent request
                _logger.LogDebug("SearchRequest {0}", _dname);
                SearchRequest searchRequest = new SearchRequest();
                searchRequest.DistinguishedName = _dname;
                searchRequest.Filter = filter;
                searchRequest.Controls.Add(pageRequestControl);

                _logger.LogDebug("SearchRequest request {0}", searchRequest);
                var response = (SearchResponse)conn.SendRequest(searchRequest);
                _logger.LogDebug("SearchRequest response: {0}", response.Entries.Count);
                _logger.LogDebug("ResultCode: {0}", JsonSerializer.Serialize(response.ResultCode.ToString()));
                _logger.LogDebug("ResultEntries: {0}", JsonSerializer.Serialize(response.Entries));
                foreach (SearchResultEntry entries in response.Entries)
                {
                    _logger.LogDebug("Dname: {0}", entries.DistinguishedName);
                    foreach (string name in entries.Attributes.AttributeNames)
                    {
                        DirectoryAttribute attribute = entries.Attributes[name];
                        foreach (string value in attribute.GetValues(name.GetType()))
                            _logger.LogDebug("{0}={1}", name, value);
                    }
                }
                ret = response.Entries;
            }
            catch (Exception ex)
            {
                _logger.LogError("Exception message: {0} {1}", ex.Message, ex.StackTrace);
                if (ex.InnerException != null)
                    _logger.LogError("Exception message: {0}", ex.InnerException.Message);
            }
            return ret;
        }

        public void Dispose()
        {
            if(conn!=null)
                conn.Dispose();
        }
    }
}
