using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Diagnostics;
using System.ComponentModel;
using System.IO;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Drawing;

namespace Sprint1
{
    public partial class adminHome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                //use a datatable for storing all the data
                DataTable dt1 = new DataTable();
                string studentQuery = "SELECT * FROM Student";
                DataTable dt2 = new DataTable();
                string companyQuery = "SELECT * FROM Company";
                DataTable dt3 = new DataTable();
                string jobQuery = "SELECT * FROM Job";
                DataTable dt4 = new DataTable();
                string internshipQuery = "SELECT * FROM Internship";
                DataTable dt5 = new DataTable();
                string scholarshipQuery = "SELECT * FROM Scholarship";
                string otherQuery = "SELECT * FROM Other";
                DataTable dt6 = new DataTable();

                //using automatically closes the connection when its done being used
                using (SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["SDB"].ConnectionString))
                using (SqlDataAdapter studentAdapter = new SqlDataAdapter(studentQuery, connection))
                using (SqlDataAdapter companyAdapter = new SqlDataAdapter(companyQuery, connection))
                using (SqlDataAdapter jobAdapter = new SqlDataAdapter(jobQuery, connection))
                using (SqlDataAdapter internshipAdapter = new SqlDataAdapter(internshipQuery, connection))
                using (SqlDataAdapter scholarshipAdapter = new SqlDataAdapter(scholarshipQuery, connection))
                using (SqlDataAdapter otherAdapter = new SqlDataAdapter(otherQuery, connection))
                {
                    try
                    {
                        //database fills the datatable
                        studentAdapter.Fill(dt1);
                        companyAdapter.Fill(dt2);
                        jobAdapter.Fill(dt3);
                        internshipAdapter.Fill(dt4);
                        scholarshipAdapter.Fill(dt5);
                        otherAdapter.Fill(dt6);
                    }
                    catch
                    {
                    }
                }

                //save the datatable into a viewstate for later use
                ViewState["grdStudents"] = dt1;
                ViewState["grdCompanies"] = dt2;
                ViewState["grdJobs"] = dt3;
                ViewState["grdInternships"] = dt4;
                ViewState["grdScholarships"] = dt5;
                ViewState["grdOther"] = dt6;

                //bind the datasource to the gridview
                grdStudents.DataSource = dt1;
                grdStudents.DataBind();
                grdCompanies.DataSource = dt2;
                grdCompanies.DataBind();
                grdJobs.DataSource = dt3;
                grdJobs.DataBind();
                grdInternships.DataSource = dt4;
                grdInternships.DataBind();
                grdScholarships.DataSource = dt5;
                grdScholarships.DataBind();
                grdOther.DataSource = dt6;
                grdOther.DataBind();
            }
        }

        protected void btnStudentSearch_Click(object sender, EventArgs e)
        {
            string searchStudent = txtStudentSearch.Text.ToLower();

            // check if the student search is at least 1 characters
            if (searchStudent.Length >= 1)
            {
                if (ViewState["grdStudents"] == null)
                    return;

                DataTable dt = ViewState["grdStudents"] as DataTable;

                // making a clone of datatable
                DataTable dtNew = dt.Clone();

                // loop through table for correct fields
                foreach (DataRow row in dt.Rows)
                {
                    if (row["FirstName"].ToString().ToLower().Contains(searchStudent) || row["LastName"].ToString().ToLower().Contains(searchStudent))
                    {
                        //finding copy and add to new table
                        dtNew.Rows.Add(row.ItemArray);
                    }
                }

                // rebind the grid
                grdStudents.DataSource = dtNew;
                grdStudents.DataBind();
            }
        }
        protected void btnAllStudents_Click(object sender, EventArgs e)
        {
            //use a datatable for storing all the data
            DataTable dt = new DataTable();
            string query = "SELECT * FROM Student";

            //using automatically closes the connection when its done being used
            using (SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["SDB"].ConnectionString))
            using (SqlDataAdapter adapter = new SqlDataAdapter(query, connection))
            {
                try
                {
                    //database fills the datatable
                    adapter.Fill(dt);
                }
                catch
                {
                }
            }

            //save the datatable into a viewstate for later use
            ViewState["grdStudents"] = dt;

            //bind the datasource to the gridview
            grdStudents.DataSource = dt;
            grdStudents.DataBind();
        }

        protected void btnCompanySearch_Click(object sender, EventArgs e)
        {
            string searchCompany = txtCompanySearch.Text.ToLower();

            // check if the student search is at least 1 characters
            if (searchCompany.Length >= 1)
            {
                if (ViewState["grdCompanies"] == null)
                    return;

                DataTable dt = ViewState["grdCompanies"] as DataTable;

                // making a clone of datatable
                DataTable dtNew = dt.Clone();

                // loop through table for correct fields
                foreach (DataRow row in dt.Rows)
                {
                    if (row["CompanyName"].ToString().ToLower().Contains(searchCompany))
                    {
                        //finding copy and add to new table
                        dtNew.Rows.Add(row.ItemArray);
                    }
                }
                // rebind the grid
                grdCompanies.DataSource = dtNew;
                grdCompanies.DataBind();
            }
        }

        protected void btnAllCompanies_Click(object sender, EventArgs e)
        {
            //use a datatable for storing all the data
            DataTable dt = new DataTable();
            string query = "SELECT * FROM Company";

            //using automatically closes the connection when its done being used
            using (SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["SDB"].ConnectionString))
            using (SqlDataAdapter adapter = new SqlDataAdapter(query, connection))
            {
                try
                {
                    //database fills the datatable
                    adapter.Fill(dt);
                }
                catch
                {
                }
            }

            //save the datatable into a viewstate for later use
            ViewState["grdCompanies"] = dt;

            //bind the datasource to the gridview
            grdCompanies.DataSource = dt;
            grdCompanies.DataBind();
        }

        protected void btnJobSearch_Click(object sender, EventArgs e)
        {
            string searchJob = txtJobSearch.Text.ToLower();

            // check if the student search is at least 1 characters
            if (searchJob.Length >= 1)
            {
                if (ViewState["grdJobs"] == null)
                    return;

                DataTable dt = ViewState["grdJobs"] as DataTable;

                // making a clone of datatable
                DataTable dtNew = dt.Clone();

                // loop through table for correct fields
                foreach (DataRow row in dt.Rows)
                {
                    if (row["JobTitle"].ToString().ToLower().Contains(searchJob))
                    {
                        //finding copy and add to new table
                        dtNew.Rows.Add(row.ItemArray);
                    }
                }
                // rebind the grid
                grdJobs.DataSource = dtNew;
                grdJobs.DataBind();
            }
        }

        protected void btnAllJobs_Click(object sender, EventArgs e)
        {
            //use a datatable for storing all the data
            DataTable dt = new DataTable();
            string query = "SELECT * FROM Job";

            //using automatically closes the connection when its done being used
            using (SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["SDB"].ConnectionString))
            using (SqlDataAdapter adapter = new SqlDataAdapter(query, connection))
            {
                try
                {
                    //database fills the datatable
                    adapter.Fill(dt);
                }
                catch
                {
                }
            }

            //save the datatable into a viewstate for later use
            ViewState["grdJobs"] = dt;

            //bind the datasource to the gridview
            grdJobs.DataSource = dt;
            grdJobs.DataBind();
        }

        protected void btnInternshipSearch_Click(object sender, EventArgs e)
        {
            string searchInternship = txtInternshipSearch.Text.ToLower();

            // check if the student search is at least 1 characters
            if (searchInternship.Length >= 1)
            {
                if (ViewState["grdInternships"] == null)
                    return;

                DataTable dt = ViewState["grdInternships"] as DataTable;

                // making a clone of datatable
                DataTable dtNew = dt.Clone();

                // loop through table for correct fields
                foreach (DataRow row in dt.Rows)
                {
                    if (row["InternshipTitle"].ToString().ToLower().Contains(searchInternship))
                    {
                        //finding copy and add to new table
                        dtNew.Rows.Add(row.ItemArray);
                    }
                }
                // rebind the grid
                grdInternships.DataSource = dtNew;
                grdInternships.DataBind();
            }
        }

        protected void btnAllInternships_Click(object sender, EventArgs e)
        {
            //use a datatable for storing all the data
            DataTable dt = new DataTable();
            string query = "SELECT * FROM Internship";

            //using automatically closes the connection when its done being used
            using (SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["SDB"].ConnectionString))
            using (SqlDataAdapter adapter = new SqlDataAdapter(query, connection))
            {
                try
                {
                    //database fills the datatable
                    adapter.Fill(dt);
                }
                catch
                {
                }
            }

            //save the datatable into a viewstate for later use
            ViewState["grdInternships"] = dt;

            //bind the datasource to the gridview
            grdInternships.DataSource = dt;
            grdInternships.DataBind();
        }

        protected void btnScholarshipSearch_Click(object sender, EventArgs e)
        {
            string searchScholarship = txtScholarshipSearch.Text.ToLower();

            // check if the student search is at least 1 characters
            if (searchScholarship.Length >= 1)
            {
                if (ViewState["grdScholarships"] == null)
                    return;

                DataTable dt = ViewState["grdScholarships"] as DataTable;

                // making a clone of datatable
                DataTable dtNew = dt.Clone();

                // loop through table for correct fields
                foreach (DataRow row in dt.Rows)
                {
                    if (row["ScholarshipName"].ToString().ToLower().Contains(searchScholarship))
                    {
                        //finding copy and add to new table
                        dtNew.Rows.Add(row.ItemArray);
                    }
                }
                // rebind the grid
                grdScholarships.DataSource = dtNew;
                grdScholarships.DataBind();
            }
        }

        protected void txtAllScholarships_Click(object sender, EventArgs e)
        {
            //use a datatable for storing all the data
            DataTable dt = new DataTable();
            string query = "SELECT * FROM Scholarship";

            //using automatically closes the connection when its done being used
            using (SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["SDB"].ConnectionString))
            using (SqlDataAdapter adapter = new SqlDataAdapter(query, connection))
            {
                try
                {
                    //database fills the datatable
                    adapter.Fill(dt);
                }
                catch
                {
                }
            }

            //save the datatable into a viewstate for later use
            ViewState["grdScholarships"] = dt;

            //bind the datasource to the gridview
            grdScholarships.DataSource = dt;
            grdScholarships.DataBind();
        }
        protected void grStudents_SelectedIndexChanged(object sender, EventArgs e)
        {
            String Name = grdStudents.SelectedRow.Cells[4].Text;
            String membersQuery = "SELECT StudentID FROM Student WHERE EmailAddress ='" + Name + "';";
            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["SDB"].ConnectionString);
            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand.Connection = sqlConnect;
            sqlCommand.CommandType = CommandType.Text;
            sqlCommand.CommandText = membersQuery;

            sqlConnect.Open();
            SqlDataReader queryResults = sqlCommand.ExecuteReader();
            while (queryResults.Read())
            {
                Session["EditStudentID"] = queryResults["StudentID"].ToString();

            }


            sqlConnect.Close();
            queryResults.Close();
        }

        protected void btnEditStudent_Click(object sender, EventArgs e)
        {
            Response.Redirect("editStudent.aspx");
        }

        protected void grCompanies_SelectedIndexChanged(object sender, EventArgs e)
        {
            String Name = grdCompanies.SelectedRow.Cells[2].Text;
            String membersQuery = "SELECT CompanyID FROM Company WHERE CompanyName ='" + Name + "';";
            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["SDB"].ConnectionString);
            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand.Connection = sqlConnect;
            sqlCommand.CommandType = CommandType.Text;
            sqlCommand.CommandText = membersQuery;

            sqlConnect.Open();
            SqlDataReader queryResults = sqlCommand.ExecuteReader();
            while (queryResults.Read())
            {
                Session["EditCompanyID"] = queryResults["CompanyID"].ToString();

            }


            sqlConnect.Close();
            queryResults.Close();
        }
        protected void btnEditCompanies_Click(object sender, EventArgs e)
        {
            Response.Redirect("editCompanies.aspx");
        }

        protected void grJobs_SelectedIndexChanged(object sender, EventArgs e)
        {
            String Name = grdJobs.SelectedRow.Cells[2].Text;
            String membersQuery = "SELECT JobID FROM Job WHERE JobTitle ='" + Name + "';";
            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["SDB"].ConnectionString);
            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand.Connection = sqlConnect;
            sqlCommand.CommandType = CommandType.Text;
            sqlCommand.CommandText = membersQuery;

            sqlConnect.Open();
            SqlDataReader queryResults = sqlCommand.ExecuteReader();
            while (queryResults.Read())
            {
                Session["EditJobID"] = queryResults["JobID"].ToString();

            }


            sqlConnect.Close();
            queryResults.Close();
        }
        protected void btnEditJobs_Click(object sender, EventArgs e)
        {
            Response.Redirect("editJobs.aspx");
        }

        protected void grInternships_SelectedIndexChanged(object sender, EventArgs e)
        {
            String Name = grdInternships.SelectedRow.Cells[2].Text;
            String membersQuery = "SELECT InternshipID FROM Internship WHERE InternshipTitle ='" + Name + "';";
            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["SDB"].ConnectionString);
            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand.Connection = sqlConnect;
            sqlCommand.CommandType = CommandType.Text;
            sqlCommand.CommandText = membersQuery;

            sqlConnect.Open();
            SqlDataReader queryResults = sqlCommand.ExecuteReader();
            while (queryResults.Read())
            {
                Session["EditInternshipID"] = queryResults["InternshipID"].ToString();

            }


            sqlConnect.Close();
            queryResults.Close();
        }
        protected void btnEditInternships_Click(object sender, EventArgs e)
        {
            Response.Redirect("editInternship.aspx");
        }

        protected void grScholarships_SelectedIndexChanged(object sender, EventArgs e)
        {
            String Name = grdScholarships.SelectedRow.Cells[2].Text;
            String membersQuery = "SELECT ScholarshipID FROM Scholarship WHERE ScholarshipName ='" + Name + "';";
            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["SDB"].ConnectionString);
            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand.Connection = sqlConnect;
            sqlCommand.CommandType = CommandType.Text;
            sqlCommand.CommandText = membersQuery;

            sqlConnect.Open();
            SqlDataReader queryResults = sqlCommand.ExecuteReader();
            while (queryResults.Read())
            {
                Session["EditScholarshipID"] = queryResults["ScholarshipID"].ToString();

            }


            sqlConnect.Close();
            queryResults.Close();
        }
        protected void btnEditScholarships_Click(object sender, EventArgs e)
        {
            Response.Redirect("editScholarships.aspx");
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddAnnouncement.aspx");
        }

        protected void btnOtherSearch_Click(object sender, EventArgs e)
        {
            string searchOther = txtOtherSearch.Text.ToLower();

            // check if the student search is at least 1 characters
            if (searchOther.Length >= 1)
            {
                if (ViewState["grdOther"] == null)
                    return;

                DataTable dt = ViewState["grdOther"] as DataTable;

                // making a clone of datatable
                DataTable dtNew = dt.Clone();

                // loop through table for correct fields
                foreach (DataRow row in dt.Rows)
                {
                    if (row["OtherTitle"].ToString().ToLower().Contains(searchOther))
                    {
                        //finding copy and add to new table
                        dtNew.Rows.Add(row.ItemArray);
                    }
                }
                // rebind the grid
                grdOther.DataSource = dtNew;
                grdOther.DataBind();
            }
        }

        protected void btnAllOther_Click(object sender, EventArgs e)
        {
            //use a datatable for storing all the data
            DataTable dt = new DataTable();
            string query = "SELECT * FROM Other";

            //using automatically closes the connection when its done being used
            using (SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["SDB"].ConnectionString))
            using (SqlDataAdapter adapter = new SqlDataAdapter(query, connection))
            {
                try
                {
                    //database fills the datatable
                    adapter.Fill(dt);
                }
                catch
                {
                }
            }

            //save the datatable into a viewstate for later use
            ViewState["grdOther"] = dt;

            //bind the datasource to the gridview
            grdOther.DataSource = dt;
            grdOther.DataBind();
        }

        protected void grdOther_SelectedIndexChanged(object sender, EventArgs e)
        {
            String Name = grdOther.SelectedRow.Cells[2].Text;
            String membersQuery = "SELECT OtherID FROM Other WHERE OtherTitle ='" + Name + "';";
            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["SDB"].ConnectionString);
            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand.Connection = sqlConnect;
            sqlCommand.CommandType = CommandType.Text;
            sqlCommand.CommandText = membersQuery;

            sqlConnect.Open();
            SqlDataReader queryResults = sqlCommand.ExecuteReader();
            while (queryResults.Read())
            {
                Session["EditOtherID"] = queryResults["OtherID"].ToString();

            }


            sqlConnect.Close();
            queryResults.Close();
        }

        protected void btnEditOther_Click(object sender, EventArgs e)
        {
            Response.Redirect("editOther.aspx");
        }
    }
}