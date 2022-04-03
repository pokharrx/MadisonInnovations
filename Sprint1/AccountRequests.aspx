﻿<%@ Page Title="" Language="C#" MasterPageFile="~/adminMaster.Master" AutoEventWireup="true" CodeBehind="AccountRequests.aspx.cs" Inherits="Sprint1.AccountRequests" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <h3>Review the following account requests.</h3>
        <br />
        <asp:DetailsView ID="dvUnauthorizedUsers"
            runat="server" 
            Height="50px" 
            Width="125px"
            DataSourceID="dtsUnauthorizedUsers"
            AutoGenerateRows="false"
            EmptyDataText="No Unauthorized Members"
            DataKeyNames="UserID"
            AllowPaging="true"
            AlternatingRowStyle-Width="100%">
            <HeaderStyle BackColor="Navy" ForeColor="White" />
            <RowStyle BackColor="White" />
            <AlternatingRowStyle BackColor="PowderBlue" />
            <Fields>
                <asp:BoundField DataField="FirstName" HeaderText="First Name" ReadOnly="true" />
                <asp:BoundField DataField="LastName" HeaderText="Last Name" ReadOnly="true" />
                <asp:BoundField DataField="Email" HeaderText="Email" ReadOnly="true" />
                <asp:BoundField DataField="PersonType" HeaderText="Account Type" ReadOnly="true" />
                <asp:BoundField DataField="Username" HeaderText="Username" ReadOnly="true" />
            </Fields>
        </asp:DetailsView>
        <br />
        <asp:Button ID="btnAuthorizeAccount" runat="server" Text="Authorize Account" OnClick="btnAuthorizeAccount_Click" OnClientClick="return confirm('Are you sure you want to authorize this account?')"/>
        <asp:Button ID="btnUnAuthorizeAccount" runat="server" Text="Decline Account" OnClick="btnUnAuthorizeAccount_Click" OnClientClick="return confirm('Are you sure you want to decline this account?')"/>
        <br />
        <br />
        <asp:Label ID="lblStatus" runat="server" Text=""></asp:Label>
    </div>
    <br />
    <asp:Label ID="lblVerification" Visible="false" runat="server" Text="Are you sure you want to decline this user?"></asp:Label>
    <br />

    <asp:SqlDataSource ID="dtsUnauthorizedUsers"
        runat="server"
        ConnectionString="<%$ ConnectionStrings:AUTH %>"
        SelectCommand="SELECT p.UserID, p.FirstName, p.LastName, p.Email, p.PersonType, p.Username FROM Person p
            JOIN Pass pa ON p.UserID=pa.UserID
            WHERE pa.Activation='Inactive'">
    </asp:SqlDataSource>
</asp:Content>
