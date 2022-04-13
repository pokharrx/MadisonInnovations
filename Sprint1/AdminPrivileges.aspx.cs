using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Drawing;

namespace Sprint1
{
    public partial class AdminPrivileges : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"].ToString() != "admin")
            {
                lblWelcome.Visible = false;
                lblStatus.Visible = true;
                lblStatus.ForeColor = Color.Red;
            }

            try
            {
                // Define Connection to DB
                SqlConnection sqlConnect = new SqlConnection
                    (WebConfigurationManager.ConnectionStrings["SDB"].ConnectionString);

                // Create Query
                String sqlQuery = "SELECT FirstName + ' ' + LastName AS Name, MemberID FROM Member WHERE AccountType='Member'";
                // Create SQL Command (Sends query to the DB
                SqlCommand sqlCommand = new SqlCommand();
                sqlCommand.Connection = sqlConnect;
                sqlCommand.CommandType = CommandType.Text;
                sqlCommand.CommandText = sqlQuery;

                // Issue the query and retrieve the results
                sqlConnect.Open();
                SqlDataReader queryResults = sqlCommand.ExecuteReader();

                while (queryResults.Read())
                {
                    ListItem item = new ListItem();
                    item.Text = queryResults["Name"].ToString();
                    item.Value = queryResults["MemberID"].ToString();
                    ddlMembersUpgrade.Items.Add(item);
                }

                //Close DB Connection
                sqlConnect.Close();
                queryResults.Close();
            }
            catch (Exception)
            {

                throw;
            }

            try
            {
                // Define Connection to DB
                SqlConnection sqlConnect = new SqlConnection
                    (WebConfigurationManager.ConnectionStrings["SDB"].ConnectionString);

                // Create Query
                String sqlQuery = "SELECT FirstName + ' ' + LastName AS Name, MemberID FROM Member WHERE AccountType='Admin' AND MemberUserName != 'admin'";
                // Create SQL Command (Sends query to the DB
                SqlCommand sqlCommand = new SqlCommand();
                sqlCommand.Connection = sqlConnect;
                sqlCommand.CommandType = CommandType.Text;
                sqlCommand.CommandText = sqlQuery;

                // Issue the query and retrieve the results
                sqlConnect.Open();
                SqlDataReader queryResults = sqlCommand.ExecuteReader();

                while (queryResults.Read())
                {
                    ListItem item = new ListItem();
                    item.Text = queryResults["Name"].ToString();
                    item.Value = queryResults["MemberID"].ToString();
                    ddlAdmins.Items.Add(item);
                }

                //Close DB Connection
                sqlConnect.Close();
                queryResults.Close();
            }
            catch (Exception)
            {

                throw;
            }
        }

        protected void btnUpgrade_Click(object sender, EventArgs e)
        {
            // Define Connection to DB
            SqlConnection sqlConnect = new SqlConnection
                (WebConfigurationManager.ConnectionStrings["SDB"].ConnectionString);

            // Create Query
            String sqlQuery = "UPDATE Member SET AccountType='Admin' WHERE MemberID=" + ddlMembersUpgrade.SelectedValue;
            // Create SQL Command (Sends query to the DB
            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand.Connection = sqlConnect;
            sqlCommand.CommandType = CommandType.Text;
            sqlCommand.CommandText = sqlQuery;

            // Issue the query and retrieve the results
            sqlConnect.Open();
            SqlDataReader queryResults = sqlCommand.ExecuteReader();

            //Close DB Connection
            sqlConnect.Close();
            queryResults.Close();
        }

        protected void btnDowngrade_Click(object sender, EventArgs e)
        {
            // Define Connection to DB
            SqlConnection sqlConnect = new SqlConnection
                (WebConfigurationManager.ConnectionStrings["SDB"].ConnectionString);

            // Create Query
            String sqlQuery = "UPDATE Member SET AccountType='Member' WHERE MemberID=" + ddlMembersUpgrade.SelectedValue;
            // Create SQL Command (Sends query to the DB
            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand.Connection = sqlConnect;
            sqlCommand.CommandType = CommandType.Text;
            sqlCommand.CommandText = sqlQuery;

            // Issue the query and retrieve the results
            sqlConnect.Open();
            SqlDataReader queryResults = sqlCommand.ExecuteReader();

            //Close DB Connection
            sqlConnect.Close();
            queryResults.Close();
        }
    }
}