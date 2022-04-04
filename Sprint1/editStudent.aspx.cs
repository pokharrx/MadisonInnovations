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
    public partial class editStudent : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                String s = Session["EditStudentID"].ToString();
                String membersQuery = "SELECT FirstName, LastName, EmailAddress, PhoneNumber, GradYear, Major, Grade, Industry, EmploymentStatus FROM Student WHERE StudentID =" + s + ";";

                SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["SDB"].ConnectionString);
                SqlCommand sqlCommand = new SqlCommand();
                sqlCommand.Connection = sqlConnect;
                sqlCommand.CommandType = CommandType.Text;
                sqlCommand.CommandText = membersQuery;

                sqlConnect.Open();
                SqlDataReader queryResults = sqlCommand.ExecuteReader();
                while (queryResults.Read())
                {
                    txtFirst.Text = queryResults["FirstName"].ToString();
                    txtLast.Text = queryResults["LastName"].ToString();
                    txtEmail.Text = queryResults["EmailAddress"].ToString();
                    txtPhone.Text = queryResults["PhoneNumber"].ToString();
                    txtGrad.Text = queryResults["GradYear"].ToString();
                    txtMajor.Text = queryResults["Major"].ToString();
                    txtGrade.Text = queryResults["Grade"].ToString();
                    txtIndustry.Text = queryResults["Industry"].ToString();
                    txtEmp.Text = queryResults["EmploymentStatus"].ToString();

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
                String s = Session["EditStudentID"].ToString();
                sc.CommandText = "Update Student SET FirstName = @FName, LastName = @lName, EmailAddress = @Email, PhoneNumber" +
                    " = @Phone, GradYear = @Grad, Major = @Major, Grade = @Grade, Industry = @Industry, EmploymentStatus = @Emp WHERE StudentID =" + s + ";";

                sc.Parameters.Add(new SqlParameter("@FName", HttpUtility.HtmlEncode(txtFirst.Text)));
                sc.Parameters.Add(new SqlParameter("@lName", HttpUtility.HtmlEncode(txtLast.Text)));
                sc.Parameters.Add(new SqlParameter("@Email", HttpUtility.HtmlEncode(txtEmail.Text)));
                sc.Parameters.Add(new SqlParameter("@Phone", HttpUtility.HtmlEncode(txtPhone.Text)));
                sc.Parameters.Add(new SqlParameter("@Grad", HttpUtility.HtmlEncode(txtGrad.Text)));
                sc.Parameters.Add(new SqlParameter("@Major", HttpUtility.HtmlEncode(txtMajor.Text)));
                sc.Parameters.Add(new SqlParameter("@Grade", HttpUtility.HtmlEncode(txtGrade.Text)));
                sc.Parameters.Add(new SqlParameter("@Industry", HttpUtility.HtmlEncode(txtIndustry.Text)));
                sc.Parameters.Add(new SqlParameter("@Emp", HttpUtility.HtmlEncode(txtEmp.Text)));
                sc.ExecuteNonQuery();
                sqlConnect.Close();
                ;



                lblStatus.Text = "Info Updated";
                Response.Redirect("adminHome.aspx");
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            System.Data.SqlClient.SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["SDB"].ConnectionString);
            sqlConnect.Open();
            SqlCommand sc = new SqlCommand();
            sc.Connection = sqlConnect;
            sc.CommandType = CommandType.Text;
            String s = Session["EditStudentID"].ToString();

            sc.CommandText = "DELETE FROM Student WHERE StudentID  = " + s + ";";
            sc.ExecuteScalar();
            sqlConnect.Close();
            ;
        }
    }

}