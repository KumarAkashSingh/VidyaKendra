using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text;
using System.Text.RegularExpressions;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Vidyakendraa
{
    public partial class ForgetPassword : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(
            ConfigurationManager.ConnectionStrings["ConConnection"].ConnectionString);
        // SEND OTP
        protected void btnSendOTP_Click(object sender, EventArgs e)
        {
            try
            {
                string mobile = txtMobile.Text.Trim();
                if (mobile == "")
                {
                    lblMsg.ForeColor = System.Drawing.Color.Red;
                    lblMsg.Text = "Enter Mobile Number";
                    return;
                }
                // Generate OTP
                Random r = new Random();
                string otp = r.Next(100000, 999999).ToString();
                SqlCommand cmd = new SqlCommand(@"
                UPDATE SchoolBookRegistration SET OTP=@OTP, OTPExpiry=DATEADD(MINUTE,5,GETDATE()) WHERE Mobile=@Mobile", con);
                cmd.Parameters.AddWithValue("@OTP", otp);
                cmd.Parameters.AddWithValue("@Mobile", mobile);
                con.Open();
                int x = cmd.ExecuteNonQuery();
                con.Close();
                if (x > 0)
                {
                    // SMS API Here
                    lblMsg.ForeColor = System.Drawing.Color.Green;
                    // REMOVE OTP DISPLAY IN LIVE PROJECT
                    lblMsg.Text = "OTP Sent Successfully : " + otp;
                }
                else
                {
                    lblMsg.ForeColor = System.Drawing.Color.Red;
                    lblMsg.Text = "Mobile Number Not Found";
                }
            }
            catch (Exception ex)
            {
                lblMsg.ForeColor = System.Drawing.Color.Red;
                lblMsg.Text = ex.Message;
            }
        }
        // RESET PASSWORD
        protected void btnResetPassword_Click(object sender, EventArgs e)
        {
            try
            {
                string mobile = txtMobile.Text.Trim();
                string otp = txtOTP.Text.Trim();
                string newPassword = txtNewPassword.Text.Trim();
                string confirmPassword = txtConfirmPassword.Text.Trim();

                // CHECK PASSWORD MATCH
                if (newPassword != confirmPassword)
                {
                    lblMsg.ForeColor = System.Drawing.Color.Red;
                    lblMsg.Text = "Password Does Not Match";
                    return;
                }

                // STRONG PASSWORD CHECK
                if (!IsStrongPassword(newPassword))
                {
                    lblMsg.ForeColor = System.Drawing.Color.Red;

                    lblMsg.Text =
                    "Password must contain uppercase, lowercase, number & special character";

                    return;
                }

                SqlCommand checkCmd = new SqlCommand(@"SELECT * FROM SchoolBookRegistration WHERE Mobile=@Mobile AND OTP=@OTP AND OTPExpiry > GETDATE()", con);
                checkCmd.Parameters.AddWithValue("@Mobile", mobile);
                checkCmd.Parameters.AddWithValue("@OTP", otp);
                con.Open();
                SqlDataReader dr = checkCmd.ExecuteReader();
                if (dr.Read())
                {
                    dr.Close();
                    string hashPassword = HashPassword(newPassword);
                    SqlCommand updateCmd = new SqlCommand(@"
                    UPDATE SchoolBookRegistration
                    SET PasswordHash=@Password,
                    PasswordChangedDate=GETDATE(),
                    OTP=NULL,
                    OTPExpiry=NULL,
                    SessionToken=NEWID()
                    WHERE Mobile=@Mobile", con);
                    updateCmd.Parameters.AddWithValue("@Password", hashPassword);
                    updateCmd.Parameters.AddWithValue("@Mobile", mobile);
                    updateCmd.ExecuteNonQuery();
                    // CLEAR SESSION
                    Session.Clear();
                    Session.Abandon();
                    lblMsg.ForeColor = System.Drawing.Color.Green;
                    lblMsg.Text = "Password Reset Successfully";
                }
                else
                {
                    lblMsg.ForeColor = System.Drawing.Color.Red;
                    lblMsg.Text = "Invalid OTP or OTP Expired";
                }

                con.Close();
            }
            catch (Exception ex)
            {
                lblMsg.ForeColor = System.Drawing.Color.Red;
                lblMsg.Text = ex.Message;
            }
        }

        // HASH PASSWORD
        public static string HashPassword(string password)
        {
            using (SHA256 sha = SHA256.Create())
            {
                byte[] bytes = sha.ComputeHash(Encoding.UTF8.GetBytes(password));

                StringBuilder sb = new StringBuilder();

                foreach (byte b in bytes)
                {
                    sb.Append(b.ToString("x2"));
                }

                return sb.ToString();
            }
        }

        // STRONG PASSWORD VALIDATION
        public static bool IsStrongPassword(string password)
        {
            return Regex.IsMatch(password,
            @"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&]).{8,}$");
        }
    }
}