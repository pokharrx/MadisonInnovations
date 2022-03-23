<%@ Page Title="" Language="C#" MasterPageFile="~/studentMaster.Master" AutoEventWireup="true" CodeBehind="studentHome.aspx.cs" Inherits="Sprint1.studentHome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Job Opportunities</h2>
    
    <%-- Gridview that shows all jobs --%>
    <asp:GridView
        ID="grdJobResults"
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
            <asp:BoundField HeaderText="Name" DataField="CompanyName" SortExpression="CompanyName"/>
                                <asp:BoundField HeaderText="Address" DataField="CompanyAddress" SortExpression="CompanyAddress"/>
                                <asp:BoundField HeaderText="Phone Number" DataField="CompanyPhone" SortExpression="CompanyPhone"/>
        </Columns>
    </asp:GridView>

    <%-- Data Sources for the gridviews --%>
    <asp:SqlDataSource ID="dtasrcAllJobs" runat="server"
            ConnectionString ="<%$ ConnectionStrings:Lab1 %>"
            SelectCommand="Select * from Job"
            UpdateCommand="UPDATE Job SET JobTitle=@JobTitle, JobYear=@JobYear, DateStart=@DateStart, DateEnd=@DateEnd 
            WHERE JobID=@JobID">
        </asp:SqlDataSource>
</asp:Content>
