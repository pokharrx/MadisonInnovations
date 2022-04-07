﻿<%@ Page Title="" Language="C#" MasterPageFile="~/adminMaster.Master" AutoEventWireup="true" CodeBehind="adminOutbox.aspx.cs" Inherits="Sprint1.adminOutbox" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<style>
        #nav {
            display: flex;
            float: right;
        }
        #nav a {
            text-decoration: none;
            font-size: large;
            font-weight: bold;
            color: #f4efe1;
            background-color: #3c3265;
            padding: 10px;
            margin: 15px;
            border-radius: 10px;
        }
        #nav a:hover {
            background-color: #f4efe1;
            color: #3c3265;
        }
    </style>
    <div id="nav">
        <a href="adminMessaging.aspx">Back</a>
    </div>
    <br />
    <h2>Sent Messages</h2>
    <hr />
    <asp:GridView 
        ID="grdSent" 
        runat="server"
        AlternatingRowStyle-BackColor="#d0c8b5" 
        EmptyDataText="No Messages Found" 
        DataKeyNames="ReceiverUsername"
        AutoGenerateColumns="false" 
        BorderColor="White" 
        CellPadding="20" 
        HeaderStyle-HorizontalAlign="Left"
        Width="100%" 
        HeaderStyle-Font-Size="X-Large" 
        HeaderStyle-BackColor="#bcaac1"
        AllowPaging="true"
        OnPageIndexChanging="grdSent_PageIndexChanging" 
        PageSize="5"
        PagerStyle-Font-Size="Large">
        <Columns>
            <asp:BoundField ItemStyle-Width="10%" HeaderText="Recipient" DataField="ReceiverUsername"/>
            <asp:BoundField ItemStyle-Width="30%" ItemStyle-CssClass="text-wrap" HeaderText="Subject" DataField="Subject"/>
            <asp:BoundField ItemStyle-Width="60%" ItemStyle-CssClass="text-wrap" HeaderText="Message" DataField="Message"/>       
        </Columns>
    </asp:GridView>
</asp:Content>
