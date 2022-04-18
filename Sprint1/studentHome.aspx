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
            border-radius: 10px;
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
        #news {
            padding: 2%;
            background-color: white;
            float: right;
            width: 300px;
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
            border-radius: 15px;
        }
        #recommended {           
            float: left;
            width: 75%;
            margin-bottom: 5%;
        }
        .gridcard {
            background-color: white;
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
            border-radius: 10px;
            padding: 3%;
        }
        .gv-head {
            color: rebeccapurple;
            border-bottom: 0.5px solid black;
            text-align: center;
        }
        .gv-row {
            text-align:center;
        }
        </style>

    <div id="news">
        <h2>Announcements</h2>
        <asp:BulletedList ID="blAnnouncements" runat="server"></asp:BulletedList>
        <asp:Calendar ID="Calendar1" runat="server">
            <TitleStyle BackColor="#dacce6" ForeColor="#7f729a" Font-Bold="true"></TitleStyle>
            <OtherMonthDayStyle ForeColor="LightGray"></OtherMonthDayStyle>
            <DayStyle BackColor="white"></DayStyle>
            <SelectedDayStyle BackColor="#7f729a" Font-Bold="True"></SelectedDayStyle>
            <TodayDayStyle BackColor="#f4efe1" Font-Bold="True" />
        </asp:Calendar>
    </div>

    <section id="recommended">
        <%-- Recommended Job Opportunities --%>
        <div id="RecommendedJobs" class="gridcard">
            <h2>Recommended Jobs</h2>
            <%-- Gridview that shows all jobs --%>
            <asp:GridView
                ID="grdRecommendedJobs"
                runat="server"
                HorizontalAlign="Justify"
                AlternatingRowStyle="PowderBlue"
                EmptyDataText="No Job Opportunities Matching Your Industry Interest"
                AutoGenerateColumns="False"
                CellPadding="10"
                CssClass="gridview" 
                DataSourceID="SqlRecJobs" 
                HeaderStyle-Font-Size="Large" HeaderStyle-CssClass="gv-head" RowStyle-CssClass="gv-row"  OnRowCommand="grdRecommendedJobs_RowCommand">
                <Columns>
                    <asp:BoundField ItemStyle-Font-Bold="true" HeaderText="JobTitle" DataField="JobTitle" SortExpression="JobTitle"/>
                    <asp:BoundField HeaderText="DateStart" DataField="DateStart" SortExpression="DateStart"/>
                    <asp:BoundField HeaderText="DateEnd" DataField="DateEnd" SortExpression="DateEnd"/>
                    <asp:BoundField HeaderText="Industry" DataField="Industry" SortExpression="Industry"/>
                    <asp:BoundField HeaderText="Description" DataField="Description" SortExpression="Description" ItemStyle-HorizontalAlign="Justify" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button ID="btnApp" runat="server" Text="Apply Here" CommandName="JobTitle" CommandArgument='<%# Eval("JobTitle") %>' OnClientClick="target='_blank';" />
                        </ItemTemplate>
                    </asp:TemplateField>
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
        <div id="RecommendedInternships" class="gridcard">
            <h2>Recommended Internships</h2>
            <%-- Gridview that shows all jobs --%>
            <asp:GridView
                ID="grdRecommendedInternships"
                runat="server"
                HorizontalAlign="Justify"
                AlternatingRowStyle="PowderBlue"
                EmptyDataText="No Internship Opportunities Matching Your Industry Interest"
                AutoGenerateColumns="False"
                CellPadding="10"
                CssClass="gridview" HeaderStyle-CssClass="gv-head" RowStyle-CssClass="gv-row"
                DataSourceID="SqlRecInternships" OnRowCommand="grdRecommendedJobs_RowCommand">
                <Columns>
                    <asp:BoundField ItemStyle-Font-Bold="true" HeaderText="InternshipTitle" DataField="InternshipTitle" SortExpression="InternshipTitle"/>
                    <asp:BoundField HeaderText="DateStart" DataField="DateStart" SortExpression="DateStart"/>
                    <asp:BoundField HeaderText="DateEnd" DataField="DateEnd" SortExpression="DateEnd"/>
                    <asp:BoundField HeaderText="Industry" DataField="Industry" SortExpression="Industry"/>
                    <asp:BoundField HeaderText="Description" DataField="Description" SortExpression="Description" ItemStyle-HorizontalAlign="Justify" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button ID="btnApp" runat="server" Text="Apply Here" CommandName="InternshipTitle" CommandArgument='<%# Eval("InternshipTitle") %>' OnClientClick="target='_blank';" />
                        </ItemTemplate>
                    </asp:TemplateField>
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
        <div id="RecommendedOther" class="gridcard">
            <h2>Recommended Other Opportunities</h2>
            <%-- Gridview that shows all jobs --%>
            <asp:GridView
                ID="grdRecommendedOther"
                runat="server"
                HorizontalAlign="Justify"
                AlternatingRowStyle="PowderBlue"
                EmptyDataText="No Other Opportunities Matching Your Industry Interest"
                AutoGenerateColumns="False"
                CellPadding="10"
                CssClass="gridview" HeaderStyle-CssClass="gv-head" RowStyle-CssClass="gv-row"
                DataSourceID="SqlRecOther" OnRowCommand="grdRecommendedJobs_RowCommand">
                <Columns>
                    <asp:BoundField ItemStyle-Font-Bold="true" HeaderText="OtherTitle" DataField="OtherTitle" SortExpression="OtherTitle"/>
                    <asp:BoundField HeaderText="DateStart" DataField="DateStart" SortExpression="DateStart"/>
                    <asp:BoundField HeaderText="DateEnd" DataField="DateEnd" SortExpression="DateEnd"/>
                    <asp:BoundField HeaderText="Industry" DataField="Industry" SortExpression="Industry"/>
                    <asp:BoundField HeaderText="Description" DataField="Description" SortExpression="Description" ItemStyle-HorizontalAlign="Justify" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button ID="btnApp" runat="server" Text="Apply Here" CommandName="OtherTitle" CommandArgument='<%# Eval("OtherTitle") %>' OnClientClick="target='_blank';" />
                        </ItemTemplate>
                    </asp:TemplateField>  
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
</asp:Content>
