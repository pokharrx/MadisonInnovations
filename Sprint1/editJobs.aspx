<%@ Page Title="" Language="C#" MasterPageFile="~/adminMaster.Master" AutoEventWireup="true" CodeBehind="editJobs.aspx.cs" Inherits="Sprint1.editJobs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="lblTitle" runat="server" Text="Job Title: "></asp:Label>
    <asp:TextBox ID="txtTitle" runat="server"></asp:TextBox>
    <br />
    <asp:Label ID="lblStart" runat="server" Text="Job Start Date: "></asp:Label>
    <asp:TextBox ID="txtStart" runat="server"></asp:TextBox>
    <br />
    <asp:Label ID="lblEnd" runat="server" Text="Job End Date: "></asp:Label>
    <asp:TextBox ID="txtEnd" runat="server"></asp:TextBox>
    <br />
    <asp:Label ID="lblIndustry" runat="server" Text="Job Industry: "></asp:Label>
    <asp:TextBox ID="txtIndustry" runat="server"></asp:TextBox>
    <br />
    <asp:Label ID="lblDescription" runat="server" Text="Job Description: "></asp:Label>
    <asp:TextBox ID="txtDescription" runat="server"></asp:TextBox>
    <br />
     <asp:Label ID="lblApp" runat="server" Text="Job Application: "></asp:Label>
    <asp:TextBox ID="txtApp" runat="server"></asp:TextBox>
    <br />
    <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" />
    <asp:Button ID="buttonDelete" runat="server" Text="Delete" OnClick="buttonDelete_Click" />
    <br />
    <asp:Label ID="lblStatus" runat="server" Text=""></asp:Label>

</asp:Content>
