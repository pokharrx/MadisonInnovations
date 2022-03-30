using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;

using System.Data.SqlClient;
using System.Web.Configuration;
using System.Drawing;

namespace Sprint1
{
    public partial class EditRecordsPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void GridViewStudents_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblSelectedIndex.Text = StudentsGridview.SelectedRow.Cells[9].Text;
        }


    }
}