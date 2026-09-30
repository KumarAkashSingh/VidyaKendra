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
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string conStr = ConfigurationManager.ConnectionStrings["ConConnection"].ConnectionString;
            using (SqlConnection con = new SqlConnection(conStr))
            {
                string query = @"SELECT Id, StudentName, Mobile FROM SchoolBookRegistration   WHERE Mobile=@Mobile AND Password=@Password";
                SqlCommand cmd = new SqlCommand(query, con);

                cmd.Parameters.AddWithValue("@Mobile", txtEmail.Text.Trim());
                cmd.Parameters.AddWithValue("@Password", txtPassword.Text.Trim());

                con.Open();

                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    // ✅ SESSION CREATE
                    Session["UserId"] = dr["Id"].ToString();
                    Session["StudentName"] = dr["StudentName"].ToString();
                    Session["Mobile"] = dr["Mobile"].ToString();
                    Session["IsLoggedIn"] = true;

                    // ✅ ADMIN LOGIN CHECK
                    if (txtEmail.Text.Trim() == "admin" &&
                        txtPassword.Text.Trim() == "admin123")
                    {
                        Response.Redirect("AdminDashboard.aspx");
                    }
                    else
                    {
                        Response.Redirect("Home.aspx");
                    }
                }
                else
                {
                    lblMsg.Text = "Invalid Mobile or Password!";
                    lblMsg.ForeColor = System.Drawing.Color.Red;
                }

                con.Close();
            }
        }
    }
}