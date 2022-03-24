<%@ Page Title="" Language="C#" MasterPageFile="~/studentMaster.Master" AutoEventWireup="true" CodeBehind="StudentAccountProfile.aspx.cs" Inherits="Sprint1.StudentAccountProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%-- Students --%>
    <div id="Students">
        <h2>Students</h2>
        <asp:GridView
            ID="grdvLoggedInStudent"
            DataSourceID="SqlLoggedinStudent"
            runat="server"
            HorizontalAlign="Justify"
            AlternatingRowStyle-BackColor="PowderBlue"
            AllowSorting="true"
            AutoGenerateColumns="false"
            DataKeyNames="StudentID"
            CellPadding="10">    
            <Columns>
                 <%-- Bind Data Fields --%>
                <asp:CommandField ShowEditButton="True" />
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

    <div>
        <br />
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
            AutoPostBack="True" 
            DataSourceID="sqlsrcStudentResumeLB"
            DataTextField="Resume"
            OnSelectedIndexChanged="lstStudentResume_SelectedIndexChanged">
        </asp:ListBox>
        <asp:Label ID="lblSelectedIndex" runat="server" Text="Index"></asp:Label>
        <br />
        <asp:Button ID="bttnpdf" runat="server" Text="Click to view PDF" Font-Bold="True" OnClick="bttnpdf_Click" /> 
        
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
            SelectCommand="SELECT [StudentID], [FirstName], [LastName], [EmailAddress], [PhoneNumber], [GradYear], [Major], [Grade], [EmploymentStatus] FROM [Student] WHERE ([StudentID] = @StudentID)" 
            UpdateCommand="UPDATE Student SET FirstName =@FirstName , LastName =@LastName , EmailAddress =@EmailAddress , 
            PhoneNumber =@PhoneNumber , GradYear =@GradYear , Major =@Major ,  Grade =@Grade , EmploymentStatus =@EmploymentStatus WHERE ([StudentID] = @StudentID)">
        <SelectParameters>
            <asp:SessionParameter Name="StudentID" SessionField="StudentID" Type="Int32" />
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
