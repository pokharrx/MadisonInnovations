using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sprint1
{
    public partial class StudentApplications : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                grdInternshipApplication.DataBind();
                grdJobApplication.DataBind();
                grdOtherApplication.DataBind();
            }
        }

    }
}