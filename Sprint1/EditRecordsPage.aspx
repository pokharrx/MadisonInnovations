<%@ Page Title="" Language="C#" MasterPageFile="~/memberMaster.Master" AutoEventWireup="true" CodeBehind="EditRecordsPage.aspx.cs" Inherits="Sprint1.EditRecordsPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <%-- Students Gridview- view and edit Students --%>
    
     <div>
    <asp:GridView 
            ID="StudentsGridview" 
            runat="server" 
            AllowSorting="True" 
            AutoGenerateColumns="False"  
            DataKeyNames="StudentID"
            DataSourceID="sqlsrcStudentsgrdv"
            OnSelectedIndexChanged="GridViewStudents_SelectedIndexChanged">

            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="StudentID" Visible="false" HeaderText="StudentID" InsertVisible="False" ReadOnly="True" SortExpression="StudentID" />
                <asp:BoundField HeaderText="First Name" DataField="FirstName" SortExpression="FirstName"/>
                <asp:BoundField HeaderText="Last Name" DataField="LastName" SortExpression="LastName"/>
                <asp:BoundField HeaderText="Email" DataField="EmailAddress" SortExpression="EmailAddress"/>
                <asp:BoundField HeaderText="Phone Number" DataField="PhoneNumber" SortExpression="PhoneNumber"/>
                <asp:BoundField HeaderText="Graduation Year" DataField="GradYear" SortExpression="GradYear"/>
                <asp:BoundField HeaderText="Major" DataField="Major" SortExpression="Major"/>
                <asp:BoundField HeaderText="Grade" DataField="Grade" SortExpression="Grade"/>
                <asp:BoundField HeaderText="Employment Status" DataField="EmploymentStatus" SortExpression="EmploymentStatus"/>
                 <asp:BoundField DataField="Resume" HeaderText="Resume" SortExpression="Resume" />
            </Columns>
        </asp:GridView>

        <asp:Label ID="lblSelectedIndex" runat="server" Text=""></asp:Label>   

     <%-- Datasources --%>
<asp:SqlDataSource 
    ID="sqlsrcStudentsgrdv" 
    runat="server" 
    ConnectionString="Data Source=LocalHost;Initial Catalog=SDB;Integrated Security=True" 
    ProviderName="System.Data.SqlClient" 
            SelectCommand="SELECT * FROM [Student]">
        </asp:SqlDataSource>
    
    </div>

</asp:Content>
