<%@ Page Title="" Language="C#" MasterPageFile="~/studentMaster.Master" AutoEventWireup="true" CodeBehind="studentHome.aspx.cs" Inherits="Sprint1.studentHome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Job Opportunities: Test1 </h2>
    
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
            <asp:BoundField HeaderText="Name" DataField="CompanyName" SortExpression="CompanyName"/>
                <asp:BoundField HeaderText="Job Title" DataField="JobTitle" SortExpression="JobTitle"/>
                <asp:BoundField HeaderText="Date Start" DataField="DateStart" SortExpression="DateStart"/>
                <asp:BoundField HeaderText="Date End" DataField="DateEnd" SortExpression="DateEnd"/>
        </Columns>
    </asp:GridView>

    <%-- Data Sources for the gridviews --%>
    <asp:SqlDataSource ID="dtasrcAllJobs" runat="server"
            ConnectionString ="<%$ ConnectionStrings:SDB %>"
            SelectCommand="Select * from Job">
        </asp:SqlDataSource>
</asp:Content>
