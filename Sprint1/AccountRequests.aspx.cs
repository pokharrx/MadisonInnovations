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
        static string firstname = "";
        static string lastname = "";
        static string email = "";
        static string persontype = "";
        static string username = "";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //METHOD FOR AUTHORIZE BUTTON CLICK
        protected void btnAuthorizeAccount_Click(object sender, EventArgs e)
        {
            
            try
            {
                // UPDATE ACTIVATION OF USER
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

                getUserData();

                if (persontype == "Student")
                {
                    // create Query
                    String sqlInsertStudent = "INSERT INTO Student (FirstName, LastName, EmailAddress, StudentUserName) VALUES ('" + firstname + "','" + lastname + "','" + email + "','" + username + "')";

                    // Define Connection to DB
                    SqlConnection sqlConnect2 = new SqlConnection
                        (WebConfigurationManager.ConnectionStrings["SDB"].ConnectionString);

                    // Create SQL Command (Sends query to the DB
                    SqlCommand sqlCommand2 = new SqlCommand();
                    sqlCommand2.Connection = sqlConnect2;
                    sqlCommand2.CommandType = CommandType.Text;
                    sqlCommand2.CommandText = sqlInsertStudent;

                    // Issue the query and retrieve the results
                    sqlConnect2.Open();
                    SqlDataReader queryResults2 = sqlCommand2.ExecuteReader();
                    sqlConnect2.Close();
                }

                else if (persontype == "Member")
                {
                    // create Query
                    String sqlInsertMember = "INSERT INTO Member (FirstName, LastName, EmailAddress, MemberUserName) VALUES ('" + firstname + "','" + lastname + "','" + email + "','" + username + "')";

                    // Define Connection to DB
                    SqlConnection sqlConnect3 = new SqlConnection
                        (WebConfigurationManager.ConnectionStrings["SDB"].ConnectionString);

                    // Create SQL Command (Sends query to the DB
                    SqlCommand sqlCommand3 = new SqlCommand();
                    sqlCommand3.Connection = sqlConnect3;
                    sqlCommand3.CommandType = CommandType.Text;
                    sqlCommand3.CommandText = sqlInsertMember;

                    // Issue the query and retrieve the results
                    sqlConnect3.Open();
                    SqlDataReader queryResults3 = sqlCommand3.ExecuteReader();
                    sqlConnect3.Close();
                }

                Response.Redirect("AccountRequests.aspx");

                lblStatus.Text = firstname + " " + lastname + "'s account has been activated!";

            }
            catch (Exception)
            {

            }
        }

        protected void btnUnAuthorizeAccount_Click(object sender, EventArgs e)
        {
            getUserData();

            // create Query
            String sqlQuery = "DELETE FROM Pass WHERE UserID=" + dvUnauthorizedUsers.SelectedValue;

            // Define Connection to DB
            SqlConnection sqlConnect = new SqlConnection
                (WebConfigurationManager.ConnectionStrings["AUTH"].ConnectionString);

            // Create SQL Command (Sends query to the DB
            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand.Connection = sqlConnect;
            sqlCommand.CommandType = CommandType.Text;
            sqlCommand.CommandText = sqlQuery;

            // Issue the query and retrieve the results
            sqlConnect.Open();
            SqlDataReader queryResults = sqlCommand.ExecuteReader();
            sqlConnect.Close();


            // create Query to delete
            String sqlInsertStudent = "DELETE FROM Person WHERE UserID=" + dvUnauthorizedUsers.SelectedValue;

            // Define Connection to DB
            SqlConnection sqlConnect2 = new SqlConnection
                (WebConfigurationManager.ConnectionStrings["AUTH"].ConnectionString);

            // Create SQL Command (Sends query to the DB
            SqlCommand sqlCommand2 = new SqlCommand();
            sqlCommand2.Connection = sqlConnect2;
            sqlCommand2.CommandType = CommandType.Text;
            sqlCommand2.CommandText = sqlInsertStudent;

            // Issue the query and retrieve the results
            sqlConnect2.Open();
            SqlDataReader queryResults2 = sqlCommand2.ExecuteReader();
            sqlConnect2.Close();

            Response.Redirect("AccountRequests.aspx");

            lblStatus.Text = firstname + " " + lastname + "'s account has been deactivated!";
        }

        // Method to pull the information of selected person
        protected void getUserData()
        {
            // create Query
            String sqlGetInfo = "SELECT FirstName, LastName, Email, PersonType, Username FROM Person WHERE UserID='" + dvUnauthorizedUsers.SelectedValue + "'";

            // Define Connection to DB
            SqlConnection sqlConnect2 = new SqlConnection
                (WebConfigurationManager.ConnectionStrings["AUTH"].ConnectionString);

            // Create SQL Command (Sends query to the DB
            SqlCommand sqlCommand2 = new SqlCommand();
            sqlCommand2.Connection = sqlConnect2;
            sqlCommand2.CommandType = CommandType.Text;
            sqlCommand2.CommandText = sqlGetInfo;

            // Issue the query and retrieve the results
            sqlConnect2.Open();
            SqlDataReader queryResults2 = sqlCommand2.ExecuteReader();

            if (queryResults2.Read())
            {
                firstname = queryResults2["FirstName"].ToString();
                lastname = queryResults2["LastName"].ToString();
                email = queryResults2["Email"].ToString();
                persontype = queryResults2["PersonType"].ToString();
                username = queryResults2["Username"].ToString();

            }

            sqlConnect2.Close();

        }



    }
}