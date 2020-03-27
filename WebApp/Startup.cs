using System;
using System.Collections.Generic;
using System.Linq;
using System.ServiceModel;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.HttpsPolicy;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using SoapCore;
using Web.Services.Soap;
using WebApp.Data;

namespace WebApp
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
                    
            services.Configure<CookiePolicyOptions>(options =>
            {
                // This lambda determines whether user consent for non-essential cookies is needed for a given request.
                options.CheckConsentNeeded = context => true;
                options.MinimumSameSitePolicy = SameSiteMode.None;
            });

            //TODO: services.AddAuthentication();
            //TODO: services.AddAuthorization();
            bool dataLoggingOption = Configuration.GetValue<bool>("DbProvider:Logging");
            string DbProviderName = Configuration.GetValue<string>("DbProvider:Name");
            if (DbProviderName == "Oracle")
            {
                services.AddDbContext<ApplicationDbContext>(options =>
                    options
                    .UseOracle(Configuration.GetConnectionString("DefaultConnection"))
                    .EnableSensitiveDataLogging(dataLoggingOption)
                );
            }
            if (DbProviderName == "SQLServer")
            {
                services.AddDbContext<ApplicationDbContext>(options =>
                    options
                    .UseSqlServer(Configuration.GetConnectionString("DefaultConnection"))
                    .EnableSensitiveDataLogging(dataLoggingOption)
                );
            }

            services.AddMvc().AddMvcOptions(o=> o.EnableEndpointRouting=false);

#if DEBUG
            services.AddControllersWithViews().AddRazorRuntimeCompilation();
#endif

            services.AddSoapCore();

            // Setup SOAP security
            string user = Configuration.GetValue<string>("SOAPWS:Username");
            string pwd = Configuration.GetValue<string>("SOAPWS:Password");
            //_logger.LogInformation("Setup security for " + user);
            services.AddSoapWsSecurityFilter("test", "321");
            services.AddSoapWsSecurityFilter("test", "123");

            services.AddTransient<CouponService.CouponAPI>();
            services.AddTransient<CouponService.PromotionAPI>();

        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.EnvironmentName.Equals("Development"))
            {
                app.UseDeveloperExceptionPage();
            }
            else
            {
                app.UseExceptionHandler("/Home/Error");
                // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
                app.UseHsts();
            }
            app.UseHttpsRedirection();
            app.UseStaticFiles();
            app.UseCookiePolicy();

            app.UseMvcWithDefaultRoute();

            var binding = new BasicHttpBinding
            {
                Security = new BasicHttpSecurity
                {
                    Mode = BasicHttpSecurityMode.Transport,
                    Transport = new HttpTransportSecurity
                    {
                        ClientCredentialType = HttpClientCredentialType.Basic,
                        ProxyCredentialType = HttpProxyCredentialType.None,

                    }
                }
            };
            app.UseSoapEndpoint<CouponService.CouponAPI>("/CouponAPI", binding);
            app.UseSoapEndpoint<CouponService.PromotionAPI>("/PromotionAPI", binding);
        }
    }
}
