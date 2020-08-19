using Microsoft.EntityFrameworkCore.Migrations;

namespace WebApp.Migrations
{
    public partial class CR_Update_1 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_NOTIFY_LIST_SYSTEM_SYSTEM_ID",
                table: "NOTIFY_LIST");

            migrationBuilder.DropPrimaryKey(
                name: "PK_SYSTEM",
                table: "SYSTEM");

            migrationBuilder.RenameTable(
                name: "SYSTEM",
                newName: "COUPON_SYSTEM");

            migrationBuilder.RenameIndex(
                name: "IX_SYSTEM_NAME",
                table: "COUPON_SYSTEM",
                newName: "IX_COUPON_SYSTEM_NAME");

            migrationBuilder.AddPrimaryKey(
                name: "PK_COUPON_SYSTEM",
                table: "COUPON_SYSTEM",
                column: "ID");

            migrationBuilder.AddForeignKey(
                name: "FK_NOTIFY_LIST_COUPON_SYSTEM_SYSTEM_ID",
                table: "NOTIFY_LIST",
                column: "SYSTEM_ID",
                principalTable: "COUPON_SYSTEM",
                principalColumn: "ID",
                onDelete: ReferentialAction.Cascade);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_NOTIFY_LIST_COUPON_SYSTEM_SYSTEM_ID",
                table: "NOTIFY_LIST");

            migrationBuilder.DropPrimaryKey(
                name: "PK_COUPON_SYSTEM",
                table: "COUPON_SYSTEM");

            migrationBuilder.RenameTable(
                name: "COUPON_SYSTEM",
                newName: "SYSTEM");

            migrationBuilder.RenameIndex(
                name: "IX_COUPON_SYSTEM_NAME",
                table: "SYSTEM",
                newName: "IX_SYSTEM_NAME");

            migrationBuilder.AddPrimaryKey(
                name: "PK_SYSTEM",
                table: "SYSTEM",
                column: "ID");

            migrationBuilder.AddForeignKey(
                name: "FK_NOTIFY_LIST_SYSTEM_SYSTEM_ID",
                table: "NOTIFY_LIST",
                column: "SYSTEM_ID",
                principalTable: "SYSTEM",
                principalColumn: "ID",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
