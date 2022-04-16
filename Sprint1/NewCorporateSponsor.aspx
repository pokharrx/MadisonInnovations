<%@ Page Title="" Language="C#" MasterPageFile="~/adminMaster.Master" AutoEventWireup="true" CodeBehind="NewCorporateSponsor.aspx.cs" Inherits="Sprint1.NewCorporateSponsor" %>
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
    <h1>Add Corporate Sponsor</h1>
    <hr />
    <div class="card">
        <asp:Label ID="ContactName" runat="server" Text="Enter Contact Name:"></asp:Label>
        <asp:TextBox ID="txtContactName" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtContactName" Text="Required Field" ForeColor="Red"></asp:RequiredFieldValidator>
        <asp:Label ID="lblContactPhone" runat="server" Text="Enter Contact Phone:"></asp:Label>
        <asp:TextBox ID="txtContactPhone" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtContactPhone" Text="Required Field" ForeColor="Red"></asp:RequiredFieldValidator>
        <asp:Label ID="lblContactEmail" runat="server" Text="Enter Contact Email:"></asp:Label>
        <asp:TextBox ID="txtContactEmail" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtContactEmail" Text="Required Field" ForeColor="Red"></asp:RequiredFieldValidator>
        <asp:Label ID="lblContactRole" runat="server" Text="Enter Contact Role: "></asp:Label>
        <asp:TextBox ID="txtContactRole" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtContactRole" Text="Required Field" ForeColor="Red"></asp:RequiredFieldValidator>
        <asp:Button ID="btnSave" runat="server" Text="Add Contact" OnClick="btnSave_Click" />
        <br />
        <asp:Label ID="lblStatus" runat="server" Text=""></asp:Label>
    </div>
</asp:Content>
