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
using System.IO;
using System.Data;

namespace Sprint1
{
    public partial class StudentAccountProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            Session["StudentUserName"] = Session["Username"].ToString();
            updateFROMDB();

            if (!IsPostBack)
            {
                lblStatus.Text = "";

                String sqlQuery2 = "SELECT * FROM Student WHERE StudentUserName = '" + Session["StudentUserName"].ToString() + "'";
                SqlConnection sqlConnect2 = new SqlConnection(WebConfigurationManager.ConnectionStrings["SDB"].ConnectionString);
                SqlCommand sqlCommand2 = new SqlCommand();
                sqlCommand2.Parameters.AddWithValue("@StudentUserName", Session["StudentUserName"]);
                sqlCommand2.Connection = sqlConnect2;
                sqlCommand2.CommandType = CommandType.Text;
                sqlCommand2.CommandText = sqlQuery2;
                sqlConnect2.Open();
                SqlDataReader queryResults2 = sqlCommand2.ExecuteReader();


                while (queryResults2.Read())

                {
                    txtStudentFirstName.Text = queryResults2["FirstName"].ToString();
                    txtStudentLastName.Text = queryResults2["LastName"].ToString();
                    txtStudentEmail.Text = queryResults2["EmailAddress"].ToString();
                    txtStudentPhoneNumber.Text = queryResults2["PhoneNumber"].ToString();
                    txtExpectedGraduation.Text = queryResults2["GradYear"].ToString();
                    txtMajor.Text = queryResults2["Major"].ToString();
                    txtGrade.Text = queryResults2["Grade"].ToString();
                    txtEmploymentStatus.Text = queryResults2["EmploymentStatus"].ToString();

                }
            }
        }

        protected void btnUploadFile_Click(object sender, EventArgs e)
        {
            // Make sure you have created a "Resume" folder
            // in your Project first before running this. Or
            // you can direct the uploaded files to any
            // folder you wish.
            if (fileUploadText.HasFile)
            {
                String fpath = Request.PhysicalApplicationPath + "Resume\\" +
                fileUploadText.FileName;
                fileUploadText.SaveAs(fpath);
                txtDisplay.Text = "Success!";
                if (File.Exists(fpath))
                {
                    //read filename and display that is has been saved to account
                    string filename = fileUploadText.FileName;
                    txtDisplay.Text = filename + " has been saved to your account. To replace the uploaded file, upload another one and it will replace.";
                    //update Resume column from null to Resume file name
                    String sqlQuery = "UPDATE Student SET Resume = '" + filename + "' WHERE StudentUserName = '" + Session["StudentUserName"].ToString()+"'" ;

                    SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["SDB"].ConnectionString);

                    SqlCommand sqlCommand = new SqlCommand();
                    sqlCommand.Connection = sqlConnect;
                    sqlCommand.CommandType = CommandType.Text;
                    sqlCommand.CommandText = sqlQuery;

                    sqlConnect.Open();
                    sqlCommand.ExecuteScalar();
                    sqlConnect.Close();


                    lstStudentResume.Items.Clear();
                    updateFROMDB();

                }
            }
            else
            {
                txtDisplay.Text = "Something went wrong!";
            }
        }

        protected void lstStudentResume_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblSelectedIndex.Text = lstStudentResume.SelectedValue;

            
        }

            protected void bttnpdf_Click(object sender, EventArgs e)
        {
            string StudentResumename = lblSelectedIndex.Text;
            string FilePath = Server.MapPath("Resume") + "\\" + StudentResumename; //changed this from student resume to resume
            WebClient User = new WebClient();
            Byte[] FileBuffer = User.DownloadData(FilePath);
            if (FileBuffer != null)
            {
                Response.ContentType = "application/pdf";
                Response.AddHeader("content-length", FileBuffer.Length.ToString());
                Response.BinaryWrite(FileBuffer);
            }
            else
            {
                txtDisplay.Text = "Something went wrong!";
            }
        }


        //update listbox method
        protected void updateFROMDB()
        {

            String sqlQuery = "SELECT [Resume] FROM [Student]";
            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["SDB"].ConnectionString);

            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand.Connection = sqlConnect;
            sqlCommand.CommandType = CommandType.Text;
            sqlCommand.CommandText = sqlQuery;

            sqlConnect.Open();
            SqlDataReader queryResults = sqlCommand.ExecuteReader();


            while (queryResults.Read())
            {
                lstStudentResume.Items.Add(new ListItem(queryResults["Resume"].ToString()));
            }

            sqlConnect.Close();
            queryResults.Close();

        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            
            String sqlQuery = "UPDATE Student SET FirstName = @FirstName, LastName=@LastName, EmailAddress=@EmailAddress, PhoneNumber=@PhoneNumber, GradYear=@GradYear, Major=@Major, Grade=@Grade, EmploymentStatus=@EmploymentStatus WHERE StudentUserName = '" + Session["StudentUserName"].ToString() + "'";
            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["SDB"].ConnectionString);

            SqlCommand sqlCommand = new SqlCommand(sqlQuery, sqlConnect);
            sqlCommand.Parameters.AddWithValue("@FirstName", txtStudentFirstName.Text);
            sqlCommand.Parameters.AddWithValue("@LastName", txtStudentLastName.Text);
            sqlCommand.Parameters.AddWithValue("@EmailAddress", txtStudentEmail.Text);
            sqlCommand.Parameters.AddWithValue("@PhoneNumber", txtStudentPhoneNumber.Text);
            sqlCommand.Parameters.AddWithValue("@GradYear", txtExpectedGraduation.Text);
            sqlCommand.Parameters.AddWithValue("@Major", txtMajor.Text);
            sqlCommand.Parameters.AddWithValue("@Grade", txtGrade.Text);
            sqlCommand.Parameters.AddWithValue("@EmploymentStatus", txtEmploymentStatus.Text);

            sqlCommand.CommandType = CommandType.Text;
            sqlCommand.CommandText = sqlQuery;
            sqlConnect.Open();
            SqlDataReader queryResults = sqlCommand.ExecuteReader();

            // Close all related connections
            queryResults.Close();
            sqlConnect.Close();
            Response.Redirect("StudentAccountProfile.aspx");

            lblStatus.ForeColor = Color.Green;
            lblStatus.Font.Bold = true;
            lblStatus.Text = "Successfully updated Student Info!";
            System.Windows.Forms.MessageBox.Show("My message here");
        }

        //protected void btnPopulate_Click(object sender, EventArgs e)
        //{
        //    String sqlQuery2 = "SELECT * FROM Student WHERE StudentUserName = '" + Session["StudentUserName"].ToString() + "'";
        //    SqlConnection sqlConnect2 = new SqlConnection(WebConfigurationManager.ConnectionStrings["SDB"].ConnectionString);
        //    SqlCommand sqlCommand2 = new SqlCommand();
        //    sqlCommand2.Parameters.AddWithValue("@StudentUserName", Session["StudentUserName"]);
        //    sqlCommand2.Connection = sqlConnect2;
        //    sqlCommand2.CommandType = CommandType.Text;
        //    sqlCommand2.CommandText = sqlQuery2;
        //    sqlConnect2.Open();
        //    SqlDataReader queryResults2 = sqlCommand2.ExecuteReader();


        //    while (queryResults2.Read())

        //    {
        //        txtStudentFirstName.Text = queryResults2["FirstName"].ToString();
        //        txtStudentLastName.Text = queryResults2["LastName"].ToString();
        //        txtStudentEmail.Text = queryResults2["EmailAddress"].ToString();
        //        txtStudentPhoneNumber.Text = queryResults2["PhoneNumber"].ToString();
        //        txtExpectedGraduation.Text = queryResults2["GradYear"].ToString();
        //        txtMajor.Text = queryResults2["Major"].ToString();
        //        txtGrade.Text = queryResults2["Grade"].ToString();
        //        txtEmploymentStatus.Text = queryResults2["EmploymentStatus"].ToString();

        //    }
        //}
    }


}