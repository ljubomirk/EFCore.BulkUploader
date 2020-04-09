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

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace WebApp.Controllers
{
    [Route("api/Promotion")]
    public class PromotionAPIController : Controller, IPromotionAPI
    {

        private readonly RepositoryServices _repo;
        private readonly PromotionAPI _service;

        public PromotionAPIController(ApplicationDbContext context)
        {
            _repo = new RepositoryServices(context);
            _service = new PromotionAPI(_repo);
        }

        // GET api/Coupon/x
        [HttpGet("{Code}")]
        public IList<Promotion> Get(string Code, [FromBody] DateTime? ValidFrom, [FromBody] DateTime? ValidTo)
        {
            return _service.Get(Code, ValidFrom, ValidTo);
        }

        // PUT api/<controller>/5
        [HttpPut("{id}")]
        public Command Create(string Code, string Name, DateTime? ValidFrom, DateTime? ValidTo)
        {
            return _service.Create(Code, Name, ValidFrom, ValidTo);
        }

        public Command AddCoupon(string PromotionCode, string CouponCode, string Holder, string User, DateTime? ExpireDate)
        {
            return _service.AddCoupon(PromotionCode, CouponCode, Holder, User, ExpireDate);
        }

        public Command AddCoupons(string PromotionCode, IList<Coupon> Coupons)
        {
            return _service.AddCoupons(PromotionCode, Coupons);
        }
    }
}
