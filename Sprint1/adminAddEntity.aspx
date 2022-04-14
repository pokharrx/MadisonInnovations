<%@ Page Title="" Language="C#" MasterPageFile="~/adminMaster.Master" AutoEventWireup="true" CodeBehind="adminAddEntity.aspx.cs" Inherits="Sprint1.adminAddEntity" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .add {
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
        .home:hover {
            background-color: #dacce6;
            border-top: 2px solid white;
            border-bottom: 2px solid white;
        }
        a {
            color: black;         
            text-decoration: none;
        }
    </style>
    <asp:ImageButton 
        ID="addJjob" 
        runat="server" 
        ImageUrl="images/job.png" 
        CssClass="home" 
        OnClick="addJjob_Click" 
        ToolTip="Add Job" />
    <asp:ImageButton 
        ID="addInternship" 
        runat="server" 
        ImageUrl="images/internship.png" 
        CssClass="home" 
        OnClick="addInternship_Click" 
        ToolTip="Add Internship" />
    <asp:ImageButton 
        ID="addCompany" 
        runat="server" 
        ImageUrl="images/company.png" 
        CssClass="home" 
        OnClick="addCompany_Click" 
        ToolTip="Add Company" />
    <asp:ImageButton 
        ID="addSponsor" 
        runat="server" 
        ImageUrl="images/sponsor.png" 
        CssClass="home" 
        OnClick="addSponsor_Click" 
        ToolTip="Add Corporate Sponsor" />
    <asp:ImageButton 
        ID="addOther" 
        runat="server" 
        ImageUrl="images/opportunity.png" 
        CssClass="home" 
        OnClick="addOther_Click" 
        ToolTip="Add Other Opportunity" />
    <asp:ImageButton 
        ID="addAnnouncement" 
        runat="server" 
        ImageUrl="images/announcement.png" 
        CssClass="home" 
        OnClick="addAnnouncement_Click" 
        ToolTip="Add Announcement" />    
</asp:Content>
