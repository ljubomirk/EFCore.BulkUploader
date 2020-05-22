using CouponDatabase.Lifecycle;
using CouponDatabase.Models;
using CouponDatabase.Services;
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
        public void TestIsActive()
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
        public void TestCouponChange()
        {
            Promotion promo = new Promotion()
            {
                Code = "123",
                ValidFrom = DateTime.Now,
                ValidTo = DateTime.Now
            
            };
            promo.PromotionProperties = new List<PromotionProperty>
            {
                new PromotionProperty() { PropertyId = 1 }
            };
            Coupon coupon = new Coupon("ABC", "", "", CouponDatabase.Lifecycle.CouponStatus.Created, promo);
            ICoupon ci = new ICoupon(coupon);
            Command cmdAssign = ci.Assign("38640440448", "38640440448");
            Assert.IsTrue(cmdAssign.Status == CommandStatus.Valid);
            Command cmdRedeem = ci.Redeem("38640440448");
            Assert.IsTrue(cmdRedeem.Status == CommandStatus.Valid);
            Command cmdUndoRedeem = ci.UndoRedeem();
            Assert.IsTrue(cmdUndoRedeem.Status == CommandStatus.Valid);
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