<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebApplication1.WebForm1" %>

<!DOCTYPE html>
<link rel="stylesheet" href="stylesheet.css">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <meta name="viewport" id="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
   <div id="container">
         <header>
             <div class="sign">
                 <div class="inputsign">
                     <asp:TextBox ID="username" runat="server" Text="UserName" style="margin-bottom: 0px"></asp:TextBox>
                     <asp:TextBox ID="password" runat="server" Text="Password"></asp:TextBox>
                     <asp:Button ID="signin" runat="server" Text="Sign In" />
                     <asp:Button ID="signup" runat="server" Text="Sign Up" />
                 </div>
            </div>
            <div class="banner-background">        
                <div class="logo">
                     <a href="#"><img src="logo.png" alt="Real Imaginary"/></a>
                 </div>
                <div class="line"></div>
             </div>
             
    <div class="mask"> </div>
             
        </header>

       <div id="seachbox">

        </div>

        <footer>
        <p>Created by Real Imaginary</p>
        </footer>

  </div>  
        </form>
</body>
</html>
