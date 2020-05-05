using System;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Migrations;

namespace WebApp.Migrations
{
    public partial class Init : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "AccessLog",
                columns: table => new
                {
                    Id = table.Column<long>(nullable: false)
                        .Annotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn),
                    ApplicationType = table.Column<int>(nullable: false),
                    Channel = table.Column<string>(nullable: true),
                    Action = table.Column<string>(nullable: true),
                    Username = table.Column<string>(nullable: true),
                    IssuedDate = table.Column<DateTime>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AccessLog", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "AwardChannel",
                columns: table => new
                {
                    Id = table.Column<long>(nullable: false)
                        .Annotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn),
                    Name = table.Column<string>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AwardChannel", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "IssuerChannel",
                columns: table => new
                {
                    Id = table.Column<long>(nullable: false)
                        .Annotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn),
                    Name = table.Column<string>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_IssuerChannel", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Promotion",
                columns: table => new
                {
                    Id = table.Column<long>(nullable: false)
                        .Annotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn),
                    Code = table.Column<string>(nullable: false),
                    Enabled = table.Column<bool>(nullable: false),
                    ValidFrom = table.Column<DateTime>(nullable: true),
                    ValidTo = table.Column<DateTime>(nullable: true),
                    CouponSeries = table.Column<int>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Promotion", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Property",
                columns: table => new
                {
                    Id = table.Column<long>(nullable: false)
                        .Annotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn),
                    Name = table.Column<string>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Property", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "System",
                columns: table => new
                {
                    Id = table.Column<long>(nullable: false)
                        .Annotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn),
                    Name = table.Column<string>(nullable: true),
                    Username = table.Column<string>(nullable: true),
                    Password = table.Column<string>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_System", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "User",
                columns: table => new
                {
                    Username = table.Column<string>(nullable: false),
                    Domain = table.Column<string>(nullable: true),
                    Fullname = table.Column<string>(nullable: true),
                    AccessType = table.Column<int>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_User", x => x.Username);
                });

            migrationBuilder.CreateTable(
                name: "Coupon",
                columns: table => new
                {
                    Id = table.Column<long>(nullable: false)
                        .Annotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn),
                    Code = table.Column<string>(nullable: true),
                    Holder = table.Column<string>(nullable: true),
                    User = table.Column<string>(nullable: true),
                    Status = table.Column<int>(nullable: false),
                    AquireFrom = table.Column<DateTime>(nullable: true),
                    AquireTo = table.Column<DateTime>(nullable: true),
                    AwardFrom = table.Column<DateTime>(nullable: true),
                    AwardTo = table.Column<DateTime>(nullable: true),
                    PromotionId = table.Column<long>(nullable: false),
                    CouponSeries = table.Column<int>(nullable: false),
                    MaxRedeemNo = table.Column<int>(nullable: false),
                    Enabled = table.Column<bool>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Coupon", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Coupon_Promotion_PromotionId",
                        column: x => x.PromotionId,
                        principalTable: "Promotion",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "PromotionAwardChannel",
                columns: table => new
                {
                    PromotionId = table.Column<long>(nullable: false),
                    AwardChannelId = table.Column<long>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_PromotionAwardChannel", x => new { x.PromotionId, x.AwardChannelId });
                    table.ForeignKey(
                        name: "FK_PromotionAwardChannel_AwardChannel_AwardChannelId",
                        column: x => x.AwardChannelId,
                        principalTable: "AwardChannel",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_PromotionAwardChannel_Promotion_PromotionId",
                        column: x => x.PromotionId,
                        principalTable: "Promotion",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "PromotionIssuerChannel",
                columns: table => new
                {
                    PromotionId = table.Column<long>(nullable: false),
                    IssuerChannelId = table.Column<long>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_PromotionIssuerChannel", x => new { x.PromotionId, x.IssuerChannelId });
                    table.ForeignKey(
                        name: "FK_PromotionIssuerChannel_IssuerChannel_IssuerChannelId",
                        column: x => x.IssuerChannelId,
                        principalTable: "IssuerChannel",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_PromotionIssuerChannel_Promotion_PromotionId",
                        column: x => x.PromotionId,
                        principalTable: "Promotion",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "PromotionProperty",
                columns: table => new
                {
                    PromotionId = table.Column<long>(nullable: false),
                    PropertyId = table.Column<long>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_PromotionProperty", x => new { x.PromotionId, x.PropertyId });
                    table.ForeignKey(
                        name: "FK_PromotionProperty_Promotion_PromotionId",
                        column: x => x.PromotionId,
                        principalTable: "Promotion",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_PromotionProperty_Property_PropertyId",
                        column: x => x.PropertyId,
                        principalTable: "Property",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "NotifyList",
                columns: table => new
                {
                    ChannelId = table.Column<long>(nullable: false),
                    SystemId = table.Column<long>(nullable: false),
                    Url = table.Column<string>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_NotifyList", x => new { x.SystemId, x.ChannelId });
                    table.ForeignKey(
                        name: "FK_NotifyList_IssuerChannel_ChannelId",
                        column: x => x.ChannelId,
                        principalTable: "IssuerChannel",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_NotifyList_System_SystemId",
                        column: x => x.SystemId,
                        principalTable: "System",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "CouponAwardChannel",
                columns: table => new
                {
                    CouponId = table.Column<long>(nullable: false),
                    AwardChannelId = table.Column<long>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_CouponAwardChannel", x => new { x.CouponId, x.AwardChannelId });
                    table.ForeignKey(
                        name: "FK_CouponAwardChannel_AwardChannel_AwardChannelId",
                        column: x => x.AwardChannelId,
                        principalTable: "AwardChannel",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_CouponAwardChannel_Coupon_CouponId",
                        column: x => x.CouponId,
                        principalTable: "Coupon",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "CouponHistory",
                columns: table => new
                {
                    Id = table.Column<long>(nullable: false)
                        .Annotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn),
                    Date = table.Column<DateTime>(nullable: false),
                    Action = table.Column<string>(nullable: true),
                    Status = table.Column<int>(nullable: false),
                    CouponId = table.Column<long>(nullable: false),
                    User = table.Column<string>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_CouponHistory", x => x.Id);
                    table.ForeignKey(
                        name: "FK_CouponHistory_Coupon_CouponId",
                        column: x => x.CouponId,
                        principalTable: "Coupon",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "CouponIssuerChannel",
                columns: table => new
                {
                    CouponId = table.Column<long>(nullable: false),
                    IssuerChannelId = table.Column<long>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_CouponIssuerChannel", x => new { x.CouponId, x.IssuerChannelId });
                    table.ForeignKey(
                        name: "FK_CouponIssuerChannel_Coupon_CouponId",
                        column: x => x.CouponId,
                        principalTable: "Coupon",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_CouponIssuerChannel_IssuerChannel_IssuerChannelId",
                        column: x => x.IssuerChannelId,
                        principalTable: "IssuerChannel",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.InsertData(
                table: "AccessLog",
                columns: new[] { "Id", "Action", "ApplicationType", "Channel", "IssuedDate", "Username" },
                values: new object[,]
                {
                    { 1L, "Create Promotion", 0, "POS", new DateTime(2020, 5, 5, 15, 35, 54, 639, DateTimeKind.Local).AddTicks(9910), "" },
                    { 2L, "Update Coupon", 1, "", new DateTime(2020, 5, 5, 15, 35, 54, 642, DateTimeKind.Local).AddTicks(7515), "korisnik" }
                });

            migrationBuilder.InsertData(
                table: "AwardChannel",
                columns: new[] { "Id", "Name" },
                values: new object[,]
                {
                    { 1L, "POS" },
                    { 3L, "SelfCare" },
                    { 4L, "Telesales" },
                    { 5L, "Webshop" }
                });

            migrationBuilder.InsertData(
                table: "IssuerChannel",
                columns: new[] { "Id", "Name" },
                values: new object[,]
                {
                    { 1L, "POS" },
                    { 2L, "Salesforce" },
                    { 3L, "SelfCare" },
                    { 4L, "Telesales" },
                    { 5L, "Webshop" }
                });

            migrationBuilder.InsertData(
                table: "Promotion",
                columns: new[] { "Id", "Code", "CouponSeries", "Enabled", "ValidFrom", "ValidTo" },
                values: new object[,]
                {
                    { 16L, "Spring6", 0, true, new DateTime(2020, 3, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 5, 1, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 17L, "Easter6", 0, false, new DateTime(2020, 4, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 5, 1, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 18L, "Summer6", 0, true, new DateTime(2020, 6, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 9, 1, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 19L, "Spring7", 0, true, new DateTime(2020, 3, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 5, 1, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 20L, "Easter7", 0, false, new DateTime(2020, 4, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 5, 1, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 26L, "AllYear", 0, true, new DateTime(2020, 2, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 8, 1, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 22L, "Spring8", 0, true, new DateTime(2020, 3, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 5, 1, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 23L, "Easter8", 0, false, new DateTime(2020, 4, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 5, 1, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 24L, "Summer8", 0, true, new DateTime(2020, 6, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 9, 1, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 25L, "Bloom", 0, true, new DateTime(2020, 2, 14, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 3, 14, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 15L, "Summer5", 0, true, new DateTime(2020, 6, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 9, 1, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 21L, "Summer7", 0, true, new DateTime(2020, 6, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 9, 1, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 14L, "Easter5", 0, false, new DateTime(2020, 4, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 5, 1, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 13L, "Spring5", 0, true, new DateTime(2020, 3, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 5, 1, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 12L, "Summer4", 0, true, new DateTime(2020, 6, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 9, 1, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 1L, "Spring", 0, true, new DateTime(2020, 3, 20, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 5, 20, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 3L, "Summer", 0, true, new DateTime(2020, 5, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 9, 1, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 4L, "SpringDown", 0, false, new DateTime(2020, 3, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 5, 1, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 5L, "EasterDown", 0, true, new DateTime(2020, 4, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 4, 12, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 6L, "SummerDown", 0, false, new DateTime(2020, 6, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 9, 1, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 2L, "Easter", 0, true, new DateTime(2020, 4, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 6, 1, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 8L, "NOTfunzies", 0, false, new DateTime(2020, 4, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 6, 1, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 9L, "Summer3", 0, true, new DateTime(2020, 6, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 9, 1, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 10L, "Spring4", 0, true, new DateTime(2020, 3, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 5, 1, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 11L, "Easter4", 0, false, new DateTime(2020, 4, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 5, 1, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 7L, "FUNZIES!", 0, true, new DateTime(2020, 4, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 6, 1, 0, 0, 0, 0, DateTimeKind.Unspecified) }
                });

            migrationBuilder.InsertData(
                table: "Property",
                columns: new[] { "Id", "Name" },
                values: new object[,]
                {
                    { 1L, "UniqueCoupons" },
                    { 2L, "NamedHolders" },
                    { 3L, "NamedConsumers" },
                    { 4L, "HolderIsOnlyConsumer" },
                    { 5L, "AllowMultipleRedeems" },
                    { 6L, "AllowCouponSeries" }
                });

            migrationBuilder.InsertData(
                table: "System",
                columns: new[] { "Id", "Name", "Password", "Username" },
                values: new object[,]
                {
                    { 1L, "CRM", "test", "max" },
                    { 2L, "SalesForce", "test", "sf" }
                });

            migrationBuilder.InsertData(
                table: "User",
                columns: new[] { "Username", "AccessType", "Domain", "Fullname" },
                values: new object[,]
                {
                    { "ljubo", 1, "LJUBO-PC", "Ljubomir Kraljevic" },
                    { "traktor", 1, "LJUBO-PC", "DJ Fresh Prince" }
                });

            migrationBuilder.InsertData(
                table: "Coupon",
                columns: new[] { "Id", "AquireFrom", "AquireTo", "AwardFrom", "AwardTo", "Code", "CouponSeries", "Enabled", "Holder", "MaxRedeemNo", "PromotionId", "Status", "User" },
                values: new object[,]
                {
                    { 14L, new DateTime(2020, 3, 20, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 5, 20, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 3, 20, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 5, 20, 0, 0, 0, 0, DateTimeKind.Unspecified), "SPRING1234567289", 2, true, "38640440481", 1, 1L, 2, "38640440481" },
                    { 26L, new DateTime(2020, 5, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 9, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 5, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 9, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), "SUMMER1234657292", 2, true, "38640440482", 1, 3L, 1, "38640440482" },
                    { 27L, new DateTime(2020, 5, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 9, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 5, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 9, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), "SUMMER1234657293", 2, true, "38640440482", 1, 3L, 2, "38640440482" },
                    { 28L, new DateTime(2020, 5, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 9, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 5, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 9, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), "SUMMER1234657294", 2, true, "38640440481", 1, 3L, 4, "38640440481" },
                    { 51L, new DateTime(2020, 5, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 9, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 5, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 9, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), "SUMMER1234657492", 2, true, "38640440484", 1, 3L, 3, "38640440484" },
                    { 8L, new DateTime(2020, 4, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 6, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 4, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 6, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), "EDOWN1234567892", 1, false, "38640440481", 1, 5L, 2, "38640440481" },
                    { 9L, new DateTime(2020, 4, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 6, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 4, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 6, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), "EDOWN1234567893", 1, false, "38640440482", 1, 5L, 2, "38640440482" },
                    { 10L, new DateTime(2020, 4, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 6, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 4, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 6, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), "EDOWN1234567894", 2, true, "38640440483", 1, 5L, 2, "38640440483" },
                    { 11L, new DateTime(2020, 4, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 6, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 4, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 6, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), "EDOWN1234567891", 1, true, "", 1, 5L, 1, "" },
                    { 12L, new DateTime(2020, 4, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 6, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 4, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 6, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), "EDOWN1234567911", 1, false, "", 1, 5L, 1, "" },
                    { 13L, new DateTime(2020, 4, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 6, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 4, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 6, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), "EDOWN1234567912", 2, true, "", 1, 5L, 3, "" },
                    { 17L, new DateTime(2020, 2, 14, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 3, 14, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 2, 14, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 3, 14, 0, 0, 0, 0, DateTimeKind.Unspecified), "BLOOM1234567092", 1, true, "38640440481", 1, 25L, 1, "38640440481" },
                    { 18L, new DateTime(2020, 2, 14, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 3, 14, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 2, 14, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 3, 14, 0, 0, 0, 0, DateTimeKind.Unspecified), "BLOOM1234567291", 1, true, "38640440481", 1, 25L, 2, "38640440481" },
                    { 19L, new DateTime(2020, 2, 14, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 3, 14, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 2, 14, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 3, 14, 0, 0, 0, 0, DateTimeKind.Unspecified), "BLOOM1234567292", 1, true, "38640440481", 1, 25L, 1, "38640440481" },
                    { 20L, new DateTime(2020, 2, 14, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 3, 14, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 2, 14, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 3, 14, 0, 0, 0, 0, DateTimeKind.Unspecified), "BLOOM1234567293", 1, true, "38640440482", 1, 25L, 3, "38640440482" },
                    { 21L, new DateTime(2020, 2, 14, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 3, 14, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 2, 14, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 3, 14, 0, 0, 0, 0, DateTimeKind.Unspecified), "BLOOM1234567294", 1, true, "38640440482", 1, 25L, 3, "38640440482" },
                    { 49L, new DateTime(2020, 2, 14, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 3, 14, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 2, 14, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 3, 14, 0, 0, 0, 0, DateTimeKind.Unspecified), "BLOOM1234567295", 1, true, "38640440485", 1, 25L, 3, "38640440485" },
                    { 50L, new DateTime(2020, 2, 14, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 3, 14, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 2, 14, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 3, 14, 0, 0, 0, 0, DateTimeKind.Unspecified), "BLOOM1234567296", 1, true, "38640440486", 1, 25L, 2, "38640440486" },
                    { 31L, new DateTime(2020, 2, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 3, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 2, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 3, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), "YEAR12345990", 1, true, "38640440481", 1, 26L, 1, "38640440481" },
                    { 32L, new DateTime(2020, 3, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 4, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 3, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 4, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), "YEAR12345991", 1, true, "38640440481", 1, 26L, 1, "38640440481" },
                    { 33L, new DateTime(2020, 4, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 5, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 4, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 5, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), "YEAR12345992", 1, true, "38640440481", 1, 26L, 1, "38640440481" },
                    { 34L, new DateTime(2020, 5, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 6, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 5, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 6, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), "YEAR12345994", 1, true, "38640440481", 1, 26L, 1, "38640440481" },
                    { 35L, new DateTime(2020, 4, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 5, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 4, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 5, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), "YEAR12345092", 1, true, "38640440481", 1, 26L, 1, "38640440481" },
                    { 36L, new DateTime(2020, 4, 15, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 5, 15, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 4, 15, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 5, 15, 0, 0, 0, 0, DateTimeKind.Unspecified), "YEAR12345093", 2, true, "38640440481", 1, 26L, 1, "38640440481" },
                    { 37L, new DateTime(2020, 4, 8, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 4, 18, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 4, 8, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 4, 18, 0, 0, 0, 0, DateTimeKind.Unspecified), "YEAR12345094", 2, true, "38640440481", 1, 26L, 1, "38640440481" },
                    { 38L, new DateTime(2020, 4, 18, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 5, 4, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 4, 18, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 5, 4, 0, 0, 0, 0, DateTimeKind.Unspecified), "YEAR12345095", 2, true, "38640440482", 1, 26L, 3, "38640440482" },
                    { 47L, new DateTime(2020, 4, 8, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 4, 18, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 4, 8, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 4, 18, 0, 0, 0, 0, DateTimeKind.Unspecified), "YEAR12345096", 2, true, "38640440487", 1, 26L, 3, "38640440487" },
                    { 48L, new DateTime(2020, 4, 8, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 4, 18, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 4, 8, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 4, 18, 0, 0, 0, 0, DateTimeKind.Unspecified), "YEAR12345097", 2, true, "38640440487", 1, 26L, 2, "38640440487" },
                    { 25L, new DateTime(2020, 5, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 9, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 5, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 9, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), "SUMMER1234657391", 1, true, "38640440481", 1, 3L, 1, "38640440481" },
                    { 24L, new DateTime(2020, 5, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 9, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 5, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 9, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), "SUMMER1234657390", 1, true, "38640440482", 1, 3L, 1, "38640440482" },
                    { 52L, new DateTime(2020, 5, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 9, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 5, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 9, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), "SUMMER1234657493", 2, true, "38640440485", 1, 3L, 2, "38640440485" },
                    { 6L, new DateTime(2020, 4, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 6, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 4, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 6, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), "EASTER1234567895", 1, true, "", 1, 2L, 3, "" },
                    { 2L, new DateTime(2020, 4, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 6, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 4, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 6, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), "EASTER1234567892", 1, true, "38640440481", 1, 2L, 2, "38640440481" },
                    { 3L, new DateTime(2020, 4, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 6, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 4, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 6, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), "EASTER1234567893", 1, true, "38640440482", 1, 2L, 2, "38640440482" },
                    { 4L, new DateTime(2020, 4, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 6, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 4, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 6, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), "EASTER1234567894", 1, true, "38640440483", 1, 2L, 1, "38640440483" },
                    { 5L, new DateTime(2020, 4, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 6, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 4, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 6, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), "EASTER1234567891", 1, true, "", 1, 2L, 4, "" },
                    { 46L, new DateTime(2020, 3, 20, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 5, 20, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 3, 20, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 5, 20, 0, 0, 0, 0, DateTimeKind.Unspecified), "SPRING1234567191", 2, true, "38640440481", 1, 1L, 2, "38640440481" },
                    { 7L, new DateTime(2020, 4, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 6, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 4, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 6, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), "EASTER1234567113", 1, true, "", 1, 2L, 3, "" },
                    { 29L, new DateTime(2020, 4, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 5, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 4, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 5, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), "EASTER1234456294", 1, true, "38640440481", 1, 2L, 1, "38640440481" },
                    { 30L, new DateTime(2020, 4, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 5, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 4, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 5, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), "EASTER1234456295", 1, true, "38640440482", 1, 2L, 1, "38640440482" },
                    { 39L, new DateTime(2020, 4, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 6, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 4, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 6, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), "EASTER1234567901", 3, false, "38591641146", 1, 2L, 2, "38591641146" },
                    { 40L, new DateTime(2020, 4, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 5, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 4, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 5, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), "EASTER1234567902", 3, true, "38591641146", 1, 2L, 2, "38591641146" },
                    { 41L, new DateTime(2020, 4, 12, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 5, 12, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 4, 12, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 5, 12, 0, 0, 0, 0, DateTimeKind.Unspecified), "EASTER1234567903", 3, true, "38591641146", 1, 2L, 1, "38591641146" },
                    { 23L, new DateTime(2020, 3, 20, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 4, 20, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 3, 20, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 4, 20, 0, 0, 0, 0, DateTimeKind.Unspecified), "SPRING1234657291", 2, true, "38640440482", 1, 1L, 4, "38640440482" },
                    { 45L, new DateTime(2020, 3, 20, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 5, 20, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 3, 20, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 5, 20, 0, 0, 0, 0, DateTimeKind.Unspecified), "SPRING1234567190", 2, true, "38640440481", 1, 1L, 3, "38640440481" },
                    { 16L, new DateTime(2020, 3, 20, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 5, 20, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 3, 20, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 5, 20, 0, 0, 0, 0, DateTimeKind.Unspecified), "SPRING1234567291", 2, true, "38640440481", 1, 1L, 4, "38640440481" },
                    { 42L, new DateTime(2020, 4, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 5, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 4, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 5, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), "EASTER1234567904", 3, false, "38591641147", 1, 2L, 1, "38591641147" },
                    { 43L, new DateTime(2020, 4, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 5, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 4, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 5, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), "EASTER1234567905", 3, true, "38591641148", 1, 2L, 3, "38591641148" },
                    { 44L, new DateTime(2020, 4, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 5, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 4, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 5, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), "EASTER1234567906", 3, true, "38591641148", 1, 2L, 2, "38591641148" },
                    { 15L, new DateTime(2020, 3, 20, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 5, 20, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 3, 20, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 5, 20, 0, 0, 0, 0, DateTimeKind.Unspecified), "SPRING1234567290", 2, true, "38640440481", 1, 1L, 3, "38640440481" },
                    { 22L, new DateTime(2020, 3, 20, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 4, 20, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 3, 20, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 4, 20, 0, 0, 0, 0, DateTimeKind.Unspecified), "SPRING1234567093", 2, true, "38640440482", 1, 1L, 3, "38640440482" }
                });

            migrationBuilder.InsertData(
                table: "PromotionAwardChannel",
                columns: new[] { "PromotionId", "AwardChannelId" },
                values: new object[,]
                {
                    { 1L, 3L },
                    { 3L, 3L },
                    { 3L, 4L },
                    { 3L, 1L },
                    { 11L, 1L },
                    { 1L, 1L },
                    { 2L, 3L },
                    { 2L, 4L },
                    { 2L, 5L },
                    { 1L, 5L }
                });

            migrationBuilder.InsertData(
                table: "PromotionIssuerChannel",
                columns: new[] { "PromotionId", "IssuerChannelId" },
                values: new object[,]
                {
                    { 2L, 4L },
                    { 1L, 2L },
                    { 1L, 1L },
                    { 3L, 1L },
                    { 3L, 4L },
                    { 2L, 5L },
                    { 11L, 2L },
                    { 2L, 1L },
                    { 1L, 5L },
                    { 3L, 5L }
                });

            migrationBuilder.InsertData(
                table: "PromotionProperty",
                columns: new[] { "PromotionId", "PropertyId" },
                values: new object[,]
                {
                    { 2L, 6L },
                    { 2L, 1L },
                    { 11L, 1L },
                    { 1L, 2L },
                    { 7L, 2L },
                    { 1L, 4L },
                    { 5L, 4L },
                    { 3L, 6L }
                });

            migrationBuilder.InsertData(
                table: "CouponAwardChannel",
                columns: new[] { "CouponId", "AwardChannelId" },
                values: new object[,]
                {
                    { 15L, 5L },
                    { 48L, 4L },
                    { 20L, 3L },
                    { 44L, 1L },
                    { 43L, 1L },
                    { 21L, 3L },
                    { 7L, 5L },
                    { 49L, 5L },
                    { 50L, 5L },
                    { 6L, 1L },
                    { 38L, 1L },
                    { 46L, 3L },
                    { 45L, 3L },
                    { 47L, 4L },
                    { 22L, 5L },
                    { 13L, 1L }
                });

            migrationBuilder.InsertData(
                table: "CouponIssuerChannel",
                columns: new[] { "CouponId", "IssuerChannelId" },
                values: new object[,]
                {
                    { 49L, 5L },
                    { 13L, 1L },
                    { 21L, 3L },
                    { 38L, 1L },
                    { 20L, 3L },
                    { 19L, 5L },
                    { 18L, 5L },
                    { 47L, 4L },
                    { 17L, 5L },
                    { 50L, 5L },
                    { 8L, 4L },
                    { 11L, 1L },
                    { 15L, 5L },
                    { 22L, 5L },
                    { 45L, 3L },
                    { 46L, 3L },
                    { 2L, 1L },
                    { 3L, 1L },
                    { 4L, 1L },
                    { 12L, 3L },
                    { 5L, 5L },
                    { 7L, 5L },
                    { 43L, 1L },
                    { 44L, 1L },
                    { 51L, 2L },
                    { 52L, 2L },
                    { 9L, 5L },
                    { 10L, 2L },
                    { 6L, 1L },
                    { 48L, 4L }
                });

            migrationBuilder.CreateIndex(
                name: "IX_Coupon_Code",
                table: "Coupon",
                column: "Code",
                unique: true,
                filter: "[Code] IS NOT NULL");

            migrationBuilder.CreateIndex(
                name: "IX_Coupon_PromotionId",
                table: "Coupon",
                column: "PromotionId");

            migrationBuilder.CreateIndex(
                name: "IX_CouponAwardChannel_AwardChannelId",
                table: "CouponAwardChannel",
                column: "AwardChannelId");

            migrationBuilder.CreateIndex(
                name: "IX_CouponHistory_CouponId",
                table: "CouponHistory",
                column: "CouponId");

            migrationBuilder.CreateIndex(
                name: "IX_CouponIssuerChannel_IssuerChannelId",
                table: "CouponIssuerChannel",
                column: "IssuerChannelId");

            migrationBuilder.CreateIndex(
                name: "IX_NotifyList_ChannelId",
                table: "NotifyList",
                column: "ChannelId");

            migrationBuilder.CreateIndex(
                name: "IX_Promotion_Code",
                table: "Promotion",
                column: "Code",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_PromotionAwardChannel_AwardChannelId",
                table: "PromotionAwardChannel",
                column: "AwardChannelId");

            migrationBuilder.CreateIndex(
                name: "IX_PromotionIssuerChannel_IssuerChannelId",
                table: "PromotionIssuerChannel",
                column: "IssuerChannelId");

            migrationBuilder.CreateIndex(
                name: "IX_PromotionProperty_PropertyId",
                table: "PromotionProperty",
                column: "PropertyId");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "AccessLog");

            migrationBuilder.DropTable(
                name: "CouponAwardChannel");

            migrationBuilder.DropTable(
                name: "CouponHistory");

            migrationBuilder.DropTable(
                name: "CouponIssuerChannel");

            migrationBuilder.DropTable(
                name: "NotifyList");

            migrationBuilder.DropTable(
                name: "PromotionAwardChannel");

            migrationBuilder.DropTable(
                name: "PromotionIssuerChannel");

            migrationBuilder.DropTable(
                name: "PromotionProperty");

            migrationBuilder.DropTable(
                name: "User");

            migrationBuilder.DropTable(
                name: "Coupon");

            migrationBuilder.DropTable(
                name: "System");

            migrationBuilder.DropTable(
                name: "AwardChannel");

            migrationBuilder.DropTable(
                name: "IssuerChannel");

            migrationBuilder.DropTable(
                name: "Property");

            migrationBuilder.DropTable(
                name: "Promotion");
        }
    }
}
