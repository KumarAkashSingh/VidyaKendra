using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Vidyakendraa
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadFestivalGif();// if no category selected
                if (Request.QueryString["Category"] != null)
                {
                    string category = Request.QueryString["Category"].ToString();
                    LoadBooksByCategory(category);
                    
                }
                else
                {
                    LoadBooks();
                    
                }
            }
        }
        private void LoadBooks()
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConConnection"].ConnectionString))
            {
                string query = @"SELECT B.BookID, B.BookName, B.Category, B.Price,
                        ISNULL((SELECT TOP 1 ImagePath FROM BookImages 
                                WHERE BookID=B.BookID),'noimage.jpg') AS ImagePath
                        FROM Books B";

                SqlDataAdapter da = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                da.Fill(dt);

                rptBooks.DataSource = dt;
                rptBooks.DataBind();
            }
        }
        private void LoadBooksByCategory(string category)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConConnection"].ConnectionString))
            {
                string query = @"SELECT B.BookID, B.BookName, B.Category, B.Price,
                        ISNULL((SELECT TOP 1 ImagePath FROM BookImages 
                                WHERE BookID=B.BookID),'noimage.jpg') AS ImagePath
                        FROM Books B
                        WHERE B.Category = @Category";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Category", category);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                rptBooks.DataSource = dt;
                rptBooks.DataBind();
            }
        }

        void LoadFestivalGif()
        {
            DateTime today = DateTime.Now;

            // 🎉 Republic Day (26 Jan)
            if (today.Month == 1 && today.Day == 26)
            {
                imgFestival.ImageUrl = "~/Image/republicday.gif";
            }
            // 🎉 Independence Day (15 Aug)
            else if (today.Month == 8 && today.Day == 15)
            {
                imgFestival.ImageUrl = "~/Image/independenceday.gif";
            }
            // 🎉 Diwali (example date - change yearly)
            else if (today.Month == 11 && today.Day == 1)
            {
                imgFestival.ImageUrl = "~/Image/diwali.gif";
            }
            // 🎉 Holi (example)
            else if (today.Month == 3 && today.Day == 25)
            {
                imgFestival.ImageUrl = "~/Image/holi.gif";
            }
            else
            {
                imgFestival.ImageUrl = "~/Image/default-banner.png"; // normal banner
            }
        }
    }
}