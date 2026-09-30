using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Vidyakendraa
{
    public partial class AdminLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnAdminLogin_Click(object sender, EventArgs e)
        {
            // ✅ Validation
            if (string.IsNullOrWhiteSpace(txtAdminUser.Text) ||
                string.IsNullOrWhiteSpace(txtAdminPass.Text))
            {
                lblMsg.Text = "Please enter Username and Password!";
                lblMsg.ForeColor = System.Drawing.Color.Red;
                return;
            }

            string cs = ConfigurationManager.ConnectionStrings["ConConnection"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = @"SELECT Id, Username FROM AdminLogin WHERE Username=@Username AND Password=@Password";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Username", txtAdminUser.Text.Trim());
                cmd.Parameters.AddWithValue("@Password", txtAdminPass.Text.Trim());
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    // ✅ Admin Session
                    Session["AdminId"] = dr["Id"].ToString();
                    Session["AdminUser"] = dr["Username"].ToString();
                    Session["IsAdmin"] = true;

                    // ✅ Redirect Dashboard
                    Response.Redirect("~/Admin/Dashboard.aspx");
                }
                else
                {
                    lblMsg.Text = "Invalid Admin Credentials!";
                    lblMsg.ForeColor = System.Drawing.Color.Red;
                }
                con.Close();
            }
        }
    }
}