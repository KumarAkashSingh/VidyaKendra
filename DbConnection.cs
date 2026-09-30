using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Vidyakendraa
{
    public class DbConnection
    {
        private static string cs = ConfigurationManager.ConnectionStrings["ConConnection"].ConnectionString;

        // 🔹 Get Connection
        public static SqlConnection GetConnection()
        {
            return new SqlConnection(cs);
        }

        // 🔹 SELECT
        public static DataTable GetData(string query, SqlParameter[] param = null)
        {
            using (SqlConnection con = GetConnection())
            {
                SqlCommand cmd = new SqlCommand(query, con);

                if (param != null)
                    cmd.Parameters.AddRange(param);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                return dt;
            }
        }

        // 🔹 INSERT / UPDATE / DELETE
        public static int ExecuteQuery(string query, SqlParameter[] param = null)
        {
            using (SqlConnection con = GetConnection())
            {
                SqlCommand cmd = new SqlCommand(query, con);

                if (param != null)
                    cmd.Parameters.AddRange(param);

                con.Open();
                return cmd.ExecuteNonQuery();
            }
        }
    }
}