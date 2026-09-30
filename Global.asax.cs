using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

namespace Vidyakendraa
{
    public class Global : System.Web.HttpApplication
    {
        protected void Application_Start(object sender, EventArgs e)
        {
            //string conStr = ConfigurationManager.ConnectionStrings["ConConnection"].ConnectionString;
            //SqlConnection con = new SqlConnection(conStr);
            ////return con;
        }

        void Application_BeginRequest(object sender, EventArgs e)
        {
            try
            {
                var context = HttpContext.Current;

                string enc = context.Request.QueryString["data"];

                if (!string.IsNullOrEmpty(enc))
                {
                    string decrypted = UrlEncryptor.Decrypt(enc);

                    var query = HttpUtility.ParseQueryString(decrypted);

                    foreach (string key in query)
                    {
                        context.Items[key] = query[key];
                    }
                }
            }
            catch
            {
                // ignore error
            }
        }
    }
}