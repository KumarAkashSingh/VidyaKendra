using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Vidyakendraa
{
    public partial class Reg : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string password = GeneratePassword();

            using (SqlConnection con = DbConnection.GetConnection())
            {
                SqlCommand cmd = new SqlCommand(@"INSERT INTO SchoolBookRegistration (StudentName, Class, Board, SchoolName, ParentName, Mobile, Address, Password)
                VALUES (@StudentName,@Class,@Board,@School,@Parent,@Mobile,@Address,@Password)", con);

                cmd.Parameters.AddWithValue("@StudentName", txtStudentName.Text);
                cmd.Parameters.AddWithValue("@Class", txtClass.Text);
                cmd.Parameters.AddWithValue("@Board", ddlBoard.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@School", txtSchoolName.Text);
                cmd.Parameters.AddWithValue("@Parent", txtParentName.Text);
                cmd.Parameters.AddWithValue("@Mobile", txtMobile.Text);
                cmd.Parameters.AddWithValue("@Address", txtAddress.Text);
                cmd.Parameters.AddWithValue("@Password", password);

                con.Open();
                cmd.ExecuteNonQuery();
            }

            // Popup
            string script = "alert('Registration Successful! Your Login Password: " + password + "');";
            ClientScript.RegisterStartupScript(this.GetType(), "popup", script, true);

            ClearForm();
        }
        private void ClearForm()
        {
            txtStudentName.Text = "";
            txtClass.Text = "";
            txtSchoolName.Text = "";
            txtParentName.Text = "";
            txtMobile.Text = "";
            txtAddress.Text = "";
            ddlBoard.SelectedIndex = 0;

        }
        private string GeneratePassword()
        {
            Random r = new Random();
            return "VK" + r.Next(1000, 9999).ToString();
        }


    }
}
