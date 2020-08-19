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
        public void TestPromotionFilter_1()
        {
            //setup
            List<Promotion> promoList = new List<Promotion>();
            Promotion promo = new Promotion()
            {
                Name = "123",
                ValidFrom = DateTime.Now.AddMonths(-1),
                ValidTo = DateTime.Now.AddMonths(1)
            };
            promoList.Add(promo);
            DateTime? ValidFrom = new DateTime().AddMonths(2);
            DateTime? ValidTo = new DateTime().AddMonths(3);
            //test
            // if upper limit valid
            if (ValidFrom.HasValue && ValidTo.HasValue && ValidFrom < ValidTo)
            {
                Assert.IsTrue(promoList.FindAll(p => (p.ValidTo.HasValue) ? p.ValidTo > ValidFrom : true).Count > 0);
            }
        }

        [Test]
        public void TestPromotionFilter_2()
        {
            //setup
            List<Promotion> promoList = new List<Promotion>();
            Promotion promo = new Promotion()
            {
                Name = "1234",
                ValidFrom = new DateTime (2020-01-01),
                ValidTo = null
            };
            promoList.Add(promo);
            DateTime? ValidFrom = DateTime.Now.AddMonths(-2);
            DateTime? ValidTo = null;
            //test
            // if upper limit valid
            if (ValidFrom.HasValue && ValidTo.HasValue && ValidFrom < ValidTo)
            {
                Assert.IsTrue(promoList.FindAll(x => x.ValidFrom <= ValidFrom && (x.ValidTo >= ValidFrom || x.ValidTo == null)
                                                                    || (x.ValidFrom >= ValidFrom)
                                                                    || (x.ValidFrom == null && (x.ValidTo == null || x.ValidTo >= ValidFrom))).Count > 0);
            }
        }


        [Test]
        public void TestPromotionFilter_3()
        {
            //setup
            List<Promotion> promoList = new List<Promotion>();
            Promotion promo = new Promotion()
            {
                Name = "12345",
                ValidFrom = null,
                ValidTo = DateTime.Now.AddMonths(-2)
            };
            promoList.Add(promo);
            DateTime? ValidFrom = null;
            DateTime? ValidTo =new DateTime(2020 - 01 - 01) ;
            //test
            // if upper limit valid
            if (ValidFrom.HasValue && ValidTo.HasValue && ValidFrom < ValidTo)
            {
                Assert.IsTrue(promoList.FindAll(x => (x.ValidFrom <= ValidTo)
                                                                    || (x.ValidTo >= ValidTo)
                                                                    || (x.ValidFrom == null)).Count > 0);
            }
        }

        [Test]
        public void TestPromotionFilter_4()
        {
            //setup
            List<Promotion> promoList = new List<Promotion>();
            Promotion promo = new Promotion()
            {
                Name = "123456",
                ValidFrom = null,
                ValidTo = DateTime.Now.AddMonths(-2)
            };
            promoList.Add(promo);
            DateTime? ValidFrom = new DateTime(2020 - 01 - 01);
            DateTime? ValidTo = new DateTime(2020 - 10 - 01);
            //test
            // if upper limit valid
            if (ValidFrom.HasValue && ValidTo.HasValue && ValidFrom < ValidTo)
            {
                Assert.IsTrue(promoList.FindAll(x => (x.ValidFrom <= ValidFrom && (x.ValidTo >= ValidTo || x.ValidTo == null))
                                                            || (x.ValidFrom >= ValidFrom && x.ValidTo <= ValidTo)
                                                            || (x.ValidFrom >= ValidFrom && (x.ValidTo == null || x.ValidTo >= ValidTo) && x.ValidFrom <= ValidTo)
                                                            || (x.ValidFrom <= ValidFrom && x.ValidTo <= ValidTo && x.ValidTo >= ValidFrom)
                                                            || (x.ValidFrom == null && (x.ValidTo == null || x.ValidTo >= ValidFrom))).Count > 0);
            }
        }

        [Test]
        public void TestPromotionFilter_5()
        {
            //setup
            List<Promotion> promoList = new List<Promotion>();
            Promotion promo = new Promotion()
            {
                Name = "123456",
                ValidFrom = new DateTime(2020 - 10 - 01),
                ValidTo = new DateTime(2020 - 10 - 01)
        };
            promoList.Add(promo);
            DateTime? ValidFrom = new DateTime(2020 - 01 - 01);
            DateTime? ValidTo = new DateTime(2020 - 10 - 01);
            //test
            // if upper limit valid
            if (ValidFrom.HasValue && ValidTo.HasValue && ValidFrom < ValidTo)
            {
                Assert.IsTrue(promoList.FindAll(x => (x.ValidFrom <= ValidFrom && (x.ValidTo >= ValidTo || x.ValidTo == null))
                                                            || (x.ValidFrom >= ValidFrom && x.ValidTo <= ValidTo)
                                                            || (x.ValidFrom >= ValidFrom && (x.ValidTo == null || x.ValidTo >= ValidTo) && x.ValidFrom <= ValidTo)
                                                            || (x.ValidFrom <= ValidFrom && x.ValidTo <= ValidTo && x.ValidTo >= ValidFrom)
                                                            || (x.ValidFrom == null && (x.ValidTo == null || x.ValidTo >= ValidFrom))).Count > 0);
            }
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