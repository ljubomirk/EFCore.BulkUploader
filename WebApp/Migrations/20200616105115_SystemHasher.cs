using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace WebApp.Migrations
{
    public partial class SystemHasher : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DeleteData(
                table: "ACCESS_LOG",
                keyColumn: "ID",
                keyValue: 1L);

            migrationBuilder.DeleteData(
                table: "ACCESS_LOG",
                keyColumn: "ID",
                keyValue: 2L);

            migrationBuilder.DeleteData(
                table: "APPL_USER",
                keyColumn: "USERNAME",
                keyValue: "ljubo");

            migrationBuilder.DeleteData(
                table: "APPL_USER",
                keyColumn: "USERNAME",
                keyValue: "traktor");

            migrationBuilder.DeleteData(
                table: "COUPON",
                keyColumn: "ID",
                keyValue: 14L);

            migrationBuilder.DeleteData(
                table: "COUPON",
                keyColumn: "ID",
                keyValue: 16L);

            migrationBuilder.DeleteData(
                table: "COUPON",
                keyColumn: "ID",
                keyValue: 23L);

            migrationBuilder.DeleteData(
                table: "COUPON",
                keyColumn: "ID",
                keyValue: 24L);

            migrationBuilder.DeleteData(
                table: "COUPON",
                keyColumn: "ID",
                keyValue: 25L);

            migrationBuilder.DeleteData(
                table: "COUPON",
                keyColumn: "ID",
                keyValue: 26L);

            migrationBuilder.DeleteData(
                table: "COUPON",
                keyColumn: "ID",
                keyValue: 27L);

            migrationBuilder.DeleteData(
                table: "COUPON",
                keyColumn: "ID",
                keyValue: 28L);

            migrationBuilder.DeleteData(
                table: "COUPON",
                keyColumn: "ID",
                keyValue: 29L);

            migrationBuilder.DeleteData(
                table: "COUPON",
                keyColumn: "ID",
                keyValue: 30L);

            migrationBuilder.DeleteData(
                table: "COUPON",
                keyColumn: "ID",
                keyValue: 31L);

            migrationBuilder.DeleteData(
                table: "COUPON",
                keyColumn: "ID",
                keyValue: 32L);

            migrationBuilder.DeleteData(
                table: "COUPON",
                keyColumn: "ID",
                keyValue: 33L);

            migrationBuilder.DeleteData(
                table: "COUPON",
                keyColumn: "ID",
                keyValue: 34L);

            migrationBuilder.DeleteData(
                table: "COUPON",
                keyColumn: "ID",
                keyValue: 35L);

            migrationBuilder.DeleteData(
                table: "COUPON",
                keyColumn: "ID",
                keyValue: 36L);

            migrationBuilder.DeleteData(
                table: "COUPON",
                keyColumn: "ID",
                keyValue: 37L);

            migrationBuilder.DeleteData(
                table: "COUPON",
                keyColumn: "ID",
                keyValue: 39L);

            migrationBuilder.DeleteData(
                table: "COUPON",
                keyColumn: "ID",
                keyValue: 40L);

            migrationBuilder.DeleteData(
                table: "COUPON",
                keyColumn: "ID",
                keyValue: 41L);

            migrationBuilder.DeleteData(
                table: "COUPON",
                keyColumn: "ID",
                keyValue: 42L);

            migrationBuilder.DeleteData(
                table: "COUPON_AWARD_CHANNEL",
                keyColumns: new[] { "COUPON_ID", "AWARD_CHANNEL_ID" },
                keyValues: new object[] { 6L, 1L });

            migrationBuilder.DeleteData(
                table: "COUPON_AWARD_CHANNEL",
                keyColumns: new[] { "COUPON_ID", "AWARD_CHANNEL_ID" },
                keyValues: new object[] { 7L, 5L });

            migrationBuilder.DeleteData(
                table: "COUPON_AWARD_CHANNEL",
                keyColumns: new[] { "COUPON_ID", "AWARD_CHANNEL_ID" },
                keyValues: new object[] { 13L, 1L });

            migrationBuilder.DeleteData(
                table: "COUPON_AWARD_CHANNEL",
                keyColumns: new[] { "COUPON_ID", "AWARD_CHANNEL_ID" },
                keyValues: new object[] { 15L, 5L });

            migrationBuilder.DeleteData(
                table: "COUPON_AWARD_CHANNEL",
                keyColumns: new[] { "COUPON_ID", "AWARD_CHANNEL_ID" },
                keyValues: new object[] { 20L, 3L });

            migrationBuilder.DeleteData(
                table: "COUPON_AWARD_CHANNEL",
                keyColumns: new[] { "COUPON_ID", "AWARD_CHANNEL_ID" },
                keyValues: new object[] { 21L, 3L });

            migrationBuilder.DeleteData(
                table: "COUPON_AWARD_CHANNEL",
                keyColumns: new[] { "COUPON_ID", "AWARD_CHANNEL_ID" },
                keyValues: new object[] { 22L, 5L });

            migrationBuilder.DeleteData(
                table: "COUPON_AWARD_CHANNEL",
                keyColumns: new[] { "COUPON_ID", "AWARD_CHANNEL_ID" },
                keyValues: new object[] { 38L, 1L });

            migrationBuilder.DeleteData(
                table: "COUPON_AWARD_CHANNEL",
                keyColumns: new[] { "COUPON_ID", "AWARD_CHANNEL_ID" },
                keyValues: new object[] { 43L, 1L });

            migrationBuilder.DeleteData(
                table: "COUPON_AWARD_CHANNEL",
                keyColumns: new[] { "COUPON_ID", "AWARD_CHANNEL_ID" },
                keyValues: new object[] { 44L, 1L });

            migrationBuilder.DeleteData(
                table: "COUPON_AWARD_CHANNEL",
                keyColumns: new[] { "COUPON_ID", "AWARD_CHANNEL_ID" },
                keyValues: new object[] { 45L, 3L });

            migrationBuilder.DeleteData(
                table: "COUPON_AWARD_CHANNEL",
                keyColumns: new[] { "COUPON_ID", "AWARD_CHANNEL_ID" },
                keyValues: new object[] { 46L, 3L });

            migrationBuilder.DeleteData(
                table: "COUPON_AWARD_CHANNEL",
                keyColumns: new[] { "COUPON_ID", "AWARD_CHANNEL_ID" },
                keyValues: new object[] { 47L, 4L });

            migrationBuilder.DeleteData(
                table: "COUPON_AWARD_CHANNEL",
                keyColumns: new[] { "COUPON_ID", "AWARD_CHANNEL_ID" },
                keyValues: new object[] { 48L, 4L });

            migrationBuilder.DeleteData(
                table: "COUPON_AWARD_CHANNEL",
                keyColumns: new[] { "COUPON_ID", "AWARD_CHANNEL_ID" },
                keyValues: new object[] { 49L, 5L });

            migrationBuilder.DeleteData(
                table: "COUPON_AWARD_CHANNEL",
                keyColumns: new[] { "COUPON_ID", "AWARD_CHANNEL_ID" },
                keyValues: new object[] { 50L, 5L });

            migrationBuilder.DeleteData(
                table: "COUPON_ISSUER_CHANNEL",
                keyColumns: new[] { "COUPON_ID", "ISSUER_CHANNEL_ID" },
                keyValues: new object[] { 2L, 1L });

            migrationBuilder.DeleteData(
                table: "COUPON_ISSUER_CHANNEL",
                keyColumns: new[] { "COUPON_ID", "ISSUER_CHANNEL_ID" },
                keyValues: new object[] { 3L, 1L });

            migrationBuilder.DeleteData(
                table: "COUPON_ISSUER_CHANNEL",
                keyColumns: new[] { "COUPON_ID", "ISSUER_CHANNEL_ID" },
                keyValues: new object[] { 4L, 1L });

            migrationBuilder.DeleteData(
                table: "COUPON_ISSUER_CHANNEL",
                keyColumns: new[] { "COUPON_ID", "ISSUER_CHANNEL_ID" },
                keyValues: new object[] { 5L, 5L });

            migrationBuilder.DeleteData(
                table: "COUPON_ISSUER_CHANNEL",
                keyColumns: new[] { "COUPON_ID", "ISSUER_CHANNEL_ID" },
                keyValues: new object[] { 6L, 1L });

            migrationBuilder.DeleteData(
                table: "COUPON_ISSUER_CHANNEL",
                keyColumns: new[] { "COUPON_ID", "ISSUER_CHANNEL_ID" },
                keyValues: new object[] { 7L, 5L });

            migrationBuilder.DeleteData(
                table: "COUPON_ISSUER_CHANNEL",
                keyColumns: new[] { "COUPON_ID", "ISSUER_CHANNEL_ID" },
                keyValues: new object[] { 8L, 4L });

            migrationBuilder.DeleteData(
                table: "COUPON_ISSUER_CHANNEL",
                keyColumns: new[] { "COUPON_ID", "ISSUER_CHANNEL_ID" },
                keyValues: new object[] { 9L, 5L });

            migrationBuilder.DeleteData(
                table: "COUPON_ISSUER_CHANNEL",
                keyColumns: new[] { "COUPON_ID", "ISSUER_CHANNEL_ID" },
                keyValues: new object[] { 10L, 2L });

            migrationBuilder.DeleteData(
                table: "COUPON_ISSUER_CHANNEL",
                keyColumns: new[] { "COUPON_ID", "ISSUER_CHANNEL_ID" },
                keyValues: new object[] { 11L, 1L });

            migrationBuilder.DeleteData(
                table: "COUPON_ISSUER_CHANNEL",
                keyColumns: new[] { "COUPON_ID", "ISSUER_CHANNEL_ID" },
                keyValues: new object[] { 12L, 3L });

            migrationBuilder.DeleteData(
                table: "COUPON_ISSUER_CHANNEL",
                keyColumns: new[] { "COUPON_ID", "ISSUER_CHANNEL_ID" },
                keyValues: new object[] { 13L, 1L });

            migrationBuilder.DeleteData(
                table: "COUPON_ISSUER_CHANNEL",
                keyColumns: new[] { "COUPON_ID", "ISSUER_CHANNEL_ID" },
                keyValues: new object[] { 15L, 5L });

            migrationBuilder.DeleteData(
                table: "COUPON_ISSUER_CHANNEL",
                keyColumns: new[] { "COUPON_ID", "ISSUER_CHANNEL_ID" },
                keyValues: new object[] { 17L, 5L });

            migrationBuilder.DeleteData(
                table: "COUPON_ISSUER_CHANNEL",
                keyColumns: new[] { "COUPON_ID", "ISSUER_CHANNEL_ID" },
                keyValues: new object[] { 18L, 5L });

            migrationBuilder.DeleteData(
                table: "COUPON_ISSUER_CHANNEL",
                keyColumns: new[] { "COUPON_ID", "ISSUER_CHANNEL_ID" },
                keyValues: new object[] { 19L, 5L });

            migrationBuilder.DeleteData(
                table: "COUPON_ISSUER_CHANNEL",
                keyColumns: new[] { "COUPON_ID", "ISSUER_CHANNEL_ID" },
                keyValues: new object[] { 20L, 3L });

            migrationBuilder.DeleteData(
                table: "COUPON_ISSUER_CHANNEL",
                keyColumns: new[] { "COUPON_ID", "ISSUER_CHANNEL_ID" },
                keyValues: new object[] { 21L, 3L });

            migrationBuilder.DeleteData(
                table: "COUPON_ISSUER_CHANNEL",
                keyColumns: new[] { "COUPON_ID", "ISSUER_CHANNEL_ID" },
                keyValues: new object[] { 22L, 5L });

            migrationBuilder.DeleteData(
                table: "COUPON_ISSUER_CHANNEL",
                keyColumns: new[] { "COUPON_ID", "ISSUER_CHANNEL_ID" },
                keyValues: new object[] { 38L, 1L });

            migrationBuilder.DeleteData(
                table: "COUPON_ISSUER_CHANNEL",
                keyColumns: new[] { "COUPON_ID", "ISSUER_CHANNEL_ID" },
                keyValues: new object[] { 43L, 1L });

            migrationBuilder.DeleteData(
                table: "COUPON_ISSUER_CHANNEL",
                keyColumns: new[] { "COUPON_ID", "ISSUER_CHANNEL_ID" },
                keyValues: new object[] { 44L, 1L });

            migrationBuilder.DeleteData(
                table: "COUPON_ISSUER_CHANNEL",
                keyColumns: new[] { "COUPON_ID", "ISSUER_CHANNEL_ID" },
                keyValues: new object[] { 45L, 3L });

            migrationBuilder.DeleteData(
                table: "COUPON_ISSUER_CHANNEL",
                keyColumns: new[] { "COUPON_ID", "ISSUER_CHANNEL_ID" },
                keyValues: new object[] { 46L, 3L });

            migrationBuilder.DeleteData(
                table: "COUPON_ISSUER_CHANNEL",
                keyColumns: new[] { "COUPON_ID", "ISSUER_CHANNEL_ID" },
                keyValues: new object[] { 47L, 4L });

            migrationBuilder.DeleteData(
                table: "COUPON_ISSUER_CHANNEL",
                keyColumns: new[] { "COUPON_ID", "ISSUER_CHANNEL_ID" },
                keyValues: new object[] { 48L, 4L });

            migrationBuilder.DeleteData(
                table: "COUPON_ISSUER_CHANNEL",
                keyColumns: new[] { "COUPON_ID", "ISSUER_CHANNEL_ID" },
                keyValues: new object[] { 49L, 5L });

            migrationBuilder.DeleteData(
                table: "COUPON_ISSUER_CHANNEL",
                keyColumns: new[] { "COUPON_ID", "ISSUER_CHANNEL_ID" },
                keyValues: new object[] { 50L, 5L });

            migrationBuilder.DeleteData(
                table: "COUPON_ISSUER_CHANNEL",
                keyColumns: new[] { "COUPON_ID", "ISSUER_CHANNEL_ID" },
                keyValues: new object[] { 51L, 2L });

            migrationBuilder.DeleteData(
                table: "COUPON_ISSUER_CHANNEL",
                keyColumns: new[] { "COUPON_ID", "ISSUER_CHANNEL_ID" },
                keyValues: new object[] { 52L, 2L });

            migrationBuilder.DeleteData(
                table: "PROMOTION",
                keyColumn: "ID",
                keyValue: 4L);

            migrationBuilder.DeleteData(
                table: "PROMOTION",
                keyColumn: "ID",
                keyValue: 6L);

            migrationBuilder.DeleteData(
                table: "PROMOTION",
                keyColumn: "ID",
                keyValue: 8L);

            migrationBuilder.DeleteData(
                table: "PROMOTION",
                keyColumn: "ID",
                keyValue: 9L);

            migrationBuilder.DeleteData(
                table: "PROMOTION",
                keyColumn: "ID",
                keyValue: 10L);

            migrationBuilder.DeleteData(
                table: "PROMOTION",
                keyColumn: "ID",
                keyValue: 12L);

            migrationBuilder.DeleteData(
                table: "PROMOTION",
                keyColumn: "ID",
                keyValue: 13L);

            migrationBuilder.DeleteData(
                table: "PROMOTION",
                keyColumn: "ID",
                keyValue: 14L);

            migrationBuilder.DeleteData(
                table: "PROMOTION",
                keyColumn: "ID",
                keyValue: 15L);

            migrationBuilder.DeleteData(
                table: "PROMOTION",
                keyColumn: "ID",
                keyValue: 16L);

            migrationBuilder.DeleteData(
                table: "PROMOTION",
                keyColumn: "ID",
                keyValue: 17L);

            migrationBuilder.DeleteData(
                table: "PROMOTION",
                keyColumn: "ID",
                keyValue: 18L);

            migrationBuilder.DeleteData(
                table: "PROMOTION",
                keyColumn: "ID",
                keyValue: 19L);

            migrationBuilder.DeleteData(
                table: "PROMOTION",
                keyColumn: "ID",
                keyValue: 20L);

            migrationBuilder.DeleteData(
                table: "PROMOTION",
                keyColumn: "ID",
                keyValue: 21L);

            migrationBuilder.DeleteData(
                table: "PROMOTION",
                keyColumn: "ID",
                keyValue: 22L);

            migrationBuilder.DeleteData(
                table: "PROMOTION",
                keyColumn: "ID",
                keyValue: 23L);

            migrationBuilder.DeleteData(
                table: "PROMOTION",
                keyColumn: "ID",
                keyValue: 24L);

            migrationBuilder.DeleteData(
                table: "PROMOTION_AWARD_CHANNEL",
                keyColumns: new[] { "PROMOTION_ID", "AWARD_CHANNEL_ID" },
                keyValues: new object[] { 1L, 1L });

            migrationBuilder.DeleteData(
                table: "PROMOTION_AWARD_CHANNEL",
                keyColumns: new[] { "PROMOTION_ID", "AWARD_CHANNEL_ID" },
                keyValues: new object[] { 1L, 3L });

            migrationBuilder.DeleteData(
                table: "PROMOTION_AWARD_CHANNEL",
                keyColumns: new[] { "PROMOTION_ID", "AWARD_CHANNEL_ID" },
                keyValues: new object[] { 1L, 5L });

            migrationBuilder.DeleteData(
                table: "PROMOTION_AWARD_CHANNEL",
                keyColumns: new[] { "PROMOTION_ID", "AWARD_CHANNEL_ID" },
                keyValues: new object[] { 2L, 3L });

            migrationBuilder.DeleteData(
                table: "PROMOTION_AWARD_CHANNEL",
                keyColumns: new[] { "PROMOTION_ID", "AWARD_CHANNEL_ID" },
                keyValues: new object[] { 2L, 4L });

            migrationBuilder.DeleteData(
                table: "PROMOTION_AWARD_CHANNEL",
                keyColumns: new[] { "PROMOTION_ID", "AWARD_CHANNEL_ID" },
                keyValues: new object[] { 2L, 5L });

            migrationBuilder.DeleteData(
                table: "PROMOTION_AWARD_CHANNEL",
                keyColumns: new[] { "PROMOTION_ID", "AWARD_CHANNEL_ID" },
                keyValues: new object[] { 3L, 1L });

            migrationBuilder.DeleteData(
                table: "PROMOTION_AWARD_CHANNEL",
                keyColumns: new[] { "PROMOTION_ID", "AWARD_CHANNEL_ID" },
                keyValues: new object[] { 3L, 3L });

            migrationBuilder.DeleteData(
                table: "PROMOTION_AWARD_CHANNEL",
                keyColumns: new[] { "PROMOTION_ID", "AWARD_CHANNEL_ID" },
                keyValues: new object[] { 3L, 4L });

            migrationBuilder.DeleteData(
                table: "PROMOTION_AWARD_CHANNEL",
                keyColumns: new[] { "PROMOTION_ID", "AWARD_CHANNEL_ID" },
                keyValues: new object[] { 11L, 1L });

            migrationBuilder.DeleteData(
                table: "PROMOTION_ISSUER_CHANNEL",
                keyColumns: new[] { "PROMOTION_ID", "ISSUER_CHANNEL_ID" },
                keyValues: new object[] { 1L, 1L });

            migrationBuilder.DeleteData(
                table: "PROMOTION_ISSUER_CHANNEL",
                keyColumns: new[] { "PROMOTION_ID", "ISSUER_CHANNEL_ID" },
                keyValues: new object[] { 1L, 2L });

            migrationBuilder.DeleteData(
                table: "PROMOTION_ISSUER_CHANNEL",
                keyColumns: new[] { "PROMOTION_ID", "ISSUER_CHANNEL_ID" },
                keyValues: new object[] { 1L, 5L });

            migrationBuilder.DeleteData(
                table: "PROMOTION_ISSUER_CHANNEL",
                keyColumns: new[] { "PROMOTION_ID", "ISSUER_CHANNEL_ID" },
                keyValues: new object[] { 2L, 1L });

            migrationBuilder.DeleteData(
                table: "PROMOTION_ISSUER_CHANNEL",
                keyColumns: new[] { "PROMOTION_ID", "ISSUER_CHANNEL_ID" },
                keyValues: new object[] { 2L, 4L });

            migrationBuilder.DeleteData(
                table: "PROMOTION_ISSUER_CHANNEL",
                keyColumns: new[] { "PROMOTION_ID", "ISSUER_CHANNEL_ID" },
                keyValues: new object[] { 2L, 5L });

            migrationBuilder.DeleteData(
                table: "PROMOTION_ISSUER_CHANNEL",
                keyColumns: new[] { "PROMOTION_ID", "ISSUER_CHANNEL_ID" },
                keyValues: new object[] { 3L, 1L });

            migrationBuilder.DeleteData(
                table: "PROMOTION_ISSUER_CHANNEL",
                keyColumns: new[] { "PROMOTION_ID", "ISSUER_CHANNEL_ID" },
                keyValues: new object[] { 3L, 4L });

            migrationBuilder.DeleteData(
                table: "PROMOTION_ISSUER_CHANNEL",
                keyColumns: new[] { "PROMOTION_ID", "ISSUER_CHANNEL_ID" },
                keyValues: new object[] { 3L, 5L });

            migrationBuilder.DeleteData(
                table: "PROMOTION_ISSUER_CHANNEL",
                keyColumns: new[] { "PROMOTION_ID", "ISSUER_CHANNEL_ID" },
                keyValues: new object[] { 11L, 2L });

            migrationBuilder.DeleteData(
                table: "PROMOTION_PROPERTY",
                keyColumns: new[] { "PROMOTION_ID", "PROPERTY_ID" },
                keyValues: new object[] { 1L, 2L });

            migrationBuilder.DeleteData(
                table: "PROMOTION_PROPERTY",
                keyColumns: new[] { "PROMOTION_ID", "PROPERTY_ID" },
                keyValues: new object[] { 1L, 4L });

            migrationBuilder.DeleteData(
                table: "PROMOTION_PROPERTY",
                keyColumns: new[] { "PROMOTION_ID", "PROPERTY_ID" },
                keyValues: new object[] { 2L, 1L });

            migrationBuilder.DeleteData(
                table: "PROMOTION_PROPERTY",
                keyColumns: new[] { "PROMOTION_ID", "PROPERTY_ID" },
                keyValues: new object[] { 2L, 6L });

            migrationBuilder.DeleteData(
                table: "PROMOTION_PROPERTY",
                keyColumns: new[] { "PROMOTION_ID", "PROPERTY_ID" },
                keyValues: new object[] { 3L, 6L });

            migrationBuilder.DeleteData(
                table: "PROMOTION_PROPERTY",
                keyColumns: new[] { "PROMOTION_ID", "PROPERTY_ID" },
                keyValues: new object[] { 5L, 4L });

            migrationBuilder.DeleteData(
                table: "PROMOTION_PROPERTY",
                keyColumns: new[] { "PROMOTION_ID", "PROPERTY_ID" },
                keyValues: new object[] { 7L, 2L });

            migrationBuilder.DeleteData(
                table: "PROMOTION_PROPERTY",
                keyColumns: new[] { "PROMOTION_ID", "PROPERTY_ID" },
                keyValues: new object[] { 11L, 1L });

            migrationBuilder.DeleteData(
                table: "SYSTEM",
                keyColumn: "ID",
                keyValue: 1L);

            migrationBuilder.DeleteData(
                table: "SYSTEM",
                keyColumn: "ID",
                keyValue: 2L);

            migrationBuilder.DeleteData(
                table: "COUPON",
                keyColumn: "ID",
                keyValue: 2L);

            migrationBuilder.DeleteData(
                table: "COUPON",
                keyColumn: "ID",
                keyValue: 3L);

            migrationBuilder.DeleteData(
                table: "COUPON",
                keyColumn: "ID",
                keyValue: 4L);

            migrationBuilder.DeleteData(
                table: "COUPON",
                keyColumn: "ID",
                keyValue: 5L);

            migrationBuilder.DeleteData(
                table: "COUPON",
                keyColumn: "ID",
                keyValue: 6L);

            migrationBuilder.DeleteData(
                table: "COUPON",
                keyColumn: "ID",
                keyValue: 7L);

            migrationBuilder.DeleteData(
                table: "COUPON",
                keyColumn: "ID",
                keyValue: 8L);

            migrationBuilder.DeleteData(
                table: "COUPON",
                keyColumn: "ID",
                keyValue: 9L);

            migrationBuilder.DeleteData(
                table: "COUPON",
                keyColumn: "ID",
                keyValue: 10L);

            migrationBuilder.DeleteData(
                table: "COUPON",
                keyColumn: "ID",
                keyValue: 11L);

            migrationBuilder.DeleteData(
                table: "COUPON",
                keyColumn: "ID",
                keyValue: 12L);

            migrationBuilder.DeleteData(
                table: "COUPON",
                keyColumn: "ID",
                keyValue: 13L);

            migrationBuilder.DeleteData(
                table: "COUPON",
                keyColumn: "ID",
                keyValue: 15L);

            migrationBuilder.DeleteData(
                table: "COUPON",
                keyColumn: "ID",
                keyValue: 17L);

            migrationBuilder.DeleteData(
                table: "COUPON",
                keyColumn: "ID",
                keyValue: 18L);

            migrationBuilder.DeleteData(
                table: "COUPON",
                keyColumn: "ID",
                keyValue: 19L);

            migrationBuilder.DeleteData(
                table: "COUPON",
                keyColumn: "ID",
                keyValue: 20L);

            migrationBuilder.DeleteData(
                table: "COUPON",
                keyColumn: "ID",
                keyValue: 21L);

            migrationBuilder.DeleteData(
                table: "COUPON",
                keyColumn: "ID",
                keyValue: 22L);

            migrationBuilder.DeleteData(
                table: "COUPON",
                keyColumn: "ID",
                keyValue: 38L);

            migrationBuilder.DeleteData(
                table: "COUPON",
                keyColumn: "ID",
                keyValue: 43L);

            migrationBuilder.DeleteData(
                table: "COUPON",
                keyColumn: "ID",
                keyValue: 44L);

            migrationBuilder.DeleteData(
                table: "COUPON",
                keyColumn: "ID",
                keyValue: 45L);

            migrationBuilder.DeleteData(
                table: "COUPON",
                keyColumn: "ID",
                keyValue: 46L);

            migrationBuilder.DeleteData(
                table: "COUPON",
                keyColumn: "ID",
                keyValue: 47L);

            migrationBuilder.DeleteData(
                table: "COUPON",
                keyColumn: "ID",
                keyValue: 48L);

            migrationBuilder.DeleteData(
                table: "COUPON",
                keyColumn: "ID",
                keyValue: 49L);

            migrationBuilder.DeleteData(
                table: "COUPON",
                keyColumn: "ID",
                keyValue: 50L);

            migrationBuilder.DeleteData(
                table: "COUPON",
                keyColumn: "ID",
                keyValue: 51L);

            migrationBuilder.DeleteData(
                table: "COUPON",
                keyColumn: "ID",
                keyValue: 52L);

            migrationBuilder.DeleteData(
                table: "PROMOTION",
                keyColumn: "ID",
                keyValue: 7L);

            migrationBuilder.DeleteData(
                table: "PROMOTION",
                keyColumn: "ID",
                keyValue: 11L);

            migrationBuilder.DeleteData(
                table: "PROMOTION",
                keyColumn: "ID",
                keyValue: 1L);

            migrationBuilder.DeleteData(
                table: "PROMOTION",
                keyColumn: "ID",
                keyValue: 2L);

            migrationBuilder.DeleteData(
                table: "PROMOTION",
                keyColumn: "ID",
                keyValue: 3L);

            migrationBuilder.DeleteData(
                table: "PROMOTION",
                keyColumn: "ID",
                keyValue: 5L);

            migrationBuilder.DeleteData(
                table: "PROMOTION",
                keyColumn: "ID",
                keyValue: 25L);

            migrationBuilder.DeleteData(
                table: "PROMOTION",
                keyColumn: "ID",
                keyValue: 26L);

            migrationBuilder.DropColumn(
                name: "PASSWORD",
                table: "SYSTEM");

            migrationBuilder.RenameColumn(
                name: "USERNAME",
                table: "SYSTEM",
                newName: "LOGIN");

            migrationBuilder.RenameColumn(
                name: "DATE",
                table: "COUPON_HISTORY",
                newName: "ISSUED_DATE");

            migrationBuilder.AddColumn<string>(
                name: "PWD_HASH",
                table: "SYSTEM",
                maxLength: 200,
                nullable: true);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "PWD_HASH",
                table: "SYSTEM");

            migrationBuilder.RenameColumn(
                name: "LOGIN",
                table: "SYSTEM",
                newName: "USERNAME");

            migrationBuilder.RenameColumn(
                name: "ISSUED_DATE",
                table: "COUPON_HISTORY",
                newName: "DATE");

            migrationBuilder.AddColumn<string>(
                name: "PASSWORD",
                table: "SYSTEM",
                maxLength: 20,
                nullable: true);

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
                table: "PROMOTION",
                columns: new[] { "ID", "CODE", "COUPON_SERIES", "ENABLED", "VALID_FROM", "VALID_TO" },
                values: new object[,]
                {
                    { 3L, "Summer", 0, true, new DateTime(2020, 5, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 9, 1, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 26L, "AllYear", 0, true, new DateTime(2020, 2, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 8, 1, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 25L, "Bloom", 0, true, new DateTime(2020, 2, 14, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 3, 14, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 24L, "Summer8", 0, true, new DateTime(2020, 6, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 9, 1, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 23L, "Easter8", 0, false, new DateTime(2020, 4, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 5, 1, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 22L, "Spring8", 0, true, new DateTime(2020, 3, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 5, 1, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 21L, "Summer7", 0, true, new DateTime(2020, 6, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 9, 1, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 20L, "Easter7", 0, false, new DateTime(2020, 4, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 5, 1, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 19L, "Spring7", 0, true, new DateTime(2020, 3, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 5, 1, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 18L, "Summer6", 0, true, new DateTime(2020, 6, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 9, 1, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 17L, "Easter6", 0, false, new DateTime(2020, 4, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 5, 1, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 2L, "Easter", 0, true, new DateTime(2020, 4, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 6, 1, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 16L, "Spring6", 0, true, new DateTime(2020, 3, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 5, 1, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 1L, "Spring", 0, true, new DateTime(2020, 3, 20, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 5, 20, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 13L, "Spring5", 0, true, new DateTime(2020, 3, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 5, 1, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 12L, "Summer4", 0, true, new DateTime(2020, 6, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 9, 1, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 11L, "Easter4", 0, false, new DateTime(2020, 4, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 5, 1, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 10L, "Spring4", 0, true, new DateTime(2020, 3, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 5, 1, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 9L, "Summer3", 0, true, new DateTime(2020, 6, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 9, 1, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 8L, "NOTfunzies", 0, false, new DateTime(2020, 4, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 6, 1, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 7L, "FUNZIES!", 0, true, new DateTime(2020, 4, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 6, 1, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 6L, "SummerDown", 0, false, new DateTime(2020, 6, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 9, 1, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 5L, "EasterDown", 0, true, new DateTime(2020, 4, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 4, 12, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 4L, "SpringDown", 0, false, new DateTime(2020, 3, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 5, 1, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 15L, "Summer5", 0, true, new DateTime(2020, 6, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 9, 1, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 14L, "Easter5", 0, false, new DateTime(2020, 4, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 5, 1, 0, 0, 0, 0, DateTimeKind.Unspecified) }
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
                    { 47L, new DateTime(2020, 4, 8, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 4, 18, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 4, 8, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 4, 18, 0, 0, 0, 0, DateTimeKind.Unspecified), "YEAR12345096", 2, true, "38640440487", 1, 26L, 3, "38640440487" },
                    { 27L, new DateTime(2020, 5, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 9, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 5, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 9, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), "SUMMER1234657293", 2, true, "38640440482", 1, 3L, 2, "38640440482" },
                    { 28L, new DateTime(2020, 5, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 9, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 5, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 9, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), "SUMMER1234657294", 2, true, "38640440481", 1, 3L, 4, "38640440481" },
                    { 51L, new DateTime(2020, 5, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 9, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 5, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 9, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), "SUMMER1234657492", 2, true, "38640440484", 1, 3L, 3, "38640440484" },
                    { 52L, new DateTime(2020, 5, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 9, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 5, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 9, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), "SUMMER1234657493", 2, true, "38640440485", 1, 3L, 2, "38640440485" },
                    { 8L, new DateTime(2020, 4, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 6, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 4, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 6, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), "EDOWN1234567892", 1, false, "38640440481", 1, 5L, 2, "38640440481" },
                    { 9L, new DateTime(2020, 4, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 6, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 4, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 6, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), "EDOWN1234567893", 1, false, "38640440482", 1, 5L, 2, "38640440482" },
                    { 10L, new DateTime(2020, 4, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 6, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 4, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 6, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), "EDOWN1234567894", 2, true, "38640440483", 1, 5L, 2, "38640440483" },
                    { 11L, new DateTime(2020, 4, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 6, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 4, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 6, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), "EDOWN1234567891", 1, true, "", 1, 5L, 1, "" },
                    { 12L, new DateTime(2020, 4, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 6, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 4, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 6, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), "EDOWN1234567911", 1, false, "", 1, 5L, 1, "" },
                    { 13L, new DateTime(2020, 4, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 6, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 4, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 6, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), "EDOWN1234567912", 2, true, "", 1, 5L, 3, "" },
                    { 17L, new DateTime(2020, 2, 14, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 3, 14, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 2, 14, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 3, 14, 0, 0, 0, 0, DateTimeKind.Unspecified), "BLOOM1234567092", 1, true, "38640440481", 1, 25L, 1, "38640440481" },
                    { 25L, new DateTime(2020, 5, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 9, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 5, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 9, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), "SUMMER1234657391", 1, true, "38640440481", 1, 3L, 1, "38640440481" },
                    { 18L, new DateTime(2020, 2, 14, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 3, 14, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 2, 14, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 3, 14, 0, 0, 0, 0, DateTimeKind.Unspecified), "BLOOM1234567291", 1, true, "38640440481", 1, 25L, 2, "38640440481" },
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
                    { 19L, new DateTime(2020, 2, 14, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 3, 14, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 2, 14, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 3, 14, 0, 0, 0, 0, DateTimeKind.Unspecified), "BLOOM1234567292", 1, true, "38640440481", 1, 25L, 1, "38640440481" },
                    { 24L, new DateTime(2020, 5, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 9, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 5, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 9, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), "SUMMER1234657390", 1, true, "38640440482", 1, 3L, 1, "38640440482" },
                    { 26L, new DateTime(2020, 5, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 9, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 5, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 9, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), "SUMMER1234657292", 2, true, "38640440482", 1, 3L, 1, "38640440482" },
                    { 5L, new DateTime(2020, 4, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 6, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 4, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 6, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), "EASTER1234567891", 1, true, "", 1, 2L, 4, "" },
                    { 15L, new DateTime(2020, 3, 20, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 5, 20, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 3, 20, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 5, 20, 0, 0, 0, 0, DateTimeKind.Unspecified), "SPRING1234567290", 2, true, "38640440481", 1, 1L, 3, "38640440481" },
                    { 16L, new DateTime(2020, 3, 20, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 5, 20, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 3, 20, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 5, 20, 0, 0, 0, 0, DateTimeKind.Unspecified), "SPRING1234567291", 2, true, "38640440481", 1, 1L, 4, "38640440481" },
                    { 22L, new DateTime(2020, 3, 20, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 4, 20, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 3, 20, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 4, 20, 0, 0, 0, 0, DateTimeKind.Unspecified), "SPRING1234567093", 2, true, "38640440482", 1, 1L, 3, "38640440482" },
                    { 23L, new DateTime(2020, 3, 20, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 4, 20, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 3, 20, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 4, 20, 0, 0, 0, 0, DateTimeKind.Unspecified), "SPRING1234657291", 2, true, "38640440482", 1, 1L, 4, "38640440482" },
                    { 45L, new DateTime(2020, 3, 20, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 5, 20, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 3, 20, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 5, 20, 0, 0, 0, 0, DateTimeKind.Unspecified), "SPRING1234567190", 2, true, "38640440481", 1, 1L, 3, "38640440481" },
                    { 46L, new DateTime(2020, 3, 20, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 5, 20, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 3, 20, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 5, 20, 0, 0, 0, 0, DateTimeKind.Unspecified), "SPRING1234567191", 2, true, "38640440481", 1, 1L, 2, "38640440481" },
                    { 2L, new DateTime(2020, 4, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 6, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 4, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 6, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), "EASTER1234567892", 1, true, "38640440481", 1, 2L, 2, "38640440481" },
                    { 3L, new DateTime(2020, 4, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 6, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 4, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 6, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), "EASTER1234567893", 1, true, "38640440482", 1, 2L, 2, "38640440482" },
                    { 4L, new DateTime(2020, 4, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 6, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 4, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 6, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), "EASTER1234567894", 1, true, "38640440483", 1, 2L, 1, "38640440483" },
                    { 6L, new DateTime(2020, 4, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 6, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 4, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 6, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), "EASTER1234567895", 1, true, "", 1, 2L, 3, "" },
                    { 7L, new DateTime(2020, 4, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 6, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 4, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 6, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), "EASTER1234567113", 1, true, "", 1, 2L, 3, "" },
                    { 29L, new DateTime(2020, 4, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 5, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 4, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 5, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), "EASTER1234456294", 1, true, "38640440481", 1, 2L, 1, "38640440481" },
                    { 48L, new DateTime(2020, 4, 8, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 4, 18, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 4, 8, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 4, 18, 0, 0, 0, 0, DateTimeKind.Unspecified), "YEAR12345097", 2, true, "38640440487", 1, 26L, 2, "38640440487" },
                    { 44L, new DateTime(2020, 4, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 5, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 4, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 5, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), "EASTER1234567906", 3, true, "38591641148", 1, 2L, 2, "38591641148" },
                    { 30L, new DateTime(2020, 4, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 5, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 4, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 5, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), "EASTER1234456295", 1, true, "38640440482", 1, 2L, 1, "38640440482" },
                    { 39L, new DateTime(2020, 4, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 6, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 4, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 6, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), "EASTER1234567901", 3, false, "38591641146", 1, 2L, 2, "38591641146" },
                    { 40L, new DateTime(2020, 4, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 5, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 4, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 5, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), "EASTER1234567902", 3, true, "38591641146", 1, 2L, 2, "38591641146" },
                    { 41L, new DateTime(2020, 4, 12, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 5, 12, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 4, 12, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 5, 12, 0, 0, 0, 0, DateTimeKind.Unspecified), "EASTER1234567903", 3, true, "38591641146", 1, 2L, 1, "38591641146" },
                    { 42L, new DateTime(2020, 4, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 5, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 4, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 5, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), "EASTER1234567904", 3, false, "38591641147", 1, 2L, 1, "38591641147" },
                    { 43L, new DateTime(2020, 4, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 5, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 4, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 5, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), "EASTER1234567905", 3, true, "38591641148", 1, 2L, 3, "38591641148" }
                });

            migrationBuilder.InsertData(
                table: "PROMOTION_AWARD_CHANNEL",
                columns: new[] { "PROMOTION_ID", "AWARD_CHANNEL_ID" },
                values: new object[,]
                {
                    { 3L, 1L },
                    { 2L, 5L },
                    { 1L, 1L },
                    { 1L, 3L },
                    { 1L, 5L },
                    { 11L, 1L },
                    { 2L, 4L },
                    { 2L, 3L },
                    { 3L, 4L },
                    { 3L, 3L }
                });

            migrationBuilder.InsertData(
                table: "PROMOTION_ISSUER_CHANNEL",
                columns: new[] { "PROMOTION_ID", "ISSUER_CHANNEL_ID" },
                values: new object[,]
                {
                    { 3L, 4L },
                    { 11L, 2L },
                    { 3L, 5L },
                    { 2L, 1L },
                    { 2L, 4L },
                    { 1L, 5L },
                    { 1L, 2L },
                    { 1L, 1L },
                    { 2L, 5L },
                    { 3L, 1L }
                });

            migrationBuilder.InsertData(
                table: "PROMOTION_PROPERTY",
                columns: new[] { "PROMOTION_ID", "PROPERTY_ID" },
                values: new object[,]
                {
                    { 2L, 6L },
                    { 7L, 2L },
                    { 5L, 4L },
                    { 1L, 2L },
                    { 1L, 4L },
                    { 3L, 6L },
                    { 2L, 1L },
                    { 11L, 1L }
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
        }
    }
}
