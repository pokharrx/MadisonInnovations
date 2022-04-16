<%@ Page Title="" Language="C#" MasterPageFile="~/memberMaster.Master" AutoEventWireup="true" CodeBehind="memberAccountProfile.aspx.cs" Inherits="Sprint1.memberAccountProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .dashboard:hover {
            background-color: #dacce6;
            border-top: 2px solid white;
            border-bottom: 2px solid white;
        }
        .home:hover {
            background-color: #dacce6;
            border-top: 2px solid white;
            border-bottom: 2px solid white;
        }
        .chat:hover {
            background-color: #dacce6;
            border-top: 2px solid white;
            border-bottom: 2px solid white;
        }
        .right {
            float: right;
        }
        .Card {
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
            border-radius: 10px;
            padding: 16px;
            margin-bottom: 30px;
            text-align: left;
            background-color: #f4efe1;
            border: none;  
        }
        .gridview {
            border: none;
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
            border-radius: 15px;
        }
    </style>
        <%-- Members --%>
    <div id="memberInfo" class="Card">
        <asp:Button ID="btnEdit" runat="server" Text="Edit" CssClass="right" OnClick="btnEdit_Click" />
        <h2>My Account</h2>
        <asp:GridView
            ID="grdLoggedInMember"
            DataSourceID="SqlLoggedinMember"
            runat="server"
            HorizontalAlign="Justify"
            BackColor="White" 
            CssClass="gridview"
            EmptyDataText="No Member Selected"
            AutoGenerateColumns="false"
            DataKeyNames="MemberID"
            CellPadding="10">    
            <Columns>
                 <%-- Bind Data Fields --%>
                <asp:CommandField ShowEditButton="false" />
                <asp:BoundField Visible="false"  DataField="MemberID" HeaderText="MemberID" InsertVisible="False" ReadOnly="True" SortExpression="MemberID" />
                <asp:BoundField HeaderText="First Name" DataField="FirstName" SortExpression="FirstName"/>
                <asp:BoundField HeaderText="Last Name" DataField="LastName" SortExpression="LastName"/>
                <asp:BoundField HeaderText="Email" DataField="EmailAddress" SortExpression="EmailAddress"/>
                <asp:BoundField HeaderText="Phone Number" DataField="PhoneNumber" SortExpression="PhoneNumber"/>
                <asp:BoundField HeaderText="Title" DataField="Title" SortExpression="Title"/>
                <asp:BoundField Visible="false" HeaderText="Member Username" DataField="MemberUserName" SortExpression="MemberUserName"/>
                <asp:BoundField HeaderText="Account Type" DataField="AccountType" SortExpression="AccountType"/>
            </Columns>
        </asp:GridView>
    </div>
        <div id="edit" runat="server" visible="false">
                <%--FirstName --%>
            <asp:Label ID="lblMemberFirstName" runat="server" Text="Enter Your First Name"></asp:Label>
            <asp:TextBox ID="txtMemberFirstName" runat="server"></asp:TextBox>

            <br />

            <%--LastName--%>
            <asp:Label ID="lblMemberLastName" runat="server" Text="Enter Your Last Name"></asp:Label>
            <asp:TextBox ID="txtMemberLastName" runat="server"></asp:TextBox>
 
            <br />

            <%--Email--%>
            <asp:Label ID="lblMemberEmail" runat="server" Text="Enter Your Email"></asp:Label>
            <asp:TextBox ID="txtMemberEmail" runat="server"></asp:TextBox>
 
            <br />

            <%--PhoneNumber --%>
            <asp:Label ID="lblMemberPhoneNumber" runat="server" Text="Enter Your Phone Number (Without Country Code)"></asp:Label>
            <asp:TextBox ID="txtMemberPhoneNumber" runat="server"></asp:TextBox>
   
            <br />

                <%--GraduationYear--%>
            <asp:Label ID="lblMemberTitle" runat="server" Text="Enter Your Expected Graduation Year"></asp:Label>
            <asp:TextBox ID="txtMemberTitle" runat="server"></asp:TextBox>
                <br />
                <br />
            <asp:Button ID="btnPopulate" runat="server" Text="Populate" OnClick="btnPopulate_Click" />
            <asp:Button ID="btnUpdate" runat="server" Text="Update" Onclick="btnUpdate_Click" />
        </div>

    <div>
         <asp:SqlDataSource 
            ID="SqlLoggedinMember" 
            runat="server" 
            ConnectionString="<%$ ConnectionStrings:SDB %>" 
            SelectCommand="SELECT [MemberID], [FirstName], [LastName], [EmailAddress], [PhoneNumber], [Title], [AccountType] FROM [Member] WHERE ([MemberUserName] = @MemberUserName)" 
            UpdateCommand="UPDATE Member SET FirstName =@FirstName , LastName =@LastName , EmailAddress =@EmailAddress , 
            PhoneNumber =@PhoneNumber , Title =@Title WHERE ([MemberUserName] = @MemberUserName)">
        <SelectParameters>
            <asp:SessionParameter Name="MemberUserName" SessionField="MemberUserName" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="FirstName" />
            <asp:Parameter Name="LastName" />
            <asp:Parameter Name="EmailAddress" />
            <asp:Parameter Name="PhoneNumber" />
            <asp:Parameter Name="Title" />
        </UpdateParameters>
        </asp:SqlDataSource> 
    </div>
</asp:Content>
