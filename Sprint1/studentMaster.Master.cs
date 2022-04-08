using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Drawing;

namespace Sprint1
{
    public partial class studentMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] != null)
            {
                lblUserName.Text = "Welcome, " + Session["Username"].ToString() + "!";
            }
            else
            {
                Session["MustLogin"] = "You Must Login To Access That Page";
                Response.Redirect("Login.aspx");
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("Login.aspx");
        }

        protected void chat_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("studentMessaging.aspx");
        }

        protected void profile_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("StudentAccountProfile.aspx");
        }

        protected void home_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("studentHome.aspx");
        }

        protected void dashboard_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("StudentAnnouncements.aspx");
        }
    }
}