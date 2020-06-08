using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace WebApp.Migrations
{
    public partial class OracleSnakeCase : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Coupon_Promotion_PromotionId",
                table: "Coupon");

            migrationBuilder.DropForeignKey(
                name: "FK_CouponAwardChannel_AwardChannel_AwardChannelId",
                table: "CouponAwardChannel");

            migrationBuilder.DropForeignKey(
                name: "FK_CouponAwardChannel_Coupon_CouponId",
                table: "CouponAwardChannel");

            migrationBuilder.DropForeignKey(
                name: "FK_CouponHistory_Coupon_CouponId",
                table: "CouponHistory");

            migrationBuilder.DropForeignKey(
                name: "FK_CouponIssuerChannel_Coupon_CouponId",
                table: "CouponIssuerChannel");

            migrationBuilder.DropForeignKey(
                name: "FK_CouponIssuerChannel_IssuerChannel_IssuerChannelId",
                table: "CouponIssuerChannel");

            migrationBuilder.DropForeignKey(
                name: "FK_NotifyList_IssuerChannel_ChannelId",
                table: "NotifyList");

            migrationBuilder.DropForeignKey(
                name: "FK_NotifyList_System_SystemId",
                table: "NotifyList");

            migrationBuilder.DropForeignKey(
                name: "FK_PromotionAwardChannel_AwardChannel_AwardChannelId",
                table: "PromotionAwardChannel");

            migrationBuilder.DropForeignKey(
                name: "FK_PromotionAwardChannel_Promotion_PromotionId",
                table: "PromotionAwardChannel");

            migrationBuilder.DropForeignKey(
                name: "FK_PromotionIssuerChannel_IssuerChannel_IssuerChannelId",
                table: "PromotionIssuerChannel");

            migrationBuilder.DropForeignKey(
                name: "FK_PromotionIssuerChannel_Promotion_PromotionId",
                table: "PromotionIssuerChannel");

            migrationBuilder.DropForeignKey(
                name: "FK_PromotionProperty_Promotion_PromotionId",
                table: "PromotionProperty");

            migrationBuilder.DropForeignKey(
                name: "FK_PromotionProperty_Property_PropertyId",
                table: "PromotionProperty");

            migrationBuilder.DropPrimaryKey(
                name: "PK_User",
                table: "User");

            migrationBuilder.DropPrimaryKey(
                name: "PK_System",
                table: "System");

            migrationBuilder.DropPrimaryKey(
                name: "PK_Property",
                table: "Property");

            migrationBuilder.DropPrimaryKey(
                name: "PK_Promotion",
                table: "Promotion");

            migrationBuilder.DropPrimaryKey(
                name: "PK_Coupon",
                table: "Coupon");

            migrationBuilder.DropIndex(
                name: "IX_Coupon_Code",
                table: "Coupon");

            migrationBuilder.DropPrimaryKey(
                name: "PK_PromotionProperty",
                table: "PromotionProperty");

            migrationBuilder.DropPrimaryKey(
                name: "PK_PromotionIssuerChannel",
                table: "PromotionIssuerChannel");

            migrationBuilder.DropPrimaryKey(
                name: "PK_PromotionAwardChannel",
                table: "PromotionAwardChannel");

            migrationBuilder.DropPrimaryKey(
                name: "PK_NotifyList",
                table: "NotifyList");

            migrationBuilder.DropPrimaryKey(
                name: "PK_IssuerChannel",
                table: "IssuerChannel");

            migrationBuilder.DropPrimaryKey(
                name: "PK_CouponIssuerChannel",
                table: "CouponIssuerChannel");

            migrationBuilder.DropPrimaryKey(
                name: "PK_CouponHistory",
                table: "CouponHistory");

            migrationBuilder.DropPrimaryKey(
                name: "PK_CouponAwardChannel",
                table: "CouponAwardChannel");

            migrationBuilder.DropPrimaryKey(
                name: "PK_AwardChannel",
                table: "AwardChannel");

            migrationBuilder.DropPrimaryKey(
                name: "PK_AccessLog",
                table: "AccessLog");

            migrationBuilder.RenameTable(
                name: "User",
                newName: "USER");

            migrationBuilder.RenameTable(
                name: "System",
                newName: "SYSTEM");

            migrationBuilder.RenameTable(
                name: "Property",
                newName: "PROPERTY");

            migrationBuilder.RenameTable(
                name: "Promotion",
                newName: "PROMOTION");

            migrationBuilder.RenameTable(
                name: "Coupon",
                newName: "COUPON");

            migrationBuilder.RenameTable(
                name: "PromotionProperty",
                newName: "PROMOTION_PROPERTY");

            migrationBuilder.RenameTable(
                name: "PromotionIssuerChannel",
                newName: "PROMOTION_ISSUER_CHANNEL");

            migrationBuilder.RenameTable(
                name: "PromotionAwardChannel",
                newName: "PROMOTION_AWARD_CHANNEL");

            migrationBuilder.RenameTable(
                name: "NotifyList",
                newName: "NOTIFY_LIST");

            migrationBuilder.RenameTable(
                name: "IssuerChannel",
                newName: "ISSUER_CHANNEL");

            migrationBuilder.RenameTable(
                name: "CouponIssuerChannel",
                newName: "COUPON_ISSUER_CHANNEL");

            migrationBuilder.RenameTable(
                name: "CouponHistory",
                newName: "COUPON_HISTORY");

            migrationBuilder.RenameTable(
                name: "CouponAwardChannel",
                newName: "COUPON_AWARD_CHANNEL");

            migrationBuilder.RenameTable(
                name: "AwardChannel",
                newName: "AWARD_CHANNEL");

            migrationBuilder.RenameTable(
                name: "AccessLog",
                newName: "ACCESS_LOG");

            migrationBuilder.RenameColumn(
                name: "Fullname",
                table: "USER",
                newName: "FULLNAME");

            migrationBuilder.RenameColumn(
                name: "Domain",
                table: "USER",
                newName: "DOMAIN");

            migrationBuilder.RenameColumn(
                name: "Username",
                table: "USER",
                newName: "USERNAME");

            migrationBuilder.RenameColumn(
                name: "AccessType",
                table: "USER",
                newName: "ACCESS_TYPE");

            migrationBuilder.RenameColumn(
                name: "Username",
                table: "SYSTEM",
                newName: "USERNAME");

            migrationBuilder.RenameColumn(
                name: "Password",
                table: "SYSTEM",
                newName: "PASSWORD");

            migrationBuilder.RenameColumn(
                name: "Name",
                table: "SYSTEM",
                newName: "NAME");

            migrationBuilder.RenameColumn(
                name: "Id",
                table: "SYSTEM",
                newName: "ID");

            migrationBuilder.RenameColumn(
                name: "Name",
                table: "PROPERTY",
                newName: "NAME");

            migrationBuilder.RenameColumn(
                name: "Id",
                table: "PROPERTY",
                newName: "ID");

            migrationBuilder.RenameColumn(
                name: "Enabled",
                table: "PROMOTION",
                newName: "ENABLED");

            migrationBuilder.RenameColumn(
                name: "Code",
                table: "PROMOTION",
                newName: "CODE");

            migrationBuilder.RenameColumn(
                name: "Id",
                table: "PROMOTION",
                newName: "ID");

            migrationBuilder.RenameColumn(
                name: "ValidTo",
                table: "PROMOTION",
                newName: "VALID_TO");

            migrationBuilder.RenameColumn(
                name: "ValidFrom",
                table: "PROMOTION",
                newName: "VALID_FROM");

            migrationBuilder.RenameColumn(
                name: "CouponSeries",
                table: "PROMOTION",
                newName: "COUPON_SERIES");

            migrationBuilder.RenameIndex(
                name: "IX_Promotion_Code",
                table: "PROMOTION",
                newName: "IX_PROMOTION_CODE");

            migrationBuilder.RenameColumn(
                name: "User",
                table: "COUPON",
                newName: "USER");

            migrationBuilder.RenameColumn(
                name: "Status",
                table: "COUPON",
                newName: "STATUS");

            migrationBuilder.RenameColumn(
                name: "Holder",
                table: "COUPON",
                newName: "HOLDER");

            migrationBuilder.RenameColumn(
                name: "Enabled",
                table: "COUPON",
                newName: "ENABLED");

            migrationBuilder.RenameColumn(
                name: "Code",
                table: "COUPON",
                newName: "CODE");

            migrationBuilder.RenameColumn(
                name: "Id",
                table: "COUPON",
                newName: "ID");

            migrationBuilder.RenameColumn(
                name: "PromotionId",
                table: "COUPON",
                newName: "PROMOTION_ID");

            migrationBuilder.RenameColumn(
                name: "MaxRedeemNo",
                table: "COUPON",
                newName: "MAX_REDEEM_NO");

            migrationBuilder.RenameColumn(
                name: "CouponSeries",
                table: "COUPON",
                newName: "COUPON_SERIES");

            migrationBuilder.RenameColumn(
                name: "AwardTo",
                table: "COUPON",
                newName: "AWARD_TO");

            migrationBuilder.RenameColumn(
                name: "AwardFrom",
                table: "COUPON",
                newName: "AWARD_FROM");

            migrationBuilder.RenameColumn(
                name: "AquireTo",
                table: "COUPON",
                newName: "AQUIRE_TO");

            migrationBuilder.RenameColumn(
                name: "AquireFrom",
                table: "COUPON",
                newName: "AQUIRE_FROM");

            migrationBuilder.RenameIndex(
                name: "IX_Coupon_PromotionId",
                table: "COUPON",
                newName: "IX_COUPON_PROMOTION_ID");

            migrationBuilder.RenameColumn(
                name: "PropertyId",
                table: "PROMOTION_PROPERTY",
                newName: "PROPERTY_ID");

            migrationBuilder.RenameColumn(
                name: "PromotionId",
                table: "PROMOTION_PROPERTY",
                newName: "PROMOTION_ID");

            migrationBuilder.RenameIndex(
                name: "IX_PromotionProperty_PropertyId",
                table: "PROMOTION_PROPERTY",
                newName: "IX_PROMOTION_PROPERTY_PROPERTY_ID");

            migrationBuilder.RenameColumn(
                name: "IssuerChannelId",
                table: "PROMOTION_ISSUER_CHANNEL",
                newName: "ISSUER_CHANNEL_ID");

            migrationBuilder.RenameColumn(
                name: "PromotionId",
                table: "PROMOTION_ISSUER_CHANNEL",
                newName: "PROMOTION_ID");

            migrationBuilder.RenameIndex(
                name: "IX_PromotionIssuerChannel_IssuerChannelId",
                table: "PROMOTION_ISSUER_CHANNEL",
                newName: "IX_PROMOTION_ISSUER_CHANNEL_ISSUER_CHANNEL_ID");

            migrationBuilder.RenameColumn(
                name: "AwardChannelId",
                table: "PROMOTION_AWARD_CHANNEL",
                newName: "AWARD_CHANNEL_ID");

            migrationBuilder.RenameColumn(
                name: "PromotionId",
                table: "PROMOTION_AWARD_CHANNEL",
                newName: "PROMOTION_ID");

            migrationBuilder.RenameIndex(
                name: "IX_PromotionAwardChannel_AwardChannelId",
                table: "PROMOTION_AWARD_CHANNEL",
                newName: "IX_PROMOTION_AWARD_CHANNEL_AWARD_CHANNEL_ID");

            migrationBuilder.RenameColumn(
                name: "Url",
                table: "NOTIFY_LIST",
                newName: "URL");

            migrationBuilder.RenameColumn(
                name: "ChannelId",
                table: "NOTIFY_LIST",
                newName: "CHANNEL_ID");

            migrationBuilder.RenameColumn(
                name: "SystemId",
                table: "NOTIFY_LIST",
                newName: "SYSTEM_ID");

            migrationBuilder.RenameIndex(
                name: "IX_NotifyList_ChannelId",
                table: "NOTIFY_LIST",
                newName: "IX_NOTIFY_LIST_CHANNEL_ID");

            migrationBuilder.RenameColumn(
                name: "Name",
                table: "ISSUER_CHANNEL",
                newName: "NAME");

            migrationBuilder.RenameColumn(
                name: "Id",
                table: "ISSUER_CHANNEL",
                newName: "ID");

            migrationBuilder.RenameColumn(
                name: "IssuerChannelId",
                table: "COUPON_ISSUER_CHANNEL",
                newName: "ISSUER_CHANNEL_ID");

            migrationBuilder.RenameColumn(
                name: "CouponId",
                table: "COUPON_ISSUER_CHANNEL",
                newName: "COUPON_ID");

            migrationBuilder.RenameIndex(
                name: "IX_CouponIssuerChannel_IssuerChannelId",
                table: "COUPON_ISSUER_CHANNEL",
                newName: "IX_COUPON_ISSUER_CHANNEL_ISSUER_CHANNEL_ID");

            migrationBuilder.RenameColumn(
                name: "User",
                table: "COUPON_HISTORY",
                newName: "USER");

            migrationBuilder.RenameColumn(
                name: "Status",
                table: "COUPON_HISTORY",
                newName: "STATUS");

            migrationBuilder.RenameColumn(
                name: "Date",
                table: "COUPON_HISTORY",
                newName: "DATE");

            migrationBuilder.RenameColumn(
                name: "Action",
                table: "COUPON_HISTORY",
                newName: "ACTION");

            migrationBuilder.RenameColumn(
                name: "Id",
                table: "COUPON_HISTORY",
                newName: "ID");

            migrationBuilder.RenameColumn(
                name: "CouponId",
                table: "COUPON_HISTORY",
                newName: "COUPON_ID");

            migrationBuilder.RenameIndex(
                name: "IX_CouponHistory_CouponId",
                table: "COUPON_HISTORY",
                newName: "IX_COUPON_HISTORY_COUPON_ID");

            migrationBuilder.RenameColumn(
                name: "AwardChannelId",
                table: "COUPON_AWARD_CHANNEL",
                newName: "AWARD_CHANNEL_ID");

            migrationBuilder.RenameColumn(
                name: "CouponId",
                table: "COUPON_AWARD_CHANNEL",
                newName: "COUPON_ID");

            migrationBuilder.RenameIndex(
                name: "IX_CouponAwardChannel_AwardChannelId",
                table: "COUPON_AWARD_CHANNEL",
                newName: "IX_COUPON_AWARD_CHANNEL_AWARD_CHANNEL_ID");

            migrationBuilder.RenameColumn(
                name: "Name",
                table: "AWARD_CHANNEL",
                newName: "NAME");

            migrationBuilder.RenameColumn(
                name: "Id",
                table: "AWARD_CHANNEL",
                newName: "ID");

            migrationBuilder.RenameColumn(
                name: "Username",
                table: "ACCESS_LOG",
                newName: "USERNAME");

            migrationBuilder.RenameColumn(
                name: "Granted",
                table: "ACCESS_LOG",
                newName: "GRANTED");

            migrationBuilder.RenameColumn(
                name: "Channel",
                table: "ACCESS_LOG",
                newName: "CHANNEL");

            migrationBuilder.RenameColumn(
                name: "Action",
                table: "ACCESS_LOG",
                newName: "ACTION");

            migrationBuilder.RenameColumn(
                name: "Id",
                table: "ACCESS_LOG",
                newName: "ID");

            migrationBuilder.RenameColumn(
                name: "IssuedDate",
                table: "ACCESS_LOG",
                newName: "ISSUED_DATE");

            migrationBuilder.RenameColumn(
                name: "ApplicationType",
                table: "ACCESS_LOG",
                newName: "APPLICATION_TYPE");

            migrationBuilder.AddPrimaryKey(
                name: "PK_USER",
                table: "USER",
                column: "USERNAME");

            migrationBuilder.AddPrimaryKey(
                name: "PK_SYSTEM",
                table: "SYSTEM",
                column: "ID");

            migrationBuilder.AddPrimaryKey(
                name: "PK_PROPERTY",
                table: "PROPERTY",
                column: "ID");

            migrationBuilder.AddPrimaryKey(
                name: "PK_PROMOTION",
                table: "PROMOTION",
                column: "ID");

            migrationBuilder.AddPrimaryKey(
                name: "PK_COUPON",
                table: "COUPON",
                column: "ID");

            migrationBuilder.AddPrimaryKey(
                name: "PK_PROMOTION_PROPERTY",
                table: "PROMOTION_PROPERTY",
                columns: new[] { "PROMOTION_ID", "PROPERTY_ID" });

            migrationBuilder.AddPrimaryKey(
                name: "PK_PROMOTION_ISSUER_CHANNEL",
                table: "PROMOTION_ISSUER_CHANNEL",
                columns: new[] { "PROMOTION_ID", "ISSUER_CHANNEL_ID" });

            migrationBuilder.AddPrimaryKey(
                name: "PK_PROMOTION_AWARD_CHANNEL",
                table: "PROMOTION_AWARD_CHANNEL",
                columns: new[] { "PROMOTION_ID", "AWARD_CHANNEL_ID" });

            migrationBuilder.AddPrimaryKey(
                name: "PK_NOTIFY_LIST",
                table: "NOTIFY_LIST",
                columns: new[] { "SYSTEM_ID", "CHANNEL_ID" });

            migrationBuilder.AddPrimaryKey(
                name: "PK_ISSUER_CHANNEL",
                table: "ISSUER_CHANNEL",
                column: "ID");

            migrationBuilder.AddPrimaryKey(
                name: "PK_COUPON_ISSUER_CHANNEL",
                table: "COUPON_ISSUER_CHANNEL",
                columns: new[] { "COUPON_ID", "ISSUER_CHANNEL_ID" });

            migrationBuilder.AddPrimaryKey(
                name: "PK_COUPON_HISTORY",
                table: "COUPON_HISTORY",
                column: "ID");

            migrationBuilder.AddPrimaryKey(
                name: "PK_COUPON_AWARD_CHANNEL",
                table: "COUPON_AWARD_CHANNEL",
                columns: new[] { "COUPON_ID", "AWARD_CHANNEL_ID" });

            migrationBuilder.AddPrimaryKey(
                name: "PK_AWARD_CHANNEL",
                table: "AWARD_CHANNEL",
                column: "ID");

            migrationBuilder.AddPrimaryKey(
                name: "PK_ACCESS_LOG",
                table: "ACCESS_LOG",
                column: "ID");

            migrationBuilder.UpdateData(
                table: "ACCESS_LOG",
                keyColumn: "ID",
                keyValue: 1L,
                column: "ISSUED_DATE",
                value: new DateTime(2020, 6, 6, 22, 27, 46, 684, DateTimeKind.Local).AddTicks(7673));

            migrationBuilder.UpdateData(
                table: "ACCESS_LOG",
                keyColumn: "ID",
                keyValue: 2L,
                column: "ISSUED_DATE",
                value: new DateTime(2020, 6, 6, 22, 27, 46, 688, DateTimeKind.Local).AddTicks(1070));

            migrationBuilder.CreateIndex(
                name: "IX_SYSTEM_NAME",
                table: "SYSTEM",
                column: "NAME",
                unique: true,
                filter: "[NAME] IS NOT NULL");

            migrationBuilder.CreateIndex(
                name: "IX_COUPON_CODE",
                table: "COUPON",
                column: "CODE",
                unique: true,
                filter: "[CODE] IS NOT NULL");

            migrationBuilder.AddForeignKey(
                name: "FK_COUPON_PROMOTION_PROMOTION_ID",
                table: "COUPON",
                column: "PROMOTION_ID",
                principalTable: "PROMOTION",
                principalColumn: "ID",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_COUPON_AWARD_CHANNEL_AWARD_CHANNEL_AWARD_CHANNEL_ID",
                table: "COUPON_AWARD_CHANNEL",
                column: "AWARD_CHANNEL_ID",
                principalTable: "AWARD_CHANNEL",
                principalColumn: "ID",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_COUPON_AWARD_CHANNEL_COUPON_COUPON_ID",
                table: "COUPON_AWARD_CHANNEL",
                column: "COUPON_ID",
                principalTable: "COUPON",
                principalColumn: "ID",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_COUPON_HISTORY_COUPON_COUPON_ID",
                table: "COUPON_HISTORY",
                column: "COUPON_ID",
                principalTable: "COUPON",
                principalColumn: "ID",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_COUPON_ISSUER_CHANNEL_COUPON_COUPON_ID",
                table: "COUPON_ISSUER_CHANNEL",
                column: "COUPON_ID",
                principalTable: "COUPON",
                principalColumn: "ID",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_COUPON_ISSUER_CHANNEL_ISSUER_CHANNEL_ISSUER_CHANNEL_ID",
                table: "COUPON_ISSUER_CHANNEL",
                column: "ISSUER_CHANNEL_ID",
                principalTable: "ISSUER_CHANNEL",
                principalColumn: "ID",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_NOTIFY_LIST_ISSUER_CHANNEL_CHANNEL_ID",
                table: "NOTIFY_LIST",
                column: "CHANNEL_ID",
                principalTable: "ISSUER_CHANNEL",
                principalColumn: "ID",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_NOTIFY_LIST_SYSTEM_SYSTEM_ID",
                table: "NOTIFY_LIST",
                column: "SYSTEM_ID",
                principalTable: "SYSTEM",
                principalColumn: "ID",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_PROMOTION_AWARD_CHANNEL_AWARD_CHANNEL_AWARD_CHANNEL_ID",
                table: "PROMOTION_AWARD_CHANNEL",
                column: "AWARD_CHANNEL_ID",
                principalTable: "AWARD_CHANNEL",
                principalColumn: "ID",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_PROMOTION_AWARD_CHANNEL_PROMOTION_PROMOTION_ID",
                table: "PROMOTION_AWARD_CHANNEL",
                column: "PROMOTION_ID",
                principalTable: "PROMOTION",
                principalColumn: "ID",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_PROMOTION_ISSUER_CHANNEL_ISSUER_CHANNEL_ISSUER_CHANNEL_ID",
                table: "PROMOTION_ISSUER_CHANNEL",
                column: "ISSUER_CHANNEL_ID",
                principalTable: "ISSUER_CHANNEL",
                principalColumn: "ID",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_PROMOTION_ISSUER_CHANNEL_PROMOTION_PROMOTION_ID",
                table: "PROMOTION_ISSUER_CHANNEL",
                column: "PROMOTION_ID",
                principalTable: "PROMOTION",
                principalColumn: "ID",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_PROMOTION_PROPERTY_PROMOTION_PROMOTION_ID",
                table: "PROMOTION_PROPERTY",
                column: "PROMOTION_ID",
                principalTable: "PROMOTION",
                principalColumn: "ID",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_PROMOTION_PROPERTY_PROPERTY_PROPERTY_ID",
                table: "PROMOTION_PROPERTY",
                column: "PROPERTY_ID",
                principalTable: "PROPERTY",
                principalColumn: "ID",
                onDelete: ReferentialAction.Cascade);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_COUPON_PROMOTION_PROMOTION_ID",
                table: "COUPON");

            migrationBuilder.DropForeignKey(
                name: "FK_COUPON_AWARD_CHANNEL_AWARD_CHANNEL_AWARD_CHANNEL_ID",
                table: "COUPON_AWARD_CHANNEL");

            migrationBuilder.DropForeignKey(
                name: "FK_COUPON_AWARD_CHANNEL_COUPON_COUPON_ID",
                table: "COUPON_AWARD_CHANNEL");

            migrationBuilder.DropForeignKey(
                name: "FK_COUPON_HISTORY_COUPON_COUPON_ID",
                table: "COUPON_HISTORY");

            migrationBuilder.DropForeignKey(
                name: "FK_COUPON_ISSUER_CHANNEL_COUPON_COUPON_ID",
                table: "COUPON_ISSUER_CHANNEL");

            migrationBuilder.DropForeignKey(
                name: "FK_COUPON_ISSUER_CHANNEL_ISSUER_CHANNEL_ISSUER_CHANNEL_ID",
                table: "COUPON_ISSUER_CHANNEL");

            migrationBuilder.DropForeignKey(
                name: "FK_NOTIFY_LIST_ISSUER_CHANNEL_CHANNEL_ID",
                table: "NOTIFY_LIST");

            migrationBuilder.DropForeignKey(
                name: "FK_NOTIFY_LIST_SYSTEM_SYSTEM_ID",
                table: "NOTIFY_LIST");

            migrationBuilder.DropForeignKey(
                name: "FK_PROMOTION_AWARD_CHANNEL_AWARD_CHANNEL_AWARD_CHANNEL_ID",
                table: "PROMOTION_AWARD_CHANNEL");

            migrationBuilder.DropForeignKey(
                name: "FK_PROMOTION_AWARD_CHANNEL_PROMOTION_PROMOTION_ID",
                table: "PROMOTION_AWARD_CHANNEL");

            migrationBuilder.DropForeignKey(
                name: "FK_PROMOTION_ISSUER_CHANNEL_ISSUER_CHANNEL_ISSUER_CHANNEL_ID",
                table: "PROMOTION_ISSUER_CHANNEL");

            migrationBuilder.DropForeignKey(
                name: "FK_PROMOTION_ISSUER_CHANNEL_PROMOTION_PROMOTION_ID",
                table: "PROMOTION_ISSUER_CHANNEL");

            migrationBuilder.DropForeignKey(
                name: "FK_PROMOTION_PROPERTY_PROMOTION_PROMOTION_ID",
                table: "PROMOTION_PROPERTY");

            migrationBuilder.DropForeignKey(
                name: "FK_PROMOTION_PROPERTY_PROPERTY_PROPERTY_ID",
                table: "PROMOTION_PROPERTY");

            migrationBuilder.DropPrimaryKey(
                name: "PK_USER",
                table: "USER");

            migrationBuilder.DropPrimaryKey(
                name: "PK_SYSTEM",
                table: "SYSTEM");

            migrationBuilder.DropIndex(
                name: "IX_SYSTEM_NAME",
                table: "SYSTEM");

            migrationBuilder.DropPrimaryKey(
                name: "PK_PROPERTY",
                table: "PROPERTY");

            migrationBuilder.DropPrimaryKey(
                name: "PK_PROMOTION",
                table: "PROMOTION");

            migrationBuilder.DropPrimaryKey(
                name: "PK_COUPON",
                table: "COUPON");

            migrationBuilder.DropIndex(
                name: "IX_COUPON_CODE",
                table: "COUPON");

            migrationBuilder.DropPrimaryKey(
                name: "PK_PROMOTION_PROPERTY",
                table: "PROMOTION_PROPERTY");

            migrationBuilder.DropPrimaryKey(
                name: "PK_PROMOTION_ISSUER_CHANNEL",
                table: "PROMOTION_ISSUER_CHANNEL");

            migrationBuilder.DropPrimaryKey(
                name: "PK_PROMOTION_AWARD_CHANNEL",
                table: "PROMOTION_AWARD_CHANNEL");

            migrationBuilder.DropPrimaryKey(
                name: "PK_NOTIFY_LIST",
                table: "NOTIFY_LIST");

            migrationBuilder.DropPrimaryKey(
                name: "PK_ISSUER_CHANNEL",
                table: "ISSUER_CHANNEL");

            migrationBuilder.DropPrimaryKey(
                name: "PK_COUPON_ISSUER_CHANNEL",
                table: "COUPON_ISSUER_CHANNEL");

            migrationBuilder.DropPrimaryKey(
                name: "PK_COUPON_HISTORY",
                table: "COUPON_HISTORY");

            migrationBuilder.DropPrimaryKey(
                name: "PK_COUPON_AWARD_CHANNEL",
                table: "COUPON_AWARD_CHANNEL");

            migrationBuilder.DropPrimaryKey(
                name: "PK_AWARD_CHANNEL",
                table: "AWARD_CHANNEL");

            migrationBuilder.DropPrimaryKey(
                name: "PK_ACCESS_LOG",
                table: "ACCESS_LOG");

            migrationBuilder.RenameTable(
                name: "USER",
                newName: "User");

            migrationBuilder.RenameTable(
                name: "SYSTEM",
                newName: "System");

            migrationBuilder.RenameTable(
                name: "PROPERTY",
                newName: "Property");

            migrationBuilder.RenameTable(
                name: "PROMOTION",
                newName: "Promotion");

            migrationBuilder.RenameTable(
                name: "COUPON",
                newName: "Coupon");

            migrationBuilder.RenameTable(
                name: "PROMOTION_PROPERTY",
                newName: "PromotionProperty");

            migrationBuilder.RenameTable(
                name: "PROMOTION_ISSUER_CHANNEL",
                newName: "PromotionIssuerChannel");

            migrationBuilder.RenameTable(
                name: "PROMOTION_AWARD_CHANNEL",
                newName: "PromotionAwardChannel");

            migrationBuilder.RenameTable(
                name: "NOTIFY_LIST",
                newName: "NotifyList");

            migrationBuilder.RenameTable(
                name: "ISSUER_CHANNEL",
                newName: "IssuerChannel");

            migrationBuilder.RenameTable(
                name: "COUPON_ISSUER_CHANNEL",
                newName: "CouponIssuerChannel");

            migrationBuilder.RenameTable(
                name: "COUPON_HISTORY",
                newName: "CouponHistory");

            migrationBuilder.RenameTable(
                name: "COUPON_AWARD_CHANNEL",
                newName: "CouponAwardChannel");

            migrationBuilder.RenameTable(
                name: "AWARD_CHANNEL",
                newName: "AwardChannel");

            migrationBuilder.RenameTable(
                name: "ACCESS_LOG",
                newName: "AccessLog");

            migrationBuilder.RenameColumn(
                name: "FULLNAME",
                table: "User",
                newName: "Fullname");

            migrationBuilder.RenameColumn(
                name: "DOMAIN",
                table: "User",
                newName: "Domain");

            migrationBuilder.RenameColumn(
                name: "USERNAME",
                table: "User",
                newName: "Username");

            migrationBuilder.RenameColumn(
                name: "ACCESS_TYPE",
                table: "User",
                newName: "AccessType");

            migrationBuilder.RenameColumn(
                name: "USERNAME",
                table: "System",
                newName: "Username");

            migrationBuilder.RenameColumn(
                name: "PASSWORD",
                table: "System",
                newName: "Password");

            migrationBuilder.RenameColumn(
                name: "NAME",
                table: "System",
                newName: "Name");

            migrationBuilder.RenameColumn(
                name: "ID",
                table: "System",
                newName: "Id");

            migrationBuilder.RenameColumn(
                name: "NAME",
                table: "Property",
                newName: "Name");

            migrationBuilder.RenameColumn(
                name: "ID",
                table: "Property",
                newName: "Id");

            migrationBuilder.RenameColumn(
                name: "ENABLED",
                table: "Promotion",
                newName: "Enabled");

            migrationBuilder.RenameColumn(
                name: "CODE",
                table: "Promotion",
                newName: "Code");

            migrationBuilder.RenameColumn(
                name: "ID",
                table: "Promotion",
                newName: "Id");

            migrationBuilder.RenameColumn(
                name: "VALID_TO",
                table: "Promotion",
                newName: "ValidTo");

            migrationBuilder.RenameColumn(
                name: "VALID_FROM",
                table: "Promotion",
                newName: "ValidFrom");

            migrationBuilder.RenameColumn(
                name: "COUPON_SERIES",
                table: "Promotion",
                newName: "CouponSeries");

            migrationBuilder.RenameIndex(
                name: "IX_PROMOTION_CODE",
                table: "Promotion",
                newName: "IX_Promotion_Code");

            migrationBuilder.RenameColumn(
                name: "USER",
                table: "Coupon",
                newName: "User");

            migrationBuilder.RenameColumn(
                name: "STATUS",
                table: "Coupon",
                newName: "Status");

            migrationBuilder.RenameColumn(
                name: "HOLDER",
                table: "Coupon",
                newName: "Holder");

            migrationBuilder.RenameColumn(
                name: "ENABLED",
                table: "Coupon",
                newName: "Enabled");

            migrationBuilder.RenameColumn(
                name: "CODE",
                table: "Coupon",
                newName: "Code");

            migrationBuilder.RenameColumn(
                name: "ID",
                table: "Coupon",
                newName: "Id");

            migrationBuilder.RenameColumn(
                name: "PROMOTION_ID",
                table: "Coupon",
                newName: "PromotionId");

            migrationBuilder.RenameColumn(
                name: "MAX_REDEEM_NO",
                table: "Coupon",
                newName: "MaxRedeemNo");

            migrationBuilder.RenameColumn(
                name: "COUPON_SERIES",
                table: "Coupon",
                newName: "CouponSeries");

            migrationBuilder.RenameColumn(
                name: "AWARD_TO",
                table: "Coupon",
                newName: "AwardTo");

            migrationBuilder.RenameColumn(
                name: "AWARD_FROM",
                table: "Coupon",
                newName: "AwardFrom");

            migrationBuilder.RenameColumn(
                name: "AQUIRE_TO",
                table: "Coupon",
                newName: "AquireTo");

            migrationBuilder.RenameColumn(
                name: "AQUIRE_FROM",
                table: "Coupon",
                newName: "AquireFrom");

            migrationBuilder.RenameIndex(
                name: "IX_COUPON_PROMOTION_ID",
                table: "Coupon",
                newName: "IX_Coupon_PromotionId");

            migrationBuilder.RenameColumn(
                name: "PROPERTY_ID",
                table: "PromotionProperty",
                newName: "PropertyId");

            migrationBuilder.RenameColumn(
                name: "PROMOTION_ID",
                table: "PromotionProperty",
                newName: "PromotionId");

            migrationBuilder.RenameIndex(
                name: "IX_PROMOTION_PROPERTY_PROPERTY_ID",
                table: "PromotionProperty",
                newName: "IX_PromotionProperty_PropertyId");

            migrationBuilder.RenameColumn(
                name: "ISSUER_CHANNEL_ID",
                table: "PromotionIssuerChannel",
                newName: "IssuerChannelId");

            migrationBuilder.RenameColumn(
                name: "PROMOTION_ID",
                table: "PromotionIssuerChannel",
                newName: "PromotionId");

            migrationBuilder.RenameIndex(
                name: "IX_PROMOTION_ISSUER_CHANNEL_ISSUER_CHANNEL_ID",
                table: "PromotionIssuerChannel",
                newName: "IX_PromotionIssuerChannel_IssuerChannelId");

            migrationBuilder.RenameColumn(
                name: "AWARD_CHANNEL_ID",
                table: "PromotionAwardChannel",
                newName: "AwardChannelId");

            migrationBuilder.RenameColumn(
                name: "PROMOTION_ID",
                table: "PromotionAwardChannel",
                newName: "PromotionId");

            migrationBuilder.RenameIndex(
                name: "IX_PROMOTION_AWARD_CHANNEL_AWARD_CHANNEL_ID",
                table: "PromotionAwardChannel",
                newName: "IX_PromotionAwardChannel_AwardChannelId");

            migrationBuilder.RenameColumn(
                name: "URL",
                table: "NotifyList",
                newName: "Url");

            migrationBuilder.RenameColumn(
                name: "CHANNEL_ID",
                table: "NotifyList",
                newName: "ChannelId");

            migrationBuilder.RenameColumn(
                name: "SYSTEM_ID",
                table: "NotifyList",
                newName: "SystemId");

            migrationBuilder.RenameIndex(
                name: "IX_NOTIFY_LIST_CHANNEL_ID",
                table: "NotifyList",
                newName: "IX_NotifyList_ChannelId");

            migrationBuilder.RenameColumn(
                name: "NAME",
                table: "IssuerChannel",
                newName: "Name");

            migrationBuilder.RenameColumn(
                name: "ID",
                table: "IssuerChannel",
                newName: "Id");

            migrationBuilder.RenameColumn(
                name: "ISSUER_CHANNEL_ID",
                table: "CouponIssuerChannel",
                newName: "IssuerChannelId");

            migrationBuilder.RenameColumn(
                name: "COUPON_ID",
                table: "CouponIssuerChannel",
                newName: "CouponId");

            migrationBuilder.RenameIndex(
                name: "IX_COUPON_ISSUER_CHANNEL_ISSUER_CHANNEL_ID",
                table: "CouponIssuerChannel",
                newName: "IX_CouponIssuerChannel_IssuerChannelId");

            migrationBuilder.RenameColumn(
                name: "USER",
                table: "CouponHistory",
                newName: "User");

            migrationBuilder.RenameColumn(
                name: "STATUS",
                table: "CouponHistory",
                newName: "Status");

            migrationBuilder.RenameColumn(
                name: "DATE",
                table: "CouponHistory",
                newName: "Date");

            migrationBuilder.RenameColumn(
                name: "ACTION",
                table: "CouponHistory",
                newName: "Action");

            migrationBuilder.RenameColumn(
                name: "ID",
                table: "CouponHistory",
                newName: "Id");

            migrationBuilder.RenameColumn(
                name: "COUPON_ID",
                table: "CouponHistory",
                newName: "CouponId");

            migrationBuilder.RenameIndex(
                name: "IX_COUPON_HISTORY_COUPON_ID",
                table: "CouponHistory",
                newName: "IX_CouponHistory_CouponId");

            migrationBuilder.RenameColumn(
                name: "AWARD_CHANNEL_ID",
                table: "CouponAwardChannel",
                newName: "AwardChannelId");

            migrationBuilder.RenameColumn(
                name: "COUPON_ID",
                table: "CouponAwardChannel",
                newName: "CouponId");

            migrationBuilder.RenameIndex(
                name: "IX_COUPON_AWARD_CHANNEL_AWARD_CHANNEL_ID",
                table: "CouponAwardChannel",
                newName: "IX_CouponAwardChannel_AwardChannelId");

            migrationBuilder.RenameColumn(
                name: "NAME",
                table: "AwardChannel",
                newName: "Name");

            migrationBuilder.RenameColumn(
                name: "ID",
                table: "AwardChannel",
                newName: "Id");

            migrationBuilder.RenameColumn(
                name: "USERNAME",
                table: "AccessLog",
                newName: "Username");

            migrationBuilder.RenameColumn(
                name: "GRANTED",
                table: "AccessLog",
                newName: "Granted");

            migrationBuilder.RenameColumn(
                name: "CHANNEL",
                table: "AccessLog",
                newName: "Channel");

            migrationBuilder.RenameColumn(
                name: "ACTION",
                table: "AccessLog",
                newName: "Action");

            migrationBuilder.RenameColumn(
                name: "ID",
                table: "AccessLog",
                newName: "Id");

            migrationBuilder.RenameColumn(
                name: "ISSUED_DATE",
                table: "AccessLog",
                newName: "IssuedDate");

            migrationBuilder.RenameColumn(
                name: "APPLICATION_TYPE",
                table: "AccessLog",
                newName: "ApplicationType");

            migrationBuilder.AddPrimaryKey(
                name: "PK_User",
                table: "User",
                column: "Username");

            migrationBuilder.AddPrimaryKey(
                name: "PK_System",
                table: "System",
                column: "Id");

            migrationBuilder.AddPrimaryKey(
                name: "PK_Property",
                table: "Property",
                column: "Id");

            migrationBuilder.AddPrimaryKey(
                name: "PK_Promotion",
                table: "Promotion",
                column: "Id");

            migrationBuilder.AddPrimaryKey(
                name: "PK_Coupon",
                table: "Coupon",
                column: "Id");

            migrationBuilder.AddPrimaryKey(
                name: "PK_PromotionProperty",
                table: "PromotionProperty",
                columns: new[] { "PromotionId", "PropertyId" });

            migrationBuilder.AddPrimaryKey(
                name: "PK_PromotionIssuerChannel",
                table: "PromotionIssuerChannel",
                columns: new[] { "PromotionId", "IssuerChannelId" });

            migrationBuilder.AddPrimaryKey(
                name: "PK_PromotionAwardChannel",
                table: "PromotionAwardChannel",
                columns: new[] { "PromotionId", "AwardChannelId" });

            migrationBuilder.AddPrimaryKey(
                name: "PK_NotifyList",
                table: "NotifyList",
                columns: new[] { "SystemId", "ChannelId" });

            migrationBuilder.AddPrimaryKey(
                name: "PK_IssuerChannel",
                table: "IssuerChannel",
                column: "Id");

            migrationBuilder.AddPrimaryKey(
                name: "PK_CouponIssuerChannel",
                table: "CouponIssuerChannel",
                columns: new[] { "CouponId", "IssuerChannelId" });

            migrationBuilder.AddPrimaryKey(
                name: "PK_CouponHistory",
                table: "CouponHistory",
                column: "Id");

            migrationBuilder.AddPrimaryKey(
                name: "PK_CouponAwardChannel",
                table: "CouponAwardChannel",
                columns: new[] { "CouponId", "AwardChannelId" });

            migrationBuilder.AddPrimaryKey(
                name: "PK_AwardChannel",
                table: "AwardChannel",
                column: "Id");

            migrationBuilder.AddPrimaryKey(
                name: "PK_AccessLog",
                table: "AccessLog",
                column: "Id");

            migrationBuilder.UpdateData(
                table: "AccessLog",
                keyColumn: "Id",
                keyValue: 1L,
                column: "IssuedDate",
                value: new DateTime(2020, 5, 6, 19, 24, 41, 867, DateTimeKind.Local).AddTicks(7586));

            migrationBuilder.UpdateData(
                table: "AccessLog",
                keyColumn: "Id",
                keyValue: 2L,
                column: "IssuedDate",
                value: new DateTime(2020, 5, 6, 19, 24, 41, 871, DateTimeKind.Local).AddTicks(6896));

            migrationBuilder.CreateIndex(
                name: "IX_Coupon_Code",
                table: "Coupon",
                column: "Code",
                unique: true,
                filter: "[Code] IS NOT NULL");

            migrationBuilder.AddForeignKey(
                name: "FK_Coupon_Promotion_PromotionId",
                table: "Coupon",
                column: "PromotionId",
                principalTable: "Promotion",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_CouponAwardChannel_AwardChannel_AwardChannelId",
                table: "CouponAwardChannel",
                column: "AwardChannelId",
                principalTable: "AwardChannel",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_CouponAwardChannel_Coupon_CouponId",
                table: "CouponAwardChannel",
                column: "CouponId",
                principalTable: "Coupon",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_CouponHistory_Coupon_CouponId",
                table: "CouponHistory",
                column: "CouponId",
                principalTable: "Coupon",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_CouponIssuerChannel_Coupon_CouponId",
                table: "CouponIssuerChannel",
                column: "CouponId",
                principalTable: "Coupon",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_CouponIssuerChannel_IssuerChannel_IssuerChannelId",
                table: "CouponIssuerChannel",
                column: "IssuerChannelId",
                principalTable: "IssuerChannel",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_NotifyList_IssuerChannel_ChannelId",
                table: "NotifyList",
                column: "ChannelId",
                principalTable: "IssuerChannel",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_NotifyList_System_SystemId",
                table: "NotifyList",
                column: "SystemId",
                principalTable: "System",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_PromotionAwardChannel_AwardChannel_AwardChannelId",
                table: "PromotionAwardChannel",
                column: "AwardChannelId",
                principalTable: "AwardChannel",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_PromotionAwardChannel_Promotion_PromotionId",
                table: "PromotionAwardChannel",
                column: "PromotionId",
                principalTable: "Promotion",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_PromotionIssuerChannel_IssuerChannel_IssuerChannelId",
                table: "PromotionIssuerChannel",
                column: "IssuerChannelId",
                principalTable: "IssuerChannel",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_PromotionIssuerChannel_Promotion_PromotionId",
                table: "PromotionIssuerChannel",
                column: "PromotionId",
                principalTable: "Promotion",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_PromotionProperty_Promotion_PromotionId",
                table: "PromotionProperty",
                column: "PromotionId",
                principalTable: "Promotion",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_PromotionProperty_Property_PropertyId",
                table: "PromotionProperty",
                column: "PropertyId",
                principalTable: "Property",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
