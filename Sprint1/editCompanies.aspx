<%@ Page Title="" Language="C#" MasterPageFile="~/memberMaster.Master" AutoEventWireup="true" CodeBehind="editCompanies.aspx.cs" Inherits="Sprint1.editCompanies" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
    <br />
    <asp:TextBox ID="txtAddress" runat="server"></asp:TextBox>
    <br />
    <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox>
    <br />
    <br />
    <asp:Button ID="btnUpdate" runat="server" Text="Update" />
    <asp:Label ID="lblStatus" runat="server" Text=""></asp:Label>
</asp:Content>
