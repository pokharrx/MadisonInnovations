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
    public partial class NewInternship : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                System.Data.SqlClient.SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["SDB"].ConnectionString);
                sqlConnect.Open();
                SqlCommand sc = new SqlCommand();
                sc.Connection = sqlConnect;


                sc.CommandText = "INSERT INTO Internship (InternshipTitle, DateStart, DateEnd, Description, ApplicationLink) VALUES ("
                    + "@title, @Start, @End, @Description, @ApplicationLink)";
                sc.Parameters.Add(new SqlParameter("@Name", HttpUtility.HtmlEncode(txtInternshipTitle.Text)));
                sc.Parameters.Add(new SqlParameter("@Year", HttpUtility.HtmlEncode(txtDateStart.Text)));
                sc.Parameters.Add(new SqlParameter("@Description", HttpUtility.HtmlEncode(txtDateEnd.Text)));
                sc.Parameters.Add(new SqlParameter("@Amount", HttpUtility.HtmlEncode(txtInternshipDescription.Text)));
                sc.Parameters.Add(new SqlParameter("@Status", HttpUtility.HtmlEncode(txtApplicationLink.Text)));



                sc.ExecuteNonQuery();
                sqlConnect.Close();
                lblStatus.Text = "Successfully uploaded!";
            }
            catch (Exception)
            {
                lblStatus.Text = "Error uploading!";
                throw;
            }
        }
    }
}