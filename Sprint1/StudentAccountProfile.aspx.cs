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
            //Hard coding Session Student ID until all the SQL data is inuptes
            Session["StudentID"] = 1;
            updateFROMDB();

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
                    String sqlQuery = "UPDATE Student SET Resume = '" + filename + "' WHERE StudentID = " + Session["StudentID"];

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



    }


}