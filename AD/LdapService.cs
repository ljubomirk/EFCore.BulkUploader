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
            string username = Environment.GetEnvironmentVariable("USERNAME") ?? Environment.GetEnvironmentVariable("USER");
            _logger.LogInformation("LdapAuthorization for {0}.", username);
            context.Request.Headers.TryGetValue("Authorization", out var authorization);
            _logger.LogInformation("LdapService for authorization:{0}!", string.Join("",authorization.ToArray()));
            _logger.LogInformation("LdapService for username:{0}!", username);
            LdapAuthorization ad = new LdapAuthorization("coupont", "Rok Seliskar 20", "wdc2t.simobil.tst:389", "DC=simobil,DC=test", _logger);
            ad.Connect();
            if (ad.SearchUsers(username).Count == 0) { 
                context.Request.Headers.Add("ApplicationGroup", new Microsoft.Extensions.Primitives.StringValues("None"));
                await _next.Invoke(context);
            }
            else
            {
                if (ad.SearchUsersInGroup("Coupon Manager").Count == 1)
                    context.Request.Headers.Add("ApplicationGroup", new Microsoft.Extensions.Primitives.StringValues("Manager"));
                if (ad.SearchUsersInGroup("Coupon Administrator").Count == 1)
                    context.Request.Headers.Add("ApplicationGroup", new Microsoft.Extensions.Primitives.StringValues("Administrator"));
                await _next.Invoke(context);
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
