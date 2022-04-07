using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Diagnostics;
using System.ComponentModel;
using System.IO;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Drawing;

namespace Sprint1
{
    public partial class studentOutbox : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] != null)
            {               
                try
                {
                    //Populate Sent
                    SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["SDB"].ConnectionString);
                    String sentQuery = "select ReceiverUsername, Message, Subject from Messaging where SenderUsername = '" + Session["Username"] + "';";
                    SqlConnection sqlConnect2 = new SqlConnection(WebConfigurationManager.ConnectionStrings["SDB"].ConnectionString);
                    SqlDataAdapter sqlAdapter2 = new SqlDataAdapter(sentQuery, sqlConnect);
                    DataTable dtSent = new DataTable();
                    sqlAdapter2.Fill(dtSent);
                    grdSent.DataSource = dtSent;
                    grdSent.DataBind();
                    sqlConnect.Close();
                }
                catch
                {

                }
            }
            else
            {
                Session["MustLogin"] = "You Must Login To Access That Page";
                Response.Redirect("Login.aspx");
            }
        }
        protected void grdSent_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdSent.PageIndex = e.NewPageIndex;
            grdSent.DataBind();
        }
    }
}