using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Logging.Abstractions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;


namespace TripleI.ActiveDirectory
{
    public class LdapService
    {
        RequestDelegate _next;
        ILogger _logger;
        IConfiguration _options;

        public LdapService(RequestDelegate next, ILogger<LdapService> logger, IConfiguration options)
        {
            _logger = logger;
            _next = next;
            _options = options;
        }

        public async Task Invoke(HttpContext context)
        {
            string fullUsername = context.User.Identity.Name ?? Environment.GetEnvironmentVariable("USER");
            string username = fullUsername;
            if (fullUsername?.Split('\\').Length>1)
                username = fullUsername.Split('\\')[1];
            _logger.LogInformation("LdapAuthorization for {0}.", username);
            context.Request.Headers.TryGetValue("Authorization", out var authorization);
            _logger.LogInformation("LdapService for authorization:{0}!", string.Join("",authorization.ToArray()));
            _logger.LogInformation("LdapService for username:{0}!", username);
            //"coupont", "Rok Seliskar 20", "wdc2t.simobil.tst:389", "DC=simobil,DC=tst", _logger))
            string usr = _options["LdapService:User"];
            string pwd = _options["LdapService:Password"];
            string host = _options["LdapService:Host"];
            string domain = _options["LdapService:Domain"];
            /* If Identity is still not set check with LDAP */
            if (!context.Request.Headers.ContainsKey(Constants.ApplicationGroup))
            {

                
                using (LdapAuthorization ad = new LdapAuthorization(usr, pwd, host, domain, _logger))
                {

                    try { ad.Connect(); }
                    catch (Exception ex)
                    {
                        _logger.LogInformation("LdapService Connect error: {0}!", ex.Message);
                    }
                    if (ad.SearchUser(username) == null)
                    {
                        _logger.LogInformation("LdapService None:{0}!", username);
                        context.Request.Headers.Add(Constants.ApplicationGroup, new Microsoft.Extensions.Primitives.StringValues("None"));
                    }
                    else
                    {
                        if (ad.IsUserInGroup(username, Constants.CouponAdmins))
                        {
                            _logger.LogInformation("LdapService Administrator:{0}!", username);
                            context.Request.Headers.Add(Constants.ApplicationGroup, new Microsoft.Extensions.Primitives.StringValues(Constants.AccessGrantLevel2));
                        }
                        else if (ad.IsUserInGroup(username, Constants.CouponUsers))
                        {
                            _logger.LogInformation("LdapService Manager:{0}!", username);
                            context.Request.Headers.Add(Constants.ApplicationGroup, new Microsoft.Extensions.Primitives.StringValues(Constants.AccessGrantLevel1));
                        }
                        else
                        {
                            context.Request.Headers.Add(Constants.ApplicationGroup, new Microsoft.Extensions.Primitives.StringValues(Constants.AccessGrantLevel0));
                        }
                    }
                }
            }
            await _next.Invoke(context);
            _logger.LogInformation(message: "LdapAuth done {DateTime}. ", DateTime.Now.ToLocalTime().ToString());
        }
    }

    public static class LdapAuthorizationService
    {
        public static IApplicationBuilder UseLdapAuthorizationService(this IApplicationBuilder builder)
        {
            return builder.UseMiddleware<LdapService>();
        }
    }
}
