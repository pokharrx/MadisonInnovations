﻿using System;
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
    public partial class MentorshipAssignment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            MaintainScrollPositionOnPostBack = true;


            if (!IsPostBack)
            {
                //Sql Query for Student Drop Down List


                // Define Connection to DB
                SqlConnection sqlConnect = new SqlConnection
                    (WebConfigurationManager.ConnectionStrings["SDB"].ConnectionString);

                // Create Query
                String sqlQuery = "SELECT FirstName + ' ' + LastName AS Name, StudentID FROM Student";
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
                    item.Value = queryResults["StudentID"].ToString();
                    ddlStudent.Items.Add(item);
                }

                //Close DB Connection
                sqlConnect.Close();
                queryResults.Close();


                //Sql Query for Member Drop Down List

                // Define Connection to DB
                SqlConnection sqlConnect2 = new SqlConnection
                    (WebConfigurationManager.ConnectionStrings["SDB"].ConnectionString);

                // Create Query
                String sqlQuery2 = "SELECT FirstName + ' ' + LastName AS Name, MemberID FROM Member";
                // Create SQL Command (Sends query to the DB
                SqlCommand sqlCommand2 = new SqlCommand();
                sqlCommand2.Connection = sqlConnect2;
                sqlCommand2.CommandType = CommandType.Text;
                sqlCommand2.CommandText = sqlQuery2;

                // Issue the query and retrieve the results
                sqlConnect2.Open();
                SqlDataReader queryResults2 = sqlCommand2.ExecuteReader();

                while (queryResults2.Read())
                {
                    ListItem item2 = new ListItem();
                    item2.Text = queryResults2["Name"].ToString();
                    item2.Value = queryResults2["MemberID"].ToString();
                    ddlMember.Items.Add(item2);
                }

                //Close DB Connection
                sqlConnect.Close();
                queryResults.Close();
            }
        }

        protected void btnMentorshipAssign_Click(object sender, EventArgs e)
        {
            if (isDuplicate() == false)
            {
                try
                {
                    // Create Query
                    String sqlQuery = "INSERT INTO StudentMentor (StudentID, MemberID) " +
                    "VALUES ('" + ddlStudent.SelectedValue + "','" + ddlMember.SelectedValue + "')";

                    // Define Connection to DB
                    SqlConnection sqlConnect = new SqlConnection
                    (WebConfigurationManager.ConnectionStrings["SDB"].ConnectionString);

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

                    lblStatus.ForeColor = Color.Green;
                    lblStatus.Text = "Mentorship Created.";
                }

                catch (Exception ex)
                {
                    lblStatus.Text = "";
                    lblError.Text = ex.Message;
                }
            }
            else
            {
                lblStatus.Text = "";
                lblError.Text = "This member is already mentoring this student.";
            }
        }

        // checks for duplicate entries
        protected Boolean isDuplicate()
        {
            try
            {

                // create Query
                String sqlQuery = "SELECT StudentID, MemberID FROM StudentMentor WHERE StudentID ='" + ddlStudent.SelectedValue + "' AND MemberID ='" + ddlMember.SelectedValue + "'";

                // Define Connection to DB
                SqlConnection sqlConnect = new SqlConnection
                    (WebConfigurationManager.ConnectionStrings["SDB"].ConnectionString);

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
            catch (Exception ex)
            {
                lblStatus.Text = "";
                lblError.Text = ex.Message;
                return true;
            }

        }
    }
}