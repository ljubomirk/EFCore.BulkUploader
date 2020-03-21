using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using CouponDatabase.API;
using CouponDatabase.Services;
using CouponDatabase.Lifecycle;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace WebApp.Controllers
{
    [Route("api/Coupon")]
    public class CouponAPIController : Controller, ICouponAPI
    {

        // GET api/Coupon/x
        [HttpGet("{PromotionCode}")]
        public ICollection<Coupon> Get(string PromotionCode, [FromBody]string CouponCode)
        {
            throw new NotImplementedException();
        }

        // PUT api/Coupon/x
        [HttpPut("{PromotionCode}")]
        public Command Assign(string PromotionCode, [FromBody]string CouponCode, string Holder, string User)
        {
            throw new NotImplementedException();
        }

        // PUT api/Coupon/5
        [HttpPut("{PromotionCode}")]
        public ICollection<Coupon> Validate(string PromotionCode, [FromBody]string CouponCode)
        {
            throw new NotImplementedException();
        }

        // PUT api/<controller>/5
        [HttpPut("{id}")]
        public Command Redeem()
        {
            throw new NotImplementedException();
        }

        // PUT api/<controller>/5
        [HttpPut("{id}")]
        public Command UndoRedeem()
        {
            throw new NotImplementedException();
        }

        public Command Cancel()
        {
            throw new NotImplementedException();
        }
    }
}
