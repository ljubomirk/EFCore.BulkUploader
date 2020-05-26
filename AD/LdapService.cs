using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Logging.Abstractions;
using System;
using System.Linq;
using System.Threading.Tasks;


namespace TripleI.ActiveDirectory
{
    public class LdapService
    {
        RequestDelegate _next;
        ILogger _logger;
        public LdapService(RequestDelegate next, ILogger<LdapService> logger)
        {
            _logger = logger;
            _next = next;
        }

        public async Task Invoke(HttpContext context)
        {
            string fullUsername = context.User.Identity.Name ?? Environment.GetEnvironmentVariable("USER");
            string username = fullUsername;
            if (fullUsername.Split('\\').Length>1)
                username = fullUsername.Split('\\')[1];
            _logger.LogInformation("LdapAuthorization for {0}.", username);
            context.Request.Headers.TryGetValue("Authorization", out var authorization);
            _logger.LogInformation("LdapService for authorization:{0}!", string.Join("",authorization.ToArray()));
            _logger.LogInformation("LdapService for username:{0}!", username);
            if (context.Request.Headers.ContainsKey("ApplicationUser")) {
                context.Request.Headers.Remove("ApplicationUser");
                context.Request.Headers.Add("ApplicationUser", new Microsoft.Extensions.Primitives.StringValues(username));
            }
            else
            { 
                if (context.Request.Headers.ContainsKey("ApplicationGroup"))
                    context.Request.Headers.Remove("ApplicationGroup");
                LdapAuthorization ad = new LdapAuthorization("coupont", "Rok Seliskar 20", "wdc2t.simobil.tst:389", "DC=simobil,DC=tst", _logger);
                ad.Connect();
                if (ad.SearchUsers(username).Count == 0) {
                    _logger.LogInformation("LdapService None:{0}!", username);
                    context.Request.Headers.Add("ApplicationGroup", new Microsoft.Extensions.Primitives.StringValues("None"));
                    await _next.Invoke(context);
                }
                else
                {
                    if (ad.IsUserInGroup(username, "Coupon Users").Count == 1) {
                        _logger.LogInformation("LdapService Manager:{0}!", username);
                        context.Request.Headers.Add("ApplicationGroup", new Microsoft.Extensions.Primitives.StringValues("Manager"));
                    }
                    if (ad.IsUserInGroup(username, "Coupon Admins").Count == 1) {
                        _logger.LogInformation("LdapService Administrator:{0}!", username);
                        context.Request.Headers.Add("ApplicationGroup", new Microsoft.Extensions.Primitives.StringValues("Administrator"));
                    }
                    await _next.Invoke(context);
                }
            }
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
