using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sprint1
{
    public partial class adminMaster : System.Web.UI.MasterPage
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
            Response.Redirect("adminMessaging.aspx");
        }

        protected void home_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("adminHome.aspx");
        }

        protected void add_Click(object sender, ImageClickEventArgs e)
        {
            if (addBar.Visible == false)
            {
                addBar.Visible = true;
            }
            else
            {
                addBar.Visible = false;
            }          
        }

        protected void addJjob_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("NewJob.aspx");
        }

        protected void addInternship_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("NewInternship.aspx");
        }

        protected void addCompany_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("NewCompany.aspx");
        }

        protected void addSponsor_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("NewCorporateSponsor.aspx");
        }

        protected void addOther_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("NewOther.aspx");
        }

        protected void addAnnouncement_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("AddAnnouncement.aspx");
        }

        protected void dashboard_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("adminDashboard.aspx");
        }
    }
}