﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SignUp.aspx.cs" MasterPageFile="~/MasterPage.master" Inherits="SignUp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="header" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="signUpk">
        <asp:Table ID="Table1" runat="server" Width="434px">
            <asp:TableRow>
                <asp:TableCell>User name:</asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
</asp:TableCell>
                <asp:TableCell>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="UserName"
                        ErrorMessage="*" Display="Static" ValidationGroup="signup">
                    </asp:RequiredFieldValidator>
                
</asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>Password:</asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="Password" TextMode="Password" runat="server"></asp:TextBox>
</asp:TableCell>
                <asp:TableCell>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Password"
                          ErrorMessage="*" Display="Static" ValidationGroup="signup">
                    </asp:RequiredFieldValidator>
                
</asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>Confirm password:</asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="ConfirmPassword" TextMode="Password"
                        runat="server"></asp:TextBox>
</asp:TableCell>
                <asp:TableCell>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ConfirmPassword"
                         ErrorMessage="*" Display="Static" ValidationGroup="signup">
                    </asp:RequiredFieldValidator>
                
</asp:TableCell>
            </asp:TableRow>
           
        </asp:Table>
                    
   <asp:Button ID="signupbtn" runat="server" Text="SignUp" OnClick="Button1_Click" ValidationGroup="signup" cssClass="signupBtn" ForeColor="White" BorderStyle="None" Height="32px" Width="189px" />
        <br/>                 
<asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="The confirm password has to be the same as above" ControlToCompare="Password" ControlToValidate="ConfirmPassword" ValidationGroup="signup"></asp:CompareValidator>
                

            
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:RealImaginaryConnectionString %>" SelectCommand="SELECT * FROM [ACCOUNT] WHERE ([ACC_USER] = @ACC_USER)">
            <SelectParameters>
                <asp:ControlParameter ControlID="UserName" Name="ACC_USER" PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:RealImaginaryConnectionString %>" SelectCommand="SELECT * FROM [ACCOUNT]"></asp:SqlDataSource>
        <br />
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
