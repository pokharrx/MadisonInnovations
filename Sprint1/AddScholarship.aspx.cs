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
    public partial class AddScholarship : System.Web.UI.Page
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


                sc.CommandText = "INSERT INTO Scholarship (ScholarshipName, ScholarshipYear, ScholarshipAmount,  Description, Status) VALUES ("
                    + "@Name, @Year, @Amount, @Description, @Status)";
                sc.Parameters.Add(new SqlParameter("@Name", HttpUtility.HtmlEncode(txtScholarshipName.Text)));
                sc.Parameters.Add(new SqlParameter("@Year", HttpUtility.HtmlEncode(txtScholarshipYear.Text)));
                sc.Parameters.Add(new SqlParameter("@Description", HttpUtility.HtmlEncode(txtScholarshipDescription.Text)));
                sc.Parameters.Add(new SqlParameter("@Amount", HttpUtility.HtmlEncode(txtScholarshipAmount.Text)));
                sc.Parameters.Add(new SqlParameter("@Status", HttpUtility.HtmlEncode(txtScholarshipStatus.Text)));



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