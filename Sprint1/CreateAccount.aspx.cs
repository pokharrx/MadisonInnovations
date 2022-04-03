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
    public partial class CreateAccount : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCreateUser_Click(object sender, EventArgs e)
        {
            if (isDuplicate() == false)
            {
                if (txtFirstName.Text != "" && txtLastName.Text != "" && txtEmail.Text != "" && txtPassword.Text != "" && txtUsername.Text != "") // all fields must be filled out
                {
                    // COMMIT VALUES
                    try
                    {
                        System.Data.SqlClient.SqlConnection sc = new SqlConnection(WebConfigurationManager.ConnectionStrings["AUTH"].ConnectionString.ToString());
                        lblStatus.Text = "Database Connection Successful";

                        sc.Open();

                        System.Data.SqlClient.SqlCommand createUser = new System.Data.SqlClient.SqlCommand();
                        createUser.Connection = sc;

                        // INSERT USER RECORD
                        createUser.CommandText = "INSERT INTO Person (FirstName, LastName, Email, PersonType, Username) VALUES (@FName, @LName, @Email, " +
                            "@PType, @Username)";
                        createUser.Parameters.Add(new SqlParameter("@FName", txtFirstName.Text));
                        createUser.Parameters.Add(new SqlParameter("@LName", txtLastName.Text));
                        createUser.Parameters.Add(new SqlParameter("@Email", txtEmail.Text));
                        createUser.Parameters.Add(new SqlParameter("@PType", ddlPersonType.Text));
                        createUser.Parameters.Add(new SqlParameter("@Username", txtUsername.Text));
                        createUser.ExecuteNonQuery();


                        System.Data.SqlClient.SqlCommand setPass = new System.Data.SqlClient.SqlCommand();
                        setPass.Connection = sc;
                        // INSERT PASSWORD RECORD AND CONNECT TO USER
                        setPass.CommandText = "INSERT INTO Pass (UserID, Username, PasswordHash, Activation) VALUES ((select max(userid) from person), " +
                            "@Username, @Password, 'Inactive')";
                        setPass.Parameters.Add(new SqlParameter("@Username", txtUsername.Text));
                        setPass.Parameters.Add(new SqlParameter("@Password", PasswordHash.HashPassword(txtPassword.Text))); // hash entered password
                        setPass.ExecuteNonQuery();

                        sc.Close();

                        // GREY OUT TEXT BOXES
                        lblStatus.Text = "Account Request Submitted! You will be emailed soon with your verification.";
                        txtFirstName.Enabled = false;
                        txtLastName.Enabled = false;
                        txtEmail.Enabled = false;
                        ddlPersonType.Enabled = false;
                        txtUsername.Enabled = false;
                        txtPassword.Enabled = false;
                        btnCreateUser.Enabled = false;
                        lnkAnother.Visible = true;
                    }
                    catch
                    {
                        // ERROR MESSAGE
                        lblStatus.Text = "Database Error - Account Request Not Submitted.";
                    }
                }
                else
                {
                    // ERROR IF ALL FIELDS HAVE NOT BEEN ENTERED
                    lblStatus.Text = "All Fields Must Be Filled!";
                }
            }
            else
            {
                // ERROR IF PERSON HAS AN ACCOUNT WITH THE SAME USERNAME
                lblStatus.Text = "There is already an account with this Username!";
            }
        }

        // CREATE ANOTHER ACCOUNT REQUEST
        protected void lnkAnother_Click(object sender, EventArgs e)
        {
            // MAKE TEXT BOXES VISIBLE 
            txtFirstName.Enabled = true;
            txtLastName.Enabled = true;
            txtEmail.Enabled = true;
            ddlPersonType.Enabled = true;
            txtUsername.Enabled = true;
            txtPassword.Enabled = true;
            btnCreateUser.Enabled = true;
            lnkAnother.Visible = false;
            txtFirstName.Text = "";
            txtLastName.Text = "";
            txtEmail.Text = "";
            txtUsername.Text = "";
            txtPassword.Text = "";
            lblStatus.Text = "";
        }

        // Method to check for Duplicate entries
        protected Boolean isDuplicate()
        {
            try
            {
                // Get username from the prompt
                string username = this.txtUsername.Text;

                // create Query
                String sqlQuery = "SELECT UserID, FirstName, LastName, Email, Username FROM Person WHERE Username='" + username + "'";

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

                if (queryResults.Read())
                {
                    //Close DB Connection
                    sqlConnect.Close();
                    queryResults.Close();

                    //return true
                    return true;
                }
                else
                {
                    //Close DB Connection
                    sqlConnect.Close();
                    queryResults.Close();

                    //return false
                    return false;
                }
            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}