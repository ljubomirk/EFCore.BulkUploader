using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using CouponDatabase.Models;

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

        // Coupon
        public DbSet<Promotion> Promotion { get; set; }

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
            /*
            modelBuilder.Entity<Promotion>()
                .HasKey(c => new { c.Code, c.Id });
                */

            /* Test Data */
            /*
            modelBuilder.Entity<Promotion>().HasData(
                new Promotion()
                {
                    Id = 1,
                    Code = "Spring",
                    ValidFrom = DateTime.Parse("01.03.2020"),
                    ValidTo = DateTime.Parse("01.05.2020")
                },
                new Promotion()
                {
                    Id = 2,
                    Code = "Easter",
                    ValidFrom = DateTime.Parse("01.04.2020"),
                    ValidTo = DateTime.Parse("01.05.2020")
                },
                new Promotion()
                {
                    Id = 3,
                    Code = "Summer",
                    ValidFrom = DateTime.Parse("01.06.2020"),
                    ValidTo = DateTime.Parse("01.09.2020")
                }
                );
            modelBuilder.Entity<Coupon>().HasData(
                new Coupon("SP1234567890", "38640440480", "38640440480", CouponDatabase.Lifecycle.CouponStatus.Issued, Promotion.Where<Promotion>(item => item.Code == "Spring").FirstOrDefault())
                );
            */
        }

    }
}
