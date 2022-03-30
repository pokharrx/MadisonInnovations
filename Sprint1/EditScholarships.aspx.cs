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
    public partial class EditScholarships : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                String s = Session["EditScholarshipID"].ToString();
                String membersQuery = "SELECT ScholarshipName, ScholarshipYear, ScholarshipAmount, Description, Status FROM Scholarship WHERE ScholarshipID =" + s + ";";

                SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["SDB"].ConnectionString);
                SqlCommand sqlCommand = new SqlCommand();
                sqlCommand.Connection = sqlConnect;
                sqlCommand.CommandType = CommandType.Text;
                sqlCommand.CommandText = membersQuery;

                sqlConnect.Open();
                SqlDataReader queryResults = sqlCommand.ExecuteReader();
                while (queryResults.Read())
                {
                    txtName.Text = queryResults["ScholarshipName"].ToString();
                    txtYear.Text = queryResults["ScholarshipYear"].ToString();
                    txtAmount.Text = queryResults["ScholarshipAmount"].ToString();
                    txtDescription.Text = queryResults["Description"].ToString();
                    txtStatus.Text = queryResults["Status"].ToString();

                }


                sqlConnect.Close();
                queryResults.Close();
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            {
                System.Data.SqlClient.SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["SDB"].ConnectionString);
                sqlConnect.Open();
                SqlCommand sc = new SqlCommand();
                sc.Connection = sqlConnect;
                String s = Session["EditScholarshipID"].ToString();
                sc.CommandText = "Update Scholarship SET ScholarshipName = @Name, ScholarshipYear = @Year, ScholarshipAmount = @Amount, Description" +
                    " = @Description, Status = @Status WHERE ScholarshipID =" + s + ";";

                sc.Parameters.Add(new SqlParameter("@Name", HttpUtility.HtmlEncode(txtName.Text)));
                sc.Parameters.Add(new SqlParameter("@Year", HttpUtility.HtmlEncode(txtYear.Text)));
                sc.Parameters.Add(new SqlParameter("@Amount", HttpUtility.HtmlEncode(txtAmount.Text)));
                sc.Parameters.Add(new SqlParameter("@Description", HttpUtility.HtmlEncode(txtDescription.Text)));
                sc.Parameters.Add(new SqlParameter("@Status", HttpUtility.HtmlEncode(txtStatus.Text)));
                sc.ExecuteNonQuery();
                sqlConnect.Close();
                ;



                lblStatus.Text = "Info Updated";
            }
        }
    }
}