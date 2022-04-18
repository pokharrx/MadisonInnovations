using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace Sprint1
{
    public partial class StudentAnnouncements : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // data source bind for the job gridview
            grdJob.DataSourceID = "dtasrcAllJobs";
            grdJob.DataBind();

            // data source bind for the internship gridview
            grdInternship.DataSourceID = "dtasrcAllInternships";
            grdInternship.DataBind();

            // data source bind for the other gridview
            grdOther.DataSourceID = "dtasrcAllOther";
            grdOther.DataBind();

            //obtain logged in user industry of interest for student to see only their indusrty recommendations
            String sqlQuery = "select Industry from Student Where StudentUserName=@StudentUserName";
            SqlConnection sqlConnect1 = new SqlConnection(WebConfigurationManager.ConnectionStrings["SDB"].ConnectionString);
            SqlCommand sqlCommand = new SqlCommand(sqlQuery, sqlConnect1);
            sqlCommand.Parameters.AddWithValue("@StudentUserName", Session["UserName"].ToString());
            sqlConnect1.Open();
            sqlCommand.ExecuteScalar();
            String studentIndustry = sqlCommand.ExecuteScalar().ToString();
            Session["StudentIndustry"] = studentIndustry;
            sqlConnect1.Close();
        }

        protected void grdJob_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            String selected = (string)e.CommandArgument;
            SqlConnection connect = new SqlConnection(WebConfigurationManager.ConnectionStrings["SDB"].ConnectionString);
            SqlCommand getapp = new SqlCommand();
            getapp.Connection = connect;
            if (e.CommandName.Equals("JobTitle"))
            {
                getapp.CommandText = "SELECT ApplicationLink FROM Job WHERE JobTitle = @JobTitle";
                getapp.Parameters.AddWithValue("@JobTitle", selected);
                connect.Open();
                String appLink = Convert.ToString(getapp.ExecuteScalar());
                Response.Redirect(appLink);
                connect.Close();
            }
            else if (e.CommandName.Equals("InternshipTitle"))
            {
                getapp.CommandText = "SELECT ApplicationLink FROM Internship WHERE InternshipTitle = @InternshipTitle";
                getapp.Parameters.AddWithValue("@InternshipTitle", selected);
                connect.Open();
                String appLink = Convert.ToString(getapp.ExecuteScalar());
                Response.Redirect(appLink);
                connect.Close();
            }
            else if (e.CommandName.Equals("OtherTitle"))
            {
                getapp.CommandText = "SELECT ApplicationLink FROM Other WHERE OtherTitle = @OtherTitle";
                getapp.Parameters.AddWithValue("@OtherTitle", selected);
                connect.Open();
                String appLink = Convert.ToString(getapp.ExecuteScalar());
                Response.Redirect(appLink);
                connect.Close();
            }
        }
    }
}