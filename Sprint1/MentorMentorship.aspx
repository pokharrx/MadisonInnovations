<%@ Page Title="" Language="C#" MasterPageFile="~/memberMaster.Master" AutoEventWireup="true" CodeBehind="MentorMentorship.aspx.cs" Inherits="Sprint1.MentorMentorship" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
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
        .chat:hover {
            background-color: #dacce6;
            border-top: 2px solid white;
            border-bottom: 2px solid white;
        }
    </style>
    <asp:Label ID="lblHeader" runat="server" Text="Become a Mentor Application" Font-Bold="True"></asp:Label>
    <br />
    <asp:Label ID="lblPName" runat="server" Text="Enter your preferred name:"></asp:Label>
    <br />
    <asp:TextBox ID="txtPName" runat="server"></asp:TextBox>
    <br />
    <asp:Label ID="lblMentees" runat="server" Text="Enter maximum number of mentees possible:"></asp:Label>
    <br />
    <asp:TextBox ID="txtMentees" runat="server"></asp:TextBox>
    <br />
    <asp:Label ID="lblInfo" runat="server" Text="Describe what you are looking for from your mentor:"></asp:Label>
    <br />
    <asp:TextBox ID="txtReason" runat="server" Height="129px" Width="496px" TextMode="MultiLine"></asp:TextBox>
    <br />
    <asp:Button ID="btn" runat="server" Text="Submit Application" OnClick="btn_Click" />
    <br />
    <asp:Label ID="lblStatus" runat="server" Text=""></asp:Label>
</asp:Content>
