using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Vidyakendraa
{
    public partial class Addtocart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                LoadCart();
        }
        private void LoadCart()
        {
            if (Session["Cart"] != null)
            {
                DataTable dt = (DataTable)Session["Cart"];

                if (dt.Rows.Count > 0)
                {
                    rptCart.DataSource = dt;
                    rptCart.DataBind();
                    pnlEmpty.Visible = false;

                    decimal subtotal = 0;
                    foreach (DataRow r in dt.Rows)
                        subtotal += Convert.ToDecimal(r["Total"]);

                    decimal shipping = subtotal > 0 ? 50 : 0;

                    lblGrandTotal.Text = (subtotal + shipping).ToString("0.00");
                    cartSummary.Visible = true;
                }
                else
                {
                    pnlEmpty.Visible = true;
                    cartSummary.Visible = false;
                }
            }
            else
            {
                pnlEmpty.Visible = true;
                cartSummary.Visible = false;
            }
        }
        protected void rptCart_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            DataTable dt = (DataTable)Session["Cart"];
            string id = e.CommandArgument.ToString();

            foreach (DataRow row in dt.Rows)
            {
                if (row["BookID"].ToString() == id)
                {
                    if (e.CommandName == "plus")
                        row["Qty"] = Convert.ToInt32(row["Qty"]) + 1;

                    if (e.CommandName == "minus")
                    {
                        int q = Convert.ToInt32(row["Qty"]);
                        if (q > 1) row["Qty"] = q - 1;
                    }

                    if (e.CommandName == "delete")
                    {
                        dt.Rows.Remove(row);
                        break;
                    }
                }
            }

            Session["Cart"] = dt;
            LoadCart();
        }

    }
}