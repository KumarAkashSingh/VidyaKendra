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
    public partial class Allcourse : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCategories();
                LoadBooks();
            }
        }
        private void LoadCategories()
        {
            string cs = ConfigurationManager.ConnectionStrings["ConConnection"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "SELECT DISTINCT Category FROM Books";

                SqlDataAdapter da = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                da.Fill(dt);

                ddlCategory.DataSource = dt;
                ddlCategory.DataTextField = "Category";
                ddlCategory.DataValueField = "Category";
                ddlCategory.DataBind();

                ddlCategory.Items.Insert(0, new ListItem("All Classes", "All"));
            }
        }
        private void LoadBooks(string category = "All")
        {
            string cs = ConfigurationManager.ConnectionStrings["ConConnection"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                string query;

                if (category == "All")
                {
                    query = @"SELECT B.BookID, B.BookName, B.Category, B.Price,
                             ISNULL(BI.ImagePath,'noimage.jpg') AS ImagePath
                      FROM Books B
                      LEFT JOIN BookImages BI ON B.BookID = BI.BookID";
                }
                else
                {
                    query = @"SELECT B.BookID, B.BookName, B.Category, B.Price,
                             ISNULL(BI.ImagePath,'noimage.jpg') AS ImagePath
                      FROM Books B
                      LEFT JOIN BookImages BI ON B.BookID = BI.BookID
                      WHERE B.Category = @Category";
                }

                SqlCommand cmd = new SqlCommand(query, con);

                if (category != "All")
                {
                    cmd.Parameters.AddWithValue("@Category", category);
                }

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                rptBooks.DataSource = dt;
                rptBooks.DataBind();
            }
        }
        protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadBooks(ddlCategory.SelectedValue);
        }

    }
}