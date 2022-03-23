<%@ Page Title="" Language="C#" MasterPageFile="~/memberMaster.Master" AutoEventWireup="true" CodeBehind="memberHome.aspx.cs" Inherits="Sprint1.memberHome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%-- View Students --%>
    <div>
        <h2>View Students</h2>
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
    <%-- View Companies --%>
    <div>
        <h2></h2>
    </div>
    <%-- Datasources --%>
    <asp:SqlDataSource ID="dtasrcAllStudents" runat="server"
        ConnectionString ="<%$ ConnectionStrings:SDB %>"
        SelectCommand="Select * from Student Order By LastName ASC">
    </asp:SqlDataSource>
</asp:Content>
