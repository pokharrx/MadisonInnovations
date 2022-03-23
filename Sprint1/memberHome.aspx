<%@ Page Title="" Language="C#" MasterPageFile="~/memberMaster.Master" AutoEventWireup="true" CodeBehind="memberHome.aspx.cs" Inherits="Sprint1.memberHome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%-- Students --%>
    <div id="Students">
        <h2>Students</h2>
        <asp:GridView
            ID="grdStudents"
            runat="server"
            HorizontalAlign="Justify"
            AlternatingRowStyle-BackColor="PowderBlue"
            EmptyDataText="No Student Selected"
            AllowSorting="true"
            AutoGenerateColumns="false"
            DataKeyNames="StudentID"
            CellPadding="10">    
            <Columns>
                <asp:BoundField HeaderText="First Name" DataField="FirstName" SortExpression="FirstName"/>
                <asp:BoundField HeaderText="Last Name" DataField="LastName" SortExpression="LastName"/>
                <asp:BoundField HeaderText="Email" DataField="EmailAddress" SortExpression="EmailAddress"/>
                <asp:BoundField HeaderText="Phone Number" DataField="PhoneNumber" SortExpression="PhoneNumber"/>
                <asp:BoundField HeaderText="Graduation Year" DataField="GradYear" SortExpression="GradYear"/>
                <asp:BoundField HeaderText="Major" DataField="Major" SortExpression="Major"/>
                <asp:BoundField HeaderText="Grade" DataField="Grade" SortExpression="Grade"/>
                <asp:BoundField HeaderText="Employment Status" DataField="EmploymentStatus" SortExpression="EmploymentStatus"/>
            </Columns>
        </asp:GridView>
    </div>
    <br />
    <%-- Companies --%>
    <div id="Companies">
        <h2>Companies</h2>
        <asp:GridView 
            ID="grdCompanies"
            runat="server" 
            HorizontalAlign="Justify"
            AlternatingRowStyle-BackColor="PowderBlue"
            EmptyDataText="No Company Selected"
            AllowSorting="true"
            AutoGenerateColumns="false"
            DataKeyNames="CompanyID"
            CellPadding="10">
            <Columns>
                <asp:BoundField HeaderText="Name" DataField="CompanyName" SortExpression="CompanyName"/>
                <asp:BoundField HeaderText="Address" DataField="CompanyAddress" SortExpression="CompanyAddress"/>
                <asp:BoundField HeaderText="Phone Number" DataField="CompanyPhone" SortExpression="CompanyPhone"/>
            </Columns>
        </asp:GridView>
    </div>
    <br />
    <%-- Jobs --%>
    <div id="Jobs">
        <h2>Jobs</h2>
        <asp:GridView 
            ID="grdJobs" 
            runat="server"
            HorizontalAlign="Justify"
            AlternatingRowStyle-BackColor="PowderBlue"
            EmptyDataText="No Job Selected"
            AllowSorting="true"
            AutoGenerateColumns="false"
            DataKeyNames="JobID"
            CellPadding="10">
            <Columns>
                <asp:BoundField HeaderText="Title" DataField="JobTitle" SortExpression="JobTitle"/> 
                <asp:BoundField HeaderText="Start Date" DataField="DateStart" SortExpression="DateStart"/>
                <asp:BoundField HeaderText="End Date" DataField="DateEnd" SortExpression="DateEnd"/>
                <asp:BoundField HeaderText="Description" DataField="Description" SortExpression="Description"/>
                <asp:BoundField HeaderText="Details" DataField="ApplicationLink" SortExpression="ApplicationLink"/>
            </Columns>
        </asp:GridView>
    </div>
    <br />
    <%-- Internships --%>
    <div id="Internships">
        <h2>Internships</h2>
        <asp:GridView 
            ID="grdInternships" 
            runat="server"
            HorizontalAlign="Justify"
            AlternatingRowStyle-BackColor="PowderBlue"
            EmptyDataText="No Internship Selected"
            AllowSorting="true"
            AutoGenerateColumns="false"
            DataKeyNames="InternshipID"
            CellPadding="10">
            <Columns>
                <asp:BoundField HeaderText="Title" DataField="InternshipTitle" SortExpression="InternshipTitle"/>
                <asp:BoundField HeaderText="Start Date" DataField="DateStart" SortExpression="DateStart"/>
                <asp:BoundField HeaderText="End Date" DataField="DateEnd" SortExpression="DateEnd"/>
                <asp:BoundField HeaderText="Description" DataField="Description" SortExpression="Description"/>
                <asp:BoundField HeaderText="Details" DataField="ApplicationLink" SortExpression="ApplicationLink"/>
            </Columns>
        </asp:GridView>
    </div>
    <br />
    <%-- Scholarships --%>
    <div id="Scholarships">
        <h2>Scholarships</h2>
        <asp:GridView 
            ID="grdScholarships" 
            runat="server"
            HorizontalAlign="Justify"
            AlternatingRowStyle-BackColor="PowderBlue"
            EmptyDataText="No Scholarship Selected"
            AllowSorting="true"
            AutoGenerateColumns="false"
            DataKeyNames="ScholarshipID"
            CellPadding="10">
            <Columns>
                <asp:BoundField HeaderText="Name" DataField="ScholarshipName" SortExpression="ScholarshipName"/>
                <asp:BoundField HeaderText="Year" DataField="ScholarshipYear" SortExpression="ScholarshipYear"/>
                <asp:BoundField HeaderText="Amount" DataField="ScholarshipAmount" SortExpression="ScholarshipAmount"/>
                <asp:BoundField HeaderText="Description" DataField="Description" SortExpression="Description"/>
                <asp:BoundField HeaderText="Status" DataField="Status" SortExpression="Status"/>
            </Columns>
        </asp:GridView>
    </div>
    <%-- Datasources --%>
    <asp:SqlDataSource ID="dtasrcAllStudents" runat="server"
        ConnectionString ="<%$ ConnectionStrings:SDB %>"
        SelectCommand="Select * from Student Order By LastName ASC">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="dtasrcAllCompanies" runat="server"
        ConnectionString ="<%$ ConnectionStrings:SDB %>"
        SelectCommand="Select * from Company Order By CompanyName ASC">
    </asp:SqlDataSource>
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
