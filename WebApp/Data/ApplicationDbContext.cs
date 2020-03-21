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

            modelBuilder.Entity<Coupon>()
                        .HasIndex(b => b.Code)
                        .IsUnique();

            modelBuilder.Entity<Promotion>()
                .HasKey(c => new { c.Code, c.Id });
        }

    }
}
