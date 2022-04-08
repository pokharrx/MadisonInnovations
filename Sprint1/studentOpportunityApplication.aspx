<%@ Page Title="" Language="C#" MasterPageFile="~/studentMaster.Master" AutoEventWireup="true" CodeBehind="studentOpportunityApplication.aspx.cs" Inherits="Sprint1.studentOpportunityApplication" %>
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
    </style>
 <%-- Section Header --%>
    <h4>Apply to Internships, Jobs, and Other Opportunities </h4>
    <br />


     <%-- Job apply --%>
    <asp:Label ID="lblJobApplication" runat="server" Text="Choose a Job Application:"></asp:Label>
    <br />
    <asp:DropDownList ID="drplstJob" runat="server" AutoPostBack="true"
       DataSourceID="datasrcJobNames"
       DataTextField="JobName" DataValueField="JobID" OnSelectedIndexChanged="drplstJob_SelectedIndexChanged"   ></asp:DropDownList>
    <br />
    <asp:Button ID="btnApplyforJob" runat="server" Text="Apply" OnClick="btnApplyforJob_Click" />
    <br />
    <br />



    <%-- Internship apply --%>
    <asp:Label ID="lblInternshipApplication" runat="server" Text="Choose an Internship Application: "></asp:Label>
    <br />
   <asp:DropDownList ID="drplstInternship" runat="server"  AutoPostBack="true"
     DataSourceID="datasrcInternshipNames"
     DataTextField="InternshipName" DataValueField="InternshipID" OnSelectedIndexChanged="drplstInternship_SelectedIndexChanged"></asp:DropDownList>
    <br />
    <asp:Button ID="btnApplyforInternship" runat="server" Text="Apply" OnClick="btnApplyforInternship_Click" />
    <br />
    <br />


    <%-- Other Opportunities  apply --%>
    <asp:Label ID="lblOtherApplication" runat="server" Text="Choose an Other Opportunity Application:"></asp:Label>
    <br />
    <asp:DropDownList ID="drplstOther" runat="server" AutoPostBack="true"
       DataSourceID="datasrcOtherNames"
       DataTextField="OtherName" DataValueField="OtherID" OnSelectedIndexChanged="drplstOther_SelectedIndexChanged"   ></asp:DropDownList>
    <br />
    <asp:Button ID="btnApplyforOther" runat="server" Text="Apply" OnClick="btnApplyforOther_Click" />
    <br />

        <%-- Connection Strings --%>
     <asp:SqlDataSource
            ID="datasrcJobNames"
            runat="server"
            ConnectionString="<%$ ConnectionStrings:SDB %>"
            SelectCommand="SELECT JobTitle
            AS JobName, JobID FROM DBO.Job"></asp:SqlDataSource>

    <asp:SqlDataSource
            ID="datasrcInternshipNames"
            runat="server"
            ConnectionString="<%$ ConnectionStrings:SDB %>"
            SelectCommand="SELECT InternshipTitle
            AS InternshipName, InternshipID FROM DBO.Internship"></asp:SqlDataSource>

    <asp:SqlDataSource
            ID="datasrcOtherNames"
            runat="server"
            ConnectionString="<%$ ConnectionStrings:SDB %>"
            SelectCommand="SELECT OtherTitle
            AS OtherName, OtherID FROM DBO.Other"></asp:SqlDataSource>

         
</asp:Content>
