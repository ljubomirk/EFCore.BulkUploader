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
                name: "AwardChannels",
                columns: table => new
                {
                    Id = table.Column<long>(nullable: false)
                        .Annotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn),
                    Name = table.Column<string>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AwardChannels", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "IssuerChannels",
                columns: table => new
                {
                    Id = table.Column<long>(nullable: false)
                        .Annotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn),
                    Name = table.Column<string>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_IssuerChannels", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Promotion",
                columns: table => new
                {
                    Id = table.Column<long>(nullable: false)
                        .Annotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn),
                    Code = table.Column<string>(maxLength: 20, nullable: false),
                    Enabled = table.Column<bool>(nullable: false),
                    ValidFrom = table.Column<DateTime>(nullable: false),
                    ValidTo = table.Column<DateTime>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Promotion", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Properties",
                columns: table => new
                {
                    Id = table.Column<long>(nullable: false)
                        .Annotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn),
                    Name = table.Column<string>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Properties", x => x.Id);
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
                    AquireFrom = table.Column<DateTime>(nullable: false),
                    AquireTo = table.Column<DateTime>(nullable: false),
                    AwardFrom = table.Column<DateTime>(nullable: false),
                    AwardTo = table.Column<DateTime>(nullable: false),
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
                        name: "FK_PromotionAwardChannel_AwardChannels_AwardChannelId",
                        column: x => x.AwardChannelId,
                        principalTable: "AwardChannels",
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
                        name: "FK_PromotionIssuerChannel_IssuerChannels_IssuerChannelId",
                        column: x => x.IssuerChannelId,
                        principalTable: "IssuerChannels",
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
                name: "PromotionProperties",
                columns: table => new
                {
                    PromotionId = table.Column<long>(nullable: false),
                    PropertyId = table.Column<long>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_PromotionProperties", x => new { x.PromotionId, x.PropertyId });
                    table.ForeignKey(
                        name: "FK_PromotionProperties_Promotion_PromotionId",
                        column: x => x.PromotionId,
                        principalTable: "Promotion",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_PromotionProperties_Properties_PropertyId",
                        column: x => x.PropertyId,
                        principalTable: "Properties",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "CouponHistory",
                columns: table => new
                {
                    CouponHistoryId = table.Column<long>(nullable: false)
                        .Annotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn),
                    UpdateDate = table.Column<DateTime>(nullable: false),
                    Status = table.Column<int>(nullable: false),
                    CouponId = table.Column<long>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_CouponHistory", x => x.CouponHistoryId);
                    table.ForeignKey(
                        name: "FK_CouponHistory_Coupon_CouponId",
                        column: x => x.CouponId,
                        principalTable: "Coupon",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.InsertData(
                table: "AwardChannels",
                columns: new[] { "Id", "Name" },
                values: new object[,]
                {
                    { 1L, "POS" },
                    { 3L, "SelfCare" },
                    { 4L, "Telesales" },
                    { 5L, "Webshop" }
                });

            migrationBuilder.InsertData(
                table: "IssuerChannels",
                columns: new[] { "Id", "Name" },
                values: new object[,]
                {
                    { 4L, "Telesales" },
                    { 3L, "SelfCare" },
                    { 5L, "Webshop" },
                    { 1L, "POS" },
                    { 2L, "Salesforce" }
                });

            migrationBuilder.InsertData(
                table: "Promotion",
                columns: new[] { "Id", "Code", "Enabled", "ValidFrom", "ValidTo" },
                values: new object[,]
                {
                    { 1L, "Spring", true, new DateTime(2020, 3, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 5, 1, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 2L, "Easter", false, new DateTime(2020, 4, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 5, 1, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 3L, "Summer", true, new DateTime(2020, 6, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 9, 1, 0, 0, 0, 0, DateTimeKind.Unspecified) }
                });

            migrationBuilder.InsertData(
                table: "Properties",
                columns: new[] { "Id", "Name" },
                values: new object[,]
                {
                    { 5L, "AlloweMultipleRedeems" },
                    { 1L, "UniqueCoupons" },
                    { 2L, "NamedHolders" },
                    { 3L, "NamedConsumers" },
                    { 4L, "HolderIsOnlyConsumer" },
                    { 6L, "AllowCouponSeries" }
                });

            migrationBuilder.InsertData(
                table: "Coupon",
                columns: new[] { "Id", "AquireFrom", "AquireTo", "AwardFrom", "AwardTo", "Code", "CouponSeries", "Holder", "PromotionId", "Status", "User" },
                values: new object[] { 1L, new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), "SP1234567890", 0, "38640440480", 1L, 2, "38640440480" });

            migrationBuilder.InsertData(
                table: "PromotionProperties",
                columns: new[] { "PromotionId", "PropertyId" },
                values: new object[] { 1L, 2L });

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
                name: "IX_CouponHistory_CouponId",
                table: "CouponHistory",
                column: "CouponId");

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
                name: "IX_PromotionProperties_PropertyId",
                table: "PromotionProperties",
                column: "PropertyId");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "CouponHistory");

            migrationBuilder.DropTable(
                name: "PromotionAwardChannel");

            migrationBuilder.DropTable(
                name: "PromotionIssuerChannel");

            migrationBuilder.DropTable(
                name: "PromotionProperties");

            migrationBuilder.DropTable(
                name: "Coupon");

            migrationBuilder.DropTable(
                name: "AwardChannels");

            migrationBuilder.DropTable(
                name: "IssuerChannels");

            migrationBuilder.DropTable(
                name: "Properties");

            migrationBuilder.DropTable(
                name: "Promotion");
        }
    }
}
