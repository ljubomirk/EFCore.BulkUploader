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
                    CouponSeries = table.Column<int>(nullable: false)
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
                    { 15L, "Summer5", 0, true, new DateTime(2020, 6, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 9, 1, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 16L, "Spring6", 0, true, new DateTime(2020, 3, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 5, 1, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 17L, "Easter6", 0, false, new DateTime(2020, 4, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 5, 1, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 18L, "Summer6", 0, true, new DateTime(2020, 6, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 9, 1, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 19L, "Spring7", 0, true, new DateTime(2020, 3, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 5, 1, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 23L, "Easter8", 0, false, new DateTime(2020, 4, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 5, 1, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 21L, "Summer7", 0, true, new DateTime(2020, 6, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 9, 1, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 22L, "Spring8", 0, true, new DateTime(2020, 3, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 5, 1, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 14L, "Easter5", 0, false, new DateTime(2020, 4, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 5, 1, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 24L, "Summer8", 0, true, new DateTime(2020, 6, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 9, 1, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 20L, "Easter7", 0, false, new DateTime(2020, 4, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 5, 1, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 13L, "Spring5", 0, true, new DateTime(2020, 3, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 5, 1, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 11L, "Easter4", 0, false, new DateTime(2020, 4, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 5, 1, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 3L, "Summer", 0, true, new DateTime(2020, 5, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 9, 1, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 10L, "Spring4", 0, true, new DateTime(2020, 3, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 5, 1, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 9L, "Summer3", 0, true, new DateTime(2020, 6, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 9, 1, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 8L, "Easter3", 0, false, new DateTime(2020, 4, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 5, 1, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 7L, "Spring3", 0, true, new DateTime(2020, 3, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 5, 1, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 6L, "Summer2", 0, true, new DateTime(2020, 6, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 9, 1, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 5L, "Easter2", 0, false, new DateTime(2020, 4, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 5, 1, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 4L, "Spring2", 0, true, new DateTime(2020, 3, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 5, 1, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 12L, "Summer4", 0, true, new DateTime(2020, 6, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 9, 1, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 2L, "Easter", 0, true, new DateTime(2020, 4, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 6, 1, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 1L, "Spring", 0, true, new DateTime(2020, 3, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 5, 1, 0, 0, 0, 0, DateTimeKind.Unspecified) }
                });

            migrationBuilder.InsertData(
                table: "Property",
                columns: new[] { "Id", "Name" },
                values: new object[,]
                {
                    { 4L, "HolderIsOnlyConsumer" },
                    { 3L, "NamedConsumers" },
                    { 5L, "AllowMultipleRedeems" },
                    { 1L, "UniqueCoupons" },
                    { 2L, "NamedHolders" },
                    { 6L, "AllowCouponSeries" }
                });

            migrationBuilder.InsertData(
                table: "Coupon",
                columns: new[] { "Id", "AquireFrom", "AquireTo", "AwardFrom", "AwardTo", "Code", "CouponSeries", "Holder", "PromotionId", "Status", "User" },
                values: new object[,]
                {
                    { 2L, null, null, null, null, "EASTER1234567892", 1, "38640440481", 1L, 4, "38640440481" },
                    { 5L, null, null, null, null, "EASTER1234567895", 1, "", 2L, 2, "" },
                    { 1L, null, null, null, null, "EASTER1234567891", 1, "", 2L, 1, "" },
                    { 3L, null, null, null, null, "EASTER1234567893", 2, "38640440482", 1L, 2, "38640440482" },
                    { 4L, null, null, null, null, "EASTER1234567894", 3, "38640440483", 1L, 3, "38640440483" }
                });

            migrationBuilder.InsertData(
                table: "PromotionAwardChannel",
                columns: new[] { "PromotionId", "AwardChannelId" },
                values: new object[,]
                {
                    { 1L, 1L },
                    { 1L, 3L },
                    { 1L, 5L },
                    { 11L, 1L },
                    { 3L, 1L },
                    { 2L, 3L },
                    { 2L, 4L },
                    { 2L, 5L },
                    { 3L, 3L },
                    { 3L, 4L }
                });

            migrationBuilder.InsertData(
                table: "PromotionIssuerChannel",
                columns: new[] { "PromotionId", "IssuerChannelId" },
                values: new object[,]
                {
                    { 11L, 2L },
                    { 3L, 5L },
                    { 3L, 4L },
                    { 3L, 1L },
                    { 2L, 5L },
                    { 2L, 4L },
                    { 2L, 1L },
                    { 1L, 5L },
                    { 1L, 2L },
                    { 1L, 1L }
                });

            migrationBuilder.InsertData(
                table: "PromotionProperty",
                columns: new[] { "PromotionId", "PropertyId" },
                values: new object[,]
                {
                    { 2L, 1L },
                    { 11L, 1L },
                    { 1L, 2L },
                    { 7L, 2L },
                    { 1L, 4L },
                    { 5L, 4L },
                    { 2L, 6L },
                    { 3L, 6L }
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
                name: "CouponAwardChannel");

            migrationBuilder.DropTable(
                name: "CouponHistory");

            migrationBuilder.DropTable(
                name: "CouponIssuerChannel");

            migrationBuilder.DropTable(
                name: "PromotionAwardChannel");

            migrationBuilder.DropTable(
                name: "PromotionIssuerChannel");

            migrationBuilder.DropTable(
                name: "PromotionProperty");

            migrationBuilder.DropTable(
                name: "Coupon");

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
