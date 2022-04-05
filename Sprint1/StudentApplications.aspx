<%@ Page Title="" Language="C#" MasterPageFile="~/studentMaster.Master" AutoEventWireup="true" CodeBehind="StudentApplications.aspx.cs" Inherits="Sprint1.StudentApplications" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%-- Section Header --%>
    <h4>View All your Internship, Job, and Other Opportunity Applications</h4>
    <br />
     <asp:Label ID="lblInternshipApplication" runat="server" Text="Your Internship Applications: "></asp:Label>
    <br />

      <%-- Internship view --%>
    <asp:GridView ID="grdInternshipApplication" runat="server" AutoGenerateColumns="False" DataSourceID="SqlStudentInternshipApps" >
        <Columns>
            <asp:BoundField DataField="ApplicationStatus" HeaderText="ApplicationStatus" SortExpression="ApplicationStatus" />
            <asp:BoundField DataField="InterviewStatus" HeaderText="InterviewStatus" SortExpression="InterviewStatus" />
            <asp:BoundField DataField="OfferStatus" HeaderText="OfferStatus" SortExpression="OfferStatus" />
            <asp:BoundField DataField="AcceptedStatus" HeaderText="AcceptedStatus" SortExpression="AcceptedStatus" />
        </Columns>
                
            </asp:GridView>
           <asp:SqlDataSource ID="SqlStudentInternshipApps" runat="server" ConnectionString="Data Source=localhost;Initial Catalog=SDB;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT [ApplicationStatus], [InterviewStatus], [OfferStatus], [AcceptedStatus] FROM [InternshipApplication] WHERE ([StudentID] = @StudentID)">
               <SelectParameters>
                   <asp:SessionParameter Name="StudentID" SessionField="StudentID" Type="Int32" />
               </SelectParameters>
    </asp:SqlDataSource>
           <br />
    <br />
</asp:Content>
