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
        .icon {
            height: 120px;
            width: 120px;
            background-color: #f1ece0;
            border-radius: 20px;
            padding: 15px;
        }
        .icon:hover {
            background-color: #e9e1ef;
        }
        h3 {
            font-weight: bold;
            font-size: 25px;
        }
        .container {
            text-align: center;
        }
    </style> 
    <div class="container">      
        <asp:ImageButton 
            ID="addJjob" 
            runat="server" 
            ImageUrl="images/job.png" 
            CssClass="icon" 
            OnClick="addJjob_Click" 
            ToolTip="Add Job" />
        <h3>Add Job</h3>
    </div>
    <div class="container">       
        <asp:ImageButton 
            ID="addInternship" 
            runat="server" 
            ImageUrl="images/internship.png" 
            CssClass="icon" 
            OnClick="addInternship_Click" 
            ToolTip="Add Internship" />
        <h3>Add Internship</h3>
    </div>
    <div class="container">
        <asp:ImageButton 
            ID="addCompany" 
            runat="server" 
            ImageUrl="images/company.png" 
            CssClass="icon" 
            OnClick="addCompany_Click" 
            ToolTip="Add Company" />
        <h3>Add Company</h3>
    </div>
    <div class="container">
        <asp:ImageButton 
            ID="addSponsor" 
            runat="server" 
            ImageUrl="images/sponsor.png" 
            CssClass="icon" 
            OnClick="addSponsor_Click" 
            ToolTip="Add Corporate Sponsor" />
        <h3>Add Sponsor</h3>
    </div>
    <div class="container">
        <asp:ImageButton 
            ID="addOther" 
            runat="server" 
            ImageUrl="images/opportunity.png" 
            CssClass="icon" 
            OnClick="addOther_Click" 
            ToolTip="Add Other Opportunity" />
        <h3>Add Opportunity</h3>
    </div>
    <div class="container">
        <asp:ImageButton 
            ID="addAnnouncement" 
            runat="server" 
            ImageUrl="images/announcement.png" 
            CssClass="icon" 
            OnClick="addAnnouncement_Click" 
            ToolTip="Add Announcement" />
        <h3>Add Announcement</h3>
    </div>
</asp:Content>
