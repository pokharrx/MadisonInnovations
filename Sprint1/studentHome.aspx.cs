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
    public partial class studentHome : System.Web.UI.Page
    {    
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //obtain logged in user firstname
                String sqlQueryFirstName = "select FirstName from Student Where StudentUserName=@StudentUserName";
                SqlConnection sqlConnectFirstName = new SqlConnection(WebConfigurationManager.ConnectionStrings["SDB"].ConnectionString);
                SqlCommand sqlCommandFirstName = new SqlCommand(sqlQueryFirstName, sqlConnectFirstName);
                sqlCommandFirstName.Parameters.AddWithValue("@StudentUserName", Session["UserName"].ToString());
                sqlConnectFirstName.Open();
                sqlCommandFirstName.ExecuteScalar();
                String studentFirstName = sqlCommandFirstName.ExecuteScalar().ToString();
                sqlConnectFirstName.Close();



                //obtain logged in user lastname
                String sqlQueryLastName = "select LastName from Student Where StudentUserName=@StudentUserName";
                SqlConnection sqlConnectLastName = new SqlConnection(WebConfigurationManager.ConnectionStrings["SDB"].ConnectionString);
                SqlCommand sqlCommandLastName = new SqlCommand(sqlQueryLastName, sqlConnectLastName);
                sqlCommandLastName.Parameters.AddWithValue("@StudentUserName", Session["UserName"].ToString());
                sqlConnectLastName.Open();
                sqlCommandLastName.ExecuteScalar();
                String studentLastName = sqlCommandLastName.ExecuteScalar().ToString();
                sqlConnectLastName.Close();



                String studentFullName = studentFirstName + " " + studentLastName;
                Session["studentFullName"] = studentFullName;

                //obtain logged in user StudentID
                String sqlQuerySID = "select StudentID from Student Where StudentUserName=@StudentUserName";
                SqlConnection sqlConnectSID = new SqlConnection(WebConfigurationManager.ConnectionStrings["SDB"].ConnectionString);
                SqlCommand sqlCommandSID = new SqlCommand(sqlQuerySID, sqlConnectSID);
                sqlCommandSID.Parameters.AddWithValue("@StudentUserName", Session["UserName"].ToString());
                sqlConnectSID.Open();
                sqlCommandSID.ExecuteScalar();
                int studentId = int.Parse(sqlCommandSID.ExecuteScalar().ToString());
                Session["StudentID"] = studentId;
                sqlConnectSID.Close();

                System.Data.SqlClient.SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["SDB"].ConnectionString);
                sqlConnect.Open();
                SqlCommand sc = new SqlCommand();
                sc.Connection = sqlConnect;
                sc.CommandText = "SELECT count(notifID) FROM notifications;";
                int x = Convert.ToInt32(sc.ExecuteScalar());
                sqlConnect.Close();




                String querystring = "select announcement from notifications;";
                SqlDataAdapter DataAdapter = new SqlDataAdapter(querystring, sqlConnect);
                DataSet ds = new DataSet();
                DataAdapter.Fill(ds, "notifications");

                int size_arr = ds.Tables[0].Rows.Count;

                string[] arr = new string[size_arr];
                int i = 0;
                foreach (DataRow dr in ds.Tables[0].Rows)
                {

                    arr[i] = dr[0].ToString();
                    i++;

                }
                for (int z = 0; z < arr.Length; z++)
                {
                    String item = arr[z];
                    blAnnouncements.Items.Add(new ListItem(item));
                }
            }

            //obtain logged in user industry of interest for student to see only their indusrty recommendations
            String sqlQuery = "select Industry from Student Where StudentUserName=@StudentUserName";
            SqlConnection sqlConnect1 = new SqlConnection(WebConfigurationManager.ConnectionStrings["SDB"].ConnectionString);
            SqlCommand sqlCommand = new SqlCommand(sqlQuery, sqlConnect1);
            sqlCommand.Parameters.AddWithValue("@StudentUserName", Session["UserName"].ToString());
            sqlConnect1.Open();
            sqlCommand.ExecuteScalar();
            String studentIndustry = sqlCommand.ExecuteScalar().ToString();
            Session["StudentIndustry"] = studentIndustry;
            sqlConnect1.Close();

          


        }

        protected void grdRecommendedJobs_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            String selected = (string)e.CommandArgument;
            SqlConnection connect = new SqlConnection(WebConfigurationManager.ConnectionStrings["SDB"].ConnectionString);
            SqlCommand getapp = new SqlCommand();
            getapp.Connection = connect;
            if (e.CommandName.Equals("JobTitle"))
            {
                getapp.CommandText = "SELECT ApplicationLink FROM Job WHERE JobTitle = @JobTitle";
                getapp.Parameters.AddWithValue("@JobTitle", selected);
                connect.Open();
                String appLink = Convert.ToString(getapp.ExecuteScalar());
                Response.Redirect(appLink);
                connect.Close();
            }
            else if (e.CommandName.Equals("InternshipTitle"))
            {
                getapp.CommandText = "SELECT ApplicationLink FROM Internship WHERE InternshipTitle = @InternshipTitle";
                getapp.Parameters.AddWithValue("@InternshipTitle", selected);
                connect.Open();
                String appLink = Convert.ToString(getapp.ExecuteScalar());
                Response.Redirect(appLink);
                connect.Close();
            }
            else if (e.CommandName.Equals("OtherTitle"))
            {
                getapp.CommandText = "SELECT ApplicationLink FROM Other WHERE OtherTitle = @OtherTitle";
                getapp.Parameters.AddWithValue("@OtherTitle", selected);
                connect.Open();
                String appLink = Convert.ToString(getapp.ExecuteScalar());
                Response.Redirect(appLink);
                connect.Close();
            }
        }

        //protected void test1_Click(object sender, EventArgs e)
        //{

        //}
    }
}