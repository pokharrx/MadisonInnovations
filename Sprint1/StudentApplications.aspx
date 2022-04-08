<%@ Page Title="" Language="C#" MasterPageFile="~/studentMaster.Master" AutoEventWireup="true" CodeBehind="StudentApplications.aspx.cs" Inherits="Sprint1.StudentApplications" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .dashboard:hover {
            background-color: #dacce6;
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
    <%-- Section Header --%>
    <h4>View All your Internship, Job, and Other Opportunity Applications</h4>
    <br />


    <asp:Label ID="lblJobApplication" runat="server" Text="Your Job Applications: "></asp:Label>
    <br />

      <%-- Job view --%>
    <asp:GridView ID="grdJobApplication" runat="server" DataKeyNames="JobApplicationID" AutoGenerateColumns="False" DataSourceID="SqlStudentJobApps" AllowSorting="True" AutoGenerateEditButton="true" >
        <Columns>
             <asp:BoundField DataField="JobApplicationID" HeaderText="JobApplicationID" Visible="false" InsertVisible="False" ReadOnly="True" SortExpression="JobApplicationID" />
             <asp:BoundField DataField="JobTitle" HeaderText="JobTitle" SortExpression="JobTitle"  ReadOnly="True" />
            <asp:BoundField DataField="ApplicationStatus" HeaderText="Applied? (Yes or No)" SortExpression="ApplicationStatus" />
            <asp:BoundField DataField="InterviewStatus" HeaderText="Interviewd? (Yes or No)" SortExpression="InterviewStatus" />
            <asp:BoundField DataField="OfferStatus" HeaderText="Offer Recieved? (Yes or No)" SortExpression="OfferStatus" />
            <asp:BoundField DataField="AcceptedStatus" HeaderText="Accepted Offer? (Yes or No)" SortExpression="AcceptedStatus" />
           
        </Columns>
                
            </asp:GridView>
           <asp:SqlDataSource ID="SqlStudentJobApps" runat="server" ConnectionString="Data Source=localhost;Initial Catalog=SDB;Integrated Security=True" ProviderName="System.Data.SqlClient" 
               SelectCommand="SELECT JobApplication. JobApplicationID,  Job. JobTitle,  JobApplication.ApplicationStatus,  JobApplication.InterviewStatus,  JobApplication.OfferStatus,  JobApplication.AcceptedStatus FROM  JobApplication INNER JOIN  Job ON  JobApplication. JobID =  Job. JobID WHERE ( JobApplication.StudentID = @StudentID)"
               UpdateCommand="Update  JobApplication Set ApplicationStatus=@ApplicationStatus,InterviewStatus=@InterviewStatus, OfferStatus=@OfferStatus, AcceptedStatus=@AcceptedStatus Where  JobApplicationID=@JobApplicationID ">
               <SelectParameters>
                   <asp:SessionParameter Name="StudentID" SessionField="StudentID" Type="Int32" />
               </SelectParameters>
               <UpdateParameters>
                   <asp:Parameter Type="String" Name="ApplicationStatus" />
                   <asp:Parameter Type="String" Name="InterviewStatus" />
                   <asp:Parameter Type="String" Name="OfferStatus" />
                   <asp:Parameter Type="String" Name="AcceptedStatus" />
               </UpdateParameters>
    </asp:SqlDataSource>
    <br />
    <br />



    <asp:Label ID="lblInternshipApplication" runat="server" Text="Your Internship Applications: "></asp:Label>
    <br />

      <%-- Internship view --%>
    <asp:GridView ID="grdInternshipApplication" runat="server" DataKeyNames="InternshipApplicationID" AutoGenerateColumns="False" DataSourceID="SqlStudentInternshipApps" AllowSorting="True" AutoGenerateEditButton="true" >
        <Columns>
             <asp:BoundField DataField="InternshipApplicationID" HeaderText="InternshipApplicationID" Visible="false" InsertVisible="False" ReadOnly="True" SortExpression="InternshipApplicationID" />
             <asp:BoundField DataField="InternshipTitle" HeaderText="InternshipTitle" SortExpression="InternshipTitle"  ReadOnly="True" />
            <asp:BoundField DataField="ApplicationStatus" HeaderText="Applied? (Yes or No)" SortExpression="ApplicationStatus" />
            <asp:BoundField DataField="InterviewStatus" HeaderText="Interviewd? (Yes or No)" SortExpression="InterviewStatus" />
            <asp:BoundField DataField="OfferStatus" HeaderText="Offer Recieved? (Yes or No)" SortExpression="OfferStatus" />
            <asp:BoundField DataField="AcceptedStatus" HeaderText="Accepted Offer? (Yes or No)" SortExpression="AcceptedStatus" />
           
        </Columns>
                
            </asp:GridView>
           <asp:SqlDataSource ID="SqlStudentInternshipApps" runat="server" ConnectionString="Data Source=localhost;Initial Catalog=SDB;Integrated Security=True" ProviderName="System.Data.SqlClient" 
               SelectCommand="SELECT InternshipApplication.InternshipApplicationID, Internship.InternshipTitle, InternshipApplication.ApplicationStatus, InternshipApplication.InterviewStatus, InternshipApplication.OfferStatus, InternshipApplication.AcceptedStatus FROM InternshipApplication INNER JOIN Internship ON InternshipApplication.InternshipID = Internship.InternshipID WHERE (InternshipApplication.StudentID = @StudentID)"
               UpdateCommand="Update InternshipApplication Set ApplicationStatus=@ApplicationStatus,InterviewStatus=@InterviewStatus, OfferStatus=@OfferStatus, AcceptedStatus=@AcceptedStatus Where InternshipApplicationID=@InternshipApplicationID ">
               <SelectParameters>
                   <asp:SessionParameter Name="StudentID" SessionField="StudentID" Type="Int32" />
               </SelectParameters>
               <UpdateParameters>
                   <asp:Parameter Type="String" Name="ApplicationStatus" />
                   <asp:Parameter Type="String" Name="InterviewStatus" />
                   <asp:Parameter Type="String" Name="OfferStatus" />
                   <asp:Parameter Type="String" Name="AcceptedStatus" />
               </UpdateParameters>
    </asp:SqlDataSource>
    <br />
    <br />



        <asp:Label ID="lblOtherApplication" runat="server" Text="Your Other Opportunity Applications: "></asp:Label>
    <br />

      <%-- Other Opportunity view --%>
    <asp:GridView ID="grdOtherApplication" runat="server" DataKeyNames="OtherApplicationID" AutoGenerateColumns="False" DataSourceID="SqlStudentOtherApps" AllowSorting="True" AutoGenerateEditButton="true" >
        <Columns>
             <asp:BoundField DataField="OtherApplicationID" HeaderText="OtherApplicationID" Visible="false" InsertVisible="False" ReadOnly="True" SortExpression="OtherApplicationID" />
             <asp:BoundField DataField="OtherTitle" HeaderText="OtherTitle" SortExpression="OtherTitle"  ReadOnly="True" />
            <asp:BoundField DataField="ApplicationStatus" HeaderText="Applied? (Yes or No)" SortExpression="ApplicationStatus" />
            <asp:BoundField DataField="InterviewStatus" HeaderText="Interviewd? (Yes or No)" SortExpression="InterviewStatus" />
            <asp:BoundField DataField="OfferStatus" HeaderText="Offer Recieved? (Yes or No)" SortExpression="OfferStatus" />
            <asp:BoundField DataField="AcceptedStatus" HeaderText="Accepted Offer? (Yes or No)" SortExpression="AcceptedStatus" />
           
        </Columns>
                
            </asp:GridView>
           <asp:SqlDataSource ID="SqlStudentOtherApps" runat="server" ConnectionString="Data Source=localhost;Initial Catalog=SDB;Integrated Security=True" ProviderName="System.Data.SqlClient" 
               SelectCommand="SELECT OtherApplication.OtherApplicationID, Other.OtherTitle, OtherApplication.ApplicationStatus, OtherApplication.InterviewStatus,OtherApplication.OfferStatus, OtherApplication.AcceptedStatus FROM OtherApplication INNER JOIN Other ON OtherApplication.OtherID = Other.OtherID WHERE (OtherApplication.StudentID = @StudentID)"
               UpdateCommand="Update OtherApplication Set ApplicationStatus=@ApplicationStatus,InterviewStatus=@InterviewStatus, OfferStatus=@OfferStatus, AcceptedStatus=@AcceptedStatus Where OtherApplicationID=@OtherApplicationID ">
               <SelectParameters>
                   <asp:SessionParameter Name="StudentID" SessionField="StudentID" Type="Int32" />
               </SelectParameters>
               <UpdateParameters>
                   <asp:Parameter Type="String" Name="ApplicationStatus" />
                   <asp:Parameter Type="String" Name="InterviewStatus" />
                   <asp:Parameter Type="String" Name="OfferStatus" />
                   <asp:Parameter Type="String" Name="AcceptedStatus" />
               </UpdateParameters>
    </asp:SqlDataSource>
    <br />
    <br />
</asp:Content>
