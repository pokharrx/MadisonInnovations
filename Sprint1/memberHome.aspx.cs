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
    public partial class memberHome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //obtain member ID on login
                String sqlQuerySID = "select MemberID from Member Where MemberUserName=@MemberUserName";
                SqlConnection sqlConnectSID = new SqlConnection(WebConfigurationManager.ConnectionStrings["SDB"].ConnectionString);
                SqlCommand sqlCommandSID = new SqlCommand(sqlQuerySID, sqlConnectSID);
                sqlCommandSID.Parameters.AddWithValue("@MemberUserName", Session["UserName"].ToString());
                sqlConnectSID.Open();
                sqlCommandSID.ExecuteScalar();
                int MemberID = int.Parse(sqlCommandSID.ExecuteScalar().ToString());
                Session["MemberID"] = MemberID;
                sqlConnectSID.Close();

                String l = Session["MemberID"].ToString();
                DataTable dt1 = new DataTable();
                string studentQuery = "select s.FirstName,s.LastName, s.EmailAddress from Student s, StudentMentor sm where sm.MemberID ='" + l + "';";
                using (SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["SDB"].ConnectionString))
                using (SqlDataAdapter studentAdapter = new SqlDataAdapter(studentQuery, connection))
                    try
                    {
                        studentAdapter.Fill(dt1);
                    }
                    catch
                    {

                    }
                grV.DataSource = dt1;
                grV.DataBind();
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
        }

    }
}       