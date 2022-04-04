<%@ Page Title="" Language="C#" MasterPageFile="~/adminMaster.Master" AutoEventWireup="true" CodeBehind="EditInternship.aspx.cs" Inherits="Sprint1.EditInternship" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <asp:Label ID="lblTitle" runat="server" Text="Internship Title: "></asp:Label>
    <asp:TextBox ID="txtTitle" runat="server"></asp:TextBox>
    <br />
    <asp:Label ID="lblStart" runat="server" Text="Internship Start Date: "></asp:Label>
    <asp:TextBox ID="txtStart" runat="server"></asp:TextBox>
    <br />
    <asp:Label ID="lblEnd" runat="server" Text="Internship End Date: "></asp:Label>
    <asp:TextBox ID="txtEnd" runat="server"></asp:TextBox>
    <br />
    <asp:Label ID="lblIndustry" runat="server" Text="Internship Industry: "></asp:Label>
    <asp:TextBox ID="txtIndustry" runat="server"></asp:TextBox>
    <br />
    <asp:Label ID="lblDescription" runat="server" Text="Internship Description: "></asp:Label>
    <asp:TextBox ID="txtDescription" runat="server"></asp:TextBox>
    <br />
    <asp:Label ID="lblApp" runat="server" Text="Internship Application: "></asp:Label>
    <asp:TextBox ID="txtApp" runat="server"></asp:TextBox>
    <br />
    <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" />
    <asp:Button ID="btnDelete" runat="server" Text="Delete" OnClick="btnDelete_Click" />
    <br />
    <asp:Label ID="lblStatus" runat="server" Text=""></asp:Label>
</asp:Content>
