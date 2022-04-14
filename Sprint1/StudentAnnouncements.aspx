<%@ Page Title="" Language="C#" MasterPageFile="~/studentMaster.Master" AutoEventWireup="true" CodeBehind="StudentAnnouncements.aspx.cs" Inherits="Sprint1.StudentAnnouncements" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <style>
        h2 {
            font-weight: 600;
        }
       .gridview {
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
            border-radius: 10px;
            padding: 16px;
            text-align: left;
            background-color: #f4efe1;
            border: none;        
            width: 100%;
        }
       .dashboard {
            background-color: #d0c8b5;
            border-top: 2px solid white;
            border-bottom: 2px solid white;
       }
       .home:hover {
            background-color: #dacce6;
            border-top: 2px solid white;
            border-bottom: 2px solid white;
       }
        .chat:hover {
            background-color: #dacce6;
            border-top: 2px solid white;
            border-bottom: 2px solid white;
        }
   </style>    
    <%-- Job Opportunities --%>
    <div id="Jobs">
        <h2>All Jobs</h2>
        <%-- Gridview that shows all jobs --%>
        <asp:GridView
            ID="grdJob"
            runat="server"
            HorizontalAlign="Justify"
            AlternatingRowStyle="PowderBlue"
            EmptyDataText="No Company Selected"
            AllowSorting="true"
            AutoGenerateColumns="false"
            DataKeyNames="JobID"
            CellPadding="10"
            CssClass="gridview">
            <Columns>
                <asp:BoundField ItemStyle-Font-Bold="true" HeaderText="Job Title" DataField="JobTitle" SortExpression="JobTitle"/>
                <asp:BoundField HeaderText="Date Start" DataField="DateStart" SortExpression="DateStart"/>
                <asp:BoundField HeaderText="Date End" DataField="DateEnd" SortExpression="DateEnd"/>
                <asp:BoundField HeaderText="Description" DataField="Description" SortExpression="Description"/>
                <asp:BoundField HeaderText="Apply Here" DataField="ApplicationLink" SortExpression="ApplicationLink" />
            </Columns>
        </asp:GridView>
    </div>
    <br />
    <%-- Internship Opportunities --%>
    <div id="Internships">
        <h2>All Internships</h2>
        <%-- Gridview that shows all internships --%>
        <asp:GridView
            ID="grdInternship"
            runat="server"
            HorizontalAlign="Justify"
            AlternatingRowStyle="PowderBlue"
            EmptyDataText="No Company Selected"
            AllowSorting="true"
            AutoGenerateColumns="false"
            DataKeyNames="InternshipID"
            CellPadding="10"
            CssClass="gridview">
            <Columns>
                <asp:BoundField ItemStyle-Font-Bold="true" HeaderText="Internship Title" DataField="InternshipTitle" SortExpression="InternshipTitle"/>
                <asp:BoundField HeaderText="Date Start" DataField="DateStart" SortExpression="DateStart"/>
                <asp:BoundField HeaderText="Date End" DataField="DateEnd" SortExpression="DateEnd"/>
                <asp:BoundField HeaderText="Description" DataField="Description" SortExpression="Description"/>
                <asp:BoundField HeaderText="Apply Here" DataField="ApplicationLink" SortExpression="ApplicationLink"/>
            </Columns>
        </asp:GridView>
    </div>
    <br />
     <%-- Other Opportunities --%>
    <div id="Other">
        <h2> All Other Opportunities</h2>
        <%-- Gridview that shows all jobs --%>
        <asp:GridView
            ID="grdOther"
            runat="server"
            HorizontalAlign="Justify"
            AlternatingRowStyle="PowderBlue"
            EmptyDataText="No Other Opportunity Selected"
            AllowSorting="true"
            AutoGenerateColumns="false"
            DataKeyNames="OtherID"
            CellPadding="10"
            CssClass="gridview">
            <Columns>
                <asp:BoundField ItemStyle-Font-Bold="true" HeaderText="Other Title" DataField="OtherTitle" SortExpression="OtherTitle"/>
                <asp:BoundField HeaderText="Date Start" DataField="DateStart" SortExpression="DateStart"/>
                <asp:BoundField HeaderText="Date End" DataField="DateEnd" SortExpression="DateEnd"/>
                <asp:BoundField HeaderText="Description" DataField="Description" SortExpression="Description"/>
                <asp:BoundField HeaderText="Apply Here" DataField="ApplicationLink" SortExpression="ApplicationLink" />
            </Columns>
        </asp:GridView>
    </div>
    <%-- Data Sources for the gridviews --%>
    <asp:SqlDataSource ID="dtasrcAllJobs" runat="server"
        ConnectionString ="<%$ ConnectionStrings:SDB %>"
        SelectCommand="Select * from Job">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="dtasrcAllOther" runat="server"
        ConnectionString ="<%$ ConnectionStrings:SDB %>"
        SelectCommand="Select * from Other">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="dtasrcAllInternships" runat="server"
        ConnectionString ="<%$ ConnectionStrings:SDB %>"
        SelectCommand="Select * from Internship">
    </asp:SqlDataSource>
</asp:Content>
