﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebApplication1.WebForm1" %>

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

                     <asp:Button ID="signup" runat="server" Text="Sign Up" CssClass="signup" ForeColor="White" BorderStyle="None"/>
                     <asp:Button ID="signin" runat="server" Text="Sign In" CssClass="signin" ForeColor="White" BorderStyle="None"/>
                     <asp:TextBox ID="password" runat="server" Text="Password" CssClass="userPw" ForeColor="Silver" TextMode="Password" ></asp:TextBox>
                     <asp:TextBox ID="username" runat="server" Text="UserName" CssClass="userName" BorderStyle="Inset" ForeColor="Silver" ></asp:TextBox>
                 </div>
            </div>
        <div class="mask"></div>
            <div class="banner-background">    
                <div class="line"></div>     
             </div>
             <div class="logo">
                     <a href="#"></a>
             </div>
        <div class="menu">            
            <asp:Button ID="listProperty" runat="server" Text="Property Listing" CssClass="listProperty" ForeColor="White" BorderStyle="None"/>
            <asp:Button ID="Selling" runat="server" Text="Selling A House" CssClass="Selling" ForeColor="White" BorderStyle="None"/>
            <asp:Button ID="ContactUs" runat="server" Text="Contact Us" CssClass="ContactUs" ForeColor="White" BorderStyle="None" />
            </div>            
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
