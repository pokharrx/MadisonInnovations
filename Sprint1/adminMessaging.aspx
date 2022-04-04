<%@ Page Title="" Language="C#" MasterPageFile="~/adminMaster.Master" AutoEventWireup="true" CodeBehind="adminMessaging.aspx.cs" Inherits="Sprint1.adminMessaging" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="send">
            <h2>Send Message</h2>
            <hr />
            <asp:Label ID="lblSelectRecipient" runat="server" Text="To: (Recipient Username)"></asp:Label>
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
            <asp:TextBox ID="txtSendMessage" runat="server" TextMode="MultiLine" Rows="10" Width="80%"></asp:TextBox>
            <br />
            <asp:Button ID="btnSendMessage" runat="server" Text="Send" OnClick="btnSendMessage_Click"/>
            <asp:Label ID="lblMessageStatus" runat="server" Text="" ForeColor="Red"></asp:Label>
        </div>
        <div id="inbox">
            <h2>Inbox</h2>
            <hr />
            <asp:GridView 
                ID="grdInbox" 
                runat="server"
                AlternatingRowStyle-BackColor="#d0c8b5" 
                EmptyDataText="No Messages Found" 
                DataKeyNames="SenderUsername"
                AutoGenerateColumns="false"
                BorderColor="White" 
                CellPadding="20" 
                HeaderStyle-HorizontalAlign="Left"
                Width="90%" 
                HeaderStyle-Font-Size="X-Large" 
                HeaderStyle-BackColor="#bcaac1"
                AllowPaging="true"
                OnPageIndexChanging="grdInbox_PageIndexChanging" 
                PageSize="5" 
                PagerStyle-Font-Size="Large">
                <Columns>
                    <asp:BoundField ItemStyle-Width="10%" HeaderText="Sender" DataField="SenderUsername" SortExpression="SenderUsername"/>
                    <asp:BoundField ItemStyle-Width="30%" ItemStyle-CssClass="text-wrap" HeaderText="Subject" DataField="Subject"/>
                    <asp:BoundField ItemStyle-Width="60%" ItemStyle-CssClass="text-wrap" HeaderText="Message" DataField="Message"/>       
                </Columns>
            </asp:GridView>
        </div>
        <div id="sent">
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
                Width="90%" 
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
        </div>
</asp:Content>
