<%@ Page Title="" Language="C#" MasterPageFile="~/adminMaster.Master" AutoEventWireup="true" CodeBehind="EditInternship.aspx.cs" Inherits="Sprint1.EditInternship" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <asp:TextBox ID="txtTitle" runat="server"></asp:TextBox>
    <br />
    <asp:TextBox ID="txtStart" runat="server"></asp:TextBox>
    <br />
    <asp:TextBox ID="txtEnd" runat="server"></asp:TextBox>
    <br />
    <asp:TextBox ID="txtDescription" runat="server"></asp:TextBox>
    <br />
    <asp:TextBox ID="txtApp" runat="server"></asp:TextBox>
    <br />
    <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" />
    <asp:Button ID="btnDelete" runat="server" Text="Delete" OnClick="btnDelete_Click" />
    <br />
    <asp:Label ID="lblStatus" runat="server" Text=""></asp:Label>
</asp:Content>
