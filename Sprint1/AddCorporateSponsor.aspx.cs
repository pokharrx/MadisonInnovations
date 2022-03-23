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
    public partial class AddCorporateSponsor : System.Web.UI.Page
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


                sc.CommandText = "INSERT INTO CorporateSponsor (ContactName, ContactPhone, ContactEmail, Role) VALUES ("
                    + "@Name, @Phone, @Email, @Role)";
                sc.Parameters.Add(new SqlParameter("@Name", HttpUtility.HtmlEncode(txtContactName.Text)));
                sc.Parameters.Add(new SqlParameter("@Phone", HttpUtility.HtmlEncode(txtContactPhone.Text)));
                sc.Parameters.Add(new SqlParameter("@Email", HttpUtility.HtmlEncode(txtContactEmail.Text)));
                sc.Parameters.Add(new SqlParameter("@Role", HttpUtility.HtmlEncode(txtContactRole.Text)));
                


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