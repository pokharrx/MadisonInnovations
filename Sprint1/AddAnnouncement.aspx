<%@ Page Title="" Language="C#" MasterPageFile="~/adminMaster.Master" AutoEventWireup="true" CodeBehind="AddAnnouncement.aspx.cs" Inherits="Sprint1.AddAnnouncement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .add {
            background-color: #d0c8b5;
            border-top: 2px solid white;
            border-bottom: 2px solid white;
        }
        .home:hover {
            background-color: #dacce6;
            border-top: 2px solid white;
            border-bottom: 2px solid white;
        }
        .dashboard:hover {
            background-color: #dacce6;
            border-top: 2px solid white;
            border-bottom: 2px solid white;
        }
        .chat:hover {
            background-color: #dacce6;
            border-top: 2px solid white;
            border-bottom: 2px solid white;
        }        
    </style>s
    <asp:Label runat="server" Text="Enter Announcement Here"></asp:Label>
    <asp:TextBox ID="txtAnnounce" runat="server"></asp:TextBox>
    <asp:Label ID="lblStatus1" runat="server" Text=""></asp:Label>
    <br />
    <asp:Button ID="Button1" runat="server" Text="Add" OnClick="Button1_Click" />
    <br />
    <br />
    <asp:DropDownList ID="ddlAnnouncements"  runat="server"  DataSourceID="sqlAnnouncements" DataTextField="Announcement" DataValueField="notifID"></asp:DropDownList>
    <asp:Label ID="lblStatus2" runat="server" Text=""></asp:Label>
    <br />
    <asp:Button ID="Button2" runat="server" Text="Remove" OnClick="Button2_Click" />

    <asp:SqlDataSource ID="sqlAnnouncements" runat="server" ConnectionString="<%$ ConnectionStrings:SDB%>"
       SelectCommand ="SELECT notifID, Announcement from Notifications"></asp:SqlDataSource>
</asp:Content>
