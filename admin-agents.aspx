<%@ Page Language="C#" AutoEventWireup="true" CodeFile="admin-agents.aspx.cs" Inherits="admin" %>

<!DOCTYPE html>
<link rel="stylesheet" href="stylesheet.css">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta name="viewport" id="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <title>Real Imaginary - The Real Estate Agency</title>
</head>

<body>
    <form id="form1" runat="server">
        <div id="container">
            <header>
                <div class="sign">
                    <div class="inputsign">
                        <asp:Button ID="signup" runat="server" Text="Sign Up" CssClass="signup" ForeColor="White" BorderStyle="None" />
                        <asp:Button ID="signin" runat="server" Text="Sign In" CssClass="signin" ForeColor="White" BorderStyle="None" />
                        <asp:TextBox ID="password" runat="server" Text="Password" CssClass="userPw" ForeColor="Silver" TextMode="Password"></asp:TextBox>
                        <asp:TextBox ID="username" runat="server" Text="UserName" CssClass="userName" BorderStyle="Inset" ForeColor="Silver"></asp:TextBox>
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
            <h1>Agents management</h1>
            <asp:Button ID="btnAgentsManage" runat="server" Text="Agents Management" Enabled="False" />
            <asp:Button ID="btnListingManage" runat="server" Text="Listing Management" Enabled="true" PostBackUrl="~/admin-listing.aspx" />
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
                <h2>Add an agent below:</h2>
                <asp:Label ID="lblError" runat="server" EnableViewState="False"></asp:Label>
                <br />
                <table>
                    <tr>
                        <td>Agent ID</td>
                        <td>
                            <asp:TextBox ID="tbAgentID" runat="server"></asp:TextBox></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>Agency ID</td>
                        <td>
                            <asp:TextBox ID="tbAgencyID" runat="server"></asp:TextBox></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>Last Name</td>
                        <td>
                            <asp:TextBox ID="tbLName" runat="server"></asp:TextBox></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>First Name</td>
                        <td>
                            <asp:TextBox ID="tbFName" runat="server"></asp:TextBox></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>Address</td>
                        <td>
                            <asp:TextBox ID="tbAddress" runat="server"></asp:TextBox></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>Phone</td>
                        <td>
                            <asp:TextBox ID="tbPhone" runat="server"></asp:TextBox></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>Email</td>
                        <td>
                            <asp:TextBox ID="tbEmail" runat="server"></asp:TextBox></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Button ID="btnAddAgent" runat="server" Text="Add new agent" ValidationGroup="insert" OnClick="btnAddAgent_Click" /></td>
                    </tr>
                </table>
            </div>
            <footer>
                <p>Created by Real Imaginary</p>
            </footer>
            </div>
    </form>
</body>
</html>
