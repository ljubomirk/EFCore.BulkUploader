using Microsoft.EntityFrameworkCore.Migrations;

namespace WebApp.Migrations
{
    public partial class PromotionProperty_Update_revert : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.UpdateData(
                table: "PROPERTY",
                keyColumn: "ID",
                keyValue: 4L,
                column: "NAME",
                value: "HoldersOnlyConsumer");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.UpdateData(
                table: "PROPERTY",
                keyColumn: "ID",
                keyValue: 4L,
                column: "NAME",
                value: "HolderOnlyConsumer");
        }
    }
}
