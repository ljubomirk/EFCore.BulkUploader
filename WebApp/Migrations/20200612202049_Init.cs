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
                name: "ACCESS_LOG",
                columns: table => new
                {
                    ID = table.Column<long>(nullable: false)
                        .Annotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn),
                    APPLICATION_TYPE = table.Column<int>(nullable: false),
                    CHANNEL = table.Column<string>(maxLength: 20, nullable: true),
                    ACTION = table.Column<string>(maxLength: 80, nullable: true),
                    USERNAME = table.Column<string>(maxLength: 20, nullable: true),
                    GRANTED = table.Column<bool>(nullable: false),
                    ISSUED_DATE = table.Column<DateTime>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ACCESS_LOG", x => x.ID);
                });

            migrationBuilder.CreateTable(
                name: "APPL_USER",
                columns: table => new
                {
                    USERNAME = table.Column<string>(maxLength: 20, nullable: false),
                    DOMAIN = table.Column<string>(maxLength: 20, nullable: true),
                    FULLNAME = table.Column<string>(maxLength: 80, nullable: true),
                    ACCESS_TYPE = table.Column<int>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_APPL_USER", x => x.USERNAME);
                });

            migrationBuilder.CreateTable(
                name: "AWARD_CHANNEL",
                columns: table => new
                {
                    ID = table.Column<long>(nullable: false)
                        .Annotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn),
                    NAME = table.Column<string>(maxLength: 20, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AWARD_CHANNEL", x => x.ID);
                });

            migrationBuilder.CreateTable(
                name: "ISSUER_CHANNEL",
                columns: table => new
                {
                    ID = table.Column<long>(nullable: false)
                        .Annotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn),
                    NAME = table.Column<string>(maxLength: 20, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ISSUER_CHANNEL", x => x.ID);
                });

            migrationBuilder.CreateTable(
                name: "PROMOTION",
                columns: table => new
                {
                    ID = table.Column<long>(nullable: false)
                        .Annotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn),
                    CODE = table.Column<string>(maxLength: 40, nullable: false),
                    ENABLED = table.Column<bool>(nullable: false),
                    VALID_FROM = table.Column<DateTime>(nullable: true),
                    VALID_TO = table.Column<DateTime>(nullable: true),
                    COUPON_SERIES = table.Column<int>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_PROMOTION", x => x.ID);
                });

            migrationBuilder.CreateTable(
                name: "PROPERTY",
                columns: table => new
                {
                    ID = table.Column<long>(nullable: false)
                        .Annotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn),
                    NAME = table.Column<string>(maxLength: 20, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_PROPERTY", x => x.ID);
                });

            migrationBuilder.CreateTable(
                name: "SYSTEM",
                columns: table => new
                {
                    ID = table.Column<long>(nullable: false)
                        .Annotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn),
                    NAME = table.Column<string>(maxLength: 20, nullable: true),
                    USERNAME = table.Column<string>(maxLength: 20, nullable: true),
                    PASSWORD = table.Column<string>(maxLength: 20, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_SYSTEM", x => x.ID);
                });

            migrationBuilder.CreateTable(
                name: "COUPON",
                columns: table => new
                {
                    ID = table.Column<long>(nullable: false)
                        .Annotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn),
                    CODE = table.Column<string>(maxLength: 40, nullable: true),
                    HOLDER = table.Column<string>(maxLength: 20, nullable: true),
                    USER = table.Column<string>(maxLength: 20, nullable: true),
                    STATUS = table.Column<int>(nullable: false),
                    AQUIRE_FROM = table.Column<DateTime>(nullable: true),
                    AQUIRE_TO = table.Column<DateTime>(nullable: true),
                    AWARD_FROM = table.Column<DateTime>(nullable: true),
                    AWARD_TO = table.Column<DateTime>(nullable: true),
                    PROMOTION_ID = table.Column<long>(nullable: false),
                    COUPON_SERIES = table.Column<int>(nullable: false),
                    MAX_REDEEM_NO = table.Column<int>(nullable: false),
                    ENABLED = table.Column<bool>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_COUPON", x => x.ID);
                    table.ForeignKey(
                        name: "FK_COUPON_PROMOTION_PROMOTION_ID",
                        column: x => x.PROMOTION_ID,
                        principalTable: "PROMOTION",
                        principalColumn: "ID",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "PROMOTION_AWARD_CHANNEL",
                columns: table => new
                {
                    PROMOTION_ID = table.Column<long>(nullable: false),
                    AWARD_CHANNEL_ID = table.Column<long>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_PROMOTION_AWARD_CHANNEL", x => new { x.PROMOTION_ID, x.AWARD_CHANNEL_ID });
                    table.ForeignKey(
                        name: "FK_PROMOTION_AWARD_CHANNEL_AWARD_CHANNEL_AWARD_CHANNEL_ID",
                        column: x => x.AWARD_CHANNEL_ID,
                        principalTable: "AWARD_CHANNEL",
                        principalColumn: "ID",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_PROMOTION_AWARD_CHANNEL_PROMOTION_PROMOTION_ID",
                        column: x => x.PROMOTION_ID,
                        principalTable: "PROMOTION",
                        principalColumn: "ID",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "PROMOTION_ISSUER_CHANNEL",
                columns: table => new
                {
                    PROMOTION_ID = table.Column<long>(nullable: false),
                    ISSUER_CHANNEL_ID = table.Column<long>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_PROMOTION_ISSUER_CHANNEL", x => new { x.PROMOTION_ID, x.ISSUER_CHANNEL_ID });
                    table.ForeignKey(
                        name: "FK_PROMOTION_ISSUER_CHANNEL_ISSUER_CHANNEL_ISSUER_CHANNEL_ID",
                        column: x => x.ISSUER_CHANNEL_ID,
                        principalTable: "ISSUER_CHANNEL",
                        principalColumn: "ID",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_PROMOTION_ISSUER_CHANNEL_PROMOTION_PROMOTION_ID",
                        column: x => x.PROMOTION_ID,
                        principalTable: "PROMOTION",
                        principalColumn: "ID",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "PROMOTION_PROPERTY",
                columns: table => new
                {
                    PROMOTION_ID = table.Column<long>(nullable: false),
                    PROPERTY_ID = table.Column<long>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_PROMOTION_PROPERTY", x => new { x.PROMOTION_ID, x.PROPERTY_ID });
                    table.ForeignKey(
                        name: "FK_PROMOTION_PROPERTY_PROMOTION_PROMOTION_ID",
                        column: x => x.PROMOTION_ID,
                        principalTable: "PROMOTION",
                        principalColumn: "ID",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_PROMOTION_PROPERTY_PROPERTY_PROPERTY_ID",
                        column: x => x.PROPERTY_ID,
                        principalTable: "PROPERTY",
                        principalColumn: "ID",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "NOTIFY_LIST",
                columns: table => new
                {
                    CHANNEL_ID = table.Column<long>(nullable: false),
                    SYSTEM_ID = table.Column<long>(nullable: false),
                    URL = table.Column<string>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_NOTIFY_LIST", x => new { x.SYSTEM_ID, x.CHANNEL_ID });
                    table.ForeignKey(
                        name: "FK_NOTIFY_LIST_ISSUER_CHANNEL_CHANNEL_ID",
                        column: x => x.CHANNEL_ID,
                        principalTable: "ISSUER_CHANNEL",
                        principalColumn: "ID",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_NOTIFY_LIST_SYSTEM_SYSTEM_ID",
                        column: x => x.SYSTEM_ID,
                        principalTable: "SYSTEM",
                        principalColumn: "ID",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "COUPON_AWARD_CHANNEL",
                columns: table => new
                {
                    COUPON_ID = table.Column<long>(nullable: false),
                    AWARD_CHANNEL_ID = table.Column<long>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_COUPON_AWARD_CHANNEL", x => new { x.COUPON_ID, x.AWARD_CHANNEL_ID });
                    table.ForeignKey(
                        name: "FK_COUPON_AWARD_CHANNEL_AWARD_CHANNEL_AWARD_CHANNEL_ID",
                        column: x => x.AWARD_CHANNEL_ID,
                        principalTable: "AWARD_CHANNEL",
                        principalColumn: "ID",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_COUPON_AWARD_CHANNEL_COUPON_COUPON_ID",
                        column: x => x.COUPON_ID,
                        principalTable: "COUPON",
                        principalColumn: "ID",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "COUPON_HISTORY",
                columns: table => new
                {
                    ID = table.Column<long>(nullable: false)
                        .Annotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn),
                    DATE = table.Column<DateTime>(nullable: false),
                    ACTION = table.Column<string>(nullable: true),
                    STATUS = table.Column<int>(nullable: false),
                    COUPON_ID = table.Column<long>(nullable: false),
                    USER = table.Column<string>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_COUPON_HISTORY", x => x.ID);
                    table.ForeignKey(
                        name: "FK_COUPON_HISTORY_COUPON_COUPON_ID",
                        column: x => x.COUPON_ID,
                        principalTable: "COUPON",
                        principalColumn: "ID",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "COUPON_ISSUER_CHANNEL",
                columns: table => new
                {
                    COUPON_ID = table.Column<long>(nullable: false),
                    ISSUER_CHANNEL_ID = table.Column<long>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_COUPON_ISSUER_CHANNEL", x => new { x.COUPON_ID, x.ISSUER_CHANNEL_ID });
                    table.ForeignKey(
                        name: "FK_COUPON_ISSUER_CHANNEL_COUPON_COUPON_ID",
                        column: x => x.COUPON_ID,
                        principalTable: "COUPON",
                        principalColumn: "ID",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_COUPON_ISSUER_CHANNEL_ISSUER_CHANNEL_ISSUER_CHANNEL_ID",
                        column: x => x.ISSUER_CHANNEL_ID,
                        principalTable: "ISSUER_CHANNEL",
                        principalColumn: "ID",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.InsertData(
                table: "ACCESS_LOG",
                columns: new[] { "ID", "ACTION", "APPLICATION_TYPE", "CHANNEL", "GRANTED", "ISSUED_DATE", "USERNAME" },
                values: new object[,]
                {
                    { 1L, "Create Promotion", 0, "POS", false, new DateTime(2020, 6, 12, 22, 20, 48, 467, DateTimeKind.Local).AddTicks(5607), "" },
                    { 2L, "Update Coupon", 1, "", false, new DateTime(2020, 6, 12, 22, 20, 48, 473, DateTimeKind.Local).AddTicks(8046), "korisnik" }
                });

            migrationBuilder.InsertData(
                table: "APPL_USER",
                columns: new[] { "USERNAME", "ACCESS_TYPE", "DOMAIN", "FULLNAME" },
                values: new object[,]
                {
                    { "ljubo", 1, "LJUBO-PC", "Ljubomir Kraljevic" },
                    { "traktor", 1, "LJUBO-PC", "DJ Fresh Prince" }
                });

            migrationBuilder.InsertData(
                table: "AWARD_CHANNEL",
                columns: new[] { "ID", "NAME" },
                values: new object[,]
                {
                    { 4L, "Telesales" },
                    { 3L, "SelfCare" },
                    { 1L, "POS" },
                    { 5L, "Webshop" }
                });

            migrationBuilder.InsertData(
                table: "ISSUER_CHANNEL",
                columns: new[] { "ID", "NAME" },
                values: new object[,]
                {
                    { 2L, "Salesforce" },
                    { 3L, "SelfCare" },
                    { 4L, "Telesales" },
                    { 5L, "Webshop" },
                    { 1L, "POS" }
                });

            migrationBuilder.InsertData(
                table: "PROMOTION",
                columns: new[] { "ID", "CODE", "COUPON_SERIES", "ENABLED", "VALID_FROM", "VALID_TO" },
                values: new object[,]
                {
                    { 16L, "Spring6", 0, true, new DateTime(2020, 3, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 5, 1, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 17L, "Easter6", 0, false, new DateTime(2020, 4, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 5, 1, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 18L, "Summer6", 0, true, new DateTime(2020, 6, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 9, 1, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 19L, "Spring7", 0, true, new DateTime(2020, 3, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 5, 1, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 22L, "Spring8", 0, true, new DateTime(2020, 3, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 5, 1, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 21L, "Summer7", 0, true, new DateTime(2020, 6, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 9, 1, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 23L, "Easter8", 0, false, new DateTime(2020, 4, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 5, 1, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 25L, "Bloom", 0, true, new DateTime(2020, 2, 14, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 3, 14, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 26L, "AllYear", 0, true, new DateTime(2020, 2, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 8, 1, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 20L, "Easter7", 0, false, new DateTime(2020, 4, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 5, 1, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 24L, "Summer8", 0, true, new DateTime(2020, 6, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 9, 1, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 15L, "Summer5", 0, true, new DateTime(2020, 6, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 9, 1, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 12L, "Summer4", 0, true, new DateTime(2020, 6, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 9, 1, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 1L, "Spring", 0, true, new DateTime(2020, 3, 20, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 5, 20, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 14L, "Easter5", 0, false, new DateTime(2020, 4, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 5, 1, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 3L, "Summer", 0, true, new DateTime(2020, 5, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 9, 1, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 4L, "SpringDown", 0, false, new DateTime(2020, 3, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 5, 1, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 5L, "EasterDown", 0, true, new DateTime(2020, 4, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 4, 12, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 2L, "Easter", 0, true, new DateTime(2020, 4, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 6, 1, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 7L, "FUNZIES!", 0, true, new DateTime(2020, 4, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 6, 1, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 8L, "NOTfunzies", 0, false, new DateTime(2020, 4, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 6, 1, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 9L, "Summer3", 0, true, new DateTime(2020, 6, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 9, 1, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 10L, "Spring4", 0, true, new DateTime(2020, 3, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 5, 1, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 11L, "Easter4", 0, false, new DateTime(2020, 4, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 5, 1, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 6L, "SummerDown", 0, false, new DateTime(2020, 6, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 9, 1, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 13L, "Spring5", 0, true, new DateTime(2020, 3, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 5, 1, 0, 0, 0, 0, DateTimeKind.Unspecified) }
                });

            migrationBuilder.InsertData(
                table: "PROPERTY",
                columns: new[] { "ID", "NAME" },
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
                table: "SYSTEM",
                columns: new[] { "ID", "NAME", "PASSWORD", "USERNAME" },
                values: new object[,]
                {
                    { 1L, "CRM", "test", "max" },
                    { 2L, "SalesForce", "test", "sf" }
                });

            migrationBuilder.InsertData(
                table: "COUPON",
                columns: new[] { "ID", "AQUIRE_FROM", "AQUIRE_TO", "AWARD_FROM", "AWARD_TO", "CODE", "COUPON_SERIES", "ENABLED", "HOLDER", "MAX_REDEEM_NO", "PROMOTION_ID", "STATUS", "USER" },
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
                table: "PROMOTION_AWARD_CHANNEL",
                columns: new[] { "PROMOTION_ID", "AWARD_CHANNEL_ID" },
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
                table: "PROMOTION_ISSUER_CHANNEL",
                columns: new[] { "PROMOTION_ID", "ISSUER_CHANNEL_ID" },
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
                table: "PROMOTION_PROPERTY",
                columns: new[] { "PROMOTION_ID", "PROPERTY_ID" },
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
                table: "COUPON_AWARD_CHANNEL",
                columns: new[] { "COUPON_ID", "AWARD_CHANNEL_ID" },
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
                table: "COUPON_ISSUER_CHANNEL",
                columns: new[] { "COUPON_ID", "ISSUER_CHANNEL_ID" },
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
                name: "IX_COUPON_CODE",
                table: "COUPON",
                column: "CODE",
                unique: true,
                filter: "[CODE] IS NOT NULL");

            migrationBuilder.CreateIndex(
                name: "IX_COUPON_PROMOTION_ID",
                table: "COUPON",
                column: "PROMOTION_ID");

            migrationBuilder.CreateIndex(
                name: "IX_COUPON_AWARD_CHANNEL_AWARD_CHANNEL_ID",
                table: "COUPON_AWARD_CHANNEL",
                column: "AWARD_CHANNEL_ID");

            migrationBuilder.CreateIndex(
                name: "IX_COUPON_HISTORY_COUPON_ID",
                table: "COUPON_HISTORY",
                column: "COUPON_ID");

            migrationBuilder.CreateIndex(
                name: "IX_COUPON_ISSUER_CHANNEL_ISSUER_CHANNEL_ID",
                table: "COUPON_ISSUER_CHANNEL",
                column: "ISSUER_CHANNEL_ID");

            migrationBuilder.CreateIndex(
                name: "IX_NOTIFY_LIST_CHANNEL_ID",
                table: "NOTIFY_LIST",
                column: "CHANNEL_ID");

            migrationBuilder.CreateIndex(
                name: "IX_PROMOTION_CODE",
                table: "PROMOTION",
                column: "CODE",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_PROMOTION_AWARD_CHANNEL_AWARD_CHANNEL_ID",
                table: "PROMOTION_AWARD_CHANNEL",
                column: "AWARD_CHANNEL_ID");

            migrationBuilder.CreateIndex(
                name: "IX_PROMOTION_ISSUER_CHANNEL_ISSUER_CHANNEL_ID",
                table: "PROMOTION_ISSUER_CHANNEL",
                column: "ISSUER_CHANNEL_ID");

            migrationBuilder.CreateIndex(
                name: "IX_PROMOTION_PROPERTY_PROPERTY_ID",
                table: "PROMOTION_PROPERTY",
                column: "PROPERTY_ID");

            migrationBuilder.CreateIndex(
                name: "IX_SYSTEM_NAME",
                table: "SYSTEM",
                column: "NAME",
                unique: true,
                filter: "[NAME] IS NOT NULL");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "ACCESS_LOG");

            migrationBuilder.DropTable(
                name: "APPL_USER");

            migrationBuilder.DropTable(
                name: "COUPON_AWARD_CHANNEL");

            migrationBuilder.DropTable(
                name: "COUPON_HISTORY");

            migrationBuilder.DropTable(
                name: "COUPON_ISSUER_CHANNEL");

            migrationBuilder.DropTable(
                name: "NOTIFY_LIST");

            migrationBuilder.DropTable(
                name: "PROMOTION_AWARD_CHANNEL");

            migrationBuilder.DropTable(
                name: "PROMOTION_ISSUER_CHANNEL");

            migrationBuilder.DropTable(
                name: "PROMOTION_PROPERTY");

            migrationBuilder.DropTable(
                name: "COUPON");

            migrationBuilder.DropTable(
                name: "SYSTEM");

            migrationBuilder.DropTable(
                name: "AWARD_CHANNEL");

            migrationBuilder.DropTable(
                name: "ISSUER_CHANNEL");

            migrationBuilder.DropTable(
                name: "PROPERTY");

            migrationBuilder.DropTable(
                name: "PROMOTION");
        }
    }
}
