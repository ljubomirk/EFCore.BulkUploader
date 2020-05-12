using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WebApp.ViewModels;

namespace WebApp.Controllers
{
    public class BaseController : Controller
    {
        public ContextData _contextData { get; private set; }
        public override void OnActionExecuting(ActionExecutingContext ctx)
        {
            base.OnActionExecuting(ctx);
            ViewData["IsAuthenticated"] = HttpContext?.User?.Identity?.IsAuthenticated;
            ViewData["Username"] = HttpContext?.User?.Identity?.Name;
            _contextData = new ContextData(ViewData["Username"]?.ToString(), "CouponAdmin");
        }

    }
}
