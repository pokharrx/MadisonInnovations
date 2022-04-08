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
        #news, #recommended {
            padding: 2%;
        }
        #news {
            background-color: white;
            float: right;
            margin-top: 2%;
            width: 25%;
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
        }
        #recommended {
            float: left;
            width: 75%;
        }
        </style>

    <div id="news">
        <h2>Announcements</h2>
        <asp:BulletedList ID="blAnnouncements" runat="server"></asp:BulletedList>
        <asp:Calendar ID="Calendar1" runat="server">
            <TitleStyle BackColor="#dacce6" ForeColor="#7f729a" Font-Bold="true"></TitleStyle>
            <OtherMonthDayStyle ForeColor="LightGray"></OtherMonthDayStyle>
            <DayStyle BackColor="white"></DayStyle>
            <SelectedDayStyle BackColor="#d0c8b5" Font-Bold="True"></SelectedDayStyle>
        </asp:Calendar>
    </div>

    <section id="recommended">
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
    </section>
    
       
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
