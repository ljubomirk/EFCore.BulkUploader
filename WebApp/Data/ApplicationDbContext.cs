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

        // Coupon
        public DbSet<Coupon> Coupon { get; set; }
        public DbSet<CouponHistory> CouponHistory { get; set; }

        // Promotion
        public DbSet<Promotion> Promotion { get; set; }
        public DbSet<Property> Properties { get; set; }
        public DbSet<IssuerChannel> IssuerChannels { get; set; }
        public DbSet<AwardChannel> AwardChannels { get; set; }
        public DbSet<PromotionAwardChannel> PromotionAwardChannel { get; set; }
        public DbSet<PromotionIssuerChannel> PromotionIssuerChannel { get; set; }
        public DbSet<PromotionProperty> PromotionProperties { get; set; }
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

            /* Test Data */
            modelBuilder.Entity<IssuerChannel>().HasData(
                BaseDefs.ArrayFrom<IssuerChannel, IssuerChannelEnum>()
            );
            modelBuilder.Entity<AwardChannel>().HasData(
                CouponDatabase.Models.AwardChannel.ArrayFrom<AwardChannel, AwardChannelEnum>()
            );
            modelBuilder.Entity<Property>().HasData(
                Property.ArrayFrom<Property,PropertyTypeEnum>()
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
                }
            );
            modelBuilder.Entity<PromotionProperty>().HasData(
                           new PromotionProperty() { PromotionId = 1, PropertyId = 2}
                        );
            modelBuilder.Entity<Coupon>().HasData(
                new Coupon()
                {
                    Id = 1,
                    Code = "SP1234567890",
                    Holder = "38640440480",
                    User = "38640440480",
                    Status = (int)CouponStatus.Issued,
                    PromotionId = 1
                }
            );

        }

    }
}
