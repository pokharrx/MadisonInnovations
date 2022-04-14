<%@ Page Title="" Language="C#" MasterPageFile="~/adminMaster.Master" AutoEventWireup="true" CodeBehind="NewOther.aspx.cs" Inherits="Sprint1.NewOther" %>
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
    </style>
 <div>
    <asp:Label ID="lblOtherTitle" runat="server" Text="Enter Other Opportunity Title:"></asp:Label>
    <asp:TextBox ID="txtOtherTitle" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtOtherTitle" Text="Required Field" ForeColor="Red"></asp:RequiredFieldValidator>
    <br />
    <asp:Label ID="lblOtherStart" runat="server" Text="Enter Other Opportunity Application Start Date:"></asp:Label>
    <asp:TextBox ID="txtOtherStart" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtOtherStart" Text="Required Field" ForeColor="Red"></asp:RequiredFieldValidator>
    <br />
    <asp:Label ID="lblOtherEnd" runat="server" Text="Enter Other Opportunity Application End Date:"></asp:Label>
    <asp:TextBox ID="txtOtherEnd" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtOtherEnd" Text="Required Field" ForeColor="Red"></asp:RequiredFieldValidator>
    <br />
    <asp:Label ID="lblIndustry" runat="server" Text="Enter Other Opportunity Industry: "></asp:Label>
    <asp:TextBox ID="txtIndustry" runat="server"></asp:TextBox>
    <br />
    <asp:Label ID="lblOtherDescription" runat="server" Text="Enter Other Opportunity Description: "></asp:Label>
    <asp:TextBox ID="txtOtherDescription" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtOtherDescription" Text="Required Field" ForeColor="Red"></asp:RequiredFieldValidator>
    <br />
    <asp:Label ID="lblApplicationLink" runat="server" Text="Enter Other Opportunity Application Link: "></asp:Label>
    <asp:TextBox ID="txtApplicationLink" runat="server"></asp:TextBox>
    <br />
    <asp:Button ID="btnSave" runat="server" Text="Save Other Opportunity" OnClick="btnSave_Click" />
    <br />
    <asp:Label ID="lblStatus" runat="server" Text=""></asp:Label>
    </div>
</asp:Content>

