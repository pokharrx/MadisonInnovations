<%@ Page Title="" Language="C#" MasterPageFile="~/studentMaster.Master" AutoEventWireup="true" CodeBehind="StudentAnnouncements.aspx.cs" Inherits="Sprint1.StudentAnnouncements" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="lbl1" runat="server" Text="Announcements"></asp:Label>
    <asp:BulletedList ID="blAnnouncements" runat="server"></asp:BulletedList>
</asp:Content>
