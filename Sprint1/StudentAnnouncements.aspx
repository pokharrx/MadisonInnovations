<%@ Page Title="" Language="C#" MasterPageFile="~/studentMaster.Master" AutoEventWireup="true" CodeBehind="StudentAnnouncements.aspx.cs" Inherits="Sprint1.StudentAnnouncements" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <style>
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
                <asp:BoundField ItemStyle-Font-Bold="true" HeaderText="JobTitle" DataField="JobTitle" SortExpression="JobTitle"/>
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
    <div id="RecommendedInternships">
        <h2>Recommended Internship Opportunities</h2>
        <%-- Gridview that shows all jobs --%>
        <asp:GridView
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
                <asp:BoundField ItemStyle-Font-Bold="true" HeaderText="InternshipTitle" DataField="InternshipTitle" SortExpression="InternshipTitle"/>
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
    <br />
    

      <%-- Recommended Other Opportunities --%>
    <div id="RecommendedOther">
        <h2>Recommended Other Opportunities</h2>
        <%-- Gridview that shows all jobs --%>
        <asp:GridView
            ID="grdRecommendedOther"
            runat="server"
            HorizontalAlign="Justify"
            AlternatingRowStyle="PowderBlue"
            EmptyDataText="No Other Opportunities Matching Your Industry Interest"
            AllowSorting="True"
            AutoGenerateColumns="False"
            CellPadding="10"
            CssClass="gridview" DataSourceID="SqlRecOther">
            <Columns>
                <asp:BoundField ItemStyle-Font-Bold="true" HeaderText="OtherTitle" DataField="OtherTitle" SortExpression="OtherTitle"/>
                <asp:BoundField HeaderText="DateStart" DataField="DateStart" SortExpression="DateStart"/>
                <asp:BoundField HeaderText="DateEnd" DataField="DateEnd" SortExpression="DateEnd"/>
                <asp:BoundField HeaderText="Industry" DataField="Industry" SortExpression="Industry"/>
                <asp:BoundField HeaderText="Description" DataField="Description" SortExpression="Description" />
                <asp:BoundField DataField="ApplicationLink" HeaderText="ApplicationLink" SortExpression="ApplicationLink" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlRecOther" runat="server" ConnectionString="<%$ ConnectionStrings:SDB %>" SelectCommand="SELECT [OtherTitle], [DateStart], [DateEnd], [Industry], [Description], [ApplicationLink] FROM [Other] WHERE ([Industry] = @Industry)">
            <SelectParameters>
                <asp:SessionParameter Name="Industry" SessionField="StudentIndustry" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    <br />
    
    
    
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
             CellPadding="10"
             CssClass="gridview">
             <Columns>
                 <asp:BoundField ItemStyle-Font-Bold="true" HeaderText="Name" DataField="ScholarshipName" SortExpression="ScholarshipName"/>
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
    <asp:SqlDataSource ID="dtasrcAllOther" runat="server"
        ConnectionString ="<%$ ConnectionStrings:SDB %>"
        SelectCommand="Select * from Other">
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
