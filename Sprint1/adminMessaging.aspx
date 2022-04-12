<%@ Page Title="" Language="C#" MasterPageFile="~/adminMaster.Master" AutoEventWireup="true" CodeBehind="adminMessaging.aspx.cs" Inherits="Sprint1.adminMessaging" MaintainScrollPositionOnPostback="true" %>
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
        .chat {
            background-color: #d0c8b5;             
            border-top: 2px solid white;
            border-bottom: 2px solid white;
        }
        .dashboard:hover {
            background-color: #dacce6;
            border-top: 2px solid white;
            border-bottom: 2px solid white;
        }
        .home:hover {
            background-color: #dacce6;
            border-top: 2px solid white;
            border-bottom: 2px solid white;
        }
        .margin-top {
            margin-top: 5px;
        }
    </style>
    <div id="page">
        <div id="nav">
            <a href="adminInbox.aspx">Inbox</a>           
            <a href="adminOutbox.aspx">Sent</a>
        </div>
        <br />
        <div id="send">
            <h2>Send Message</h2>
            <hr/>
            <asp:Label ID="lblSelectRecipient" runat="server" Text="To: "></asp:Label>
            <asp:TextBox ID="txtRecipientSearch" runat="server" Width="32%"></asp:TextBox>           
            <asp:Button ID="btnRecipientSearch" runat="server" Text="Search" OnClick="btnRecipientSearch_Click" />
            <br />
            <asp:GridView 
                ID="grdPersons" 
                runat="server" 
                AlternatingRowStyle-BackColor="#d0c8b5" 
                EmptyDataText="No User Found" 
                AutoGenerateColumns="false"
                DataKeyNames="PersonMessageID"
                AutoGenerateSelectButton="true" 
                OnSelectedIndexChanged="grdPersons_SelectedIndexChanged" 
                CellPadding="10" 
                Visible="false" 
                CssClass="margin-top"
                BorderColor="White"
                HeaderStyle-HorizontalAlign="Left"
                Width="40%" 
                HeaderStyle-Font-Size="Large" 
                HeaderStyle-BackColor="#bcaac1">
                <Columns>
                    <asp:BoundField HeaderText="Username" DataField="UserName" />
                    <asp:BoundField HeaderText="First Name" DataField="FirstName" />
                    <asp:BoundField HeaderText="Last Name" DataField="LastName" />
                </Columns>
            </asp:GridView>           
            <asp:ListBox ID="lstboxRecipients" runat="server" Height="75px" Width="40%" CssClass="margin-top"></asp:ListBox>
            <br />
            <asp:Button ID="btnRemoveRecipient" runat="server" Text="Remove Recipient" OnClick="btnRemoveRecipient_Click"/>
            <br /><br />
            <asp:Label ID="lblSubject" runat="server" Text="Subject:"></asp:Label>           
            <asp:TextBox ID="txtSubject" runat="server" Width="75%"></asp:TextBox>
            <br /><br />
            <asp:Label ID="lblMessage" runat="server" Text="Message:"></asp:Label>
            <br />
            <asp:TextBox ID="txtSendMessage" runat="server" TextMode="MultiLine" Rows="10" Columns="150"></asp:TextBox>
            <br />
            <asp:Button ID="btnSendMessage" runat="server" Text="Send" OnClick="btnSendMessage_Click"/>
            <asp:Label ID="lblMessageStatus" runat="server" Text="" ForeColor="Red"></asp:Label>
        </div>      
    </div>
</asp:Content>
