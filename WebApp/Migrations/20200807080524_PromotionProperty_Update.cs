using Microsoft.EntityFrameworkCore.Migrations;

namespace WebApp.Migrations
{
    public partial class PromotionProperty_Update : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DeleteData(
                table: "PROPERTY",
                keyColumn: "ID",
                keyValue: 5L);

            migrationBuilder.DeleteData(
                table: "PROPERTY",
                keyColumn: "ID",
                keyValue: 6L);

            migrationBuilder.UpdateData(
                table: "PROPERTY",
                keyColumn: "ID",
                keyValue: 1L,
                column: "NAME",
                value: "NamedHolders");

            migrationBuilder.UpdateData(
                table: "PROPERTY",
                keyColumn: "ID",
                keyValue: 2L,
                column: "NAME",
                value: "HolderIsOnlyConsumer");

            migrationBuilder.UpdateData(
                table: "PROPERTY",
                keyColumn: "ID",
                keyValue: 3L,
                column: "NAME",
                value: "AllowMultipleRedeems");

            migrationBuilder.UpdateData(
                table: "PROPERTY",
                keyColumn: "ID",
                keyValue: 4L,
                column: "NAME",
                value: "AllowCouponSeries");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.UpdateData(
                table: "PROPERTY",
                keyColumn: "ID",
                keyValue: 1L,
                column: "NAME",
                value: "UniqueCoupons");

            migrationBuilder.UpdateData(
                table: "PROPERTY",
                keyColumn: "ID",
                keyValue: 2L,
                column: "NAME",
                value: "NamedHolders");

            migrationBuilder.UpdateData(
                table: "PROPERTY",
                keyColumn: "ID",
                keyValue: 3L,
                column: "NAME",
                value: "NamedConsumers");

            migrationBuilder.UpdateData(
                table: "PROPERTY",
                keyColumn: "ID",
                keyValue: 4L,
                column: "NAME",
                value: "HolderIsOnlyConsumer");

            migrationBuilder.InsertData(
                table: "PROPERTY",
                columns: new[] { "ID", "NAME" },
                values: new object[,]
                {
                    { 5L, "AllowMultipleRedeems" },
                    { 6L, "AllowCouponSeries" }
                });
        }
    }
}
