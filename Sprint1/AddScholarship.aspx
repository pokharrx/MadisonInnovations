<%@ Page Title="" Language="C#" MasterPageFile="~/adminMaster.Master" AutoEventWireup="true" CodeBehind="AddScholarship.aspx.cs" Inherits="Sprint1.AddScholarship" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
    <asp:Label ID="lblScholarshipName" runat="server" Text="Enter Scholarship Name:"></asp:Label>
    <asp:TextBox ID="txtScholarshipName" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtScholarshipName" Text="Required Field" ForeColor="Red"></asp:RequiredFieldValidator>
    <br />
    <asp:Label ID="lblScholarshipYear" runat="server" Text="Enter Scholarship Year:"></asp:Label>
    <asp:TextBox ID="txtScholarshipYear" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtScholarshipYear" Text="Required Field" ForeColor="Red"></asp:RequiredFieldValidator>
    <br />
    <asp:Label ID="lblScholarshipAmount" runat="server" Text="Enter Scholarship Amount:"></asp:Label>
    <asp:TextBox ID="txtScholarshipAmount" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtScholarshipAmount" Text="Required Field" ForeColor="Red"></asp:RequiredFieldValidator>
    
    <br />
    <asp:Label ID="lblScholarshipDescription" runat="server" Text="Enter Scholarship Description: "></asp:Label>
    <asp:TextBox ID="txtScholarshipDescription" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtScholarshipDescription" Text="Required Field" ForeColor="Red"></asp:RequiredFieldValidator>
    <br />
    <asp:Label ID="lblScholarshipStatus" runat="server" Text="Enter Scholarship Status: "></asp:Label>
    <asp:TextBox ID="txtScholarshipStatus" runat="server"></asp:TextBox>
    <br />
    <asp:Button ID="btnSave" runat="server" Text="Save Scholarship" OnClick="btnSave_Click" />
    <br />
    <asp:Label ID="lblStatus" runat="server" Text=""></asp:Label>
    </div>

</asp:Content>
