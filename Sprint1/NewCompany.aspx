<%@ Page Title="" Language="C#" MasterPageFile="~/adminMaster.Master" AutoEventWireup="true" CodeBehind="NewCompany.aspx.cs" Inherits="Sprint1.NewCompany" %>
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
    <h1>Add Company</h1>
    <hr />
    <div class="card">
        <asp:Label ID="lblCompanyName" runat="server" Text="Enter Company Name:"></asp:Label>
        <asp:TextBox ID="txtCompanyName" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtCompanyName" Text="Required Field" ForeColor="Red"></asp:RequiredFieldValidator>
        <asp:Label ID="lblCompanyAddress" runat="server" Text="Enter Company Address:"></asp:Label>
        <asp:TextBox ID="txtCompanyAddress" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtCompanyAddress" Text="Required Field" ForeColor="Red"></asp:RequiredFieldValidator>
        <asp:Label ID="lblCompanyPhone" runat="server" Text="Enter Company Phone: "></asp:Label>
        <asp:TextBox ID="txtCompanyPhone" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtCompanyPhone" Text="Required Field" ForeColor="Red"></asp:RequiredFieldValidator>
        <asp:Button ID="btnSave" runat="server" Text="Add Company" OnClick="btnSave_Click" />
        <br />
        <asp:Label ID="lblStatus" runat="server" Text=""></asp:Label>
    </div>
</asp:Content>
