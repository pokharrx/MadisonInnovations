<%@ Page Title="" Language="C#" MasterPageFile="~/studentMaster.Master" AutoEventWireup="true" CodeBehind="InternshipApplication.aspx.cs" Inherits="Sprint1.InternshipApplication" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    InternshipApplication

    <asp:Label ID="lblOpportunityTitle" runat="server" Text=""></asp:Label>
    <br />
    <asp:Label ID="lblApplicationLink" runat="server" Text="Application Link: "></asp:Label>
    <asp:HyperLink ID="hlApplicationLink" runat="server" NavigateUrl="https://home.kpmg/th/en/home/careers/experienced-professionals/advisory/sr-systems-analyst-fs-consulting.html" >Click Here</asp:HyperLink>
    <br />

    <asp:Label ID="lblApplicationStatus" runat="server" Text="Check off the box if you finished the application: "></asp:Label>
    <asp:CheckBox ID="chbxApplicationStatus" runat="server" />
    <br />

    <asp:Label ID="lblInterviewStatus" runat="server" Text="Check off the box if you have recieved an interview: "></asp:Label>
    <asp:CheckBox ID="chbxInterviewStatus" runat="server" />
    <br />

    <asp:Label ID="lblOfferStatus" runat="server" Text="Check off the box if you have recieved an offer: "></asp:Label>
    <asp:CheckBox ID="chbxOfferStatus" runat="server" />
    <br />

    <asp:Label ID="lblAcceptanceStatus" runat="server" Text="Check off the box if you have recieved an interview: "></asp:Label>
    <asp:CheckBox ID="chbxAcceptanceStatus" runat="server" />
    <br />

<%--    <asp:Label ID="lblApplicationNotes" runat="server" Text="Enter any Notes for your Internship Application: "></asp:Label>
    <asp:TextBox ID="txtApplicationText" runat="server"></asp:TextBox>
    <br />--%>

    <asp:Button ID="btnSubmit" runat="server" Text="Submit Application" OnClick="btnSubmit_Click"/>

    <asp:Label ID="lblStatus" runat="server" Text=""></asp:Label>
        <br />
    <br />
    <asp:HyperLink ID="InternshipAppsHL" runat="server" NavigateUrl="studentOpportunityApplication.aspx">Return to the Applications Page</asp:HyperLink>
    <br />
</asp:Content>
