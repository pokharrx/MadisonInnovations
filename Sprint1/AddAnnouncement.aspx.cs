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
    public partial class AddAnnouncement : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                System.Data.SqlClient.SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["SDB"].ConnectionString);
                sqlConnect.Open();
                SqlCommand sc = new SqlCommand();
                sc.Connection = sqlConnect;

                sc.CommandText = "INSERT INTO Notifications (Announcement) VALUES ("
                    + "@Announcement)";
                sc.Parameters.Add(new SqlParameter("@Announcement", HttpUtility.HtmlEncode(txtAnnounce.Text)));            

                sc.ExecuteNonQuery();
                sqlConnect.Close();
                txtAnnounce.Text = "";
                lblStatus1.Text = "Successfully Posted!";
            }
            catch (Exception)
            {
                lblStatus1.Text = "Error Posting!";
                throw;
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            String s = ddlAnnouncements.SelectedValue.ToString();
            String membersQuery = "Delete FROM Notifications WHERE notifID =" + s + ";";

            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["SDB"].ConnectionString);
            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand.Connection = sqlConnect;
            sqlCommand.CommandType = CommandType.Text;
            sqlCommand.CommandText = membersQuery;

            sqlConnect.Open();
            sqlCommand.ExecuteScalar();
            sqlConnect.Close();
            Response.Redirect("AddAnnouncement.aspx");
        }
    }
}