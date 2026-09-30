using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Vidyakendraa
{
    public partial class vidya : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["IsLoggedIn"] != null)
                {
                    btnLogout.Visible = true;
                    liLogin.Visible = false;
                    liRegister.Visible = false;
                }
                else
                {
                    btnLogout.Visible = false;
                    liLogin.Visible = true;
                    liRegister.Visible = true;
                }
            }
        }
        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();

            Response.Redirect("Home.aspx");
        }

        protected void btnFAQ_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;

            string answer = "";

            switch (btn.CommandArgument)
            {
                case "hello":
                    answer = "👋 Hello! Welcome to VidyaKendra.";
                    break;

                case "books":
                    answer = "📚 All books are available on the Books page.";
                    break;

                case "register":
                    answer = "📝 Click Register to create your account.";
                    break;

                case "contact":
                    answer = "📞 Contact: +91-9198818395";
                    break;

                default:
                    answer = "Sorry! I couldn't understand.";
                    break;
            }

            litChat.Text += "<div class='user'>" + btn.Text + "</div>";
            litChat.Text += "<div class='bot'>" + answer + "</div>";
        }
    }
}