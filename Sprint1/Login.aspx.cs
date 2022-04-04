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
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["MustLogin"] == null)
            {
                lblStatus.Text = "Please login to continue.";
            }
            else
            {
                lblStatus.Text = Session["MustLogin"].ToString();
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            // connect to database to retrieve stored password string
            try
            {
                System.Data.SqlClient.SqlConnection sc = new SqlConnection(WebConfigurationManager.ConnectionStrings["AUTH"].ConnectionString.ToString());
                lblStatus.Text = "Database Connection Successful";

                sc.Open();
                System.Data.SqlClient.SqlCommand findPass = new System.Data.SqlClient.SqlCommand();
                findPass.Connection = sc;
                // SELECT PASSWORD STRING WHERE THE ENTERED USERNAME MATCHES
                findPass.CommandType = CommandType.StoredProcedure;
                findPass.CommandText = "sp_UserLogin";
                //findPass.CommandText = "SELECT p.PersonType, pa.Username, pa.Activation, pa.PasswordHash FROM Person p JOIN Pass pa ON p.UserID=pa.UserID WHERE pa.Username = @Username";
                findPass.Parameters.Add(new SqlParameter("@Username", txtUsername.Text));
                //findPass.Parameters.Add(new SqlParameter("@PasswordHash", PasswordHash.HashPassword(txtPassword.Text)));

                SqlDataReader reader = findPass.ExecuteReader(); // create a reader

                if (reader.HasRows) // if the username exists, it will continue
                {
                    while (reader.Read()) // this will read the single record that matches the entered username
                    {
                        string storedHash = reader["PasswordHash"].ToString(); // store the database password into this variable
                        string persontype = reader["PersonType"].ToString(); // store the database PersonType into this variable
                        string activation = reader["Activation"].ToString(); // store the database Activation Status into this variable

                        if (PasswordHash.ValidatePassword(txtPassword.Text, storedHash)) // if the entered password matches what is stored, it will show success
                        {
                            if (persontype == "Member" & activation == "Active")
                            {
                                Session["Username"] = txtUsername.Text;
                                Response.Redirect("memberHome.aspx");
                            }
                            else if (persontype == "Student" & activation == "Active")
                            {
                                Session["Username"] = txtUsername.Text;

                                Response.Redirect("studentHome.aspx");
                            }
                            else if (persontype == "Admin" & activation == "Active")
                            {
                                Session["Username"] = txtUsername.Text;
                                Response.Redirect("adminHome.aspx");
                            }
                            else
                            {
                                lblStatus.Text = "Your account has not been activated by our admins yet!";
                            }
                        }
                        else
                            lblStatus.Text = "Username or Password is incorrect.";
                    }
                }
                else // if the username doesn't exist, it will show failure
                    lblStatus.Text = "Username or Password is incorrect.";

                sc.Close();
            }
            catch (Exception args)
            {
                lblStatus.Text = "Database Error. " + args;
            }
        }
        }
}