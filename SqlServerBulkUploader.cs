using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Linq.Expressions;
using Microsoft.EntityFrameworkCore;
using Microsoft.Data.SqlClient;
using System.Reflection;

namespace EFCore.SqlServerBulkUploader
{
    /// <summary>SQLServerBulkUploader</summary>
    public class SqlServerBulkUploader : BulkUploader
    {

        /// <summary>BulkInsert</summary>
        public static void Insert<T>(DbContext dbContext, SqlConnection connection, List<T> list, int packageSize = PACKAGE_SIZE)
            where T : class
        {
            var model = dbContext.Model.GetEntityTypes().Where(e => e.ClrType == typeof(T)).Single();
            var tableName = model.Relational().TableName;
            //var modelProperties = BulkUploader.IdentityUse ? model.GetProperties().Where(e => e.Relational().ColumnName != BulkUploader.IdentityColumnName) : model.GetProperties();
            var modelProperties = model.GetProperties();

            using (SqlBulkCopy bc = new SqlBulkCopy(connection))
            {
                bc.DestinationTableName = "[" + tableName + "]";
                bc.BatchSize = PACKAGE_SIZE;
                DataTable dt = new DataTable();
                foreach (var c in modelProperties)
                {
                    var item = Expression.Parameter(typeof(T), "item");
                    var prop = Expression.Convert(Expression.Property(item, c.PropertyInfo.Name), typeof(object));
                    var f = Expression.Lambda<Func<T, object>>(prop, item).Compile();
                    dt.Columns.Add(c.Relational().ColumnName);
                }
                foreach (T item in list)
                {
                    DataRow row = dt.NewRow();
                    for (int idx = 0; idx < dt.Columns.Count; idx++)
                    {
                        var modelProp = modelProperties.Where(e => e.Relational().ColumnName == dt.Columns[idx].ColumnName).Single();
                        Object prop = typeof(T).GetProperty(modelProp.Name).GetValue(item);
                        row[idx] = prop;
                    }
                    dt.Rows.Add(row);
                }
                bc.WriteToServer(dt);
            }
        }
    }
}