<%@ Page Title="" Language="C#" MasterPageFile="~/adminMaster.Master" AutoEventWireup="true" CodeBehind="editStudent.aspx.cs" Inherits="Sprint1.editStudent" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:TextBox ID="txtFirst" runat="server"></asp:TextBox>
    <br />
    <asp:TextBox ID="txtLast" runat="server"></asp:TextBox>
    <br />
    <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
    <br />
    <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox>
    <br />
    <asp:TextBox ID="txtGrad" runat="server"></asp:TextBox>
    <br />
    <asp:TextBox ID="txtMajor" runat="server"></asp:TextBox>
    <br />
    <asp:TextBox ID="txtGrade" runat="server"></asp:TextBox>
    <br />
    <asp:TextBox ID="txtEmp" runat="server"></asp:TextBox>
    <br />
    <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" />
    <asp:Button ID="btnDelete" runat="server" Text="Delete" OnClick="btnDelete_Click"/>
    <br />
    <asp:Label ID="lblStatus" runat="server" Text=""></asp:Label>
</asp:Content>

