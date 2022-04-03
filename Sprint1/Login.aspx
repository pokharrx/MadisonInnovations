<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Sprint1.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <link href="loginstyle.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <br />
            <br />
   <section class ="container">
       <div class="row align-content-around d-flex justify-content-center">
           <div class="col-md-5">
               <div class="box shadow bg-white p-4">
                 <h3 class="mb-4 text-center fs-1">Welcome!</h3>
                  <div class=" mx-auto text-center"> 
                     <img src="Images/ole%20school%20group%20logo.png" class="justify-content-center"/>
                       <asp:TextBox ID="txtUsername" runat="server"  class="form-control rounded-0" placeholder="Username"></asp:TextBox>
                      <br />
                       <asp:TextBox ID="txtPassword" runat="server" class="form-control rounded-0" placeholder="Password" TextMode="Password"></asp:TextBox>
                              <a href="CreateAccount.aspx">Sign up</a>
                      <br />
                       <asp:Label ID="lblStatus" runat="server" Text=""></asp:Label>
                      <br />
                      <br />
                       <div class="d-grid gap-2 mb-3">
                      <asp:Button ID="btnLogin" runat="server" Text="Login"  class="btn btn-secondary btn-rounded" OnClick="btnLogin_Click"/>
                    </div>  
                     
                </div>
               </div>

           </div>
       </div>
</section>


  
        <br />
        
        </div>
    </form>
     <script src="Scripts/jquery-3.6.0.slim.js"></script>
    <script src="Scripts/esm/popper.min.js"></script>
    <script src="Scripts/bootstrap.bundle.min.js"></script>

</body>
</html>
