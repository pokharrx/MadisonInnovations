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
	public partial class studentOpportunityApplication : System.Web.UI.Page
	{
        protected void Page_Load(object sender, EventArgs e)
        {
            //obtain the student ID value for the current entered user
            String username = Session["Username"].ToString();

        }


        protected void drplstJob_SelectedIndexChanged(object sender, EventArgs e)
        {
            int retrievedJobID = int.Parse(drplstJob.SelectedValue);
            Session["JobID"] = retrievedJobID;
        }

        protected void btnApplyforJob_Click(object sender, EventArgs e)
        {
            String sqlQuery = "Select JobTitle FROM Job Where JobID= @JobID";
            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["SDB"].ConnectionString);
            SqlCommand sqlCommand = new SqlCommand(sqlQuery, sqlConnect);
            sqlCommand.Parameters.AddWithValue("@JobID", Session["JobID"]);
            sqlConnect.Open();
            sqlCommand.ExecuteScalar();

            String retrievedJobTitle = Convert.ToString(sqlCommand.ExecuteScalar());
            Session["JobTitle"] = retrievedJobTitle;
            //close connection
            sqlConnect.Close();

            Response.Redirect("JobApplication.aspx");
        }

        protected void drplstInternship_SelectedIndexChanged(object sender, EventArgs e)
        {
            int retrievedInternshipID = int.Parse(drplstInternship.SelectedValue);
            Session["InternshipID"] = retrievedInternshipID;
        }

        protected void btnApplyforInternship_Click(object sender, EventArgs e)
        {
            String sqlQuery = "Select InternshipTitle FROM Internship Where InternshipID= @InternshipID";
            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["SDB"].ConnectionString);
            SqlCommand sqlCommand = new SqlCommand(sqlQuery, sqlConnect);
            sqlCommand.Parameters.AddWithValue("@InternshipID", Session["InternshipID"]);
            sqlConnect.Open();
            sqlCommand.ExecuteScalar();

            String retrievedInternshipTitle = Convert.ToString(sqlCommand.ExecuteScalar());
            Session["InternshipTitle"] = retrievedInternshipTitle;
            //close connection
            sqlConnect.Close();

            Response.Redirect("InternshipApplication.aspx");
        }



       

        protected void drplstOther_SelectedIndexChanged(object sender, EventArgs e)
        {
            int retrievedOtherID = int.Parse(drplstOther.SelectedValue);
            Session["OtherID"] = retrievedOtherID;
        }

        protected void btnApplyforOther_Click(object sender, EventArgs e)
        {
            String sqlQuery = "Select OtherTitle FROM Other Where OtherID= @OtherID";
            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["SDB"].ConnectionString);
            SqlCommand sqlCommand = new SqlCommand(sqlQuery, sqlConnect);
            sqlCommand.Parameters.AddWithValue("@OtherID", Session["OtherID"]);
            sqlConnect.Open();
            sqlCommand.ExecuteScalar();

            String retrievedOtherTitle = Convert.ToString(sqlCommand.ExecuteScalar());
            Session["OtherTitle"] = retrievedOtherTitle;
            //close connection
            sqlConnect.Close();

            Response.Redirect("OtherApplication.aspx");
        }



      
    }
}