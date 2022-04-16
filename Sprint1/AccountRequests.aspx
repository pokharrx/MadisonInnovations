<%@ Page Title="" Language="C#" MasterPageFile="~/adminMaster.Master" AutoEventWireup="true" CodeBehind="AccountRequests.aspx.cs" Inherits="Sprint1.AccountRequests" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>       
        .home:hover {
            background-color: #dacce6;
            border-top: 2px solid white;
            border-bottom: 2px solid white;
        }
        .chat:hover {
            background-color: #dacce6;
            border-top: 2px solid white;
            border-bottom: 2px solid white;
        }
        .add:hover {
            background-color: #dacce6;
            border-top: 2px solid white;
            border-bottom: 2px solid white;
        }
        .card {
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
            border-radius: 10px;
            padding: 16px;
            margin-bottom: 30px;
            text-align: left;
            background-color: #f4efe1;
            border: none;  
            width: 500px;
            display: inline-block;
            text-align: center;
        }
    </style>
    <h1>Authorize Accounts</h1>
    <hr />
    <div class="card">
        <h3>Review the following account requests.</h3>
        <br />
        <asp:DetailsView ID="dvUnauthorizedUsers"
            runat="server" 
            Height="50px" 
            Width="100%"
            AlternatingRowStyle-BackColor="#dacce6"
            DataSourceID="dtsUnauthorizedUsers"
            AutoGenerateRows="false"
            EmptyDataText="No Unauthorized Members"
            DataKeyNames="UserID"
            AllowPaging="true"
            AlternatingRowStyle-Width="100%">
            <RowStyle BackColor="White" />
            <Fields>
                <asp:BoundField DataField="FirstName" HeaderText="First Name" ReadOnly="true" />
                <asp:BoundField DataField="LastName" HeaderText="Last Name" ReadOnly="true" />
                <asp:BoundField DataField="Email" HeaderText="Email" ReadOnly="true" />
                <asp:BoundField DataField="PersonType" HeaderText="Account Type" ReadOnly="true" />
                <asp:BoundField DataField="Username" HeaderText="Username" ReadOnly="true" />
            </Fields>
        </asp:DetailsView>
        <br />
        <asp:Button Width="45%" CssClass="left" ID="btnAuthorizeAccount" runat="server" Text="Authorize Account" OnClick="btnAuthorizeAccount_Click" OnClientClick="return confirm('Are you sure you want to authorize this account?')"/>
        <asp:Button Width="45%" CssClass="right" ID="btnUnAuthorizeAccount" runat="server" Text="Decline Account" OnClick="btnUnAuthorizeAccount_Click" OnClientClick="return confirm('Are you sure you want to decline this account?')"/>
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
