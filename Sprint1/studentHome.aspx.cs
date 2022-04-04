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

            //obtain logged in user industry of interest for student to see only their indusrty recommendations
            String sqlQuery = "select Industry from Student Where StudentUserName=@StudentUserName";
            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["SDB"].ConnectionString);
            SqlCommand sqlCommand = new SqlCommand(sqlQuery, sqlConnect);
            sqlCommand.Parameters.AddWithValue("@StudentUserName", Session["UserName"].ToString());
            sqlConnect.Open();
            sqlCommand.ExecuteScalar();
            String studentIndustry = sqlCommand.ExecuteScalar().ToString();
            Session["StudentIndustry"] = studentIndustry;
            sqlConnect.Close();

          


        }

        //protected void test1_Click(object sender, EventArgs e)
        //{
            
        //}
    }
}