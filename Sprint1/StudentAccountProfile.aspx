<%@ Page Title="" Language="C#" MasterPageFile="~/studentMaster.Master" AutoEventWireup="true" CodeBehind="StudentAccountProfile.aspx.cs" Inherits="Sprint1.StudentAccountProfile" %>
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
    <%-- Students --%>
    <div id="Students">
        <div class="Card">       
        <asp:Button ID="btnEdit" runat="server" Text="Edit" CssClass="right" OnClick="btnEdit_Click" />
        <h2>My Account</h2>
        <asp:GridView
            ID="grdvLoggedInStudent"
            DataSourceID="SqlLoggedinStudent"
            runat="server"
            HorizontalAlign="Justify" 
            BackColor="White" 
            CssClass="gridview"
            AutoGenerateColumns="false"
            DataKeyNames="StudentID"
            CellPadding="10">    
            <Columns>
                 <%-- Bind Data Fields --%>
                <asp:CommandField ShowEditButton="false" />
                <asp:BoundField Visible="false"  DataField="StudentID" HeaderText="StudentID" InsertVisible="False" ReadOnly="True" SortExpression="StudentID" />
                <asp:BoundField HeaderText="First Name" DataField="FirstName" SortExpression="FirstName"/>
                <asp:BoundField HeaderText="Last Name" DataField="LastName" SortExpression="LastName"/>
                <asp:BoundField HeaderText="Email" DataField="EmailAddress" SortExpression="EmailAddress"/>
                <asp:BoundField HeaderText="Phone Number" DataField="PhoneNumber" SortExpression="PhoneNumber"/>
                <asp:BoundField HeaderText="Graduation Year" DataField="GradYear" SortExpression="GradYear"/>
                <asp:BoundField HeaderText="Major" DataField="Major" SortExpression="Major"/>
                <asp:BoundField HeaderText="Grade" DataField="Grade" SortExpression="Grade"/>
                <asp:BoundField HeaderText="Employment Status" DataField="EmploymentStatus" SortExpression="EmploymentStatus"/>
            </Columns>
        </asp:GridView>
        </div>
    </div>
    <div id="edit" runat="server" visible="false">
        <h4>Edit Your Student Information</h4>
        <br />
      <%--FirstName --%>
        <asp:Label ID="lblStudentFirstName" runat="server" Text="Enter Your First Name"></asp:Label>
        <asp:TextBox ID="txtStudentFirstName" runat="server"></asp:TextBox>

        <br />

        <%--LastName--%>
        <asp:Label ID="lblStudentLastName" runat="server" Text="Enter Your Last Name"></asp:Label>
        <asp:TextBox ID="txtStudentLastName" runat="server"></asp:TextBox>
 
        <br />

        <%--Email--%>
        <asp:Label ID="lblStudentEmail" runat="server" Text="Enter Your Email"></asp:Label>
        <asp:TextBox ID="txtStudentEmail" runat="server"></asp:TextBox>
 
        <br />

        <%--PhoneNumber --%>
        <asp:Label ID="lblStudentPhoneNumber" runat="server" Text="Enter Your Phone Number (Without Country Code)"></asp:Label>
        <asp:TextBox ID="txtStudentPhoneNumber" runat="server"></asp:TextBox>
   
        <br />

            <%--GraduationYear--%>
        <asp:Label ID="lblExpectedGraduation" runat="server" Text="Enter Your Expected Graduation Year"></asp:Label>
        <asp:TextBox ID="txtExpectedGraduation" runat="server"></asp:TextBox>
  
        <br />
             <%--Major--%>
        <asp:Label ID="lblMajor" runat="server" Text="Enter Your Major"></asp:Label>
             <asp:TextBox ID="txtMajor" runat="server"></asp:TextBox>

        <br />

             <%--UniversityYear --%>
        <asp:Label ID="lblGrade" runat="server" Text="Enter Your University Year"></asp:Label>
        <asp:TextBox ID="txtGrade" runat="server"></asp:TextBox>

        <br />

        <%--Employment Status --%>
        <asp:Label ID="lblEmploymentStatus" runat="server" Text="Enter Your EmploymentStatus"></asp:Label>
        <asp:TextBox ID="txtEmploymentStatus" runat="server"></asp:TextBox>
            <br />
            <br />
       <%-- <asp:Button ID="btnPopulate" runat="server" Text="Populate" OnClick="btnPopulate_Click" />--%>
        <asp:Button ID="btnUpdate" runat="server" Text="Update" Onclick="btnUpdate_Click" />

        <%--Status- lable --%>
        <asp:Label ID="lblStatus" runat="server" Text=""></asp:Label>
    </div>
    <div>
        <br />
        <h1>My Files</h1>
        <hr />
            <asp:Label ID="Label1" runat="server" Text="Choose PDF File to
            Upload. Uploading a file will also replace the file you have attached to your account."></asp:Label>
                        <asp:FileUpload ID="fileUploadText" runat="server" />
                        <br />
            <asp:Button ID="btnUploadFile" runat="server" Text="Upload File"
            OnClick="btnUploadFile_Click" />
                        <br />
            <asp:TextBox ID="txtDisplay" runat="server" TextMode="MultiLine"
            Rows="20" Height="40px" Width="269px"></asp:TextBox>
        <asp:Label ID="Label2" runat="server" Text="File that is linked to your acccount"></asp:Label>
        <br />
        <asp:ListBox ID="lstStudentResume" runat="server"
            AutoPostBack="false" 
            DataSourceID="sqlsrcStudentResumeLB"
            DataTextField="Resume"
            OnSelectedIndexChanged="lstStudentResume_SelectedIndexChanged">
        </asp:ListBox>
        <asp:Label ID="lblSelectedIndex" runat="server" Text="Index"></asp:Label>
        <br />
        <asp:Button ID="bttnpdf" runat="server" Text="Click to view PDF" Font-Bold="True" OnClick="bttnpdf_Click" /> 
        <br />
        <br />

    
        
        <asp:SqlDataSource 
            ID="sqlsrcStudentResumeLB" 
            runat="server" 
            ConnectionString="Data Source=LocalHost;Initial Catalog=SDB;Integrated Security=True" 
            ProviderName="System.Data.SqlClient" 
            SelectCommand="SELECT [Resume] FROM [Student]"></asp:SqlDataSource>


    <asp:SqlDataSource 
            ID="SqlLoggedinStudent" 
            runat="server" 
            ConnectionString="<%$ ConnectionStrings:SDB %>" 
            SelectCommand="SELECT [StudentID], [FirstName], [LastName], [EmailAddress], [PhoneNumber], [GradYear], [Major], [Grade], [EmploymentStatus] FROM [Student] WHERE ([StudentUserName] = @StudentUserName)" 
            UpdateCommand="UPDATE Student SET FirstName =@FirstName , LastName =@LastName , EmailAddress =@EmailAddress , 
            PhoneNumber =@PhoneNumber , GradYear =@GradYear , Major =@Major ,  Grade =@Grade , EmploymentStatus =@EmploymentStatus WHERE ([StudentUserName] = @StudentUserName)">
        <SelectParameters>
            <asp:SessionParameter Name="StudentUserName" SessionField="StudentUserName" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="FirstName" />
            <asp:Parameter Name="LastName" />
            <asp:Parameter Name="EmailAddress" />
            <asp:Parameter Name="PhoneNumber" />
            <asp:Parameter Name="GradYear" />
            <asp:Parameter Name="Major" />
            <asp:Parameter Name="Grade" />
            <asp:Parameter Name="EmploymentStatus" />
            <asp:Parameter Name="StudentID" />
        </UpdateParameters>
        </asp:SqlDataSource> 
    </div>


  

</asp:Content>
