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
    public partial class memberInbox : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] != null)
            {
                try
                {
                    //Populate Inbox
                    String inboxQuery = "select SenderUsername, Message, Subject from Messaging where ReceiverUsername = '" + Session["Username"].ToString() + "';";
                    SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["SDB"].ConnectionString);
                    SqlDataAdapter sqlAdapter = new SqlDataAdapter(inboxQuery, sqlConnect);
                    DataTable dtInbox = new DataTable();
                    sqlAdapter.Fill(dtInbox);
                    grdInbox.DataSource = dtInbox;
                    grdInbox.DataBind();
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
        protected void grdInbox_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdInbox.PageIndex = e.NewPageIndex;
            grdInbox.DataBind();
        }
    }
}