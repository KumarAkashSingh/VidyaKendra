using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Vidyakendraa
{
    public partial class Eventgallery : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadGallery();
            }
        }
        private void LoadGallery()
        {
            string query = "SELECT * FROM EventGallery ORDER BY Id DESC";
            DataTable dt = DbConnection.GetData(query);
            rptGallery.DataSource = dt;
            rptGallery.DataBind();
        }
    }
}