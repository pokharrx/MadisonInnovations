using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sprint1
{
    public partial class adminAddEntity : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

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
    }
}