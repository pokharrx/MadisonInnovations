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
    public partial class editOther : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                String s = Session["EditOtherID"].ToString();
                String membersQuery = "SELECT OtherTitle, DateStart, DateEnd, Description, ApplicationLink FROM Other WHERE OtherID =" + s + ";";

                SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["SDB"].ConnectionString);
                SqlCommand sqlCommand = new SqlCommand();
                sqlCommand.Connection = sqlConnect;
                sqlCommand.CommandType = CommandType.Text;
                sqlCommand.CommandText = membersQuery;

                sqlConnect.Open();
                SqlDataReader queryResults = sqlCommand.ExecuteReader();
                while (queryResults.Read())
                {
                    txtTitle.Text = queryResults["OtherTitle"].ToString();
                    txtStart.Text = queryResults["DateStart"].ToString();
                    txtEnd.Text = queryResults["DateEnd"].ToString();
                    txtDescription.Text = queryResults["Description"].ToString();
                    txtApp.Text = queryResults["ApplicationLink"].ToString();

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
                String s = Session["EditOtherID"].ToString();
                sc.CommandText = "Update Other SET OtherTitle = @Title, DateStart = @Start, DateEnd = @End, Description" +
                    " = @Description, ApplicationLink = @App WHERE OtherID =" + s + ";";

                sc.Parameters.Add(new SqlParameter("@Title", HttpUtility.HtmlEncode(txtTitle.Text)));
                sc.Parameters.Add(new SqlParameter("@Start", HttpUtility.HtmlEncode(txtStart.Text)));
                sc.Parameters.Add(new SqlParameter("@End", HttpUtility.HtmlEncode(txtEnd.Text)));
                sc.Parameters.Add(new SqlParameter("@Description", HttpUtility.HtmlEncode(txtDescription.Text)));
                sc.Parameters.Add(new SqlParameter("@App", HttpUtility.HtmlEncode(txtApp.Text)));
                sc.ExecuteNonQuery();
                sqlConnect.Close();
                ;



                lblStatus.Text = "Info Updated";
            }
        }
    }
}