using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Logging.Abstractions;
using System;
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
            string username = context.Request.Headers["domain"];
            _logger.LogInformation("LdapAuthorazation comenses!");
            LdapAuthorization ad = new LdapAuthorization(username, "", "", "", _logger);
            ad.Connect();
            if (ad.SearchUsers(username).Count==1)
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
