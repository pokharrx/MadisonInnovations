<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="messagePortal.aspx.cs" Inherits="Sprint1.messagePortal" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        .margin-top {
            margin-top: 1%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="send">
            <h2>Send Message</h2>
            <asp:Label ID="lblSelectRecipient" runat="server" Text="To:"></asp:Label>
            <asp:TextBox ID="txtRecipientSearch" runat="server" Width="25%"></asp:TextBox>
            <asp:DropDownList 
                ID="ddlRecipientType" 
                runat="server">
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
                AlternatingRowStyle-BackColor="PowderBlue" 
                EmptyDataText="No User Found" 
                AllowSorting="false"
                AutoGenerateColumns="false"
                DataKeyNames="MemberID"
                AutoGenerateSelectButton="true" 
                OnSelectedIndexChanged="grdMembers_SelectedIndexChanged" 
                CellPadding="10" 
                Visible="false" 
                CssClass="margin-top">
                <Columns>
                    <asp:BoundField HeaderText="Username" DataField="MemberUserName" />
                    <asp:BoundField HeaderText="First Name" DataField="FirstName" />
                    <asp:BoundField HeaderText="Last Name" DataField="LastName" />     
                </Columns>
            </asp:GridView>
            <asp:GridView 
                ID="grdStudents" 
                runat="server" 
                AlternatingRowStyle-BackColor="PowderBlue" 
                EmptyDataText="No User Found" 
                AllowSorting="false"
                AutoGenerateColumns="false"
                DataKeyNames="StudentID"
                AutoGenerateSelectButton="true" 
                OnSelectedIndexChanged="grdStudents_SelectedIndexChanged" 
                CellPadding="10" 
                Visible="false" 
                CssClass="margin-top">
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
            <asp:TextBox ID="txtSendMessage" runat="server" TextMode="MultiLine" Rows="10" Width="80%"></asp:TextBox>
            <br />
            <asp:Button ID="btnSendMessage" runat="server" Text="Send" OnClick="btnSendMessage_Click"/>
            <asp:Label ID="lblMessageStatus" runat="server" Text=""></asp:Label>
        </div>
        <div id="inbox">
            <h2>Inbox</h2>
            <asp:GridView 
                ID="grdInbox" 
                runat="server"
                AlternatingRowStyle-BackColor="PowderBlue" 
                EmptyDataText="No Messages Found" 
                DataKeyNames="SenderUsername">
            </asp:GridView>
        </div>
        <div id="sent">
            <h2>Sent Messages</h2>
            <asp:GridView 
                ID="grdSent" 
                runat="server"
                AlternatingRowStyle-BackColor="PowderBlue" 
                EmptyDataText="No Messages Found" 
                DataKeyNames="ReceiverUsername">
            </asp:GridView>
        </div>
    </form>
</body>
</html>
