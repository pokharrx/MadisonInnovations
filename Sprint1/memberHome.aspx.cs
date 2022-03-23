using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sprint1
{
    public partial class memberHome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            grdStudents.DataSourceID = "dtasrcAllStudents";
            grdStudents.DataBind();
            grdCompanies.DataSourceID = "dtasrcAllCompanies";
            grdCompanies.DataBind();
            grdJobs.DataSourceID = "dtasrcAllJobs";
            grdJobs.DataBind();
            grdInternships.DataSourceID = "dtasrcAllInternships";
            grdInternships.DataBind();
            grdScholarships.DataSourceID = "dtasrcAllScholarships";
            grdScholarships.DataBind();
        }
    }
}