<%@ Page Title="" Language="C#" MasterPageFile="~/adminMaster.Master" AutoEventWireup="true" CodeBehind="EditScholarships.aspx.cs" Inherits="Sprint1.EditScholarships" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
    <br />
    <asp:TextBox ID="txtYear" runat="server"></asp:TextBox>
    <br />
    <asp:TextBox ID="txtAmount" runat="server"></asp:TextBox>
    <br />
    <asp:TextBox ID="txtDescription" runat="server"></asp:TextBox>
    <br />
    <asp:TextBox ID="txtStatus" runat="server"></asp:TextBox>
    <br />
    <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" />
    <br />
    <asp:Label ID="lblStatus" runat="server" Text=""></asp:Label>
</asp:Content>
