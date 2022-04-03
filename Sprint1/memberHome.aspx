<%@ Page Title="" Language="C#" MasterPageFile="~/memberMaster.Master" AutoEventWireup="true" CodeBehind="memberHome.aspx.cs" Inherits="Sprint1.memberHome" MaintainScrollPositionOnPostback="true" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="lbl1" runat="server" Text="Announcements"></asp:Label>
    <asp:BulletedList ID="blAnnouncements" runat="server" BorderWidth="2" BackColor="#cc33ff" Width="500" ForeColor="Black" BorderColor="Gold"></asp:BulletedList>
</asp:Content>
