using Microsoft.EntityFrameworkCore.Migrations;

namespace WebApp.Migrations
{
    public partial class PromotionProperty_Update : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropIndex(
                name: "IX_PROMOTION_CODE",
                table: "PROMOTION");

            migrationBuilder.DeleteData(
                table: "PROPERTY",
                keyColumn: "ID",
                keyValue: 1L);

            migrationBuilder.DeleteData(
                table: "PROPERTY",
                keyColumn: "ID",
                keyValue: 2L);

            migrationBuilder.AlterColumn<string>(
                name: "CODE",
                table: "PROMOTION",
                maxLength: 40,
                nullable: true,
                oldClrType: typeof(string),
                oldMaxLength: 40);

            migrationBuilder.UpdateData(
                table: "PROPERTY",
                keyColumn: "ID",
                keyValue: 3L,
                column: "NAME",
                value: "NamedHolders");

            migrationBuilder.UpdateData(
                table: "PROPERTY",
                keyColumn: "ID",
                keyValue: 4L,
                column: "NAME",
                value: "HolderOnlyConsumer");

            migrationBuilder.InsertData(
                table: "PROPERTY",
                columns: new[] { "ID", "NAME" },
                values: new object[,]
                {
                    { 5L, "AllowMultipleRedeems" },
                    { 6L, "AllowCouponSeries" }
                });

            migrationBuilder.CreateIndex(
                name: "IX_PROMOTION_CODE",
                table: "PROMOTION",
                column: "CODE",
                unique: true,
                filter: "[CODE] IS NOT NULL");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropIndex(
                name: "IX_PROMOTION_CODE",
                table: "PROMOTION");

            migrationBuilder.DeleteData(
                table: "PROPERTY",
                keyColumn: "ID",
                keyValue: 5L);

            migrationBuilder.DeleteData(
                table: "PROPERTY",
                keyColumn: "ID",
                keyValue: 6L);

            migrationBuilder.AlterColumn<string>(
                name: "CODE",
                table: "PROMOTION",
                maxLength: 40,
                nullable: false,
                oldClrType: typeof(string),
                oldMaxLength: 40,
                oldNullable: true);

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

            migrationBuilder.InsertData(
                table: "PROPERTY",
                columns: new[] { "ID", "NAME" },
                values: new object[,]
                {
                    { 1L, "NamedHolders" },
                    { 2L, "HolderIsOnlyConsumer" }
                });

            migrationBuilder.CreateIndex(
                name: "IX_PROMOTION_CODE",
                table: "PROMOTION",
                column: "CODE",
                unique: true);
        }
    }
}
