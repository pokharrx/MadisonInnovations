<%@ Page Title="" Language="C#" MasterPageFile="~/memberMaster.Master" AutoEventWireup="true" CodeBehind="memberHome.aspx.cs" Inherits="Sprint1.memberHome" MaintainScrollPositionOnPostback="true" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style type="text/css">
        h2 {
            font-weight: 600;
        }
        .gridview {
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
            padding: 16px;
            text-align: left;
            background-color: #f4efe1;
            border: none;           
        }
        .home {
            background-color: #d0c8b5;
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
        #news {
            padding: 5%;
            margin-left: 100px;
            background-color: white;
            float: right;
            margin-top: 2%;
            margin-bottom: 5%;
            width: 300px;
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
            border-radius: 15px;
        }
        </style>
        <div id="news">
            <h2>Announcements</h2>
            <asp:BulletedList ID="blAnnouncements" runat="server"></asp:BulletedList>
            <asp:Calendar ID="Calendar1" runat="server">
                <TitleStyle BackColor="#dacce6" ForeColor="#7f729a" Font-Bold="true"></TitleStyle>
                <OtherMonthDayStyle ForeColor="LightGray"></OtherMonthDayStyle>
                <DayStyle BackColor="white"></DayStyle>
                <SelectedDayStyle BackColor="#7f729a" Font-Bold="True"></SelectedDayStyle>
                <TodayDayStyle BackColor="#f4efe1" Font-Bold="True" />
            </asp:Calendar>
        </div>
    <asp:GridView ID="grV" runat="server" Width="250%" AutoGenerateColumns="false" >
    <Columns>
        <asp:BoundField HeaderText="First Name" DataField="FirstName" />
        <asp:BoundField HeaderText="Last Name" DataField="LastName" />
        <asp:BoundField HeaderText="Email" DataField="EmailAddress" />

    </Columns>
    </asp:GridView>
</asp:Content>
