<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateAccount.aspx.cs" Inherits="Sprint1.CreateAccount" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <%--TITLE--%>
            <h3>Create Account:</h3>
            <%--TABLE FORMAT--%>
        <table class="auto-style1">
            <tr>
                <td class="auto-style2">Firstname:</td>
                <td>
                    <%--FIRST NAME TB--%>
                    <asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <%--LAST NAME TB--%>
                <td class="auto-style3">LastName:</td>
                <td class="auto-style4">
                    <asp:TextBox ID="txtLastName" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Email:</td>
                <td>
                    <%--EMAIL TB--%>
                    <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Username:</td>
                <td>
                    <%--USERNAME TB--%>
                    <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Password:</td>
                <td>
                    <%--PASSWORD TB--%>
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Student or Member:</td>
                <td>
                    <%--PERSON TYPE TB--%>
                    <asp:DropDownList ID="ddlPersonType" runat="server">
                        <asp:ListItem>Student</asp:ListItem>
                        <asp:ListItem>Member</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
        </table>
            <%--CREATE USER BUTTON--%>
        <asp:Button ID="btnCreateUser" runat="server" Text="Create Account" OnClick="btnCreateUser_Click"/>
        <br />
            <%--CREATE ANOTHER USER BUTTON--%>
        <asp:LinkButton ID="lnkAnother" runat="server" OnClick="lnkAnother_Click" Visible="False">Create Another Account</asp:LinkButton>
        <br />
            <%--STATUS LABEL--%>
        <asp:Label ID="lblStatus" runat="server" Text=""></asp:Label>
        </div>
    </form>
</body>
</html>
