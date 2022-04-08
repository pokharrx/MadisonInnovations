<%@ Page Title="" Language="C#" MasterPageFile="~/memberMaster.Master" AutoEventWireup="true" CodeBehind="memberMessaging.aspx.cs" Inherits="Sprint1.memberMessaging" MaintainScrollPositionOnPostback="true" %>
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
    </style>
    <div id="page">
        <div id="nav">
            <a href="memberInbox.aspx">Inbox</a>           
            <a href="memberOutbox.aspx">Sent</a>
        </div>
        <br />
        <div id="send">
            <h2>Send Message</h2>
            <hr/>
            <asp:Label ID="lblSelectRecipient" runat="server" Text="To: (Recipient Username)"></asp:Label>
            <asp:TextBox ID="txtRecipientSearch" runat="server" Width="25%"></asp:TextBox>
            <asp:DropDownList ID="ddlRecipientType" runat="server">
                <asp:ListItem Value="Nothing">Choose Recipient Type</asp:ListItem>
                <asp:ListItem Value="Member">Member</asp:ListItem>
                <asp:ListItem Value="Student">Student</asp:ListItem>
            </asp:DropDownList>
            <asp:Button ID="btnRecipientSearch" runat="server" Text="Search" OnClick="btnRecipientSearch_Click" />
            <asp:Label ID="lblMissingTypeAlert" runat="server" Text="Please Choose Recipient Type" Visible="false" ForeColor="Red"></asp:Label>
            <br />
            <asp:GridView 
                ID="grdMembers" 
                runat="server" 
                AlternatingRowStyle-BackColor="#d0c8b5" 
                EmptyDataText="No User Found" 
                AutoGenerateColumns="false"
                DataKeyNames="MemberID"
                AutoGenerateSelectButton="true" 
                OnSelectedIndexChanged="grdMembers_SelectedIndexChanged" 
                CellPadding="10" 
                Visible="false" 
                CssClass="margin-top"
                BorderColor="White"
                HeaderStyle-HorizontalAlign="Left"
                Width="75%" 
                HeaderStyle-Font-Size="Large" 
                HeaderStyle-BackColor="#bcaac1">
                <Columns>
                    <asp:BoundField HeaderText="Username" DataField="MemberUserName" />
                    <asp:BoundField HeaderText="First Name" DataField="FirstName" />
                    <asp:BoundField HeaderText="Last Name" DataField="LastName" />
                </Columns>
            </asp:GridView>
            <asp:GridView 
                ID="grdStudents" 
                runat="server" 
                AlternatingRowStyle-BackColor="#d0c8b5" 
                EmptyDataText="No User Found"
                AutoGenerateColumns="false"
                DataKeyNames="StudentID"
                AutoGenerateSelectButton="true" 
                OnSelectedIndexChanged="grdStudents_SelectedIndexChanged" 
                CellPadding="10" 
                Visible="false" 
                CssClass="margin-top"
                BorderColor="White"
                HeaderStyle-HorizontalAlign="Left"
                Width="75%" 
                HeaderStyle-Font-Size="Large" 
                HeaderStyle-BackColor="#bcaac1">
                <Columns>
                    <asp:BoundField HeaderText="Username" DataField="StudentUserName" />
                    <asp:BoundField HeaderText="First Name" DataField="FirstName" SortExpression="FirstName"/>
                    <asp:BoundField HeaderText="Last Name" DataField="LastName" SortExpression="LastName"/>       
                </Columns>
            </asp:GridView>
            <br />
            <asp:Label ID="lblSubject" runat="server" Text="Subject:"></asp:Label>           
            <asp:TextBox ID="txtSubject" runat="server" Width="75%"></asp:TextBox>
            <br /><br />
            <asp:TextBox ID="txtSendMessage" runat="server" TextMode="MultiLine" Rows="10" Columns="150"></asp:TextBox>
            <br />
            <asp:Button ID="btnSendMessage" runat="server" Text="Send" OnClick="btnSendMessage_Click"/>
            <asp:Label ID="lblMessageStatus" runat="server" Text="" ForeColor="Red"></asp:Label>
        </div>      
    </div>
</asp:Content>
