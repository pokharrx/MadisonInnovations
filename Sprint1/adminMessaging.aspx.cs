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
    public partial class adminMessaging : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] != null)
            {
                if (!Page.IsPostBack)
                {
                    //use a datatable for storing all the data
                    DataTable dt1 = new DataTable();
                    string memberQuery = "SELECT * from Member";
                    DataTable dt2 = new DataTable();
                    string studentQuery = "SELECT * from Student";

                    //using automatically closes the connection when its done being used
                    using (SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["SDB"].ConnectionString))
                    using (SqlDataAdapter memberAdapter = new SqlDataAdapter(memberQuery, connection))
                    using (SqlDataAdapter studentAdapter = new SqlDataAdapter(studentQuery, connection))
                    {
                        try
                        {
                            //database fills the datatable
                            memberAdapter.Fill(dt1);
                            studentAdapter.Fill(dt2);
                        }
                        catch
                        {
                        }
                    }

                    //save the datatable into a viewstate for later use
                    ViewState["grdMembers"] = dt1;
                    ViewState["grdStudents"] = dt2;

                    //bind the datasource to the gridview
                    grdMembers.DataSource = dt1;
                    grdMembers.DataBind();
                    grdStudents.DataSource = dt2;
                    grdStudents.DataBind();
                }
                try
                {
                    //Populate Inbox
                    String inboxQuery = "select SenderUsername, Message, Subject from Messaging where ReceiverUsername = '" + Session["Username"].ToString() + "';";
                    SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["SDB"].ConnectionString);
                    SqlDataAdapter sqlAdapter = new SqlDataAdapter(inboxQuery, sqlConnect);
                    DataTable dtInbox = new DataTable();
                    sqlAdapter.Fill(dtInbox);
                    grdInbox.DataSource = dtInbox;
                    grdInbox.DataBind();
                    sqlConnect.Close();

                    //Populate Sent
                    String sentQuery = "select ReceiverUsername, Message, Subject from Messaging where SenderUsername = '" + Session["Username"] + "';";
                    SqlConnection sqlConnect2 = new SqlConnection(WebConfigurationManager.ConnectionStrings["SDB"].ConnectionString);
                    SqlDataAdapter sqlAdapter2 = new SqlDataAdapter(sentQuery, sqlConnect);
                    DataTable dtSent = new DataTable();
                    sqlAdapter2.Fill(dtSent);
                    grdSent.DataSource = dtSent;
                    grdSent.DataBind();
                    sqlConnect.Close();
                }
                catch
                {

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
            if (ddlRecipientType.SelectedItem.Value == "Member" || ddlRecipientType.SelectedItem.Value == "Student")
            {
                if (ddlRecipientType.SelectedItem.Value == "Member")
                {
                    grdStudents.Visible = false;
                    lblMissingTypeAlert.Visible = false;

                    string searchMember = txtRecipientSearch.Text.ToLower();

                    // check if the student search is at least 1 characters
                    if (searchMember.Length >= 1)
                    {
                        if (ViewState["grdMembers"] == null)
                            return;

                        DataTable dt = ViewState["grdMembers"] as DataTable;

                        // making a clone of datatable
                        DataTable dtNew = dt.Clone();

                        // loop through table for correct fields
                        foreach (DataRow row in dt.Rows)
                        {
                            if (row["FirstName"].ToString().ToLower().Contains(searchMember) || row["LastName"].ToString().ToLower().Contains(searchMember) || row["MemberUserName"].ToString().ToLower().Contains(searchMember))
                            {
                                //finding copy and add to new table
                                dtNew.Rows.Add(row.ItemArray);
                            }
                        }

                        // rebind the grid
                        grdMembers.DataSource = dtNew;
                        grdMembers.DataBind();
                        grdMembers.Visible = true;
                    }
                }
                if (ddlRecipientType.SelectedItem.Value == "Student")
                {
                    grdMembers.Visible = false;
                    lblMissingTypeAlert.Visible = false;

                    string searchStudent = txtRecipientSearch.Text.ToLower();

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
                            if (row["FirstName"].ToString().ToLower().Contains(searchStudent) || row["LastName"].ToString().ToLower().Contains(searchStudent) || row["StudentUserName"].ToString().ToLower().Contains(searchStudent))
                            {
                                //finding copy and add to new table
                                dtNew.Rows.Add(row.ItemArray);
                            }
                        }

                        // rebind the grid
                        grdStudents.DataSource = dtNew;
                        grdStudents.DataBind();
                        grdStudents.Visible = true;
                    }
                }
            }
            else
            {
                lblMissingTypeAlert.Visible = true;
            }
        }

        protected void grdStudents_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtRecipientSearch.Text = grdStudents.SelectedRow.Cells[1].Text;
            grdStudents.Visible = false;
        }

        protected void grdMembers_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtRecipientSearch.Text = grdMembers.SelectedRow.Cells[1].Text;
            grdMembers.Visible = false;
        }

        protected void btnSendMessage_Click(object sender, EventArgs e)
        {
            if (txtRecipientSearch.Text != "" && txtSendMessage.Text != "" && txtSubject.Text != "" && ddlRecipientType.SelectedItem.Value != "Nothing")
            {
                try
                {
                    System.Data.SqlClient.SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["SDB"].ConnectionString);
                    sqlConnect.Open();
                    SqlCommand sc = new SqlCommand();
                    sc.Connection = sqlConnect;

                    String messageSender = Session["Username"].ToString();

                    sc.CommandText = "INSERT INTO Messaging (SenderUsername, ReceiverUsername, Message, Subject) VALUES ('"
                        + messageSender + "', @Recipient, @Message, @Subject)";
                    sc.Parameters.Add(new SqlParameter("@Recipient", HttpUtility.HtmlEncode(txtRecipientSearch.Text)));
                    sc.Parameters.Add(new SqlParameter("@Message", HttpUtility.HtmlEncode(txtSendMessage.Text)));
                    sc.Parameters.Add(new SqlParameter("@Subject", HttpUtility.HtmlEncode(txtSubject.Text)));

                    sc.ExecuteNonQuery();
                    sqlConnect.Close();
                    Response.Redirect("memberMessaging.aspx");
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

        protected void grdInbox_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdInbox.PageIndex = e.NewPageIndex;
            grdInbox.DataBind();
        }

        protected void grdSent_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdSent.PageIndex = e.NewPageIndex;
            grdSent.DataBind();
        }
    }
}