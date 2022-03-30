using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;

using System.Data.SqlClient;
using System.Web.Configuration;
using System.Drawing;
using System.IO;
using System.Data;

namespace Sprint1
{
    public partial class memberAccountProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["MemberUserName"] = Session["Username"].ToString();
            
        }

       

        protected void btnUpdate_Click(object sender, EventArgs e)
        {

            String sqlQuery = "UPDATE Member SET FirstName = @FirstName, LastName=@LastName, EmailAddress=@EmailAddress, PhoneNumber=@PhoneNumber,Title=@Title WHERE MemberUserName = '" + Session["MemberUserName"].ToString() + "'";
            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["SDB"].ConnectionString);

            SqlCommand sqlCommand = new SqlCommand(sqlQuery, sqlConnect);
            sqlCommand.Parameters.AddWithValue("@FirstName", txtMemberFirstName.Text);
            sqlCommand.Parameters.AddWithValue("@LastName", txtMemberLastName.Text);
            sqlCommand.Parameters.AddWithValue("@EmailAddress", txtMemberEmail.Text);
            sqlCommand.Parameters.AddWithValue("@PhoneNumber", txtMemberPhoneNumber.Text);
            sqlCommand.Parameters.AddWithValue("@Title", txtMemberTitle.Text);


            sqlCommand.CommandType = CommandType.Text;
            sqlCommand.CommandText = sqlQuery;
            sqlConnect.Open();
            SqlDataReader queryResults = sqlCommand.ExecuteReader();

            // Close all related connections
            queryResults.Close();
            sqlConnect.Close();

            Response.Redirect("memberAccountProfile.aspx");

        }

        protected void btnPopulate_Click(object sender, EventArgs e)
        {
            String sqlQuery2 = "SELECT * FROM Member WHERE MemberUserName = '" + Session["MemberUserName"].ToString() + "'";
            SqlConnection sqlConnect2 = new SqlConnection(WebConfigurationManager.ConnectionStrings["SDB"].ConnectionString);
            SqlCommand sqlCommand2 = new SqlCommand();
            sqlCommand2.Parameters.AddWithValue("@MemberUserName", Session["MemberUserName"]);
            sqlCommand2.Connection = sqlConnect2;
            sqlCommand2.CommandType = CommandType.Text;
            sqlCommand2.CommandText = sqlQuery2;
            sqlConnect2.Open();
            SqlDataReader queryResults2 = sqlCommand2.ExecuteReader();


            while (queryResults2.Read())

            {
                txtMemberFirstName.Text = queryResults2["FirstName"].ToString();
                txtMemberLastName.Text = queryResults2["LastName"].ToString();
                txtMemberEmail.Text = queryResults2["EmailAddress"].ToString();
                txtMemberPhoneNumber.Text = queryResults2["PhoneNumber"].ToString();
                txtMemberTitle.Text = queryResults2["Title"].ToString();
               

            }
        }


    }
}