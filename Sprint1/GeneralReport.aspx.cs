using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sprint1
{
    public partial class GeneralReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            fvStudentMemberCount.DataBind();
            grdJobInformation.DataSourceID = "dtasrcJobInformation";
            grdJobInformation.DataBind();
            grdInternshipInformation.DataSourceID = "dtasrcInternshipInformation";
            grdInternshipInformation.DataBind();
            grdOtherInformation.DataSourceID = "dtasrcOtherInformation";
            grdOtherInformation.DataBind();
        }
    }
}