<%@ Page Title="" Language="C#" MasterPageFile="~/adminMaster.Master" AutoEventWireup="true" CodeBehind="AdminPrivileges.aspx.cs" Inherits="Sprint1.AdminPrivileges" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="lblWelcome" runat="server" Text="Select a member to upgrade to an admin:"></asp:Label>
    <asp:Label ID="lblStatus" runat="server" Text="You are not an admin, access denied." Visible="false"></asp:Label>
    <br />
    <asp:DropDownList ID="ddlMembersUpgrade" runat="server"></asp:DropDownList>
    <br />
    <asp:Button ID="btnUpgrade" runat="server" Text="Promote" OnClick="btnUpgrade_Click"/>
    <br />
    <asp:Label ID="lblDowngrade" runat="server" Text="Select an admin to downgrade to a member:"></asp:Label>
    <br />
    <asp:DropDownList ID="ddlAdmins" runat="server"></asp:DropDownList>
    <br />
    <asp:Button ID="btnDowngrade" runat="server" Text="Demote" OnClick="btnDowngrade_Click"/>


</asp:Content>
