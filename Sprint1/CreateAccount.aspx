<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateAccount.aspx.cs" Inherits="Sprint1.CreateAccount" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
<link href="Content/bootstrap.css" rel="stylesheet" />
    <link href="createaccountstyle.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            
            
            <section class ="container">
       <div class="row align-content-around d-flex justify-content-center">
           <div class="col-md-5">
               <div class="box shadow bg-white p-4">
                 <h3 class="mb-4 text-center fs-1"> Create your Account</h3>
                  <div class=" mx-auto text-center"> 
                     <img src="Images/ole%20school%20group%20logo.png" class="justify-content-center"/>
                      <br />
                    <asp:TextBox ID="txtFirstName" runat="server"  class="form-control rounded-0" placeholder="First Name"></asp:TextBox>
                      <br />
                       <asp:TextBox ID="txtLastName" runat="server"  class="form-control rounded-0" placeholder="Lastt Name"></asp:TextBox>
                      <br />
                       <asp:TextBox ID="txtEmail" runat="server"  class="form-control rounded-0" placeholder="Email"></asp:TextBox>
                      <br />
                      <asp:TextBox ID="txtUsername" runat="server"  class="form-control rounded-0" placeholder="Username"></asp:TextBox>
                      <br />
                     <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"  class="form-control rounded-0" placeholder="Password"></asp:TextBox>
                      <br />
                      <asp:Label ID="lblpersontype" runat="server" Text="Student or Member: "></asp:Label>
                        <asp:DropDownList ID="ddlPersonType" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlPersonType_SelectedIndexChanged">
                        <asp:ListItem>Student</asp:ListItem>
                        <asp:ListItem>Member</asp:ListItem>
                    </asp:DropDownList>
                      <br />
                      <br />
                      <asp:Label ID="lblStatus" runat="server" Text=""></asp:Label>
                      <br />
                        <asp:Button ID="btnCreateUser" runat="server" Text="Create Account" class="btn btn-secondary btn-rounded" OnClick="btnCreateUser_Click"/>
                      <br />
                      <br />`
                      
            <asp:Label ID="lblWantMentor" runat="server" Text="Check if you would like a mentor:"></asp:Label>
            <asp:CheckBox ID="cbxWantMentor" runat="server" />
            <br />
            <asp:Label ID="lblWantToMentor" runat="server" Text="Check if you would like to mentor students:" Visible="false"></asp:Label>
            <asp:CheckBox ID="cbxWantToMentor" runat="server" Visible="false"/>
            <br />
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
                     <a href="Login.aspx">Go Back to Login Page</a>
                      <br />
                      &nbsp;<br />
                    
                    </div>  
                     
      
            </div>
               </div>
           </div>
                </section>

            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
       
            
            <%--CREATE USER BUTTON--%>
    
        <br />
            <%--CREATE ANOTHER USER BUTTON--%>
       <%-- <asp:LinkButton ID="lnkAnother" runat="server" OnClick="lnkAnother_Click" Visible="False">Create Another Account</asp:LinkButton>--%>
        <br />
            <%--STATUS LABEL--%>
        
        <br />
            <%--HYPER LINK TO LOGIN--%>
      
        </div>
    </form>
     <script src="Scripts/jquery-3.6.0.slim.js"></script>
    <script src="Scripts/esm/popper.min.js"></script>
    <script src="Scripts/bootstrap.bundle.min.js"></script>
</body>
</html>
