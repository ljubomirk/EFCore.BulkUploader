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
    public class DomainService
    {
        RequestDelegate _next;
        ILogger _logger;
        IConfiguration _options;

        public DomainService(RequestDelegate next, ILogger<DomainService> logger, IConfiguration options)
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
            context.Request.Headers.TryGetValue("Authorization", out var authorization);
            _logger.LogInformation("LdapService for authorization:{0}!", string.Join("",authorization.ToArray()));
            _logger.LogInformation("LdapService for username:{0}!", username);
            if (context.User == null)
            {
                _logger.LogInformation("LdapService None:{0}!", username);
                context.Request.Headers.Add(Constants.ApplicationGroup, new Microsoft.Extensions.Primitives.StringValues("None"));
            }
            else
            {
                if (context.User.IsInRole(Constants.CouponAdmins))
                {
                    _logger.LogInformation("LdapService Administrator:{0}!", username);
                    context.Request.Headers.Add(Constants.ApplicationGroup, new Microsoft.Extensions.Primitives.StringValues(Constants.AccessGrantLevel2));
                }
                else if (context.User.IsInRole(Constants.CouponUsers))
                {
                    _logger.LogInformation("LdapService Manager:{0}!", username);
                    context.Request.Headers.Add(Constants.ApplicationGroup, new Microsoft.Extensions.Primitives.StringValues(Constants.AccessGrantLevel1));
                }
                else
                {
                    context.Request.Headers.Add(Constants.ApplicationGroup, new Microsoft.Extensions.Primitives.StringValues(Constants.AccessGrantLevel0));
                }
            }
            await _next.Invoke(context);
            _logger.LogInformation(message: "LdapAuth done {DateTime}. ", DateTime.Now.ToLocalTime().ToString());
        }
    }

    public static class LocalMachineService
    {
        public static IApplicationBuilder UseLocalMachineService(this IApplicationBuilder builder)
        {
            return builder.UseMiddleware<DomainService>();
        }
    }
}
