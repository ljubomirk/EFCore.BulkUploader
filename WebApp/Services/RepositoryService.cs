using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Options;
using WebApp.Data;
using CouponDatabase.Models;

namespace WebApp.Services
{
    public class RepositoryServices
    {
        readonly ApplicationDbContext Context;

        public RepositoryServices(ApplicationDbContext context)
        {
            Context = context;
        }
        public void Add(string code)
        {
            Coupon coupon = new Coupon(code, null, null, CouponDatabase.Lifecycle.CouponStatus.Created, null);
            Context.Coupon.Add(coupon);
            Context.SaveChanges();
        }
    }
}
