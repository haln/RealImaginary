﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="admin-agents.aspx.cs" Inherits="admin" %>

<!DOCTYPE html>
<link rel="stylesheet" href="stylesheet.css">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta name="viewport" id="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <title>Real Imaginary - The Real Estate Agency</title>

    <style type="text/css">
    </style>

</head>

<body>
    <form id="form1" runat="server">
        <div id="container">
            <header>
                <asp:Panel ID="Panel1" runat="server" DefaultButton="signin">
                    <div class="sign">
                        <div class="inputsign">
                            <asp:Button ID="signup" runat="server" Text="Sign Up" CssClass="signup" ForeColor="White" BorderStyle="None" OnClick="signup_Click" />
                            <asp:Button ID="signin" runat="server" Text="Sign In" CssClass="signin" ForeColor="White" BorderStyle="None" OnClick="signin_Click" />
                            <asp:Button ID="signout" runat="server" Text="Sign Out" CssClass="signup" ForeColor="White" BorderStyle="None" OnClick="signout_Click" Visible="False" />
                            <asp:Button ID="manage" runat="server" Text="Manage" CssClass="signin" ForeColor="White" BorderStyle="None" OnClick="manage_Click" Visible="False" />
                            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:RealImaginaryConnectionString %>" SelectCommand="SELECT * FROM [ACCOUNT] WHERE (([ACC_USER] = @ACC_USER) AND ([ACC_PASS] = @ACC_PASS))" >
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="username" Name="ACC_USER" PropertyName="Text" Type="String" />
                                    <asp:ControlParameter ControlID="password" Name="ACC_PASS" PropertyName="Text" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource> 
                            <asp:Label ID="Label1" runat="server" Font-Bold="True" ForeColor="White"></asp:Label>
                            <asp:TextBox ID="password" runat="server"  CssClass="userPw" ForeColor="Silver" TextMode="Password" placeholder="password"></asp:TextBox>
                            <asp:TextBox ID="username" runat="server"  CssClass="userName" BorderStyle="Inset" ForeColor="Silver" placeholder="username"></asp:TextBox>
                         
                        </div>
                    </div>
                </asp:Panel>
                <div class="mask"></div>
                <div class="banner-background">
                    <div class="line"></div>
                </div>
                <div class="logo">
                    <a href="#"></a>
                </div>
                <div class="menu">
                    <asp:Button ID="listProperty" runat="server" Text="Property Listing" CssClass="listProperty" ForeColor="White" BorderStyle="None" PostBackUrl="~/Default.aspx" />
                    <asp:Button ID="Selling" runat="server" Text="Selling A House" CssClass="Selling" ForeColor="White" BorderStyle="None" PostBackUrl="~/Sell House.aspx"/>
                    <asp:Button ID="ContactUs" runat="server" Text="Contact Us" CssClass="ContactUs" ForeColor="White" BorderStyle="None"  PostBackUrl="~/ContactUs.aspx"/>
                </div>
            </header>
            <div id="admin">
                <h1>Agents management</h1>
                <div id="adminNavigation">
                    <asp:Button ID="btnAgentsManage" runat="server" Text="Agents Management" Enabled="False" BackColor="#1472DC" ForeColor="White" Height="36px" BorderStyle="None" />
                    <asp:Button ID="btnListingManage" runat="server" Text="Listing Management" Enabled="true" PostBackUrl="~/admin-listing.aspx" BackColor="#ECAB1C" ForeColor="White" Height="36px" BorderStyle="None" />
                </div>
                <br />
                <div id="agentTable">
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="AGENT_ID,AGENCY_ID" BackColor="White">
                        <Columns>
                            <asp:BoundField DataField="AGENT_ID" HeaderText="AGENT ID" ReadOnly="True" SortExpression="AGENT_ID" />
                            <asp:BoundField DataField="AGENCY_ID" HeaderText="AGENCY ID" ReadOnly="True" SortExpression="AGENCY_ID" />
                            <asp:BoundField DataField="AGENT_LNAME" HeaderText="LAST NAME" SortExpression="AGENT_LNAME" />
                            <asp:BoundField DataField="AGENT_FNAME" HeaderText="FIRST NAME" SortExpression="AGENT_FNAME" />
                            <asp:BoundField DataField="AGENT_ADDRESS" HeaderText="ADDRESS" SortExpression="AGENT_ADDRESS" />
                            <asp:BoundField DataField="AGENT_PHONE" HeaderText="PHONE" SortExpression="AGENT_PHONE" />
                            <asp:BoundField DataField="AGENT_EMAIL" HeaderText="EMAIL" SortExpression="AGENT_EMAIL" />
                            <asp:CommandField ButtonType="Button" ShowEditButton="True" />
                            <asp:CommandField ButtonType="Button" ShowDeleteButton="True" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RealImaginaryConnectionString %>" SelectCommand="SELECT * FROM [AGENT]" DeleteCommand="DELETE FROM [AGENT] WHERE [AGENT_ID] = @AGENT_ID AND [AGENCY_ID] = @AGENCY_ID" InsertCommand="INSERT INTO [AGENT] ([AGENT_ID], [AGENCY_ID], [AGENT_LNAME], [AGENT_FNAME], [AGENT_ADDRESS], [AGENT_PHONE], [AGENT_EMAIL]) VALUES (@AGENT_ID, @AGENCY_ID, @AGENT_LNAME, @AGENT_FNAME, @AGENT_ADDRESS, @AGENT_PHONE, @AGENT_EMAIL)" UpdateCommand="UPDATE [AGENT] SET [AGENT_LNAME] = @AGENT_LNAME, [AGENT_FNAME] = @AGENT_FNAME, [AGENT_ADDRESS] = @AGENT_ADDRESS, [AGENT_PHONE] = @AGENT_PHONE, [AGENT_EMAIL] = @AGENT_EMAIL WHERE [AGENT_ID] = @AGENT_ID AND [AGENCY_ID] = @AGENCY_ID">
                        <DeleteParameters>
                            <asp:Parameter Name="AGENT_ID" Type="String" />
                            <asp:Parameter Name="AGENCY_ID" Type="String" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="AGENT_ID" Type="String" />
                            <asp:Parameter Name="AGENCY_ID" Type="String" />
                            <asp:Parameter Name="AGENT_LNAME" Type="String" />
                            <asp:Parameter Name="AGENT_FNAME" Type="String" />
                            <asp:Parameter Name="AGENT_ADDRESS" Type="String" />
                            <asp:Parameter Name="AGENT_PHONE" Type="String" />
                            <asp:Parameter Name="AGENT_EMAIL" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="AGENT_LNAME" Type="String" />
                            <asp:Parameter Name="AGENT_FNAME" Type="String" />
                            <asp:Parameter Name="AGENT_ADDRESS" Type="String" />
                            <asp:Parameter Name="AGENT_PHONE" Type="String" />
                            <asp:Parameter Name="AGENT_EMAIL" Type="String" />
                            <asp:Parameter Name="AGENT_ID" Type="String" />
                            <asp:Parameter Name="AGENCY_ID" Type="String" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:RealImaginaryConnectionString %>" SelectCommand="SELECT * FROM [AGENT]" DeleteCommand="DELETE FROM [AGENT] WHERE [AGENT_ID] = @AGENT_ID AND [AGENCY_ID] = @AGENCY_ID" InsertCommand="INSERT INTO [AGENT] ([AGENT_ID], [AGENCY_ID], [AGENT_LNAME], [AGENT_FNAME], [AGENT_ADDRESS], [AGENT_PHONE], [AGENT_EMAIL]) VALUES (@AGENT_ID, @AGENCY_ID, @AGENT_LNAME, @AGENT_FNAME, @AGENT_ADDRESS, @AGENT_PHONE, @AGENT_EMAIL)" UpdateCommand="UPDATE [AGENT] SET [AGENT_LNAME] = @AGENT_LNAME, [AGENT_FNAME] = @AGENT_FNAME, [AGENT_ADDRESS] = @AGENT_ADDRESS, [AGENT_PHONE] = @AGENT_PHONE, [AGENT_EMAIL] = @AGENT_EMAIL WHERE [AGENT_ID] = @AGENT_ID AND [AGENCY_ID] = @AGENCY_ID">
                        <DeleteParameters>
                            <asp:Parameter Name="AGENT_ID" Type="String" />
                            <asp:Parameter Name="AGENCY_ID" Type="String" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="AGENT_ID" Type="String" />
                            <asp:Parameter Name="AGENCY_ID" Type="String" />
                            <asp:Parameter Name="AGENT_LNAME" Type="String" />
                            <asp:Parameter Name="AGENT_FNAME" Type="String" />
                            <asp:Parameter Name="AGENT_ADDRESS" Type="String" />
                            <asp:Parameter Name="AGENT_PHONE" Type="String" />
                            <asp:Parameter Name="AGENT_EMAIL" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="AGENT_LNAME" Type="String" />
                            <asp:Parameter Name="AGENT_FNAME" Type="String" />
                            <asp:Parameter Name="AGENT_ADDRESS" Type="String" />
                            <asp:Parameter Name="AGENT_PHONE" Type="String" />
                            <asp:Parameter Name="AGENT_EMAIL" Type="String" />
                            <asp:Parameter Name="AGENT_ID" Type="String" />
                            <asp:Parameter Name="AGENCY_ID" Type="String" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    <br />
                    <div id="addAgent" style="padding: 15px; background-color: #FFFFFF;">
                        <h2>Add an agent below:</h2>
                        <asp:Label ID="lblError" runat="server" EnableViewState="False"></asp:Label>
                        <br />
                        <table>

                            <tr>
                                <td>Agency</td>
                                <td class="auto-style1">
                                    <asp:DropDownList ID="agencyDrop" runat="server" DataSourceID="SqlDataSource2" DataTextField="AGENCY_ADDRESS" DataValueField="AGENCY_ID">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:RealImaginaryConnectionString %>" SelectCommand="SELECT [AGENCY_ID], [AGENCY_ADDRESS] FROM [AGENCY]"></asp:SqlDataSource>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>Last Name</td>
                                <td class="auto-style1">
                                    <asp:TextBox ID="tbLName" runat="server"></asp:TextBox></td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="required" ValidationGroup="add" ControlToValidate="tbLName"></asp:RequiredFieldValidator></td>
                            </tr>
                            <tr>
                                <td>First Name</td>
                                <td class="auto-style1">
                                    <asp:TextBox ID="tbFName" runat="server"></asp:TextBox></td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="required" ValidationGroup="add" ControlToValidate="tbFName"></asp:RequiredFieldValidator></td>
                            </tr>
                            <tr>
                                <td>Address</td>
                                <td class="auto-style1">
                                    <asp:TextBox ID="tbAddress" runat="server"></asp:TextBox></td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="required" ValidationGroup="add" ControlToValidate="tbAddress"></asp:RequiredFieldValidator></td>
                            </tr>
                            <tr>
                                <td>Phone</td>
                                <td class="auto-style1">
                                    <asp:TextBox ID="tbPhone" runat="server"></asp:TextBox></td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="required" ValidationGroup="add" ControlToValidate="tbPhone"></asp:RequiredFieldValidator></td>
                            </tr>
                            <tr>
                                <td>Email</td>
                                <td class="auto-style1">
                                    <asp:TextBox ID="tbEmail" runat="server"></asp:TextBox></td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="required" ValidationGroup="add" ControlToValidate="tbEmail"></asp:RequiredFieldValidator></td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Button ID="btnAddAgent" runat="server" Text="Add new agent" ValidationGroup="add" OnClick="btnAddAgent_Click" /></td>
                            </tr>
                        </table>
                    </div>
                </div>
                <footer>
                    <p>Created by Real Imaginary</p>
                </footer>
            </div>
        </div>
    </form>
</body>
</html>
