<%@ Page Title="" Language="C#" MasterPageFile="~/adminMaster.Master" AutoEventWireup="true" CodeBehind="adminHome.aspx.cs" Inherits="Sprint1.adminHome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style type="text/css">
        h2 {
            font-weight: 600;
        }
        .gridview {
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
            padding: 16px;
            text-align: left;
            background-color: #f4efe1;
            border: none;
            width: 100%;
        }
        .home {
            background-color: #d0c8b5;
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
        .add:hover {
            background-color: #dacce6;
            border-top: 2px solid white;
            border-bottom: 2px solid white;
        }
        </style>
    <%-- Students --%>
    <div id="Students">
        <h2>Students</h2>
        <asp:TextBox ID="txtStudentSearch" runat="server"></asp:TextBox>
        <asp:Button ID="btnStudentSearch" runat="server" Text="Search" OnClick="btnStudentSearch_Click" />
        <asp:Button ID="btnAllStudents" runat="server" Text="View All" OnClick="btnAllStudents_Click"/>
        <asp:GridView
            ID="grdStudents"
            runat="server"
            HorizontalAlign="Justify"
            EmptyDataText="No Student Found"
            AllowSorting="false"
            AutoGenerateColumns="false"
            DataKeyNames="StudentID"
            AutoGenerateSelectButton="true"
            OnSelectedIndexChanged="grStudents_SelectedIndexChanged"
            CellPadding="10" 
            CssClass="gridview">    
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button ID="btnEditStudent" Text="Edit" OnClick="btnEditStudent_Click" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField HeaderText="First Name" DataField="FirstName" SortExpression="FirstName"/>
                <asp:BoundField HeaderText="Last Name" DataField="LastName" SortExpression="LastName"/>
                <asp:BoundField HeaderText="Email" DataField="EmailAddress" SortExpression="EmailAddress"/>
                <asp:BoundField HeaderText="Phone Number" DataField="PhoneNumber" SortExpression="PhoneNumber"/>
                <asp:BoundField HeaderText="Graduation Year" DataField="GradYear" SortExpression="GradYear"/>
                <asp:BoundField HeaderText="Major" DataField="Major" SortExpression="Major"/>
                <asp:BoundField HeaderText="Grade" DataField="Grade" SortExpression="Grade"/>
                 <asp:BoundField HeaderText="Industry of Interest" DataField="Industry" SortExpression="Industry"/>
                <asp:BoundField HeaderText="Employment Status" DataField="EmploymentStatus" SortExpression="EmploymentStatus"/>
            
            </Columns>
        </asp:GridView>
    </div>
    <br />
    <%-- Companies --%>
    <div id="Companies">
        <h2>Companies</h2>
        <asp:TextBox ID="txtCompanySearch" runat="server"></asp:TextBox>
        <asp:Button ID="btnCompanySearch" runat="server" Text="Search" OnClick="btnCompanySearch_Click" />
        <asp:Button ID="btnAllCompanies" runat="server" Text="View All" OnClick="btnAllCompanies_Click"/>
        <asp:GridView 
            ID="grdCompanies"
            runat="server" 
            HorizontalAlign="Justify"
            EmptyDataText="No Company Found"
            AllowSorting="false"
            AutoGenerateColumns="false"
            DataKeyNames="CompanyID"
            CellPadding="10"
            AutoGenerateSelectButton="true"
            OnSelectedIndexChanged="grCompanies_SelectedIndexChanged"
            CssClass="gridview">
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button ID="btnEditCompanies" Text="Edit" OnClick="btnEditCompanies_Click" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField HeaderText="Name" DataField="CompanyName" SortExpression="CompanyName"/>
                <asp:BoundField HeaderText="Address" DataField="CompanyAddress" SortExpression="CompanyAddress"/>
                <asp:BoundField HeaderText="Phone Number" DataField="CompanyPhone" SortExpression="CompanyPhone"/>
            </Columns>
        </asp:GridView>
    </div>
    <br />
    <%-- Jobs --%>
    <div id="Jobs">
        <h2>Jobs</h2>
        <asp:TextBox ID="txtJobSearch" runat="server"></asp:TextBox>
        <asp:Button ID="btnJobSearch" runat="server" Text="Search" OnClick="btnJobSearch_Click" />
        <asp:Button ID="btnAllJobs" runat="server" Text="View All" OnClick="btnAllJobs_Click"/>
        <asp:GridView 
            ID="grdJobs" 
            runat="server"
            HorizontalAlign="Justify"
            EmptyDataText="No Job Found"
            AllowSorting="false"
            AutoGenerateColumns="false"
            DataKeyNames="JobID"
            CellPadding="10"
            AutoGenerateSelectButton="true"
            OnSelectedIndexChanged="grJobs_SelectedIndexChanged"
            CssClass="gridview">
            <Columns>
                  <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button ID="btnEditJobs" Text="Edit" OnClick="btnEditJobs_Click" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField HeaderText="Title" DataField="JobTitle" SortExpression="JobTitle"/> 
                <asp:BoundField HeaderText="Start Date" DataField="DateStart" SortExpression="DateStart"/>
                <asp:BoundField HeaderText="End Date" DataField="DateEnd" SortExpression="DateEnd"/>
                 <asp:BoundField HeaderText="Industry" DataField="Industry" SortExpression="Industry"/>
                <asp:BoundField HeaderText="Description" DataField="Description" SortExpression="Description"/>
                <asp:BoundField HeaderText="Details" DataField="ApplicationLink" SortExpression="ApplicationLink"/>
            </Columns>
        </asp:GridView>
    </div>
    <br />
    <%-- Internships --%>
    <div id="Internships">
        <h2>Internships</h2>
        <asp:TextBox ID="txtInternshipSearch" runat="server"></asp:TextBox>
        <asp:Button ID="btnInternshipSearch" runat="server" Text="Search" OnClick="btnInternshipSearch_Click" />
        <asp:Button ID="btnAllInternships" runat="server" Text="View All" OnClick="btnAllInternships_Click"/>
        <asp:GridView 
            ID="grdInternships" 
            runat="server"
            HorizontalAlign="Justify"
            EmptyDataText="No Internship Found"
            AllowSorting="false"
            AutoGenerateColumns="false"
            DataKeyNames="InternshipID"
            CellPadding="10"
            AutoGenerateSelectButton="true"
            OnSelectedIndexChanged="grInternships_SelectedIndexChanged"
            CssClass="gridview">
            <Columns>
                  <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button ID="btnEditInternships" Text="Edit" OnClick="btnEditInternships_Click" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField HeaderText="Title" DataField="InternshipTitle" SortExpression="InternshipTitle"/>
                <asp:BoundField HeaderText="Start Date" DataField="DateStart" SortExpression="DateStart"/>
                <asp:BoundField HeaderText="End Date" DataField="DateEnd" SortExpression="DateEnd"/>
                <asp:BoundField HeaderText="Industry" DataField="Industry" SortExpression="Industry"/>
                <asp:BoundField HeaderText="Description" DataField="Description" SortExpression="Description"/>
                <asp:BoundField HeaderText="Details" DataField="ApplicationLink" SortExpression="ApplicationLink"/>
            </Columns>
        </asp:GridView>
    </div>
    <br />

     <%-- Other Opportunities --%>
    <div id="Other">
        <h2>Other Opportunities</h2>
        <asp:TextBox ID="txtOtherSearch" runat="server"></asp:TextBox>
        <asp:Button ID="btnOtherSearch" runat="server" Text="Search" OnClick="btnOtherSearch_Click" />
        <asp:Button ID="btnAllOther" runat="server" Text="View All" OnClick="btnAllOther_Click"/>
        <asp:GridView 
            ID="grdOther" 
            runat="server"
            HorizontalAlign="Justify"
            EmptyDataText="No Other Opportunities Found"
            AllowSorting="false"
            AutoGenerateColumns="false"
            DataKeyNames="OtherID"
            CellPadding="10"
            AutoGenerateSelectButton="true"
            OnSelectedIndexChanged="grdOther_SelectedIndexChanged"
            CssClass="gridview">
            <Columns>
                  <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button ID="btnEditOther" Text="Edit" OnClick="btnEditOther_Click" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField HeaderText="Title" DataField="OtherTitle" SortExpression="OtherTitle"/>
                <asp:BoundField HeaderText="Start Date" DataField="DateStart" SortExpression="DateStart"/>
                <asp:BoundField HeaderText="End Date" DataField="DateEnd" SortExpression="DateEnd"/>
                 <asp:BoundField HeaderText="Industry" DataField="Industry" SortExpression="Industry"/>
                <asp:BoundField HeaderText="Description" DataField="Description" SortExpression="Description"/>
                <asp:BoundField HeaderText="Details" DataField="ApplicationLink" SortExpression="ApplicationLink"/>
            </Columns>
        </asp:GridView>
    </div>
    <br />

    <%-- Scholarships --%>
    <div id="Scholarships">
        <h2>Scholarships</h2>
        <asp:TextBox ID="txtScholarshipSearch" runat="server"></asp:TextBox>
        <asp:Button ID="btnScholarshipSearch" runat="server" Text="Search" OnClick="btnScholarshipSearch_Click" />
        <asp:Button ID="txtAllScholarships" runat="server" Text="View All" OnClick="txtAllScholarships_Click"/>
        <asp:GridView 
            ID="grdScholarships" 
            runat="server"
            HorizontalAlign="Justify"
            EmptyDataText="No Scholarship Found"
            AllowSorting="false"
            AutoGenerateColumns="false"
            DataKeyNames="ScholarshipID"
            CellPadding="10"
            AutoGenerateSelectButton="true"
            OnSelectedIndexChanged="grScholarships_SelectedIndexChanged"
            CssClass="gridview">
            <Columns>
                  <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button ID="btnEditScholarships" Text="Edit" OnClick="btnEditScholarships_Click" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField HeaderText="Name" DataField="ScholarshipName" SortExpression="ScholarshipName"/>
                <asp:BoundField HeaderText="Year" DataField="ScholarshipYear" SortExpression="ScholarshipYear"/>
                <asp:BoundField HeaderText="Amount" DataField="ScholarshipAmount" SortExpression="ScholarshipAmount"/>
                <asp:BoundField HeaderText="Description" DataField="Description" SortExpression="Description"/>
                <asp:BoundField HeaderText="Status" DataField="Status" SortExpression="Status"/>
            </Columns>
        </asp:GridView>
        <br />       
    </div>
</asp:Content>
