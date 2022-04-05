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
    public partial class InternshipApplication : System.Web.UI.Page
    {
        String ApplicationStatus= "No";
        String InterviewStatus = "No";
        String OfferStatus = "No";
        String AcceptanceStatus = "No";

        protected void Page_Load(object sender, EventArgs e)
        {
            lblOpportunityTitle.Text = Session["InternshipTitle"].ToString();
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {

            if (chbxApplicationStatus.Checked)
            {
                ApplicationStatus = "Yes";
            }

            if (chbxInterviewStatus.Checked)
            {
                InterviewStatus = "Yes";
            }

            if (chbxOfferStatus.Checked)
            {
                OfferStatus = "Yes";
            }

            if (chbxAcceptanceStatus.Checked)
            {
                AcceptanceStatus = "Yes";
            }

            //obtain logged in user industry of interest for student to see only their indusrty recommendations
            String sqlQuery = "select StudentID from Student Where StudentUserName=@StudentUserName";
            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["SDB"].ConnectionString);
            SqlCommand sqlCommand = new SqlCommand(sqlQuery, sqlConnect);
            sqlCommand.Parameters.AddWithValue("@StudentUserName", Session["UserName"].ToString());
            sqlConnect.Open();
            sqlCommand.ExecuteScalar();
            int studentId = int.Parse(sqlCommand.ExecuteScalar().ToString());
            Session["StudentID"] = studentId;
            sqlConnect.Close();

            int InternshipID = int.Parse(Session["InternshipID"].ToString());



            String sqlQuery2 = "INSERT INTO InternshipApplication(ApplicationStatus,InterviewStatus, OfferStatus, AcceptedStatus, InternshipID,StudentID ) VALUES('"
                    + ApplicationStatus + "','" + InterviewStatus + "','" + OfferStatus + "','" + AcceptanceStatus + "','" + InternshipID + "','" +  studentId + "')";

            SqlConnection sqlConnect2 = new SqlConnection(WebConfigurationManager.ConnectionStrings["SDB"].ConnectionString);

            SqlCommand sqlCommand2 = new SqlCommand(sqlQuery2, sqlConnect2);
            sqlCommand2.Connection = sqlConnect2;
            sqlCommand2.CommandType = CommandType.Text;
            sqlCommand2.CommandText = sqlQuery2;

            sqlConnect2.Open();
            sqlCommand2.ExecuteScalar();
            sqlConnect2.Close();

            //User already exists in the database
            lblStatus.ForeColor = Color.Green;
            lblStatus.Font.Bold = true;
            lblStatus.Text = "Successfully Created a Student Internship Application for the " + Session["InternshipName"] + " Internship!";




            Response.Redirect("StudentApplications.aspx");



        }
    }
}