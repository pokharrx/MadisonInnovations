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
    public partial class studentMessaging : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] != null)
            {
                if (!Page.IsPostBack)
                {
                    //use a datatable for storing all the data
                    DataTable dt1 = new DataTable();
                    string personQuery = "SELECT * from PersonMessage";
                   
                    //using automatically closes the connection when its done being used
                    using (SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["SDB"].ConnectionString))
                    using (SqlDataAdapter personAdapter = new SqlDataAdapter(personQuery, connection))
                    {
                        try
                        {
                            //database fills the datatable
                            personAdapter.Fill(dt1);
                        }
                        catch
                        {
                        }
                    }

                    //save the datatable into a viewstate for later use
                    ViewState["grdPersons"] = dt1;

                    //bind the datasource to the gridview
                    grdPersons.DataSource = dt1;
                    grdPersons.DataBind();
                }
            }
            else
            {
                Session["MustLogin"] = "You Must Login To Access That Page";
                Response.Redirect("Login.aspx");
            }
        }

        protected void btnRecipientSearch_Click(object sender, EventArgs e)
        {
            string searchPerson = txtRecipientSearch.Text.ToLower();

            // check if the student search is at least 1 characters
            if (searchPerson.Length >= 1)
            {
                if (ViewState["grdPersons"] == null)
                return;

                DataTable dt = ViewState["grdPersons"] as DataTable;

                // making a clone of datatable
                DataTable dtNew = dt.Clone();

                // loop through table for correct fields
                foreach (DataRow row in dt.Rows)
                {
                    if (row["FirstName"].ToString().ToLower().Contains(searchPerson) || row["LastName"].ToString().ToLower().Contains(searchPerson) || row["UserName"].ToString().ToLower().Contains(searchPerson))
                    {
                        //finding copy and add to new table
                        dtNew.Rows.Add(row.ItemArray);
                    }
                }
                
                // rebind the grid
                grdPersons.DataSource = dtNew;
                grdPersons.DataBind();
                grdPersons.Visible = true;              
            }
        }

        protected void grdPersons_SelectedIndexChanged(object sender, EventArgs e)
        {
            lstboxRecipients.Items.Add(grdPersons.SelectedRow.Cells[1].Text);
            grdPersons.Visible = false;
        }

        protected void btnRemoveRecipient_Click(object sender, EventArgs e)
        {
            lstboxRecipients.Items.Remove(lstboxRecipients.SelectedItem);
        }

        protected void btnSendMessage_Click(object sender, EventArgs e)
        {
            if (lstboxRecipients.Items.Count > 0 && txtSendMessage.Text != "" && txtSubject.Text != "")
            {
                try
                {                    
                    foreach (var listBoxItem in lstboxRecipients.Items)
                    {
                        System.Data.SqlClient.SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["SDB"].ConnectionString);
                        sqlConnect.Open();
                        SqlCommand sc = new SqlCommand();
                        sc.Connection = sqlConnect;

                        String messageSender = Session["Username"].ToString();

                        sc.CommandText = "INSERT INTO Messaging (SenderUsername, ReceiverUsername, Message, Subject) VALUES ('"
                            + messageSender + "', @Recipient, @Message, @Subject)";

                        sc.Parameters.Add(new SqlParameter("@Recipient", HttpUtility.HtmlEncode(listBoxItem)));
                        sc.Parameters.Add(new SqlParameter("@Message", HttpUtility.HtmlEncode(txtSendMessage.Text)));
                        sc.Parameters.Add(new SqlParameter("@Subject", HttpUtility.HtmlEncode(txtSubject.Text)));

                        sc.ExecuteNonQuery();
                        sqlConnect.Close();
                    }
                                                      
                    Response.Redirect("studentMessaging.aspx");
                }
                catch (Exception)
                {
                    lblMessageStatus.Text = "Error Sending Message, Please Check That All Fields Are Filled Out Properly";
                    throw;
                }
            }
            else
            {
                lblMessageStatus.Text = "Please Fill Out All Fields";
            }
        }
    }
}