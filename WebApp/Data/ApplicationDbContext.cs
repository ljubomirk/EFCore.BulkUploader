using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using CouponDatabase.Models;
using CouponDatabase.Lifecycle;

namespace WebApp.Data
{
    public class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
    : base(options)
        {
        }
        // Base entities
        public DbSet<Property> Property { get; set; }
        public DbSet<IssuerChannel> IssuerChannel { get; set; }
        public DbSet<AwardChannel> AwardChannel { get; set; }
        // Coupon
        public DbSet<Coupon> Coupon { get; set; }
        public DbSet<CouponHistory> CouponHistory { get; set; }
        public DbSet<CouponAwardChannel> CouponAwardChannel { get; set; }
        public DbSet<CouponIssuerChannel> CouponIssuerChannel { get; set; }

        // Promotion
        public DbSet<Promotion> Promotion { get; set; }
        public DbSet<PromotionAwardChannel> PromotionAwardChannel { get; set; }
        public DbSet<PromotionIssuerChannel> PromotionIssuerChannel { get; set; }
        public DbSet<PromotionProperty> PromotionProperty { get; set; }
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);
            /* Unique keys */
            modelBuilder.Entity<Promotion>()
                        .HasIndex(b => b.Code)
                        .IsUnique();

            modelBuilder.Entity<Coupon>()
                        .HasIndex(b => b.Code)
                        .IsUnique();
            /* Composite key */
            modelBuilder.Entity<PromotionAwardChannel>().HasKey(
                pac => new { pac.PromotionId, pac.AwardChannelId }
            );
            modelBuilder.Entity<PromotionIssuerChannel>().HasKey(
                pac => new { pac.PromotionId, pac.IssuerChannelId }
            );
            modelBuilder.Entity<PromotionProperty>().HasKey(
                pac => new { pac.PromotionId, pac.PropertyId }
            );
            modelBuilder.Entity<CouponAwardChannel>().HasKey(
                pac => new { pac.CouponId, pac.AwardChannelId }
            );
            modelBuilder.Entity<CouponIssuerChannel>().HasKey(
                pac => new { pac.CouponId, pac.IssuerChannelId }
            );

            /* Test Data */
            modelBuilder.Entity<IssuerChannel>().HasData(
                BaseDefs.ArrayFrom<IssuerChannel, IssuerChannelEnum>()
            );
            modelBuilder.Entity<AwardChannel>().HasData(
                BaseDefs.ArrayFrom<AwardChannel, AwardChannelEnum>()
            );
            modelBuilder.Entity<Property>().HasData(
                BaseDefs.ArrayFrom<Property, PropertyTypeEnum>()
            );
            //set Promotions
            modelBuilder.Entity<Promotion>().HasData(
                new Promotion()
                {
                    Id = 1,
                    Code = "Spring",
                    Enabled = true,
                    ValidFrom = DateTime.Parse("01.03.2020"),
                    ValidTo = DateTime.Parse("01.05.2020")
                },
                new Promotion()
                {
                    Id = 2,
                    Code = "Easter",
                    Enabled = false,
                    ValidFrom = DateTime.Parse("01.04.2020"),
                    ValidTo = DateTime.Parse("01.05.2020")
                },
                new Promotion()
                {
                    Id = 3,
                    Code = "Summer",
                    Enabled = true,
                    ValidFrom = DateTime.Parse("01.06.2020"),
                    ValidTo = DateTime.Parse("01.09.2020")
                },
                new Promotion()
                {
                    Id = 4,
                    Code = "Spring2",
                    Enabled = true,
                    ValidFrom = DateTime.Parse("01.03.2020"),
                    ValidTo = DateTime.Parse("01.05.2020")
                },
                new Promotion()
                {
                    Id = 5,
                    Code = "Easter2",
                    Enabled = false,
                    ValidFrom = DateTime.Parse("01.04.2020"),
                    ValidTo = DateTime.Parse("01.05.2020")
                },
                new Promotion()
                {
                    Id = 6,
                    Code = "Summer2",
                    Enabled = true,
                    ValidFrom = DateTime.Parse("01.06.2020"),
                    ValidTo = DateTime.Parse("01.09.2020")
                },
                new Promotion()
                {
                    Id = 7,
                    Code = "Spring3",
                    Enabled = true,
                    ValidFrom = DateTime.Parse("01.03.2020"),
                    ValidTo = DateTime.Parse("01.05.2020")
                },
                new Promotion()
                {
                    Id = 8,
                    Code = "Easter3",
                    Enabled = false,
                    ValidFrom = DateTime.Parse("01.04.2020"),
                    ValidTo = DateTime.Parse("01.05.2020")
                },
                new Promotion()
                {
                    Id = 9,
                    Code = "Summer3",
                    Enabled = true,
                    ValidFrom = DateTime.Parse("01.06.2020"),
                    ValidTo = DateTime.Parse("01.09.2020")
                },
                new Promotion()
                {
                    Id = 10,
                    Code = "Spring4",
                    Enabled = true,
                    ValidFrom = DateTime.Parse("01.03.2020"),
                    ValidTo = DateTime.Parse("01.05.2020")
                },
                new Promotion()
                {
                    Id = 11,
                    Code = "Easter4",
                    Enabled = false,
                    ValidFrom = DateTime.Parse("01.04.2020"),
                    ValidTo = DateTime.Parse("01.05.2020")
                },
                new Promotion()
                {
                    Id = 12,
                    Code = "Summer4",
                    Enabled = true,
                    ValidFrom = DateTime.Parse("01.06.2020"),
                    ValidTo = DateTime.Parse("01.09.2020")
                },
                new Promotion()
                {
                    Id = 13,
                    Code = "Spring5",
                    Enabled = true,
                    ValidFrom = DateTime.Parse("01.03.2020"),
                    ValidTo = DateTime.Parse("01.05.2020")
                },
                new Promotion()
                {
                    Id = 14,
                    Code = "Easter5",
                    Enabled = false,
                    ValidFrom = DateTime.Parse("01.04.2020"),
                    ValidTo = DateTime.Parse("01.05.2020")
                },
                new Promotion()
                {
                    Id = 15,
                    Code = "Summer5",
                    Enabled = true,
                    ValidFrom = DateTime.Parse("01.06.2020"),
                    ValidTo = DateTime.Parse("01.09.2020")
                },
                new Promotion()
                {
                    Id = 16,
                    Code = "Spring6",
                    Enabled = true,
                    ValidFrom = DateTime.Parse("01.03.2020"),
                    ValidTo = DateTime.Parse("01.05.2020")
                },
                new Promotion()
                {
                    Id = 17,
                    Code = "Easter6",
                    Enabled = false,
                    ValidFrom = DateTime.Parse("01.04.2020"),
                    ValidTo = DateTime.Parse("01.05.2020")
                },
                new Promotion()
                {
                    Id = 18,
                    Code = "Summer6",
                    Enabled = true,
                    ValidFrom = DateTime.Parse("01.06.2020"),
                    ValidTo = DateTime.Parse("01.09.2020")
                },
                new Promotion()
                {
                    Id = 19,
                    Code = "Spring7",
                    Enabled = true,
                    ValidFrom = DateTime.Parse("01.03.2020"),
                    ValidTo = DateTime.Parse("01.05.2020")
                },
                new Promotion()
                {
                    Id = 20,
                    Code = "Easter7",
                    Enabled = false,
                    ValidFrom = DateTime.Parse("01.04.2020"),
                    ValidTo = DateTime.Parse("01.05.2020")
                },
                new Promotion()
                {
                    Id = 21,
                    Code = "Summer7",
                    Enabled = true,
                    ValidFrom = DateTime.Parse("01.06.2020"),
                    ValidTo = DateTime.Parse("01.09.2020")
                },
                new Promotion()
                {
                    Id = 22,
                    Code = "Spring8",
                    Enabled = true,
                    ValidFrom = DateTime.Parse("01.03.2020"),
                    ValidTo = DateTime.Parse("01.05.2020")
                },
                new Promotion()
                {
                    Id = 23,
                    Code = "Easter8",
                    Enabled = false,
                    ValidFrom = DateTime.Parse("01.04.2020"),
                    ValidTo = DateTime.Parse("01.05.2020")
                },
                new Promotion()
                {
                    Id = 24,
                    Code = "Summer8",
                    Enabled = true,
                    ValidFrom = DateTime.Parse("01.06.2020"),
                    ValidTo = DateTime.Parse("01.09.2020")
                }
            );
            modelBuilder.Entity<PromotionProperty>().HasData(
                           new PromotionProperty() { PromotionId = 1, PropertyId = 2},
                           new PromotionProperty() { PromotionId = 1, PropertyId = 4 },
                           new PromotionProperty() { PromotionId = 2, PropertyId = 6 },
                           new PromotionProperty() { PromotionId = 2, PropertyId = 1 },
                           new PromotionProperty() { PromotionId = 7, PropertyId = 2 },
                           new PromotionProperty() { PromotionId = 5, PropertyId = 4 },
                           new PromotionProperty() { PromotionId = 3, PropertyId = 6 },
                           new PromotionProperty() { PromotionId = 11, PropertyId = 1 }
                        );
            modelBuilder.Entity<PromotionIssuerChannel>().HasData(
                           new PromotionIssuerChannel() { PromotionId = 1, IssuerChannelId = 1 },
                           new PromotionIssuerChannel() { PromotionId = 1, IssuerChannelId = 2 },
                           new PromotionIssuerChannel() { PromotionId = 1, IssuerChannelId = 5 },
                           new PromotionIssuerChannel() { PromotionId = 2, IssuerChannelId = 1 },
                           new PromotionIssuerChannel() { PromotionId = 2, IssuerChannelId = 4 },
                           new PromotionIssuerChannel() { PromotionId = 2, IssuerChannelId = 5 },
                           new PromotionIssuerChannel() { PromotionId = 11, IssuerChannelId = 2 },
                           new PromotionIssuerChannel() { PromotionId = 3, IssuerChannelId = 1 },
                           new PromotionIssuerChannel() { PromotionId = 3, IssuerChannelId = 4 },
                           new PromotionIssuerChannel() { PromotionId = 3, IssuerChannelId = 5 }
                        );
            modelBuilder.Entity<PromotionAwardChannel>().HasData(
                           new PromotionAwardChannel() {  PromotionId = 1, AwardChannelId = 1 },
                           new PromotionAwardChannel() { PromotionId = 1, AwardChannelId = 3 },
                           new PromotionAwardChannel() { PromotionId = 1, AwardChannelId = 5 },
                           new PromotionAwardChannel() { PromotionId = 2, AwardChannelId = 3 },
                           new PromotionAwardChannel() { PromotionId = 2, AwardChannelId = 4 },
                           new PromotionAwardChannel() { PromotionId = 2, AwardChannelId = 5 },
                           new PromotionAwardChannel() { PromotionId = 11, AwardChannelId = 1 },
                           new PromotionAwardChannel() { PromotionId = 3, AwardChannelId = 1 },
                           new PromotionAwardChannel() { PromotionId = 3, AwardChannelId = 4 },
                           new PromotionAwardChannel() { PromotionId = 3, AwardChannelId = 3 }
                        );
            modelBuilder.Entity<Coupon>().HasData(
                new Coupon()
                {
                    Id = 2,
                    Code = "EASTER1234567892",
                    Holder = "38640440481",
                    User = "38640440481",
                    Status = (int)CouponStatus.Canceled,
                    PromotionId = 1
                },
                new Coupon()
                {
                    Id = 3,
                    Code = "EASTER1234567893",
                    Holder = "38640440482",
                    User = "38640440482",
                    Status = (int)CouponStatus.Issued,
                    PromotionId = 1
                },
                new Coupon()
                {
                    Id = 4,
                    Code = "EASTER1234567894",
                    Holder = "38640440483",
                    User = "38640440483",
                    Status = (int)CouponStatus.Redeemed,
                    PromotionId = 1
                },
                new Coupon()
                {
                    Id = 1,
                    Code = "EASTER1234567891",
                    Holder = "",
                    User = "",
                    Status = (int)CouponStatus.Created,
                    PromotionId = 1
                }
            );

        }

    }
}
