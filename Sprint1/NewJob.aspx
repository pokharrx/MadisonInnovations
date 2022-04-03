<%@ Page Title="" Language="C#" MasterPageFile="~/adminMaster.Master" AutoEventWireup="true" CodeBehind="NewJob.aspx.cs" Inherits="Sprint1.NewJob" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
    <asp:Label ID="lblJobTitle" runat="server" Text="Enter Job Title:"></asp:Label>
    <asp:TextBox ID="txtJobTitle" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtJobTitle" Text="Required Field" ForeColor="Red"></asp:RequiredFieldValidator>
    <br />
    <asp:Label ID="lblJobStart" runat="server" Text="Enter Job Application Start Date:"></asp:Label>
    <asp:TextBox ID="txtJobStart" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtJobStart" Text="Required Field" ForeColor="Red"></asp:RequiredFieldValidator>
    <br />
    <asp:Label ID="lblJobEnd" runat="server" Text="Enter Job Application End Date:"></asp:Label>
    <asp:TextBox ID="txtJobEnd" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtJobEnd" Text="Required Field" ForeColor="Red"></asp:RequiredFieldValidator>
    <br />
    <asp:Label ID="lblJobDescription" runat="server" Text="Enter Job Description: "></asp:Label>
    <asp:TextBox ID="txtJobDescription" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtJobDescription" Text="Required Field" ForeColor="Red"></asp:RequiredFieldValidator>
    <br />
    <asp:Label ID="lblApplicationLink" runat="server" Text="Enter Job Application Link: "></asp:Label>
    <asp:TextBox ID="txtApplicationLink" runat="server"></asp:TextBox>
    <br />
    <asp:Button ID="btnSave" runat="server" Text="Save Job" OnClick="btnSave_Click" />
    <br />
    <asp:Label ID="lblStatus" runat="server" Text=""></asp:Label>
    </div>
</asp:Content>
