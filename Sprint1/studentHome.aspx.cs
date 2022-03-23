using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace Sprint1
{
    public partial class studentHome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // data source bind for the job gridview
            grdJob.DataSourceID = "dtasrcAllJobs";
            grdJob.DataBind();

            // data source bind for the internship gridview
            grdInternship.DataSourceID = "dtasrcAllInternships";
            grdInternship.DataBind();

            // data source bind for the scholarship gridview
            grdScholarship.DataSourceID = "dtasrcAllScholarships";
            grdScholarship.DataBind();
        }
    }
}