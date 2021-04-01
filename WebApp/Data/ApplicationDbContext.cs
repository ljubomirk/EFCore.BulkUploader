using Microsoft.EntityFrameworkCore;
using System;
using CouponDatabase.Models;
using CouponSystem = CouponDatabase.Models.System;
using CouponDatabase.Lifecycle;
using System.Data.Common;
using System.Data;
using Microsoft.EntityFrameworkCore.Storage;
using EFCore.OracleBulkUploader;
using EFCore.SqlServerBulkUploader;
using System.Collections.Generic;

namespace WebApp.Data
{
    public class ApplicationDbContext : DbContext
    {
        #region Static properties
        static DbContextOptions<ApplicationDbContext> Options;
        static string DbProviderName;
        #endregion
        #region Constructor
        public ApplicationDbContext() : base(ApplicationDbContext.Options)
        {
            SetupOracleConnection();
        }
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options): base(options)
        {
            //Parameters of DbConnection
            DbProviderName = Database.ProviderName;
            ApplicationDbContext.Options = options;
            SetupOracleConnection();
        }

        private void SetupOracleConnection()
        {
            //Special setup for Oracle 
            if (DbProviderName == "Oracle.EntityFrameworkCore")
            {
                //Command to setup current schema
                String sessionCurrentSchema = "ALTER SESSION SET CURRENT_SCHEMA = APL_KUPON_MGMT";
                Database.ExecuteSqlCommand(sessionCurrentSchema);
                Database.GetDbConnection().StateChange += (sender, e) =>
                {
                    if (e.OriginalState != ConnectionState.Open && e.CurrentState == ConnectionState.Open)
                    {
                        var senderConnection = (DbConnection)sender;

                        using (var command = senderConnection.CreateCommand())
                        {
                            command.Connection = senderConnection;
                            command.CommandText = sessionCurrentSchema;
                            command.ExecuteNonQuery();
                        }

                    }

                };
            }
        }

        /// <summary>
        /// Context with new connection connection
        /// </summary>
        /// <returns>ApplicationDbContext</returns>
        public static ApplicationDbContext Factory()
        {
            return new ApplicationDbContext(Options);
        }
        /// <summary>
        /// Context uses same connection as main Context and can be used with transaction options
        /// </summary>
        /// <param name="transaction">Transaction from Context.Database.BeginTransaction()</param>
        /// <returns>ApplicationDbContext</returns>
        public static ApplicationDbContext Factory(IDbContextTransaction transaction)
        {
          
            var builder = new DbContextOptionsBuilder<ApplicationDbContext>();
            if (DbProviderName == "Oracle.EntityFrameworkCore")
                builder.UseOracle(transaction.GetDbTransaction().Connection);
            else
                builder.UseSqlServer(transaction.GetDbTransaction().Connection);

            ApplicationDbContext context = new ApplicationDbContext(builder.Options);
            DbTransaction current = transaction.GetDbTransaction();
            context.Database.UseTransaction(current);
            return context;
        }
        #endregion
        #region Bulk operations
        public int InsertBulk<T>(List<T> entities) where T : class {
            if (DbProviderName == "Oracle.EntityFrameworkCore")
            {
                //BulkUploader setup
                EFCore.BulkUploader.IdentityUse = true;
                EFCore.BulkUploader.IdentityColumnName = "ID";
                OracleBulkUploader.Insert(this, entities);
            }
            else
            {
                SqlServerBulkUploader.Insert(this, entities);
            }
            return 0;
        }
        #endregion
        #region Entities
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

        //Administration
        public DbSet<User> ApplUser { get; set; }
        public DbSet<AccessLog> AccessLog { get; set; }
        public DbSet<CouponSystem> Coupon_System { get; set; }
        public DbSet<NotifyList> NotifyList { get; set; }
        #endregion
        #region ModelCreation
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);
            #region SnakeCase table and column names
            /** 
             * fix table and column name to be upper case for Oracle
             */
            /*if (Database.ProviderName == "Oracle.EntityFrameworkCore")
            { */
                foreach (var entity in modelBuilder.Model.GetEntityTypes())
                {
                    // Replace table names
                    entity.Relational().TableName = entity.Relational().TableName.ToSnakeCase();

                    // Replace column names            
                    foreach (var property in entity.GetProperties())
                    {
                        property.Relational().ColumnName = property.Relational().ColumnName.ToSnakeCase();
                    }

                    foreach (var key in entity.GetKeys())
                    {
                        key.Relational().Name = key.Relational().Name.ToSnakeCase();
                    }

                    foreach (var key in entity.GetForeignKeys())
                    {
                        key.Relational().Name = key.Relational().Name.ToSnakeCase();
                    }

                    foreach (var index in entity.GetIndexes())
                    {
                        index.Relational().Name = index.Relational().Name.ToSnakeCase();
                    }
                }
            /*}*/
            #endregion
            #region Keys
            /* Unique keys */
            modelBuilder.Entity<Promotion>()
                        .HasIndex(b => b.Code)
                        .IsUnique();

            modelBuilder.Entity<Coupon>()
                        .HasIndex(b => b.Code)
                        .IsUnique();
            modelBuilder.Entity<CouponSystem>()
                        .HasIndex(b => b.Name)
                        .IsUnique();
            /* Primary key */
            modelBuilder.Entity<User>().HasKey(
                u => new { u.Username }
            );
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
            modelBuilder.Entity<NotifyList>().HasKey(
                pac => new { pac.SystemId, pac.ChannelId }
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
            #endregion
            #region Promotion seed
            //set Promotions
            /* comment test data
            modelBuilder.Entity<Promotion>().HasData(
                new Promotion()
                {
                    Id = 1,
                    Code = "Spring",
                    Enabled = true,
                    ValidFrom = new DateTime(2020, 3, 20),
                    ValidTo = new DateTime(2020, 5, 20)
                },
                new Promotion()
                {
                    Id = 2,
                    Code = "Easter",
                    Enabled = true,
                    ValidFrom = new DateTime(2020, 4, 1),
                    ValidTo = new DateTime(2020, 6, 1)
                },
                new Promotion()
                {
                    Id = 3,
                    Code = "Summer",
                    Enabled = true,
                    ValidFrom = new DateTime(2020, 5, 1),
                    ValidTo = new DateTime(2020, 9, 1)
                },
                new Promotion()
                {
                    Id = 4,
                    Code = "SpringDown",
                    Enabled = false,
                    ValidFrom = new DateTime(2020, 3, 1),
                    ValidTo = new DateTime(2020, 5, 1)
                },
                new Promotion()
                {
                    Id = 5,
                    Code = "EasterDown",
                    Enabled = true,
                    ValidFrom = new DateTime(2020, 4, 1),
                    ValidTo = new DateTime(2020, 4, 12)
                },
                new Promotion()
                {
                    Id = 6,
                    Code = "SummerDown",
                    Enabled = false,
                    ValidFrom = new DateTime(2020, 6, 1),
                    ValidTo = new DateTime(2020, 9, 1)
                },
                new Promotion()
                {
                    Id = 7,
                    Code = "FUNZIES!",
                    Enabled = true,
                    ValidFrom = new DateTime(2020, 4, 1),
                    ValidTo = new DateTime(2020, 6, 1)
                },
                new Promotion()
                {
                    Id = 8,
                    Code = "NOTfunzies",
                    Enabled = false,
                    ValidFrom = new DateTime(2020,4,1),
                    ValidTo = new DateTime(2020,6,1)
                },
                new Promotion()
                {
                    Id = 9,
                    Code = "Summer3",
                    Enabled = true,
                    ValidFrom = new DateTime(2020,6,1),
                    ValidTo = new DateTime(2020, 9, 1)
                },
                new Promotion()
                {
                    Id = 10,
                    Code = "Spring4",
                    Enabled = true,
                    ValidFrom = new DateTime(2020,3,1),
                    ValidTo = new DateTime(2020,5,1)
                },
                new Promotion()
                {
                    Id = 11,
                    Code = "Easter4",
                    Enabled = false,
                    ValidFrom = new DateTime(2020,4,1),
                    ValidTo = new DateTime(2020,5,1)
                },
                new Promotion()
                {
                    Id = 12,
                    Code = "Summer4",
                    Enabled = true,
                    ValidFrom = new DateTime(2020,6,1),
                    ValidTo = new DateTime(2020,9,1)
                },
                new Promotion()
                {
                    Id = 13,
                    Code = "Spring5",
                    Enabled = true,
                    ValidFrom = new DateTime(2020,3,1),
                    ValidTo = new DateTime(2020,5,1)
                },
                new Promotion()
                {
                    Id = 14,
                    Code = "Easter5",
                    Enabled = false,
                    ValidFrom = new DateTime(2020,4,1),
                    ValidTo = new DateTime(2020,5,1)
                },
                new Promotion()
                {
                    Id = 15,
                    Code = "Summer5",
                    Enabled = true,
                    ValidFrom = new DateTime(2020,6,1),
                    ValidTo = new DateTime(2020,9,1)
                },
                new Promotion()
                {
                    Id = 16,
                    Code = "Spring6",
                    Enabled = true,
                    ValidFrom = new DateTime(2020,3,1),
                    ValidTo = new DateTime(2020,5,1)
                },
                new Promotion()
                {
                    Id = 17,
                    Code = "Easter6",
                    Enabled = false,
                    ValidFrom = new DateTime(2020,4,1),
                    ValidTo = new DateTime(2020,5,1)
                },
                new Promotion()
                {
                    Id = 18,
                    Code = "Summer6",
                    Enabled = true,
                    ValidFrom = new DateTime(2020,6,1),
                    ValidTo = new DateTime(2020,9,1)
                },
                new Promotion()
                {
                    Id = 19,
                    Code = "Spring7",
                    Enabled = true,
                    ValidFrom = new DateTime(2020,3,1),
                    ValidTo = new DateTime(2020,5,1)
                },
                new Promotion()
                {
                    Id = 20,
                    Code = "Easter7",
                    Enabled = false,
                    ValidFrom = new DateTime(2020,4,1),
                    ValidTo = new DateTime(2020,5,1)
                },
                new Promotion()
                {
                    Id = 21,
                    Code = "Summer7",
                    Enabled = true,
                    ValidFrom = new DateTime(2020,6,1),
                    ValidTo = new DateTime(2020,9,1)
                },
                new Promotion()
                {
                    Id = 22,
                    Code = "Spring8",
                    Enabled = true,
                    ValidFrom = new DateTime(2020, 3, 1),
                    ValidTo = new DateTime(2020,5,1)
                },
                new Promotion()
                {
                    Id = 23,
                    Code = "Easter8",
                    Enabled = false,
                    ValidFrom = new DateTime(2020, 4, 1),
                    ValidTo = new DateTime(2020, 5, 1)
                },
                new Promotion()
                {
                    Id = 24,
                    Code = "Summer8",
                    Enabled = true,
                    ValidFrom = new DateTime(2020,6,1),
                    ValidTo = new DateTime(2020,9,1)
                },
                new Promotion()
                {
                    Id = 25,
                    Code = "Bloom",
                    Enabled = true,
                    ValidFrom = new DateTime(2020, 2, 14),
                    ValidTo = new DateTime(2020, 3, 14)
                },
                new Promotion()
                {
                    Id = 26,
                    Code = "AllYear",
                    Enabled = true,
                    ValidFrom = new DateTime(2020, 2, 1),
                    ValidTo = new DateTime(2020, 8, 1)
                }
            );
            */
            #endregion
            #region Additional Promotion seed
            /* comment test data
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
            */
            #endregion
            #region Coupon seed
            /* comment test data
            modelBuilder.Entity<Coupon>().HasData(
                new Coupon()
                {
                    Id = 2,
                    Code = "EASTER1234567892",
                    Holder = "38640440481",
                    User = "38640440481",
                    AquireFrom = new DateTime(2020, 4, 1),
                    AquireTo = new DateTime(2020, 6, 1),
                    AwardFrom = new DateTime(2020, 4, 1),
                    AwardTo = new DateTime(2020, 6, 1),
                    Enabled = true,
                    Status = (int)CouponStatus.Issued,
                    PromotionId = 2,
                    CouponSeries = 1
                },
                new Coupon()
                {
                    Id = 3,
                    Code = "EASTER1234567893",
                    Holder = "38640440482",
                    User = "38640440482",
                    AquireFrom = new DateTime(2020,4,1),
                    AquireTo = new DateTime(2020, 6, 1),
                    AwardFrom = new DateTime(2020, 4, 1),
                    AwardTo = new DateTime(2020, 6, 1),
                    Enabled = true,
                    Status = (int)CouponStatus.Issued,
                    PromotionId = 2,
                    CouponSeries = 1
                },
                new Coupon()
                {
                    Id = 4,
                    Code = "EASTER1234567894",
                    Holder = "38640440483",
                    User = "38640440483",
                    AquireFrom = new DateTime(2020, 4, 1),
                    AquireTo = new DateTime(2020, 6, 1),
                    AwardFrom = new DateTime(2020, 4, 1),
                    AwardTo = new DateTime(2020, 6, 1),
                    Enabled = true,
                    Status = (int)CouponStatus.Created,
                    PromotionId = 2,
                    CouponSeries = 1
                },
                new Coupon()
                {
                    Id = 5,
                    Code = "EASTER1234567891",
                    Holder = "",
                    User = "",
                    AquireFrom = new DateTime(2020, 4, 1),
                    AquireTo = new DateTime(2020, 6, 1),
                    AwardFrom = new DateTime(2020, 4, 1),
                    AwardTo = new DateTime(2020, 6, 1),
                    Enabled = true,
                    Status = (int)CouponStatus.Canceled,
                    PromotionId = 2,
                    CouponSeries = 1
                },
                new Coupon()
                {
                    Id = 6,
                    Code = "EASTER1234567895",
                    Holder = "",
                    User = "",
                    AquireFrom = new DateTime(2020, 4, 1),
                    AquireTo = new DateTime(2020, 6, 1),
                    AwardFrom = new DateTime(2020, 4, 1),
                    AwardTo = new DateTime(2020, 6, 1),
                    Enabled = true,
                    Status = (int)CouponStatus.Redeemed,
                    PromotionId = 2,
                    CouponSeries = 1
                },
                new Coupon()
                {
                    Id = 7,
                    Code = "EASTER1234567113",
                    Holder = "",
                    User = "",
                    AquireFrom = new DateTime(2020, 4, 1),
                    AquireTo = new DateTime(2020, 6, 1),
                    AwardFrom = new DateTime(2020, 4, 1),
                    AwardTo = new DateTime(2020, 6, 1),
                    Enabled = true,
                    Status = (int)CouponStatus.Redeemed,
                    PromotionId = 2,
                    CouponSeries = 1
                },
                new Coupon()
                {
                    Id = 8,
                    Code = "EDOWN1234567892",
                    Holder = "38640440481",
                    User = "38640440481",
                    AquireFrom = new DateTime(2020, 4, 1),
                    AquireTo = new DateTime(2020, 6, 1),
                    AwardFrom = new DateTime(2020, 4, 1),
                    AwardTo = new DateTime(2020, 6, 1),
                    Enabled = false,
                    Status = (int)CouponStatus.Issued,
                    PromotionId = 5,
                    CouponSeries = 1
                },
                new Coupon()
                {
                    Id = 9,
                    Code = "EDOWN1234567893",
                    Holder = "38640440482",
                    User = "38640440482",
                    AquireFrom = new DateTime(2020, 4, 1),
                    AquireTo = new DateTime(2020, 6, 1),
                    AwardFrom = new DateTime(2020, 4, 1),
                    AwardTo = new DateTime(2020, 6, 1),
                    Enabled = false,
                    Status = (int)CouponStatus.Issued,
                    PromotionId = 5,
                    CouponSeries = 1
                },
                new Coupon()
                {
                    Id = 10,
                    Code = "EDOWN1234567894",
                    Holder = "38640440483",
                    User = "38640440483",
                    AquireFrom = new DateTime(2020, 4, 1),
                    AquireTo = new DateTime(2020, 6, 1),
                    AwardFrom = new DateTime(2020, 4, 1),
                    AwardTo = new DateTime(2020, 6, 1),
                    Enabled = true,
                    Status = (int)CouponStatus.Issued,
                    PromotionId = 5,
                    CouponSeries = 2
                },
                new Coupon()
                {
                    Id = 11,
                    Code = "EDOWN1234567891",
                    Holder = "",
                    User = "",
                    AquireFrom = new DateTime(2020, 4, 1),
                    AquireTo = new DateTime(2020, 6, 1),
                    AwardFrom = new DateTime(2020, 4, 1),
                    AwardTo = new DateTime(2020, 6, 1),
                    Enabled = true,
                    Status = (int)CouponStatus.Created,
                    PromotionId = 5,
                    CouponSeries = 1
                },
                new Coupon()
                {
                    Id = 12,
                    Code = "EDOWN1234567911",
                    Holder = "",
                    User = "",
                    AquireFrom = new DateTime(2020, 4, 1),
                    AquireTo = new DateTime(2020, 6, 1),
                    AwardFrom = new DateTime(2020, 4, 1),
                    AwardTo = new DateTime(2020, 6, 1),
                    Enabled = false,
                    Status = (int)CouponStatus.Created,
                    PromotionId = 5,
                    CouponSeries = 1
                },
                new Coupon()
                {
                    Id = 13,
                    Code = "EDOWN1234567912",
                    Holder = "",
                    User = "",
                    AquireFrom = new DateTime(2020, 4, 1),
                    AquireTo = new DateTime(2020, 6, 1),
                    AwardFrom = new DateTime(2020, 4, 1),
                    AwardTo = new DateTime(2020, 6, 1),
                    Enabled = true,
                    Status = (int)CouponStatus.Redeemed,
                    PromotionId = 5,
                    CouponSeries = 2
                },
                new Coupon()
                {
                    Id = 14,
                    Code = "SPRING1234567289",
                    Holder = "38640440481",
                    User = "38640440481",
                    AquireFrom = new DateTime(2020, 3, 20),
                    AquireTo = new DateTime(2020, 5, 20),
                    AwardFrom = new DateTime(2020, 3, 20),
                    AwardTo = new DateTime(2020, 5, 20),
                    Enabled = true,
                    Status = (int)CouponStatus.Issued,
                    PromotionId = 1,
                    CouponSeries = 2
                },
                new Coupon()
                {
                    Id = 15,
                    Code = "SPRING1234567290",
                    Holder = "38640440481",
                    User = "38640440481",
                    AquireFrom = new DateTime(2020, 3, 20),
                    AquireTo = new DateTime(2020, 5, 20),
                    AwardFrom = new DateTime(2020, 3, 20),
                    AwardTo = new DateTime(2020, 5, 20),
                    Enabled = true,
                    Status = (int)CouponStatus.Redeemed,
                    PromotionId = 1,
                    CouponSeries = 2
                },
                new Coupon()
                {
                    Id = 16,
                    Code = "SPRING1234567291",
                    Holder = "38640440481",
                    User = "38640440481",
                    AquireFrom = new DateTime(2020, 3, 20),
                    AquireTo = new DateTime(2020, 5, 20),
                    AwardFrom = new DateTime(2020, 3, 20),
                    AwardTo = new DateTime(2020, 5, 20),
                    Enabled = true,
                    Status = (int)CouponStatus.Canceled,
                    PromotionId = 1,
                    CouponSeries = 2
                },
                new Coupon()
                {
                    Id = 17,
                    Code = "BLOOM1234567092",
                    Holder = "38640440481",
                    User = "38640440481",
                    AquireFrom = new DateTime(2020, 2, 14),
                    AquireTo = new DateTime(2020, 3, 14),
                    AwardFrom = new DateTime(2020, 2, 14),
                    AwardTo = new DateTime(2020, 3, 14),
                    Enabled = true,
                    Status = (int)CouponStatus.Created,
                    PromotionId = 25,
                    CouponSeries = 1
                },
                new Coupon()
                {
                    Id = 18,
                    Code = "BLOOM1234567291",
                    Holder = "38640440481",
                    User = "38640440481",
                    AquireFrom = new DateTime(2020, 2, 14),
                    AquireTo = new DateTime(2020, 3, 14),
                    AwardFrom = new DateTime(2020, 2, 14),
                    AwardTo = new DateTime(2020, 3, 14),
                    Enabled = true,
                    Status = (int)CouponStatus.Issued,
                    PromotionId = 25,
                    CouponSeries = 1
                },
                new Coupon()
                {
                    Id = 19,
                    Code = "BLOOM1234567292",
                    Holder = "38640440481",
                    User = "38640440481",
                    AquireFrom = new DateTime(2020, 2, 14),
                    AquireTo = new DateTime(2020, 3, 14),
                    AwardFrom = new DateTime(2020, 2, 14),
                    AwardTo = new DateTime(2020, 3, 14),
                    Enabled = true,
                    Status = (int)CouponStatus.Created,
                    PromotionId = 25,
                    CouponSeries = 1
                },
                new Coupon()
                {
                    Id = 20,
                    Code = "BLOOM1234567293",
                    Holder = "38640440482",
                    User = "38640440482",
                    AquireFrom = new DateTime(2020, 2, 14),
                    AquireTo = new DateTime(2020, 3, 14),
                    AwardFrom = new DateTime(2020, 2, 14),
                    AwardTo = new DateTime(2020, 3, 14),
                    Enabled = true,
                    Status = (int)CouponStatus.Redeemed,
                    PromotionId = 25,
                    CouponSeries = 1
                },
                new Coupon()
                {
                    Id = 21,
                    Code = "BLOOM1234567294",
                    Holder = "38640440482",
                    User = "38640440482",
                    AquireFrom = new DateTime(2020, 2, 14),
                    AquireTo = new DateTime(2020, 3, 14),
                    AwardFrom = new DateTime(2020, 2, 14),
                    AwardTo = new DateTime(2020, 3, 14),
                    Enabled = true,
                    Status = (int)CouponStatus.Redeemed,
                    PromotionId = 25,
                    CouponSeries = 1
                },
                new Coupon()
                {
                    Id = 22,
                    Code = "SPRING1234567093",
                    Holder = "38640440482",
                    User = "38640440482",
                    AquireFrom = new DateTime(2020, 3, 20),
                    AquireTo = new DateTime(2020, 4, 20),
                    AwardFrom = new DateTime(2020, 3, 20),
                    AwardTo = new DateTime(2020, 4, 20),
                    Enabled = true,
                    Status = (int)CouponStatus.Redeemed,
                    PromotionId = 1,
                    CouponSeries = 2
                },
                new Coupon()
                {
                    Id = 23,
                    Code = "SPRING1234657291",
                    Holder = "38640440482",
                    User = "38640440482",
                    AquireFrom = new DateTime(2020, 3, 20),
                    AquireTo = new DateTime(2020, 4, 20),
                    AwardFrom = new DateTime(2020, 3, 20),
                    AwardTo = new DateTime(2020, 4, 20),
                    Enabled = true,
                    Status = (int)CouponStatus.Canceled,
                    PromotionId = 1,
                    CouponSeries = 2
                },
                new Coupon()
                {
                    Id = 24,
                    Code = "SUMMER1234657390",
                    Holder = "38640440482",
                    User = "38640440482",
                    AquireFrom = new DateTime(2020, 5, 1),
                    AquireTo = new DateTime(2020, 9, 1),
                    AwardFrom = new DateTime(2020, 5, 1),
                    AwardTo = new DateTime(2020, 9, 1),
                    Enabled = true,
                    Status = (int)CouponStatus.Created,
                    PromotionId = 3,
                    CouponSeries = 1
                },
                new Coupon()
                {
                    Id = 25,
                    Code = "SUMMER1234657391",
                    Holder = "38640440481",
                    User = "38640440481",
                    AquireFrom = new DateTime(2020, 5, 1),
                    AquireTo = new DateTime(2020, 9, 1),
                    AwardFrom = new DateTime(2020, 5, 1),
                    AwardTo = new DateTime(2020, 9, 1),
                    Enabled = true,
                    Status = (int)CouponStatus.Created,
                    PromotionId = 3,
                    CouponSeries = 1
                },
                new Coupon()
                {
                    Id = 26,
                    Code = "SUMMER1234657292",
                    Holder = "38640440482",
                    User = "38640440482",
                    AquireFrom = new DateTime(2020, 5, 1),
                    AquireTo = new DateTime(2020, 9, 1),
                    AwardFrom = new DateTime(2020, 5, 1),
                    AwardTo = new DateTime(2020, 9, 1),
                    Enabled = true,
                    Status = (int)CouponStatus.Created,
                    PromotionId = 3,
                    CouponSeries = 2
                },
                new Coupon()
                {
                    Id = 27,
                    Code = "SUMMER1234657293",
                    Holder = "38640440482",
                    User = "38640440482",
                    AquireFrom = new DateTime(2020, 5, 1),
                    AquireTo = new DateTime(2020, 9, 1),
                    AwardFrom = new DateTime(2020, 5, 1),
                    AwardTo = new DateTime(2020, 9, 1),
                    Enabled = true,
                    Status = (int)CouponStatus.Issued,
                    PromotionId = 3,
                    CouponSeries = 2
                },
                new Coupon()
                {
                    Id = 28,
                    Code = "SUMMER1234657294",
                    Holder = "38640440481",
                    User = "38640440481",
                    AquireFrom = new DateTime(2020, 5, 1),
                    AquireTo = new DateTime(2020, 9, 1),
                    AwardFrom = new DateTime(2020, 5, 1),
                    AwardTo = new DateTime(2020, 9, 1),
                    Enabled = true,
                    Status = (int)CouponStatus.Canceled,
                    PromotionId = 3,
                    CouponSeries = 2
                },
                new Coupon()
                {
                    Id = 29,
                    Code = "EASTER1234456294",
                    Holder = "38640440481",
                    User = "38640440481",
                    AquireFrom = new DateTime(2020, 4, 1),
                    AquireTo = new DateTime(2020, 5, 1),
                    AwardFrom = new DateTime(2020, 4, 1),
                    AwardTo = new DateTime(2020, 5, 1),
                    Enabled = true,
                    Status = (int)CouponStatus.Created,
                    PromotionId = 2,
                    CouponSeries = 1
                },
                new Coupon()
                {
                    Id = 30,
                    Code = "EASTER1234456295",
                    Holder = "38640440482",
                    User = "38640440482",
                    AquireFrom = new DateTime(2020, 4, 1),
                    AquireTo = new DateTime(2020, 5, 1),
                    AwardFrom = new DateTime(2020, 4, 1),
                    AwardTo = new DateTime(2020, 5, 1),
                    Enabled = true,
                    Status = (int)CouponStatus.Created,
                    PromotionId = 2,
                    CouponSeries = 1
                },
                new Coupon()
                {
                    Id = 31,
                    Code = "YEAR12345990",
                    Holder = "38640440481",
                    User = "38640440481",
                    AquireFrom = new DateTime(2020, 2, 1),
                    AquireTo = new DateTime(2020, 3, 1),
                    AwardFrom = new DateTime(2020, 2, 1),
                    AwardTo = new DateTime(2020, 3, 1),
                    Enabled = true,
                    Status = (int)CouponStatus.Created,
                    PromotionId = 26,
                    CouponSeries = 1
                },
                new Coupon()
                {
                    Id = 32,
                    Code = "YEAR12345991",
                    Holder = "38640440481",
                    User = "38640440481",
                    AquireFrom = new DateTime(2020, 3, 1),
                    AquireTo = new DateTime(2020, 4, 1),
                    AwardFrom = new DateTime(2020, 3, 1),
                    AwardTo = new DateTime(2020, 4, 1),
                    Enabled = true,
                    Status = (int)CouponStatus.Created,
                    PromotionId = 26,
                    CouponSeries = 1
                },
                new Coupon()
                {
                    Id = 33,
                    Code = "YEAR12345992",
                    Holder = "38640440481",
                    User = "38640440481",
                    AquireFrom = new DateTime(2020, 4, 1),
                    AquireTo = new DateTime(2020, 5, 1),
                    AwardFrom = new DateTime(2020, 4, 1),
                    AwardTo = new DateTime(2020, 5, 1),
                    Enabled = true,
                    Status = (int)CouponStatus.Created,
                    PromotionId = 26,
                    CouponSeries = 1
                },
                new Coupon()
                {
                    Id = 34,
                    Code = "YEAR12345994",
                    Holder = "38640440481",
                    User = "38640440481",
                    AquireFrom = new DateTime(2020, 5, 1),
                    AquireTo = new DateTime(2020, 6, 1),
                    AwardFrom = new DateTime(2020, 5, 1),
                    AwardTo = new DateTime(2020, 6, 1),
                    Enabled = true,
                    Status = (int)CouponStatus.Created,
                    PromotionId = 26,
                    CouponSeries = 1
                },
                new Coupon()
                {
                    Id = 35,
                    Code = "YEAR12345092",
                    Holder = "38640440481",
                    User = "38640440481",
                    AquireFrom = new DateTime(2020, 4, 1),
                    AquireTo = new DateTime(2020, 5, 1),
                    AwardFrom = new DateTime(2020, 4, 1),
                    AwardTo = new DateTime(2020, 5, 1),
                    Enabled = true,
                    Status = (int)CouponStatus.Created,
                    PromotionId = 26,
                    CouponSeries = 1
                },
                new Coupon()
                {
                    Id = 36,
                    Code = "YEAR12345093",
                    Holder = "38640440481",
                    User = "38640440481",
                    AquireFrom = new DateTime(2020, 4, 15),
                    AquireTo = new DateTime(2020, 5, 15),
                    AwardFrom = new DateTime(2020, 4, 15),
                    AwardTo = new DateTime(2020, 5, 15),
                    Enabled = true,
                    Status = (int)CouponStatus.Created,
                    PromotionId = 26,
                    CouponSeries = 2
                },
                new Coupon()
                {
                    Id = 37,
                    Code = "YEAR12345094",
                    Holder = "38640440481",
                    User = "38640440481",
                    AquireFrom = new DateTime(2020, 4, 8),
                    AquireTo = new DateTime(2020, 4, 18),
                    AwardFrom = new DateTime(2020, 4, 8),
                    AwardTo = new DateTime(2020, 4, 18),
                    Enabled = true,
                    Status = (int)CouponStatus.Created,
                    PromotionId = 26,
                    CouponSeries = 2
                },
                new Coupon()
                {
                    Id = 38,
                    Code = "YEAR12345095",
                    Holder = "38640440482",
                    User = "38640440482",
                    AquireFrom = new DateTime(2020, 4, 18),
                    AquireTo = new DateTime(2020, 5, 4),
                    AwardFrom = new DateTime(2020, 4, 18),
                    AwardTo = new DateTime(2020, 5, 4),
                    Enabled = true,
                    Status = (int)CouponStatus.Redeemed,
                    PromotionId = 26,
                    CouponSeries = 2
                },
                new Coupon()
                {
                    Id = 39,
                    Code = "EASTER1234567901",
                    Holder = "38591641146",
                    User = "38591641146",
                    AquireFrom = new DateTime(2020, 4, 1),
                    AquireTo = new DateTime(2020, 6, 1),
                    AwardFrom = new DateTime(2020, 4, 1),
                    AwardTo = new DateTime(2020, 6, 1),
                    Enabled = false,
                    Status = (int)CouponStatus.Issued,
                    PromotionId = 2,
                    CouponSeries = 3
                },
                new Coupon()
                {
                    Id = 40,
                    Code = "EASTER1234567902",
                    Holder = "38591641146",
                    User = "38591641146",
                    AquireFrom = new DateTime(2020, 4, 1),
                    AquireTo = new DateTime(2020, 5, 1),
                    AwardFrom = new DateTime(2020, 4, 1),
                    AwardTo = new DateTime(2020, 5, 1),
                    Enabled = true,
                    Status = (int)CouponStatus.Issued,
                    PromotionId = 2,
                    CouponSeries = 3
                },
                new Coupon()
                {
                    Id = 41,
                    Code = "EASTER1234567903",
                    Holder = "38591641146",
                    User = "38591641146",
                    AquireFrom = new DateTime(2020, 4, 12),
                    AquireTo = new DateTime(2020, 5, 12),
                    AwardFrom = new DateTime(2020, 4, 12),
                    AwardTo = new DateTime(2020, 5, 12),
                    Enabled = true,
                    Status = (int)CouponStatus.Created,
                    PromotionId = 2,
                    CouponSeries = 3
                },
                new Coupon()
                {
                    Id = 42,
                    Code = "EASTER1234567904",
                    Holder = "38591641147",
                    User = "38591641147",
                    AquireFrom = new DateTime(2020, 4, 1),
                    AquireTo = new DateTime(2020, 5, 1),
                    AwardFrom = new DateTime(2020, 4, 1),
                    AwardTo = new DateTime(2020, 5, 1),
                    Enabled = false,
                    Status = (int)CouponStatus.Created,
                    PromotionId = 2,
                    CouponSeries = 3
                },
                new Coupon()
                {
                    Id = 43,
                    Code = "EASTER1234567905",
                    Holder = "38591641148",
                    User = "38591641148",
                    AquireFrom = new DateTime(2020, 4, 1),
                    AquireTo = new DateTime(2020, 5, 1),
                    AwardFrom = new DateTime(2020, 4, 1),
                    AwardTo = new DateTime(2020, 5, 1),
                    Enabled = true,
                    Status = (int)CouponStatus.Redeemed,
                    PromotionId = 2,
                    CouponSeries = 3
                },
                new Coupon()
                {
                    Id = 44,
                    Code = "EASTER1234567906",
                    Holder = "38591641148",
                    User = "38591641148",
                    AquireFrom = new DateTime(2020, 4, 1),
                    AquireTo = new DateTime(2020, 5, 1),
                    AwardFrom = new DateTime(2020, 4, 1),
                    AwardTo = new DateTime(2020, 5, 1),
                    Enabled = true,
                    Status = (int)CouponStatus.Issued,
                    PromotionId = 2,
                    CouponSeries = 3
                },
                new Coupon()
                {
                    Id = 45,
                    Code = "SPRING1234567190",
                    Holder = "38640440481",
                    User = "38640440481",
                    AquireFrom = new DateTime(2020, 3, 20),
                    AquireTo = new DateTime(2020, 5, 20),
                    AwardFrom = new DateTime(2020, 3, 20),
                    AwardTo = new DateTime(2020, 5, 20),
                    Enabled = true,
                    Status = (int)CouponStatus.Redeemed,
                    PromotionId = 1,
                    CouponSeries = 2
                },
                new Coupon()
                {
                    Id = 46,
                    Code = "SPRING1234567191",
                    Holder = "38640440481",
                    User = "38640440481",
                    AquireFrom = new DateTime(2020, 3, 20),
                    AquireTo = new DateTime(2020, 5, 20),
                    AwardFrom = new DateTime(2020, 3, 20),
                    AwardTo = new DateTime(2020, 5, 20),
                    Enabled = true,
                    Status = (int)CouponStatus.Issued,
                    PromotionId = 1,
                    CouponSeries = 2
                },
                new Coupon()
                {
                    Id = 47,
                    Code = "YEAR12345096",
                    Holder = "38640440487",
                    User = "38640440487",
                    AquireFrom = new DateTime(2020, 4, 8),
                    AquireTo = new DateTime(2020, 4, 18),
                    AwardFrom = new DateTime(2020, 4, 8),
                    AwardTo = new DateTime(2020, 4, 18),
                    Enabled = true,
                    Status = (int)CouponStatus.Redeemed,
                    PromotionId = 26,
                    CouponSeries = 2
                },
                new Coupon()
                {
                    Id = 48,
                    Code = "YEAR12345097",
                    Holder = "38640440487",
                    User = "38640440487",
                    AquireFrom = new DateTime(2020, 4, 8),
                    AquireTo = new DateTime(2020, 4, 18),
                    AwardFrom = new DateTime(2020, 4, 8),
                    AwardTo = new DateTime(2020, 4, 18),
                    Enabled = true,
                    Status = (int)CouponStatus.Issued,
                    PromotionId = 26,
                    CouponSeries = 2
                },
                new Coupon()
                {
                    Id = 49,
                    Code = "BLOOM1234567295",
                    Holder = "38640440485",
                    User = "38640440485",
                    AquireFrom = new DateTime(2020, 2, 14),
                    AquireTo = new DateTime(2020, 3, 14),
                    AwardFrom = new DateTime(2020, 2, 14),
                    AwardTo = new DateTime(2020, 3, 14),
                    Enabled = true,
                    Status = (int)CouponStatus.Redeemed,
                    PromotionId = 25,
                    CouponSeries = 1
                },
                new Coupon()
                {
                    Id = 50,
                    Code = "BLOOM1234567296",
                    Holder = "38640440486",
                    User = "38640440486",
                    AquireFrom = new DateTime(2020, 2, 14),
                    AquireTo = new DateTime(2020, 3, 14),
                    AwardFrom = new DateTime(2020, 2, 14),
                    AwardTo = new DateTime(2020, 3, 14),
                    Enabled = true,
                    Status = (int)CouponStatus.Issued,
                    PromotionId = 25,
                    CouponSeries = 1
                },
                new Coupon()
                {
                    Id = 51,
                    Code = "SUMMER1234657492",
                    Holder = "38640440484",
                    User = "38640440484",
                    AquireFrom = new DateTime(2020, 5, 1),
                    AquireTo = new DateTime(2020, 9, 1),
                    AwardFrom = new DateTime(2020, 5, 1),
                    AwardTo = new DateTime(2020, 9, 1),
                    Enabled = true,
                    Status = (int)CouponStatus.Redeemed,
                    PromotionId = 3,
                    CouponSeries = 2
                },
                new Coupon()
                {
                    Id = 52,
                    Code = "SUMMER1234657493",
                    Holder = "38640440485",
                    User = "38640440485",
                    AquireFrom = new DateTime(2020, 5, 1),
                    AquireTo = new DateTime(2020, 9, 1),
                    AwardFrom = new DateTime(2020, 5, 1),
                    AwardTo = new DateTime(2020, 9, 1),
                    Enabled = true,
                    Status = (int)CouponStatus.Issued,
                    PromotionId = 3,
                    CouponSeries = 2
                }
            );
            */
            #endregion
            #region Coupon issuer channels seed
            /* remove test data
            modelBuilder.Entity<CouponIssuerChannel>().HasData(
                new CouponIssuerChannel()
                {
                    CouponId = 2,
                    IssuerChannelId = (int)IssuerChannelEnum.POS
                },
                new CouponIssuerChannel()
                {
                    CouponId = 3,
                    IssuerChannelId = (int)IssuerChannelEnum.POS
                },
                new CouponIssuerChannel()
                {
                    CouponId = 4,
                    IssuerChannelId = (int)IssuerChannelEnum.POS
                },
                new CouponIssuerChannel()
                {
                    CouponId = 5,
                    IssuerChannelId = (int)IssuerChannelEnum.Webshop
                },
                new CouponIssuerChannel()
                {
                    CouponId = 6,
                    IssuerChannelId = (int)IssuerChannelEnum.POS
                },
                new CouponIssuerChannel()
                {
                    CouponId = 7,
                    IssuerChannelId = (int)IssuerChannelEnum.Webshop
                },
                new CouponIssuerChannel()
                {
                    CouponId = 8,
                    IssuerChannelId = (int)IssuerChannelEnum.Telesales
                },
                new CouponIssuerChannel()
                {
                    CouponId = 9,
                    IssuerChannelId = (int)IssuerChannelEnum.Webshop
                },
                new CouponIssuerChannel()
                {
                    CouponId = 10,
                    IssuerChannelId = (int)IssuerChannelEnum.Salesforce
                },
                new CouponIssuerChannel()
                {
                    CouponId = 11,
                    IssuerChannelId = (int)IssuerChannelEnum.POS
                },
                new CouponIssuerChannel()
                {
                    CouponId = 12,
                    IssuerChannelId = (int)IssuerChannelEnum.SelfCare
                },
                new CouponIssuerChannel()
                {
                    CouponId = 13,
                    IssuerChannelId = (int)IssuerChannelEnum.POS
                },
                new CouponIssuerChannel()
                {
                    CouponId = 15,
                    IssuerChannelId = (int)IssuerChannelEnum.Webshop
                },
                new CouponIssuerChannel()
                {
                    CouponId = 17,
                    IssuerChannelId = (int)IssuerChannelEnum.Webshop
                },
                new CouponIssuerChannel()
                {
                    CouponId = 18,
                    IssuerChannelId = (int)IssuerChannelEnum.Webshop
                },
                new CouponIssuerChannel()
                {
                    CouponId = 19,
                    IssuerChannelId = (int)IssuerChannelEnum.Webshop
                },
                new CouponIssuerChannel()
                {
                    CouponId = 20,
                    IssuerChannelId = (int)IssuerChannelEnum.SelfCare
                },
                new CouponIssuerChannel()
                {
                    CouponId = 21,
                    IssuerChannelId = (int)IssuerChannelEnum.SelfCare
                },
                new CouponIssuerChannel()
                {
                    CouponId = 22,
                    IssuerChannelId = (int)IssuerChannelEnum.Webshop
                },
                new CouponIssuerChannel()
                {
                    CouponId = 38,
                    IssuerChannelId = (int)IssuerChannelEnum.POS
                },
                new CouponIssuerChannel()
                {
                    CouponId = 43,
                    IssuerChannelId = (int)IssuerChannelEnum.POS
                },
                new CouponIssuerChannel()
                {
                    CouponId = 44,
                    IssuerChannelId = (int)IssuerChannelEnum.POS
                },
                new CouponIssuerChannel()
                {
                    CouponId = 45,
                    IssuerChannelId = (int)IssuerChannelEnum.SelfCare
                },
                new CouponIssuerChannel()
                {
                    CouponId = 46,
                    IssuerChannelId = (int)IssuerChannelEnum.SelfCare
                },
                new CouponIssuerChannel()
                {
                    CouponId = 47,
                    IssuerChannelId = (int)IssuerChannelEnum.Telesales
                },
                new CouponIssuerChannel()
                {
                    CouponId = 48,
                    IssuerChannelId = (int)IssuerChannelEnum.Telesales
                },
                new CouponIssuerChannel()
                {
                    CouponId = 49,
                    IssuerChannelId = (int)IssuerChannelEnum.Webshop
                },
                new CouponIssuerChannel()
                {
                    CouponId = 50,
                    IssuerChannelId = (int)IssuerChannelEnum.Webshop
                },
                new CouponIssuerChannel()
                {
                    CouponId = 51,
                    IssuerChannelId = (int)IssuerChannelEnum.Salesforce
                },
                new CouponIssuerChannel()
                {
                    CouponId = 52,
                    IssuerChannelId = (int)IssuerChannelEnum.Salesforce
                }
            );
            */
            #endregion
            #region Coupon award channels seed
            /* remove test data
               modelBuilder.Entity<CouponAwardChannel>().HasData(
                new CouponAwardChannel()
                {
                    CouponId = 6,
                    AwardChannelId = (int)AwardChannelEnum.POS
                },
                new CouponAwardChannel()
                {
                    CouponId = 7,
                    AwardChannelId = (int)AwardChannelEnum.Webshop
                },
                new CouponAwardChannel()
                {
                    CouponId = 13,
                    AwardChannelId = (int)AwardChannelEnum.POS
                },
                new CouponAwardChannel()
                {
                    CouponId = 15,
                    AwardChannelId = (int)AwardChannelEnum.Webshop
                },
                new CouponAwardChannel()
                {
                    CouponId = 20,
                    AwardChannelId = (int)AwardChannelEnum.SelfCare
                },
                new CouponAwardChannel()
                {
                    CouponId = 21,
                    AwardChannelId = (int)AwardChannelEnum.SelfCare
                },
                new CouponAwardChannel()
                {
                    CouponId = 22,
                    AwardChannelId = (int)AwardChannelEnum.Webshop
                },
                new CouponAwardChannel()
                {
                    CouponId = 38,
                    AwardChannelId = (int)AwardChannelEnum.POS
                },
                new CouponAwardChannel()
                {
                    CouponId = 43,
                    AwardChannelId = (int)AwardChannelEnum.POS
                },
                new CouponAwardChannel()
                {
                    CouponId = 44,
                    AwardChannelId = (int)AwardChannelEnum.POS
                },
                new CouponAwardChannel()
                {
                    CouponId = 45,
                    AwardChannelId = (int)AwardChannelEnum.SelfCare
                },
                new CouponAwardChannel()
                {
                    CouponId = 46,
                    AwardChannelId = (int)AwardChannelEnum.SelfCare
                },
                new CouponAwardChannel()
                {
                    CouponId = 47,
                    AwardChannelId = (int)AwardChannelEnum.Telesales
                },
                new CouponAwardChannel()
                {
                    CouponId = 48,
                    AwardChannelId = (int)AwardChannelEnum.Telesales
                },
                new CouponAwardChannel()
                {
                    CouponId = 49,
                    AwardChannelId = (int)AwardChannelEnum.Webshop
                },
                new CouponAwardChannel()
                {
                    CouponId = 50,
                    AwardChannelId = (int)AwardChannelEnum.Webshop
                }
            );
            */
            #endregion
            #region Admin seed
            /* remove test data
            modelBuilder.Entity<User>().HasData(
                new User() { AccessType = AccessTypeEnum.Administrator, Username = "ljubo", Fullname = "Ljubomir Kraljevic", Domain = "LJUBO-PC" },
                new User() { AccessType = AccessTypeEnum.Administrator, Username = "traktor", Fullname = "DJ Fresh Prince", Domain = "LJUBO-PC" }
            );
            modelBuilder.Entity<CouponSystem>().HasData(
                new CouponSystem() { Id = 1, Name = "CRM", Username="max", Password="test" },
                new CouponSystem() { Id = 2, Name = "SalesForce", Username = "sf", Password = "test" }
            );
            modelBuilder.Entity<AccessLog>().HasData(
                new AccessLog() { Id = 1, Action = "Create Promotion", ApplicationType = ApplicationEnum.API, Channel = "POS", Username = "", IssuedDate = DateTime.Now },
                new AccessLog() { Id = 2, Action = "Update Coupon", ApplicationType = ApplicationEnum.WebApp, Channel = "", Username = "korisnik", IssuedDate = DateTime.Now }
            );
            */
            #endregion
        }
        #endregion
    }
}
