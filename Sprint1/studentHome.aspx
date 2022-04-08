<%@ Page Title="" Language="C#" MasterPageFile="~/studentMaster.Master" AutoEventWireup="true" CodeBehind="studentHome.aspx.cs" Inherits="Sprint1.studentHome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style type="text/css">
        h2 {
            font-weight: 600;
        }
        .gridview {
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
            padding: 16px;
            text-align: left;
            background-color: #f4efe1;
            border: none;        
            width: 100%;
        }
        .home {
            background-color: #d0c8b5;
            border-top: 2px solid white;
            border-bottom: 2px solid white;
        }
        .dashboard:hover {
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
    <asp:Label ID="lbl1" runat="server" Text="Announcements"></asp:Label>

    <asp:BulletedList ID="blAnnouncements" runat="server"></asp:BulletedList>
    
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
                <asp:BoundField HeaderText="OtherTitle" DataField="OtherTitle" SortExpression="OtherTitle"/>
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
