<%@ Page Title="" Language="C#" MasterPageFile="~/adminMaster.Master" AutoEventWireup="true" CodeBehind="MentorshipAssignment.aspx.cs" Inherits="Sprint1.MentorshipAssignment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3>Mentorship Assignment:</h3>
    <div style="margin-left: auto; margin-right: auto; text-align: center;">
        <h3>Choose a student:</h3>
        <br />
        <asp:DropDownList ID="ddlStudent" runat="server"></asp:DropDownList>
        <br />
        <h3>Select mentor:</h3>
        <br />
        <asp:DropDownList ID="ddlMember" runat="server"></asp:DropDownList>
        <br />
        <br />
        <asp:Button ID="btnMentorshipAssign" runat="server" Text="Assign Mentor" OnClick="btnMentorshipAssign_Click"/>
        <br />
        <asp:Label ID="lblStatus" runat="server" Text=""></asp:Label>
        <br />
        <asp:Label ID="lblError" runat="server" Text=""></asp:Label>
    </div>
</asp:Content>
