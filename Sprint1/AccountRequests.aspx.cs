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
    public partial class AccountRequests : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAuthorizeAccount_Click(object sender, EventArgs e)
        {
            try
            {
                String sqlQuery = "UPDATE Pass SET Activation = 'Active' WHERE UserID =" + dvUnauthorizedUsers.SelectedValue;

                System.Data.SqlClient.SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["AUTH"].ConnectionString.ToString());

                // create and structure query command for insert
                SqlCommand sqlCommand = new SqlCommand();
                sqlCommand.Connection = sqlConnect;
                sqlCommand.CommandType = CommandType.Text;
                sqlCommand.CommandText = sqlQuery;

                // execute query and retrieve results
                sqlConnect.Open();
                sqlCommand.ExecuteScalar();
                sqlConnect.Close();

                Response.Redirect("AccountRequests.aspx");
            }
            catch (Exception)
            {

            }
        }

        protected void btnUnAuthorizeAccount_Click(object sender, EventArgs e)
        {
            lblVerification.Visible = true;
            btnYes.Visible = true;
            btnNo.Visible = true;
        }

        protected void btnYes_Click(object sender, EventArgs e)
        {

        }

        protected void btnNo_Click(object sender, EventArgs e)
        {
            lblVerification.Visible = false;
            btnYes.Visible = false;
            btnNo.Visible = false;
        }
    }
}