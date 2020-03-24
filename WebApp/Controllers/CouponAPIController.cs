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
    [Route("api/Coupon")]
    public class CouponAPIController : Controller, ICouponAPI
    {

        private readonly RepositoryServices _repo;
        private readonly CouponAPI _service;

        public CouponAPIController(ApplicationDbContext context)
        {
            _repo = new RepositoryServices(context);
            _service = new CouponAPI(_repo);
        }

        // GET api/Coupon/x
        [HttpGet("{PromotionCode}")]
        public Coupon Get(string PromotionCode, [FromBody]string CouponCode)
        {
            return _service.Get(PromotionCode, CouponCode);
        }

        // PUT api/Coupon/x
        [HttpPut("{PromotionCode}")]
        public Command Assign(string PromotionCode, [FromBody]string CouponCode, string Holder, string User)
        {
            return _service.Assign(PromotionCode, CouponCode, Holder, User);
        }

        // PUT api/Coupon/5
        [HttpPut("{PromotionCode}")]
        public Command Validate(string PromotionCode, [FromBody]string CouponCode)
        {
            throw new NotImplementedException();
        }

        // PUT api/<controller>/5
        [HttpPut("{id}")]
        public Command Redeem(string PromotionCode, [FromBody]string CouponCode, string User)
        {
            throw new NotImplementedException();
        }

        // PUT api/<controller>/5
        [HttpPut("{id}")]
        public Command UndoRedeem(string PromotionCode, [FromBody]string CouponCode)
        {
            throw new NotImplementedException();
        }

        public Command Cancel(string PromotionCode, [FromBody]string CouponCode)
        {
            throw new NotImplementedException();
        }
    }
}
