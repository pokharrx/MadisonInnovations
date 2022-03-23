<%@ Page Title="" Language="C#" MasterPageFile="~/studentMaster.Master" AutoEventWireup="true" CodeBehind="studentHome.aspx.cs" Inherits="Sprint1.studentHome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <div>
    <h2>Job Opportunities</h2>
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
                <asp:BoundField HeaderText="Job Title" DataField="JobTitle" SortExpression="JobTitle"/>
                <asp:BoundField HeaderText="Date Start" DataField="DateStart" SortExpression="DateStart"/>
                <asp:BoundField HeaderText="Date End" DataField="DateEnd" SortExpression="DateEnd"/>
                <asp:BoundField HeaderText="Description" DataField="Description" SortExpression="Description"/>
                <asp:BoundField HeaderText="Apply Here" DataField="ApplicationLink" SortExpression="ApplicationLink" />
        </Columns>
    </asp:GridView>
        </div>

    <div>
    <h2>Internship Opportunities</h2>
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
                <asp:BoundField HeaderText="Internship Title" DataField="InternshipTitle" SortExpression="InternshipTitle"/>
                <asp:BoundField HeaderText="Date Start" DataField="DateStart" SortExpression="DateStart"/>
                <asp:BoundField HeaderText="Date End" DataField="DateEnd" SortExpression="DateEnd"/>
                <asp:BoundField HeaderText="Description" DataField="Description" SortExpression="Description"/>
               <asp:BoundField HeaderText="Apply Here" DataField="ApplicationLink" SortExpression="ApplicationLink"/>

        </Columns>
    </asp:GridView>
    </div>

    <%-- Gridview that shows all scholarships --%>
    <div>
        <h2>Scholarships</h2>
        <asp:GridView 
             ID="grdScholarship" 
                 runat="server"
                 HorizontalAlign="Justify"
                 AlternatingRowStyle-BackColor="PowderBlue"
                 EmptyDataText="No Scholarship Selected"
                 AllowSorting="true"
                 AutoGenerateColumns="false"
                 DataKeyNames="ScholarshipID"
                 CellPadding="10"
                 CssClass="gridview">
                 <Columns>
                        <asp:BoundField HeaderText="Name" DataField="ScholarshipName" SortExpression="ScholarshipName"/>
                        <asp:BoundField HeaderText="Year" DataField="ScholarshipYear" SortExpression="ScholarshipYear"/>
                        <asp:BoundField HeaderText="Amount" DataField="ScholarshipAmount" SortExpression="ScholarshipAmount"/>
                        <asp:BoundField HeaderText="Description" DataField="Description" SortExpression="Description"/>
                        <asp:BoundField HeaderText="Status" DataField="Status" SortExpression="Status"/>
                 </Columns>
         </asp:GridView>
    </div>

    <%-- Data Sources for the gridviews --%>
    <asp:SqlDataSource ID="dtasrcAllJobs" runat="server"
            ConnectionString ="<%$ ConnectionStrings:SDB %>"
            SelectCommand="Select * from Job">
        </asp:SqlDataSource>

    <asp:SqlDataSource ID="dtasrcAllInternships" runat="server"
            ConnectionString ="<%$ ConnectionStrings:SDB %>"
            SelectCommand="Select * from Internship">
        </asp:SqlDataSource>

    <asp:SqlDataSource ID="dtasrcAllScholarships" runat="server"
            ConnectionString ="<%$ ConnectionStrings:SDB %>"
            SelectCommand="Select * from Scholarship">
        </asp:SqlDataSource>

</asp:Content>
