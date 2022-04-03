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
    public partial class editCompanies : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                String s = Session["EditCompanyID"].ToString();
                String membersQuery = "SELECT CompanyName, CompanyAddress, CompanyPhone FROM Company WHERE CompanyID =" + s + ";";

                SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["SDB"].ConnectionString);
                SqlCommand sqlCommand = new SqlCommand();
                sqlCommand.Connection = sqlConnect;
                sqlCommand.CommandType = CommandType.Text;
                sqlCommand.CommandText = membersQuery;

                sqlConnect.Open();
                SqlDataReader queryResults = sqlCommand.ExecuteReader();
                while (queryResults.Read())
                {
                    txtName.Text = queryResults["CompanyName"].ToString();
                    txtAddress.Text = queryResults["CompanyAddress"].ToString();
                    txtPhone.Text = queryResults["CompanyPhone"].ToString();

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
                String s = Session["EditCompanyID"].ToString();
                sc.CommandText = "Update Company SET CompanyName = @Name, CompanyAddress = @Address, CompanyPhone = @Phone WHERE CompanyID =" + s + ";";

                sc.Parameters.Add(new SqlParameter("@Name", HttpUtility.HtmlEncode(txtName.Text)));
                sc.Parameters.Add(new SqlParameter("@Address", HttpUtility.HtmlEncode(txtAddress.Text)));
                sc.Parameters.Add(new SqlParameter("@Phone", HttpUtility.HtmlEncode(txtPhone.Text)));
                sc.ExecuteNonQuery();
                sqlConnect.Close();
                ;



                lblStatus.Text = "Info Updated";
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            System.Data.SqlClient.SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["SDB"].ConnectionString);
            sqlConnect.Open();
            SqlCommand sc = new SqlCommand();
            sc.Connection = sqlConnect;
            sc.CommandType = CommandType.Text;
            String s = Session["EditCompanyID"].ToString();

            sc.CommandText = "DELETE FROM Company WHERE CompanyID  = " + s + ";"; 
            sc.ExecuteScalar();
            sqlConnect.Close();
            ;
        }
    }
}