<%@ Page Title="" Language="C#" MasterPageFile="~/adminMaster.Master" AutoEventWireup="true" CodeBehind="NewJob.aspx.cs" Inherits="Sprint1.NewJob" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .add {
            background-color: #d0c8b5;
            border-top: 2px solid white;
            border-bottom: 2px solid white;
        }
        .home:hover {
            background-color: #dacce6;
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
        .card {
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
            border-radius: 10px;
            padding: 16px;
            margin-bottom: 30px;
            text-align: left;
            background-color: #f4efe1;
            border: none;  
            width: 350px;
        }
    </style>
    <h1>Add Job</h1>
    <hr />
    <div class="card">
        <asp:Label ID="lblJobTitle" runat="server" Text="Enter Job Title:"></asp:Label>
        <asp:TextBox ID="txtJobTitle" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtJobTitle" Text="Required Field" ForeColor="Red"></asp:RequiredFieldValidator>
        <asp:Label ID="lblJobStart" runat="server" Text="Enter Job Application Start Date:"></asp:Label>
        <asp:TextBox ID="txtJobStart" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtJobStart" Text="Required Field" ForeColor="Red"></asp:RequiredFieldValidator>
        <asp:Label ID="lblJobEnd" runat="server" Text="Enter Job Application End Date:"></asp:Label>
        <asp:TextBox ID="txtJobEnd" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtJobEnd" Text="Required Field" ForeColor="Red"></asp:RequiredFieldValidator>
        <asp:Label ID="lblIndustry" runat="server" Text="Enter Job Industry: "></asp:Label>
        <asp:TextBox ID="txtIndustry" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="lblJobDescription" runat="server" Text="Enter Job Description: "></asp:Label>
        <asp:TextBox ID="txtJobDescription" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtJobDescription" Text="Required Field" ForeColor="Red"></asp:RequiredFieldValidator>
        <asp:Label ID="lblApplicationLink" runat="server" Text="Enter Job Application Link: "></asp:Label>
        <asp:TextBox ID="txtApplicationLink" runat="server"></asp:TextBox>
        <br />
        <asp:Button ID="btnSave" runat="server" Text="Add Job" OnClick="btnSave_Click" />
        <br />
        <asp:Label ID="lblStatus" runat="server" Text=""></asp:Label>
    </div>
</asp:Content>
