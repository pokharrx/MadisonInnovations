<%@ Page Title="" Language="C#" MasterPageFile="~/memberMaster.Master" AutoEventWireup="true" CodeBehind="memberHome.aspx.cs" Inherits="Sprint1.memberHome" MaintainScrollPositionOnPostback="true" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%-- Students --%>
    <div id="Students">
        <h2>Students</h2>
        <asp:TextBox ID="txtStudentSearch" runat="server"></asp:TextBox>
        <asp:Button ID="btnStudentSearch" runat="server" Text="Search" OnClick="btnStudentSearch_Click" />
        <asp:Button ID="btnAllStudents" runat="server" Text="View All" OnClick="btnAllStudents_Click"/>
        <asp:GridView
            ID="grdStudents"
            runat="server"
            HorizontalAlign="Justify"
            AlternatingRowStyle-BackColor="PowderBlue"
            EmptyDataText="No Student Found"
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
        <asp:TextBox ID="txtCompanySearch" runat="server"></asp:TextBox>
        <asp:Button ID="btnCompanySearch" runat="server" Text="Search" OnClick="btnCompanySearch_Click" />
        <asp:Button ID="btnAllCompanies" runat="server" Text="View All" OnClick="btnAllCompanies_Click"/>
        <asp:GridView 
            ID="grdCompanies"
            runat="server" 
            HorizontalAlign="Justify"
            AlternatingRowStyle-BackColor="PowderBlue"
            EmptyDataText="No Company Found"
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
        <asp:TextBox ID="txtJobSearch" runat="server"></asp:TextBox>
        <asp:Button ID="btnJobSearch" runat="server" Text="Search" OnClick="btnJobSearch_Click" />
        <asp:Button ID="btnAllJobs" runat="server" Text="View All" OnClick="btnAllJobs_Click"/>
        <asp:GridView 
            ID="grdJobs" 
            runat="server"
            HorizontalAlign="Justify"
            AlternatingRowStyle-BackColor="PowderBlue"
            EmptyDataText="No Job Found"
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
        <asp:TextBox ID="txtInternshipSearch" runat="server"></asp:TextBox>
        <asp:Button ID="btnInternshipSearch" runat="server" Text="Search" OnClick="btnInternshipSearch_Click" />
        <asp:Button ID="btnAllInternships" runat="server" Text="View All" OnClick="btnAllInternships_Click"/>
        <asp:GridView 
            ID="grdInternships" 
            runat="server"
            HorizontalAlign="Justify"
            AlternatingRowStyle-BackColor="PowderBlue"
            EmptyDataText="No Internship Found"
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
        <asp:TextBox ID="txtScholarshipSearch" runat="server"></asp:TextBox>
        <asp:Button ID="btnScholarshipSearch" runat="server" Text="Search" OnClick="btnScholarshipSearch_Click" />
        <asp:Button ID="txtAllScholarships" runat="server" Text="View All" OnClick="txtAllScholarships_Click"/>
        <asp:GridView 
            ID="grdScholarships" 
            runat="server"
            HorizontalAlign="Justify"
            AlternatingRowStyle-BackColor="PowderBlue"
            EmptyDataText="No Scholarship Found"
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
</asp:Content>
