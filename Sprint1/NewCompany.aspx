<%@ Page Title="" Language="C#" MasterPageFile="~/memberMaster.Master" AutoEventWireup="true" CodeBehind="NewCompany.aspx.cs" Inherits="Sprint1.NewCompany" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div>
    <asp:Label ID="lblCompanyName" runat="server" Text="Enter Company Name:"></asp:Label>
    <asp:TextBox ID="txtCompanyName" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtCompanyName" Text="Required Field" ForeColor="Red"></asp:RequiredFieldValidator>
    <br />
    <asp:Label ID="lblCompanyAddress" runat="server" Text="Enter Company Address:"></asp:Label>
    <asp:TextBox ID="txtCompanyAddress" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtCompanyAddress" Text="Required Field" ForeColor="Red"></asp:RequiredFieldValidator>
    <br />
    <asp:Label ID="lblCompanyPhone" runat="server" Text="Enter Company Phone: "></asp:Label>
    <asp:TextBox ID="txtCompanyPhone" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtCompanyPhone" Text="Required Field" ForeColor="Red"></asp:RequiredFieldValidator>
    <br />
    <asp:Button ID="btnSave" runat="server" Text="Save Company" OnClick="btnSave_Click" />
    <br />
    <asp:Label ID="lblStatus" runat="server" Text=""></asp:Label>
    </div>
</asp:Content>
