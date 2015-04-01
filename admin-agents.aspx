<%@ Page Language="C#" AutoEventWireup="true" CodeFile="admin-agents.aspx.cs" Inherits="admin" %>

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
                <div class="sign">
                    <div class="inputsign">
                        <asp:Button ID="signout" runat="server" Text="Sign out" CssClass="signup" ForeColor="White" BorderStyle="None" OnClick="signout_Click" />
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
                    <asp:Button ID="listProperty" runat="server" Text="Property Listing" CssClass="listProperty" ForeColor="White" BorderStyle="None" PostBackUrl="~/Default.aspx" />
                    <asp:Button ID="Selling" runat="server" Text="Selling A House" CssClass="Selling" ForeColor="White" BorderStyle="None" />
                    <asp:Button ID="ContactUs" runat="server" Text="Contact Us" CssClass="ContactUs" ForeColor="White" BorderStyle="None" PostBackUrl="~/ContactUs.aspx" />
                </div>
            </header>
            <div id="admin">
                <h1>Agents management</h1>
                <div id="adminNavigation">
                    <asp:Button ID="btnAgentsManage" runat="server" Text="Agents Management" Enabled="False" />
                    <asp:Button ID="btnListingManage" runat="server" Text="Listing Management" Enabled="true" PostBackUrl="~/admin-listing.aspx" />
                </div>
                <br />
                <div id="agentTable">
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="AGENT_ID,AGENCY_ID">
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
                    <br />
                    <div id="addAgent">
                        <h2>Add an agent below:</h2>
                        <asp:Label ID="lblError" runat="server" EnableViewState="False"></asp:Label>
                        <br />
                        <table>
                            <tr>
                                <td>Agent ID</td>
                                <td class="auto-style1">
                                    <asp:TextBox ID="tbAgentID" runat="server"></asp:TextBox></td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="required" ValidationGroup="add" ControlToValidate="tbAgentID"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>Agency ID</td>
                                <td class="auto-style1">
                                    <asp:TextBox ID="tbAgencyID" runat="server"></asp:TextBox></td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="required" ValidationGroup="add" ControlToValidate="tbAgencyID"></asp:RequiredFieldValidator></td>
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
            </div>
            <footer>
                <p>Created by Real Imaginary</p>
            </footer>
        </div>
    </form>
</body>
</html>
