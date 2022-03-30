﻿<%@ Page Title="" Language="C#" MasterPageFile="~/memberMaster.Master" AutoEventWireup="true" CodeBehind="memberAccountProfile.aspx.cs" Inherits="Sprint1.memberAccountProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <%-- Members --%>
    <div id="memberInfo">
        <h2>Members</h2>
        <asp:GridView
            ID="grdLoggedInMember"
            DataSourceID="SqlLoggedinMember"
            runat="server"
            HorizontalAlign="Justify"
            AlternatingRowStyle-BackColor="PowderBlue"
            AllowSorting="true"
            EmptyDataText="No Member Selected"
            AutoGenerateColumns="false"
            DataKeyNames="MemberID"
            CellPadding="10">    
            <Columns>
                 <%-- Bind Data Fields --%>
                <asp:CommandField ShowEditButton="True" />
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

    <div>
         <asp:SqlDataSource 
            ID="SqlLoggedinMember" 
            runat="server" 
            ConnectionString="<%$ ConnectionStrings:SDB %>" 
            SelectCommand="SELECT [MemberID], [FirstName], [LastName], [EmailAddress], [PhoneNumber], [Title], [MemberUserName], [AccountType] FROM [Member] WHERE ([MemberID] = @MemberID)" 
            UpdateCommand="UPDATE Member SET FirstName =@FirstName , LastName =@LastName , EmailAddress =@EmailAddress , 
            PhoneNumber =@PhoneNumber , Title =@Title , MemberUserName =@MemberUserName ,  AccountType =@AccountType WHERE ([MemberID] = @MemberID)">
        <SelectParameters>
            <asp:SessionParameter Name="MemberID" SessionField="MemberID" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="FirstName" />
            <asp:Parameter Name="LastName" />
            <asp:Parameter Name="EmailAddress" />
            <asp:Parameter Name="PhoneNumber" />
            <asp:Parameter Name="Title" />
            <asp:Parameter Name="MemberUserName" />
            <asp:Parameter Name="AccountType" />
        </UpdateParameters>
        </asp:SqlDataSource> 
    </div>
</asp:Content>