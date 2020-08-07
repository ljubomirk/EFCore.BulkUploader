using Microsoft.EntityFrameworkCore.Migrations;
using Oracle.EntityFrameworkCore.Metadata;

namespace WebApp.Migrations
{
    public partial class PromotionProperty_Update : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropIndex(
                name: "IX_PROMOTION_CODE",
                table: "PROMOTION");

            migrationBuilder.DropIndex(
                name: "IX_COUPON_SYSTEM_NAME",
                table: "COUPON_SYSTEM");

            migrationBuilder.DropIndex(
                name: "IX_COUPON_CODE",
                table: "COUPON");

            migrationBuilder.AlterColumn<long>(
                name: "ID",
                table: "PROPERTY",
                nullable: false,
                oldClrType: typeof(long))
                .Annotation("Oracle:ValueGenerationStrategy", OracleValueGenerationStrategy.IdentityColumn);

            migrationBuilder.AlterColumn<long>(
                name: "ID",
                table: "PROMOTION",
                nullable: false,
                oldClrType: typeof(long))
                .Annotation("Oracle:ValueGenerationStrategy", OracleValueGenerationStrategy.IdentityColumn);

            migrationBuilder.AlterColumn<long>(
                name: "ID",
                table: "ISSUER_CHANNEL",
                nullable: false,
                oldClrType: typeof(long))
                .Annotation("Oracle:ValueGenerationStrategy", OracleValueGenerationStrategy.IdentityColumn);

            migrationBuilder.AlterColumn<long>(
                name: "ID",
                table: "COUPON_SYSTEM",
                nullable: false,
                oldClrType: typeof(long))
                .Annotation("Oracle:ValueGenerationStrategy", OracleValueGenerationStrategy.IdentityColumn);

            migrationBuilder.AlterColumn<long>(
                name: "ID",
                table: "COUPON_HISTORY",
                nullable: false,
                oldClrType: typeof(long))
                .Annotation("Oracle:ValueGenerationStrategy", OracleValueGenerationStrategy.IdentityColumn);

            migrationBuilder.AlterColumn<long>(
                name: "ID",
                table: "COUPON",
                nullable: false,
                oldClrType: typeof(long))
                .Annotation("Oracle:ValueGenerationStrategy", OracleValueGenerationStrategy.IdentityColumn);

            migrationBuilder.AlterColumn<long>(
                name: "ID",
                table: "AWARD_CHANNEL",
                nullable: false,
                oldClrType: typeof(long))
                .Annotation("Oracle:ValueGenerationStrategy", OracleValueGenerationStrategy.IdentityColumn);

            migrationBuilder.AlterColumn<long>(
                name: "ID",
                table: "ACCESS_LOG",
                nullable: false,
                oldClrType: typeof(long))
                .Annotation("Oracle:ValueGenerationStrategy", OracleValueGenerationStrategy.IdentityColumn);

            migrationBuilder.UpdateData(
                table: "PROPERTY",
                keyColumn: "ID",
                keyValue: 4L,
                column: "NAME",
                value: "HoldersOnlyConsumer");

            migrationBuilder.CreateIndex(
                name: "IX_PROMOTION_CODE",
                table: "PROMOTION",
                column: "CODE",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_COUPON_SYSTEM_NAME",
                table: "COUPON_SYSTEM",
                column: "NAME",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_COUPON_CODE",
                table: "COUPON",
                column: "CODE",
                unique: true);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropIndex(
                name: "IX_PROMOTION_CODE",
                table: "PROMOTION");

            migrationBuilder.DropIndex(
                name: "IX_COUPON_SYSTEM_NAME",
                table: "COUPON_SYSTEM");

            migrationBuilder.DropIndex(
                name: "IX_COUPON_CODE",
                table: "COUPON");

            migrationBuilder.AlterColumn<long>(
                name: "ID",
                table: "PROPERTY",
                nullable: false,
                oldClrType: typeof(long))
                .OldAnnotation("Oracle:ValueGenerationStrategy", OracleValueGenerationStrategy.IdentityColumn);

            migrationBuilder.AlterColumn<long>(
                name: "ID",
                table: "PROMOTION",
                nullable: false,
                oldClrType: typeof(long))
                .OldAnnotation("Oracle:ValueGenerationStrategy", OracleValueGenerationStrategy.IdentityColumn);

            migrationBuilder.AlterColumn<long>(
                name: "ID",
                table: "ISSUER_CHANNEL",
                nullable: false,
                oldClrType: typeof(long))
                .OldAnnotation("Oracle:ValueGenerationStrategy", OracleValueGenerationStrategy.IdentityColumn);

            migrationBuilder.AlterColumn<long>(
                name: "ID",
                table: "COUPON_SYSTEM",
                nullable: false,
                oldClrType: typeof(long))
                .OldAnnotation("Oracle:ValueGenerationStrategy", OracleValueGenerationStrategy.IdentityColumn);

            migrationBuilder.AlterColumn<long>(
                name: "ID",
                table: "COUPON_HISTORY",
                nullable: false,
                oldClrType: typeof(long))
                .OldAnnotation("Oracle:ValueGenerationStrategy", OracleValueGenerationStrategy.IdentityColumn);

            migrationBuilder.AlterColumn<long>(
                name: "ID",
                table: "COUPON",
                nullable: false,
                oldClrType: typeof(long))
                .OldAnnotation("Oracle:ValueGenerationStrategy", OracleValueGenerationStrategy.IdentityColumn);

            migrationBuilder.AlterColumn<long>(
                name: "ID",
                table: "AWARD_CHANNEL",
                nullable: false,
                oldClrType: typeof(long))
                .OldAnnotation("Oracle:ValueGenerationStrategy", OracleValueGenerationStrategy.IdentityColumn);

            migrationBuilder.AlterColumn<long>(
                name: "ID",
                table: "ACCESS_LOG",
                nullable: false,
                oldClrType: typeof(long))
                .OldAnnotation("Oracle:ValueGenerationStrategy", OracleValueGenerationStrategy.IdentityColumn);

            migrationBuilder.UpdateData(
                table: "PROPERTY",
                keyColumn: "ID",
                keyValue: 4L,
                column: "NAME",
                value: "HolderOnlyConsumer");

            migrationBuilder.CreateIndex(
                name: "IX_PROMOTION_CODE",
                table: "PROMOTION",
                column: "CODE",
                unique: true,
                filter: "[CODE] IS NOT NULL");

            migrationBuilder.CreateIndex(
                name: "IX_COUPON_SYSTEM_NAME",
                table: "COUPON_SYSTEM",
                column: "NAME",
                unique: true,
                filter: "[NAME] IS NOT NULL");

            migrationBuilder.CreateIndex(
                name: "IX_COUPON_CODE",
                table: "COUPON",
                column: "CODE",
                unique: true,
                filter: "[CODE] IS NOT NULL");
        }
    }
}
