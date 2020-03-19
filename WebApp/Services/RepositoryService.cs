using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Options;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WebApp.Data;
using Models;

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
            Coupon coupon = new Coupon()
            {
                Code = code
            };
            Context.Coupon.Add(coupon);
            Context.SaveChanges();
        }
    }
}
