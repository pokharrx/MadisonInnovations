<%@ Page Title="" Language="C#" MasterPageFile="~/adminMaster.Master" AutoEventWireup="true" CodeBehind="MentorshipAssignment.aspx.cs" Inherits="Sprint1.MentorshipAssignment" %>
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
    </style>
    <h3>Mentorship Assignment:</h3>
    <div style="margin-left: auto; margin-right: auto; ">
        <h3>Choose a student:</h3>
        <br />
        <asp:DropDownList ID="ddlStudent" runat="server" OnSelectedIndexChanged="ddlStudent_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
        <asp:Label ID="lblInfo" runat="server" Text="" ></asp:Label>
        <br />
        <h3>Select mentor:</h3>
        <br />
        <asp:DropDownList ID="ddlMember" runat="server" OnSelectedIndexChanged="ddlMember_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
        <br />
        <asp:Label ID="Label2" runat="server" Text="Current Mentees"></asp:Label>
        <asp:Label ID="lblCurrent" runat="server" Text=""></asp:Label>
        <br />
        <asp:Label ID="Label1" runat="server" Text="Max Mentees:"></asp:Label>
        <asp:Label ID="lblMax" runat="server" Text=""></asp:Label>
        <br />
        <br />
        <asp:Button ID="btnMentorshipAssign" runat="server" Text="Assign Mentor" OnClick="btnMentorshipAssign_Click"/>
        <br />
        <asp:Label ID="lblStatus" runat="server" Text=""></asp:Label>
        <br />
        <asp:Label ID="lblError" runat="server" Text=""></asp:Label>
    </div>
</asp:Content>
