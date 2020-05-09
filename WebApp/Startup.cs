using System;
using System.Collections.Generic;
using System.Linq;
using System.ServiceModel;
using System.Text;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.HttpsPolicy;
using Microsoft.AspNetCore.Mvc;
using Microsoft.CodeAnalysis.Options;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;
using SoapCore;
using SoapCore.Extensibility;
using Web.Services.Soap;
using WebApp.Data;
using TripleI.ActiveDirectory;

namespace WebApp
{
    public class Startup
    {
        private readonly ILogger _logger;
        public IConfiguration Configuration { get; }

        public Startup(IConfiguration configuration, ILogger<Startup> logger)
        {
            Configuration = configuration;
            _logger = logger;
        }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            services.Configure<CookiePolicyOptions>(options =>
            {
                // This lambda determines whether user consent for non-essential cookies is needed for a given request.
                options.CheckConsentNeeded = context => true;
                options.MinimumSameSitePolicy = SameSiteMode.None;
            });

            services.AddLogging();
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

            services.AddDistributedMemoryCache();

            services.AddSession(options =>
            {
                options.IdleTimeout = TimeSpan.FromMinutes(20);
                options.Cookie.HttpOnly = true;
                options.Cookie.IsEssential = true;
            });

            services.AddMvc().AddMvcOptions(o=> o.EnableEndpointRouting=false);

#if DEBUG
            services.AddControllersWithViews().AddRazorRuntimeCompilation();
#endif

            services.AddSoapCore();

            // Setup SOAP security
            string user = Configuration.GetValue<string>("SOAPWS:Username");
            string pwd = Configuration.GetValue<string>("SOAPWS:Password");
            _logger.LogInformation("Setup security for " + user);
            // working only for one authentication password
            // services.AddSoapWsSecurityFilter("test", "321");
            services.AddSoapWsSecurityFilter("test", "123");

            services.AddTransient<CouponService.CouponAPI>();
            services.AddTransient<CouponService.PromotionAPI>();

        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.EnvironmentName.Equals("Internal"))
            {
                app.UseDeveloperExceptionPage();
            }
            else
            {
                app.UseExceptionHandler("/Home/Error");
                // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
                app.UseHsts();
            }
            //allow http also
            //app.UseHttpsRedirection();
            app.UseStaticFiles();
            app.UseCookiePolicy();
            //app.UseHttpContextItemsMiddleware();
            app.UseSession();

            if (!env.EnvironmentName.Equals("Development"))
            {
                app.UseLdapAuthorizationService();
            }

            app.UseMvcWithDefaultRoute();

            var bindCouponAPI = new BasicHttpBinding
            {
                Security = new BasicHttpSecurity
                {
                    Mode = BasicHttpSecurityMode.Transport,
                    Transport = new HttpTransportSecurity
                    {
                        ClientCredentialType = HttpClientCredentialType.Basic,
                        ProxyCredentialType = HttpProxyCredentialType.None,
                    }
                },
                TextEncoding = new UTF8Encoding(false),
                Name = "CouponAPI"
            };
            app.UseSoapEndpoint<CouponService.CouponAPI>(
                options =>  {
                    options.Path = "/CouponAPI";
                    options.SoapSerializer = SoapSerializer.DataContractSerializer;
                    options.Binding = bindCouponAPI;
                    options.CaseInsensitivePath = false;
                });
            var bindPromotionAPI = new BasicHttpBinding
            {
                Security = new BasicHttpSecurity
                {
                    Mode = BasicHttpSecurityMode.Transport,
                    Transport = new HttpTransportSecurity
                    {
                        ClientCredentialType = HttpClientCredentialType.Basic,
                        ProxyCredentialType = HttpProxyCredentialType.None
                    }
                },
                TextEncoding = new UTF8Encoding(false),
                Name = "PromotionAPI"
            };
            app.UseSoapEndpoint<CouponService.PromotionAPI>(
                options => {
                    options.Path = "/PromotionAPI";
                    options.SoapSerializer = SoapSerializer.DataContractSerializer;
                    options.Binding = bindPromotionAPI;
                    options.CaseInsensitivePath = false;
                });
        }
    }
}
