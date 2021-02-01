using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Logging.Abstractions;
using System;
using System.Collections;
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
        public class User
        {
            public string Username { get; set; }
            public string Fullname { get; set; }
            public string Domain { get; set; }
        }

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
            
            if (credentials.UserName!="")
                conn = new LdapConnection(serverId, credentials);
            else
                conn = new LdapConnection(serverId);

            try
            {
                conn.Bind();
                conn.Timeout = TimeSpan.FromSeconds(8);
            }
            catch (Exception ex)
            {
                _logger.LogError("Exception message: {0} - {1}", ex.Message, ex.StackTrace);

                result = false;
            }
            return result;
        }

        public User SearchUser(string userName)
        {
            string filter = "(&(objectClass=user)(sAMAccountName={0}))".Replace("{0}", userName);
            User user = null;
            SearchResultEntryCollection found = SearchLdap(filter);
            if (found!=null)
            {
                user = new User()
                {
                    Username = (string)found[0].Attributes["samaccountname"].GetValues(string.Empty.GetType())[0],
                    Fullname = (string)found[0].Attributes["name"].GetValues(string.Empty.GetType())[0],
                    Domain = this.Domain
                };
            }
            return user;
        }

        public IList<User> SearchUsersInGroup(string groupName)
        {
            string filter = "(&(objectClass=user)(memberOf=CN={0}, OU = Groups, {1}))".Replace("{0}", groupName).Replace("{1}", _dname);
            IList<User> users = new List<User>();
            SearchResultEntryCollection ret = SearchLdap(filter);
            IEnumerator en = ret.GetEnumerator();
            while (en.MoveNext())
            {
                SearchResultEntry found = (SearchResultEntry)en.Current;

                User user = new User()
                {
                    Username = (string)found.Attributes["samaccountname"].GetValues(string.Empty.GetType())[0],
                    Fullname = (string)found.Attributes["name"].GetValues(string.Empty.GetType())[0],
                    Domain = this.Domain
                };
            }
            return users;
        }

        public bool IsUserInGroup(string userName, string groupName)
        {
            string filter = "(&(objectClass=user)(sAMAccountName={0})(memberOf=CN={1}, OU = Groups, {2}))".Replace("{0}", userName).Replace("{1}", groupName).Replace("{2}", _dname);
            SearchResultEntryCollection ret = SearchLdap(filter);
            return ret.Count == 1;
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
