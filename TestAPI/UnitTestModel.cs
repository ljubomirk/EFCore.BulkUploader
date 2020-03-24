using CouponDatabase.Models;
using NUnit.Framework;
using System;

namespace TestAPI
{
    public class Tests
    {
        [SetUp]
        public void Setup()
        {
        }

        [Test]
        public void Test�sActive()
        {
            Promotion promo = new Promotion()
            {
                Code = "123",
                ValidFrom = DateTime.Now,
                ValidTo = DateTime.Now
            };
            Coupon coupon = new Coupon("ABC", "38640440448", "", CouponDatabase.Lifecycle.CouponStatus.Created, promo);

            Assert.IsTrue(!coupon.Active);
        }
    }
}