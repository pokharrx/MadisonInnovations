<%@ Page Title="" Language="C#" MasterPageFile="~/memberMaster.Master" AutoEventWireup="true" CodeBehind="AddCorporateSponsor.aspx.cs" Inherits="Sprint1.AddCorporateSponsor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div>
    <asp:Label ID="ContactName" runat="server" Text="Enter Contact Name:"></asp:Label>
    <asp:TextBox ID="txtContactName" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtContactName" Text="Required Field" ForeColor="Red"></asp:RequiredFieldValidator>
    <br />
    <asp:Label ID="lblContactPhone" runat="server" Text="Enter Contact Phone:"></asp:Label>
    <asp:TextBox ID="txtContactPhone" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtContactPhone" Text="Required Field" ForeColor="Red"></asp:RequiredFieldValidator>
    <br />
    <asp:Label ID="lblContactEmail" runat="server" Text="Enter Contact Email:"></asp:Label>
    <asp:TextBox ID="txtContactEmail" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtContactEmail" Text="Required Field" ForeColor="Red"></asp:RequiredFieldValidator>
    <br />
    <asp:Label ID="lblContactRole" runat="server" Text="Enter Contact Role: "></asp:Label>
    <asp:TextBox ID="txtContactRole" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtContactRole" Text="Required Field" ForeColor="Red"></asp:RequiredFieldValidator>
    <br />
    <asp:Button ID="btnSave" runat="server" Text="Save Company" OnClick="btnSave_Click" />
    <br />
    <asp:Label ID="lblStatus" runat="server" Text=""></asp:Label>
    </div>
</asp:Content>
