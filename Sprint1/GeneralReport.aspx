<%@ Page Title="" Language="C#" MasterPageFile="~/adminMaster.Master" AutoEventWireup="true" CodeBehind="GeneralReport.aspx.cs" Inherits="Sprint1.GeneralReport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:FormView ID="fvStudentMemberCount" 
        DataSourceId="dtasrcStudentMemberCount"
        runat="server" >
        <ItemTemplate>
            <asp:Label ID="lblMemberCount"
                Text="Member Count"
                AssociatedControlID="txtMemberCount"
                runat="server" />
            <asp:Label
                ID="txtMemberCount"
                Text='<%# Eval("MemberCount")%>'
                runat="server" />
             <asp:Label ID="lblStudentCount"
                Text="Student Count"
                AssociatedControlID="txtStudentCount"
                runat="server" />
            <asp:Label
                ID="txtStudentCount"
                Text='<%# Eval("StudentCount")%>'
                runat="server" />
        </ItemTemplate>
        </asp:FormView>

        <%-- Data Sources for the gridviews --%>
    <asp:SqlDataSource ID="dtasrcStudentMemberCount" runat="server"
        ConnectionString ="<%$ ConnectionStrings:SDB %>"
        SelectCommand="SELECT COUNT(Member.MemberID) AS MemberCount, COUNT(Student.StudentID) AS StudentCount FROM  Member FULL OUTER JOIN StudentMentor ON Member.MemberID = StudentMentor.MemberID  FULL OUTER JOIN Student ON StudentMentor.StudentID = Student.StudentID">
    </asp:SqlDataSource>
</asp:Content>
