<%@ Page Title="" Language="C#" MasterPageFile="~/adminMaster.Master" AutoEventWireup="true" CodeBehind="GeneralReport.aspx.cs" Inherits="Sprint1.GeneralReport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>       
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
        .add:hover {
            background-color: #dacce6;
            border-top: 2px solid white;
            border-bottom: 2px solid white;
        }
    </style>

    <div id="StudentMemberCountInformation">
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
        </div>

    <div id ="JobInformation">
        <asp:GridView ID="grdJobInformation" 
            runat="server" 
            HorizontalAlign="Justify"  
            EmptyDataText="No Job Statistics" 
            AutoGenerateColumns="false"
            DataKeyNames="CompanyName" 
            CellPadding="10"> 
            <Columns>
                <asp:BoundField HeaderText="Company Name" DataField="CompanyName" />
                <asp:BoundField HeaderText="Number Applied" DataField="Applied" />
                <asp:BoundField HeaderText="Number Interviewed" DataField="Interviewed" />
                <asp:BoundField HeaderText="Number of Offers" DataField="Offer" />
            </Columns>
        </asp:GridView>
    </div>

        <div id ="InternshipInformation">
        <asp:GridView ID="grdInternshipInformation" 
            runat="server" 
            HorizontalAlign="Justify"  
            EmptyDataText="No Internship Statistics" 
            AutoGenerateColumns="false"
            DataKeyNames="CompanyName" 
            CellPadding="10"> 
            <Columns>
                <asp:BoundField HeaderText="Company Name" DataField="CompanyName" />
                <asp:BoundField HeaderText="Number Applied" DataField="Applied" />
                <asp:BoundField HeaderText="Number Interviewed" DataField="Interviewed" />
                <asp:BoundField HeaderText="Number of Offers" DataField="Offer" />
            </Columns>
        </asp:GridView>
    </div>

        <div id ="OtherInformation">
        <asp:GridView ID="grdOtherInformation" 
            runat="server" 
            HorizontalAlign="Justify"  
            EmptyDataText="No Other Statistics" 
            AutoGenerateColumns="false"
            DataKeyNames="CompanyName" 
            CellPadding="10"> 
            <Columns>
                <asp:BoundField HeaderText="Company Name" DataField="CompanyName" />
                <asp:BoundField HeaderText="Number Applied" DataField="Applied" />
                <asp:BoundField HeaderText="Number Interviewed" DataField="Interviewed" />
                <asp:BoundField HeaderText="Number of Offers" DataField="Offer" />
            </Columns>
        </asp:GridView>
    </div>

        <%-- Data Sources for the gridviews --%>
    <asp:SqlDataSource ID="dtasrcStudentMemberCount" runat="server"
        ConnectionString ="<%$ ConnectionStrings:SDB %>"
        SelectCommand="SELECT COUNT(Member.MemberID) AS MemberCount, COUNT(Student.StudentID) AS StudentCount FROM  Member FULL OUTER JOIN StudentMentor ON Member.MemberID = StudentMentor.MemberID  FULL OUTER JOIN Student ON StudentMentor.StudentID = Student.StudentID">
    </asp:SqlDataSource>

     <asp:SqlDataSource ID="dtasrcJobInformation" runat="server"
        ConnectionString ="<%$ ConnectionStrings:SDB %>"
        SelectCommand="SELECT c.CompanyName, COUNT(ja.ApplicationStatus) AS Applied, COUNT(ja.InterviewStatus) AS Interviewed, COUNT(ja.OfferStatus) AS Offer, COUNT(ja.AcceptedStatus) AS Acceptance FROM Company c, CorporateSponsor cs, Job j, JobApplication ja WHERE (c.CompanyID=cs.CompanyID AND cs.ContactID=j.ContactID AND j.JobID=ja.JobID) AND (ja.ApplicationStatus = 'Yes' OR ja.InterviewStatus = 'Yes' OR ja.OfferStatus = 'Yes' OR ja.AcceptedStatus = 'Yes') GROUP BY c.CompanyName;  ">
    </asp:SqlDataSource>

       <asp:SqlDataSource ID="dtasrcInternshipInformation" runat="server"
        ConnectionString ="<%$ ConnectionStrings:SDB %>"
        SelectCommand="SELECT c.CompanyName, COUNT(ia.ApplicationStatus) AS Applied, COUNT(ia.InterviewStatus) AS Interviewed, COUNT(ia.OfferStatus) AS Offer, COUNT(ia.AcceptedStatus) AS Acceptance FROM Company c, CorporateSponsor cs, Internship i, InternshipApplication ia WHERE (c.CompanyID=cs.CompanyID AND cs.ContactID=i.ContactID AND i.InternshipID=ia.InternshipID) AND (ia.ApplicationStatus = 'Yes' OR ia.InterviewStatus = 'Yes' OR ia.OfferStatus = 'Yes' OR ia.AcceptedStatus = 'Yes') GROUP BY c.CompanyName; ">
    </asp:SqlDataSource>

       <asp:SqlDataSource ID="dtasrcOtherInformation" runat="server"
        ConnectionString ="<%$ ConnectionStrings:SDB %>"
        SelectCommand="SELECT c.CompanyName, COUNT(oa.ApplicationStatus) AS Applied, COUNT(oa.InterviewStatus) AS Interviewed, COUNT(oa.OfferStatus) AS Offer, COUNT(oa.AcceptedStatus) AS Acceptance FROM Company c, CorporateSponsor cs, Other o, OtherApplication oa WHERE (c.CompanyID=cs.CompanyID AND cs.ContactID=o.ContactID AND o.OtherID=oa.OtherID) AND (oa.ApplicationStatus = 'Yes' OR oa.InterviewStatus = 'Yes' OR oa.OfferStatus = 'Yes' OR oa.AcceptedStatus = 'Yes') GROUP BY c.CompanyName; ">
    </asp:SqlDataSource>

</asp:Content>
