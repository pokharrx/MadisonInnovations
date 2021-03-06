<%@ Page Title="" Language="C#" MasterPageFile="~/adminMaster.Master" AutoEventWireup="true" CodeBehind="NewInternship.aspx.cs" Inherits="Sprint1.NewInternship" %>
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
    <h1>Add Internship</h1>
    <hr />
    <div class="card">
        <asp:Label ID="lblInternshipTitle" runat="server" Text="Enter Internship Title:"></asp:Label>
        <asp:TextBox ID="txtInternshipTitle" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtInternshipTitle" Text="Required Field" ForeColor="Red"></asp:RequiredFieldValidator>
        <asp:Label ID="lblDateStart" runat="server" Text="Enter Internship Start Date:"></asp:Label>
        <asp:TextBox ID="txtDateStart" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtDateStart" Text="Required Field" ForeColor="Red"></asp:RequiredFieldValidator>
        <asp:Label ID="lblDateEnd" runat="server" Text="Enter Internship End Date:"></asp:Label>
        <asp:TextBox ID="txtDateEnd" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtDateEnd" Text="Required Field" ForeColor="Red"></asp:RequiredFieldValidator>
        <asp:Label ID="lblIndustry" runat="server" Text="Enter Internship Industry: "></asp:Label>
        <asp:TextBox ID="txtIndustry" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="lblInternshipDescription" runat="server" Text="Enter Internship Description: "></asp:Label>
        <asp:TextBox ID="txtInternshipDescription" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtInternshipDescription" Text="Required Field" ForeColor="Red"></asp:RequiredFieldValidator>
        <asp:Label ID="lblApplicationLink" runat="server" Text="Enter Link For Application: "></asp:Label>
        <asp:TextBox ID="txtApplicationLink" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtApplicationLink" Text="Required Field" ForeColor="Red"></asp:RequiredFieldValidator>
        <asp:Button ID="btnSave" runat="server" Text="Add Internship" OnClick="btnSave_Click" />
        <br />
        <asp:Label ID="lblStatus" runat="server" Text=""></asp:Label>
    </div>
</asp:Content>
