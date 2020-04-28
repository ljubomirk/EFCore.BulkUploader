using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using CouponDatabase.API;
using CouponDatabase.Services;
using CouponDatabase.Lifecycle;
using Microsoft.AspNetCore.Mvc;
using WebApp.Services;
using WebApp.Data;
using Web.Services.Impl;
using Microsoft.Extensions.Logging;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace WebApp.Controllers
{
    [Route("api/Promotion")]
    public class PromotionAPIController : Controller, IPromotionAPI
    {

        private readonly RepositoryServices _repo;
        private readonly PromotionAPI _service;
        private ILogger _logger;

        public PromotionAPIController(ApplicationDbContext context, ILogger<PromotionAPIController> logger)
        {
            _repo = new RepositoryServices(context, logger);
            _service = new PromotionAPI(_repo);
            _logger = logger;
        }

        // GET api/Coupon/x
        [HttpGet("{Code}")]
        public IList<Promotion> Get(string Code, [FromBody] DateTime? ValidFrom, [FromBody] DateTime? ValidTo)
        {
            return _service.Get(Code, ValidFrom, ValidTo);
        }

        // PUT api/<controller>/5
        [HttpPut("{id}")]
        public Command Create(string Code, DateTime? ValidFrom, DateTime? ValidTo, bool Enabled, IList<PromotionProperty> PromotionProperties)
        {
            return _service.Create(Code, ValidFrom, ValidTo, Enabled, PromotionProperties);
        }

        public Command AddCoupon(string PromotionCode, string CouponCode, string Holder, string User, DateTime? ExpireDate, CouponStatus Status)
        {
            return _service.AddCoupon(PromotionCode, CouponCode, Holder, User, ExpireDate, Status);
        }

        public Command AddCoupons(string PromotionCode, IList<Coupon> Coupons)
        {
            return _service.AddCoupons(PromotionCode, Coupons);
        }
    }
}
