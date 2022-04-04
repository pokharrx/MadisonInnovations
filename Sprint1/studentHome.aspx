<%@ Page Title="" Language="C#" MasterPageFile="~/studentMaster.Master" AutoEventWireup="true" CodeBehind="studentHome.aspx.cs" Inherits="Sprint1.studentHome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
      <%-- Recommended Job Opportunities --%>
    <div id="RecommendedJobs">
        <h2>Recommended Job Opportunities</h2>
        <%-- Gridview that shows all jobs --%>
        <asp:GridView
            ID="grdRecommendedJobs"
            runat="server"
            HorizontalAlign="Justify"
            AlternatingRowStyle="PowderBlue"
            EmptyDataText="No Job Opportunities Matching Your Industry Interest"
            AllowSorting="True"
            AutoGenerateColumns="False"
            CellPadding="10"
            CssClass="gridview" DataSourceID="SqlRecJobs">
            <Columns>
                <asp:BoundField HeaderText="JobTitle" DataField="JobTitle" SortExpression="JobTitle"/>
                <asp:BoundField HeaderText="DateStart" DataField="DateStart" SortExpression="DateStart"/>
                <asp:BoundField HeaderText="DateEnd" DataField="DateEnd" SortExpression="DateEnd"/>
                <asp:BoundField HeaderText="Industry" DataField="Industry" SortExpression="Industry"/>
                <asp:BoundField HeaderText="Description" DataField="Description" SortExpression="Description" />
                <asp:BoundField DataField="ApplicationLink" HeaderText="ApplicationLink" SortExpression="ApplicationLink" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlRecJobs" runat="server" ConnectionString="<%$ ConnectionStrings:SDB %>" SelectCommand="SELECT [JobTitle], [DateStart], [DateEnd], [Industry], [Description], [ApplicationLink] FROM [Job] WHERE ([Industry] = @Industry)">
            <SelectParameters>
                <asp:SessionParameter Name="Industry" SessionField="StudentIndustry" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    <br />

    <%-- Recommended Internship Opportunities --%>
   <%-- <div id="RecommendedInternships">
        <h2>Recommended Internship Opportunities</h2>--%>
        <%-- Gridview that shows all jobs --%>
        <%--<asp:GridView
            ID="grdRecommendedInternships"
            runat="server"
            HorizontalAlign="Justify"
            AlternatingRowStyle="PowderBlue"
            EmptyDataText="No Internship Opportunities Matching Your Industry Interest"
            AllowSorting="True"
            AutoGenerateColumns="False"
            CellPadding="10"
            CssClass="gridview" DataSourceID="SqlRecInternships">
            <Columns>
                <asp:BoundField HeaderText="InternshipTitle" DataField="InternshipTitle" SortExpression="InternshipTitle"/>
                <asp:BoundField HeaderText="DateStart" DataField="DateStart" SortExpression="DateStart"/>
                <asp:BoundField HeaderText="DateEnd" DataField="DateEnd" SortExpression="DateEnd"/>
                <asp:BoundField HeaderText="Industry" DataField="Industry" SortExpression="Industry"/>
                <asp:BoundField HeaderText="Description" DataField="Description" SortExpression="Description" />
                <asp:BoundField DataField="ApplicationLink" HeaderText="ApplicationLink" SortExpression="ApplicationLink" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlRecInternships" runat="server" ConnectionString="<%$ ConnectionStrings:SDB %>" SelectCommand="SELECT [InternshipTitle], [DateStart], [DateEnd], [Industry], [Description], [ApplicationLink] FROM [Internship] WHERE ([Industry] = @Industry)">
            <SelectParameters>
                <asp:SessionParameter Name="Industry" SessionField="StudentIndustry" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    <br />--%>
    
    
    
    
    <%-- Job Opportunities --%>
    <div id="Jobs">
        <h2>All Job Opportunities</h2>
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
    <br />
    <%-- Internship Opportunities --%>
    <div id="Internships">
        <h2>All Internship Opportunities</h2>
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
            CellPadding="10">
            <Columns>
                <asp:BoundField HeaderText="Internship Title" DataField="InternshipTitle" SortExpression="InternshipTitle"/>
                <asp:BoundField HeaderText="Date Start" DataField="DateStart" SortExpression="DateStart"/>
                <asp:BoundField HeaderText="Date End" DataField="DateEnd" SortExpression="DateEnd"/>
                <asp:BoundField HeaderText="Description" DataField="Description" SortExpression="Description"/>
                <asp:BoundField HeaderText="Apply Here" DataField="ApplicationLink" SortExpression="ApplicationLink"/>
            </Columns>
        </asp:GridView>
    </div>
    <br />
    <%-- Scholarship Opportunities --%>
    <div id="Scholarships">
        <h2>All Scholarships</h2>
        <%-- Gridview that shows all scholarships --%>
        <asp:GridView 
             ID="grdScholarship" 
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
    <br />


       
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
