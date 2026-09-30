using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace Vidyakendraa
{
    public partial class BookDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["BookID"] != null)
                {
                    string enc = UrlEncryptor.Encrypt(ID);
                    int bookId = Convert.ToInt32(Request.QueryString["BookID"]);
                    LoadBookDetails(bookId);
                }
            }
        }

        private void LoadBookDetails(int bookId)
        {
            string cs = ConfigurationManager.ConnectionStrings["ConConnection"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = @"SELECT B.BookID, B.BookName, B.Category, B.Price,
                                BI.ImagePath, B.Description
                         FROM Books B
                         LEFT JOIN BookImages BI ON B.BookID = BI.BookID
                         WHERE B.BookID = @BookID";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@BookID", bookId);

                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();

                DataTable dt = new DataTable();
                dt.Load(dr);

                // 🔴 No Book Found
                if (dt.Rows.Count == 0)
                {
                    Response.Write("Book not found");
                    return;
                }

                // ✅ Book Details
                lblName.Text = dt.Rows[0]["BookName"].ToString();
                lblCategory.Text = dt.Rows[0]["Category"].ToString();
                lblPrice.Text = "₹ " + dt.Rows[0]["Price"].ToString();

                // ✅ Description Safe
                Labeldes.Text = dt.Rows[0]["Description"] == DBNull.Value
                    ? "No description available."
                    : dt.Rows[0]["Description"].ToString();

                // ✅ Main Image Safe
                string mainImage = dt.Rows[0]["ImagePath"] == DBNull.Value
                    ? "noimage.jpg"
                    : dt.Rows[0]["ImagePath"].ToString();

                //imgBook.ImageUrl = ResolveUrl("~/Images/" + mainImage);

                // ✅ Bind Multiple Images
                rptImages.DataSource = dt;
                rptImages.DataBind();
            }
        }

        protected void rptImages_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemIndex == 0)
            {
                HtmlGenericControl div = (HtmlGenericControl)e.Item.FindControl("divItem");
                div.Attributes["class"] += " active";
            }
        }

        protected void btnCart_Click(object sender, EventArgs e)
        {
            // Check login session
            if (Session["IsLoggedIn"] == null)
            {
                // Save return page
                Session["ReturnUrl"] = Request.RawUrl;

                // Redirect to login page
                string enc = UrlEncryptor.Encrypt(ID);
                Response.Redirect("Login.aspx?data=" + enc);
                return;
            }

            // ✅ USER LOGGED IN → ADD TO CART CODE HERE
            AddToCart();
        }

        private void AddToCart()
        {
            if (Session["IsLoggedIn"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            DataTable dt;

            if (Session["Cart"] == null)
                dt = CreateCart();
            else
                dt = (DataTable)Session["Cart"];

            string id = Request.QueryString["BookID"];
            string name = lblName.Text;
            decimal price = Convert.ToDecimal(lblPrice.Text.Replace("₹", ""));
            //string image = imgBook.ImageUrl.Replace("~/Images/", "");

            DataRow[] dr = dt.Select("BookID=" + id);

            if (dr.Length > 0)
                dr[0]["Qty"] = Convert.ToInt32(dr[0]["Qty"]) + 1;
            else
            {
                DataRow row = dt.NewRow();
                row["BookID"] = id;
                row["BookName"] = name;
                row["Price"] = price;
                row["Qty"] = 1;
                //row["ImagePath"] = image;
                dt.Rows.Add(row);
            }

            Session["Cart"] = dt;
            string enc = UrlEncryptor.Encrypt(ID);

            Response.Redirect("AddToCart.aspx?data=" + enc);
        }
        private DataTable CreateCart()
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("BookID");
            dt.Columns.Add("BookName");
            dt.Columns.Add("Price", typeof(decimal));
            dt.Columns.Add("Qty", typeof(int));
            dt.Columns.Add("ImagePath");
            dt.Columns.Add("Total", typeof(decimal), "Price * Qty");
            return dt;
        }


    }
}