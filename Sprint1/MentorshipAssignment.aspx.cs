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
    public partial class MentorshipAssignment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            MaintainScrollPositionOnPostBack = true;
            

            if (!IsPostBack)//change it so that the queries populate from new tables
            {
                //Sql Query for Student Drop Down List
                String s = ddlStudent.SelectedValue.ToString();
                String membersQuery = "SELECT TOP 1 reason FROM studentMentorshipApp;";
                //String membersQuery = "SELECT TOP 1 reason FROM studentMentorshipApp WHERE studentID ='" + s + "';";
                SqlConnection sqlConnect1 = new SqlConnection(WebConfigurationManager.ConnectionStrings["SDB"].ConnectionString);
                SqlCommand sqlCommand1 = new SqlCommand();
                sqlCommand1.Connection = sqlConnect1;
                sqlCommand1.CommandType = CommandType.Text;
                sqlCommand1.CommandText = membersQuery;

                sqlConnect1.Open();
                SqlDataReader queryResults1 = sqlCommand1.ExecuteReader();
                while (queryResults1.Read())
                {
                    //pull the reason they want a mentor as a reminder
                    lblInfo.Text = queryResults1["reason"].ToString();

                }
                String mentees = "SELECT top 1 numMentees, memberID FROM memberMentorPref;";

                SqlConnection sqlConnect3 = new SqlConnection(WebConfigurationManager.ConnectionStrings["SDB"].ConnectionString);
                SqlCommand sqlCommand3 = new SqlCommand();
                sqlCommand3.Connection = sqlConnect3;
                sqlCommand3.CommandType = CommandType.Text;
                sqlCommand3.CommandText = mentees;

                sqlConnect3.Open();
                SqlDataReader queryResults3 = sqlCommand3.ExecuteReader();
                while (queryResults3.Read())
                {
                    //pull the max
                    lblMax.Text = queryResults3["numMentees"].ToString();
                    Session["load"] = queryResults3["memberID"].ToString();

                }


                sqlConnect3.Close();
                queryResults3.Close();


                sqlConnect1.Close();
                queryResults1.Close();

                System.Data.SqlClient.SqlConnection sqlConnect4 = new SqlConnection(WebConfigurationManager.ConnectionStrings["SDB"].ConnectionString);
                sqlConnect4.Open();
                SqlCommand sc = new SqlCommand();
                sc.Connection = sqlConnect4;
                String z = Session["load"].ToString();
                sc.CommandText = "SELECT COUNT(StudentID) FROM StudentMentor WHERE MemberID =" + z + ";";
                string x = Convert.ToString(sc.ExecuteScalar());
                sqlConnect4.Close();
                lblCurrent.Text = x;

                // Define Connection to DB
                SqlConnection sqlConnect = new SqlConnection
                    (WebConfigurationManager.ConnectionStrings["SDB"].ConnectionString);

                // Create Query
                String sqlQuery = "SELECT prefName, studentID FROM studentMentorshipApp";
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
                    item.Text = queryResults["prefName"].ToString();
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
                String sqlQuery2 = "SELECT prefName, MemberID FROM memberMentorPref";
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
                    item2.Text = queryResults2["prefName"].ToString();
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

                    System.Data.SqlClient.SqlConnection sqlConnect1 = new SqlConnection(WebConfigurationManager.ConnectionStrings["SDB"].ConnectionString);
                    sqlConnect1.Open();
                    SqlCommand sc = new SqlCommand();
                    sc.Connection = sqlConnect1;
                    sc.CommandType = CommandType.Text;
                    String s = ddlStudent.SelectedValue.ToString();

                    sc.CommandText = "DELETE FROM studentMentorshipApp WHERE StudentID  = " + s + ";";
                    sc.ExecuteScalar();
                    sqlConnect.Close();

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

        protected void ddlStudent_SelectedIndexChanged(object sender, EventArgs e)
        {
            String s = ddlStudent.SelectedValue.ToString();
            String membersQuery = "SELECT reason FROM studentMentorshipApp WHERE studentID =" + s + ";";

            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["SDB"].ConnectionString);
            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand.Connection = sqlConnect;
            sqlCommand.CommandType = CommandType.Text;
            sqlCommand.CommandText = membersQuery;

            sqlConnect.Open();
            SqlDataReader queryResults = sqlCommand.ExecuteReader();
            while (queryResults.Read())
            {
                //pull the reason they want a mentor as a reminder
                lblInfo.Text = queryResults["reason"].ToString();

            }


            sqlConnect.Close();
            queryResults.Close();
        }

        protected void ddlMember_SelectedIndexChanged(object sender, EventArgs e)
        {
            String s = ddlMember.SelectedValue.ToString();
            String membersQuery = "SELECT numMentees FROM memberMentorPref WHERE memberID =" + s + ";";

            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["SDB"].ConnectionString);
            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand.Connection = sqlConnect;
            sqlCommand.CommandType = CommandType.Text;
            sqlCommand.CommandText = membersQuery;

            sqlConnect.Open();
            SqlDataReader queryResults = sqlCommand.ExecuteReader();
            while (queryResults.Read())
            {
                //pull the max
                lblMax.Text = queryResults["numMentees"].ToString();


            }


            sqlConnect.Close();
            queryResults.Close();


            //String membersQuery2 = "SELECT COUNT(StudentID) FROM StudentMentor WHERE MemberID =" + s + ";";

            //SqlConnection sqlConnect2 = new SqlConnection(WebConfigurationManager.ConnectionStrings["SDB"].ConnectionString);
            //SqlCommand sqlCommand2 = new SqlCommand();
            //sqlCommand.Connection = sqlConnect2;
            //sqlCommand.CommandType = CommandType.Text;
            //sqlCommand.CommandText = membersQuery2;

            //sqlConnect2.Open();
            //SqlDataReader queryResults2 = sqlCommand.ExecuteReader();
            //while (queryResults2.Read())
            //{
            //    //need max, will need another query for current
            //    lblCurrent.Text = queryResults2["StudentID"].ToString();


            //}


            //sqlConnect2.Close();
            //queryResults2.Close();

            System.Data.SqlClient.SqlConnection sqlConnect2 = new SqlConnection(WebConfigurationManager.ConnectionStrings["SDB"].ConnectionString);
            sqlConnect2.Open();
            SqlCommand sc = new SqlCommand();
            sc.Connection = sqlConnect2;
            sc.CommandText = "SELECT COUNT(StudentID) FROM StudentMentor WHERE MemberID =" + s + ";";
            string x = Convert.ToString(sc.ExecuteScalar());
            sqlConnect2.Close();
            lblCurrent.Text = x;
        }
    }
}