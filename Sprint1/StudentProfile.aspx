<%@ Page Title="" Language="C#" MasterPageFile="~/studentMaster.Master" AutoEventWireup="true" CodeBehind="StudentProfile.aspx.cs" Inherits="Sprint1.StudentProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   <%-- Section Header --%>
    <h4> Student's Account Page</h4>
    <br />
  
    <%-- Students info Gridview- view and edit own students info --%>
    <asp:GridView ID="grdvLoggedInStudent" runat="server" 
        AutoGenerateColumns="False" 
        DataKeyNames="StudentID" 
        DataSourceID="SqlLoggedinStudent">
        <Columns>
            <%-- Bind Data Fields --%>
            <asp:CommandField ShowEditButton="True" />
            <asp:BoundField Visible="false"  DataField="StudentID" HeaderText="StudentID" InsertVisible="False" ReadOnly="True" SortExpression="StudentID" />
            <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
            <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
            <asp:BoundField DataField="EmailAddress" HeaderText="EmailAddress" SortExpression="EmailAddress" />
            <asp:BoundField DataField="PhoneNumber" HeaderText="PhoneNumber" SortExpression="PhoneNumber" />
            <asp:BoundField DataField="GradYear" HeaderText="GradYear" SortExpression="GradYear" />
            <asp:BoundField DataField="Major" HeaderText="Major" SortExpression="Major" />
            <asp:BoundField DataField="Grade" HeaderText="Grade" SortExpression="Grade" />
            <asp:BoundField DataField="EmploymentStatus" HeaderText="EmploymentStatus" SortExpression="EmploymentStatus" />
        </Columns>
    </asp:GridView>

   

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
        </div>
    <div>
        <asp:Label ID="Label2" runat="server" Text="File that is linked to your acccount"></asp:Label>
        <br />
        <asp:ListBox ID="lstStudentResume" runat="server"
            AutoPostBack="True" 
            DataSourceID="sqlsrcStudentResumeLB"
            DataTextField="StudentResume"
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
            ConnectionString="<%$ ConnectionStrings: <asp:SqlDataSource 
            ID="SqlLoggedinStudent" 
            runat="server" 
            ConnectionString="<%$ ConnectionStrings:SDB %>" 
            SelectCommand="SELECT [StudentID], [FirstName], [LastName], [EmailAddress], [PhoneNumber], [GradYear], [Major], [EmploymentStatus], FROM [Student] 
            WHERE ([StudentID] = @StudentID)" 
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
        </asp:SqlDataSource> %>" 
            SelectCommand="SELECT [StudentID], [FirstName], [LastName], [EmailAddress], [PhoneNumber], [Major], [ExpectedGradYear], [UniversityYear] FROM [Students] 
            WHERE ([StudentID] = @StudentID)" 
            UpdateCommand="UPDATE Students SET FirstName =@FirstName , LastName =@LastName , EmailAddress =@EmailAddress , 
            PhoneNumber =@PhoneNumber , Major =@Major , ExpectedGradYear =@ExpectedGradYear , UniversityYear =@UniversityYear WHERE ([StudentID] = @StudentID)">
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
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>

        </div>
    </form>
</body>
</html>