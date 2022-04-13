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
    public partial class StudentMentorship : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btn_Click(object sender, EventArgs e)
        {
            String s = Session["StudentID"].ToString();
            try
            {
                System.Data.SqlClient.SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["SDB"].ConnectionString);
                sqlConnect.Open();
                SqlCommand sc = new SqlCommand();
                sc.Connection = sqlConnect;


                sc.CommandText = "INSERT INTO studentMentorshipApp (prefName, reason, StudentID, prior) VALUES ("
                    + "@pName, @reason, @StudentID, @prior)";
                sc.Parameters.Add(new SqlParameter("@pName", HttpUtility.HtmlEncode(txtPName.Text)));
                sc.Parameters.Add(new SqlParameter("@reason", HttpUtility.HtmlEncode(txtReason.Text)));
                sc.Parameters.Add(new SqlParameter("@StudentID", s));
                sc.Parameters.Add(new SqlParameter("@prior", "y"));

                sc.ExecuteNonQuery();
                sqlConnect.Close();
                lblStatus.Text = "Successfully Sent!";
            }
            catch (Exception)
            {
                lblStatus.Text = "Error uploading!";
                throw;
            }
        }
    }
}