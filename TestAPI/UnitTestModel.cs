using CouponDatabase.Lifecycle;
using CouponDatabase.Models;
using NUnit.Framework;
using System;
using System.Collections.Generic;

namespace TestAPI
{
    public class Tests
    {
        [SetUp]
        public void Setup()
        {
        }

        [Test]
        public void TestÍsActive()
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

        [Test]
        public void TestChannels()
        {
            List<IssuerChannel> channels = BaseDefs.ArrayFrom<IssuerChannel, IssuerChannelEnum>();
            foreach(IssuerChannel channel in channels)
            {
                System.Console.WriteLine("Channel {0} ({1})", channel.Name, channel.Id);
            }
            Assert.AreEqual(channels.Count, 5);
        }
    }
}