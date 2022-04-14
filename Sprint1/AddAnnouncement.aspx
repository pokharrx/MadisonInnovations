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
        #new, #remove {
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
            border-radius: 10px;
            padding: 16px;
            margin-bottom: 30px;
            text-align: left;
            background-color: #f4efe1;
            border: none;        
        }
    </style>
    <div id="new">
        <h2>New Announcement</h2>
        <asp:Label runat="server" Text="Enter Announcement Here"></asp:Label>
        <br />
        <asp:TextBox ID="txtAnnounce" runat="server" TextMode="MultiLine" Rows="5" Columns="50"></asp:TextBox>
        <br />        
        <asp:Button ID="Button1" runat="server" Text="Add" OnClick="Button1_Click" />
        <asp:Label ID="lblStatus1" runat="server" Text=""></asp:Label>
    </div>
    <div id="remove">
        <h2>Remove Announcement</h2>
        <asp:Label runat="server" Text="Select Announcement to Remove"></asp:Label>
        <asp:DropDownList ID="ddlAnnouncements"  runat="server"  DataSourceID="sqlAnnouncements" DataTextField="Announcement" DataValueField="notifID"></asp:DropDownList>
        <br />
        <asp:Button ID="Button2" runat="server" Text="Remove" OnClick="Button2_Click" />
    </div>
    <asp:SqlDataSource ID="sqlAnnouncements" runat="server" ConnectionString="<%$ ConnectionStrings:SDB%>"
       SelectCommand ="SELECT notifID, Announcement from Notifications"></asp:SqlDataSource>
</asp:Content>
