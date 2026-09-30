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
    public partial class ContactUs : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnSend_Click(object sender, EventArgs e)
        {
            // Basic validation
            if (txtName.Text.Trim() == "" || txtMobile.Text.Trim() == "" || txtMessage.Text.Trim() == "")
            {
                lblMsg.Text = "Please fill all required fields.";
                lblMsg.CssClass = "text-danger d-block text-center mt-3";
                return;
            }

            try
            {
                string cs = ConfigurationManager.ConnectionStrings["ConConnection"].ConnectionString;

                using (SqlConnection con = new SqlConnection(cs))
                {
                    string query = @"INSERT INTO ContactUs(Name, Mobile, Email, Message, CreatedDate)
                                    VALUES
                                    (@Name, @Mobile, @Email, @Message, GETDATE())";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@Name", txtName.Text.Trim());
                        cmd.Parameters.AddWithValue("@Mobile", txtMobile.Text.Trim());
                        cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                        cmd.Parameters.AddWithValue("@Message", txtMessage.Text.Trim());

                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }
                }

                // Success message
                lblMsg.Text = "Thank you! Your message has been sent successfully.";
                lblMsg.CssClass = "text-success d-block text-center mt-3";

                // Clear fields
                txtName.Text = "";
                txtMobile.Text = "";
                txtEmail.Text = "";
                txtMessage.Text = "";
            }
            catch (Exception ex)
            {
                lblMsg.Text = "Something went wrong. Please try again later.";
                lblMsg.CssClass = "text-danger d-block text-center mt-3";
            }
        }
    }
}