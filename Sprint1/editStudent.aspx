<%@ Page Title="" Language="C#" MasterPageFile="~/adminMaster.Master" AutoEventWireup="true" CodeBehind="editStudent.aspx.cs" Inherits="Sprint1.editStudent" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <asp:Label ID="lblFirstName" runat="server" Text="Student First Name: "></asp:Label>
    <asp:TextBox ID="txtFirst" runat="server"></asp:TextBox>
    <br />
    <asp:Label ID="lblLastName" runat="server" Text="Student Last Name: "></asp:Label>
    <asp:TextBox ID="txtLast" runat="server"></asp:TextBox>
    <br />
     <asp:Label ID="lblEmail" runat="server" Text="Student Email: "></asp:Label>
    <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
    <br />
     <asp:Label ID="lblPhone" runat="server" Text="Student Phone Number: "></asp:Label>
    <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox>
    <br />
     <asp:Label ID="lblGrad" runat="server" Text="Student Graduation Year: "></asp:Label>
    <asp:TextBox ID="txtGrad" runat="server"></asp:TextBox>
    <br />
     <asp:Label ID="lblMajor" runat="server" Text="Student Major: "></asp:Label>
    <asp:TextBox ID="txtMajor" runat="server"></asp:TextBox>
    <br />
     <asp:Label ID="lblGrade" runat="server" Text="Student Grade: "></asp:Label>
    <asp:TextBox ID="txtGrade" runat="server"></asp:TextBox>
    <br />
    <asp:Label ID="lblIndustry" runat="server" Text="Industry of Interst: "></asp:Label>
    <asp:TextBox ID="txtIndustry" runat="server"></asp:TextBox>
    <br />
    <asp:Label ID="lblEmp" runat="server" Text="Student Employment Status: "></asp:Label>
    <asp:TextBox ID="txtEmp" runat="server"></asp:TextBox>
    <br />
    <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" />
    <asp:Button ID="btnDelete" runat="server" Text="Delete" OnClick="btnDelete_Click"/>
    <br />
    <asp:Label ID="lblStatus" runat="server" Text=""></asp:Label>
</asp:Content>

