<%@ Page Language="C#" AutoEventWireup="true" CodeFile="admin-listing.aspx.cs" Inherits="admin_listing" %>

<!DOCTYPE html>
<link rel="stylesheet" href="stylesheet.css">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta name="viewport" id="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <title>Real Imaginary - The Real Estate Agency</title>
    <style type="text/css">
        .auto-style1 {
            width: 53px;
        }
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
                            <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:RealImaginaryConnectionString %>" SelectCommand="SELECT * FROM [ACCOUNT] WHERE (([ACC_USER] = @ACC_USER) AND ([ACC_PASS] = @ACC_PASS))">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="username" Name="ACC_USER" PropertyName="Text" Type="String" />
                                    <asp:ControlParameter ControlID="password" Name="ACC_PASS" PropertyName="Text" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:Label ID="Label1" runat="server" Font-Bold="True" ForeColor="White"></asp:Label>
                            <asp:TextBox ID="password" runat="server" CssClass="userPw" ForeColor="Silver" TextMode="Password" placeholder="password"></asp:TextBox>
                            <asp:TextBox ID="username" runat="server" CssClass="userName" BorderStyle="Inset" ForeColor="Silver" placeholder="username"></asp:TextBox>

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
                    <asp:Button ID="Selling" runat="server" Text="Selling A House" CssClass="Selling" ForeColor="White" BorderStyle="None" PostBackUrl="~/Sell House.aspx" />
                    <asp:Button ID="ContactUs" runat="server" Text="Contact Us" CssClass="ContactUs" ForeColor="White" BorderStyle="None" PostBackUrl="~/ContactUs.aspx" />
                </div>
            </header>
            <div id="adminHeader">
                <h3>Listing management</h3>
                <asp:Button ID="btnAgentsManage" runat="server" Text="Agents Management" Enabled="true" PostBackUrl="~/admin-agents.aspx" BackColor="#1472DC" ForeColor="White" Height="36px" BorderStyle="None" />
                <asp:Button ID="btnListingManage" runat="server" Text="Listing Management" Enabled="false" BackColor="#ECAB1C" ForeColor="White" Height="36px" BorderStyle="None" />
                <br />
            </div>

            <div id="listing">
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="HOUSE_ID" DataSourceID="SqlDataSource1" BackColor="White">
                    <Columns>
                        <asp:BoundField DataField="HOUSE_ID" HeaderText="HOUSE_ID" ReadOnly="True" SortExpression="HOUSE_ID" />
                        <asp:BoundField DataField="BUYER_ID" HeaderText="BUYER_ID" SortExpression="BUYER_ID" />
                        <asp:BoundField DataField="SELLER_ID" HeaderText="SELLER_ID" SortExpression="SELLER_ID" />

                        <asp:BoundField DataField="AGENT_ID" HeaderText="AGENT_ID" SortExpression="AGENT_ID" />
                        <asp:BoundField DataField="HOUSE_ADDRESS" HeaderText="HOUSE_ADDRESS" SortExpression="HOUSE_ADDRESS" />
                        <asp:BoundField DataField="HOUSE_STATE" HeaderText="HOUSE_STATE" SortExpression="HOUSE_STATE" />
                        <asp:BoundField DataField="HOUSE_ASKINGPRICE" HeaderText="HOUSE_ASKINGPRICE" SortExpression="HOUSE_ASKINGPRICE" />
                        <asp:BoundField DataField="HOUSE_SELLINGPRICE" HeaderText="HOUSE_SELLINGPRICE" SortExpression="HOUSE_SELLINGPRICE" />
                        <asp:BoundField DataField="HOUSE_PICTURE" HeaderText="HOUSE_PICTURE" SortExpression="HOUSE_PICTURE" />
                        <asp:CommandField ButtonType="Button" ShowEditButton="True" />
                        <asp:CommandField ButtonType="Button" ShowDeleteButton="True" />

                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RealImaginaryConnectionString %>" SelectCommand="SELECT * FROM [HOUSE]" DeleteCommand="DELETE FROM [HOUSE] WHERE [HOUSE_ID] = @HOUSE_ID" InsertCommand="INSERT INTO [HOUSE] ([HOUSE_ID], [BUYER_ID], [SELLER_ID], [AGENT_ID], [HOUSE_ADDRESS], [HOUSE_STATE], [HOUSE_ASKINGPRICE], [HOUSE_SELLINGPRICE], [HOUSE_PICTURE]) VALUES (@HOUSE_ID, @BUYER_ID, @SELLER_ID, @AGENT_ID, @HOUSE_ADDRESS, @HOUSE_STATE, @HOUSE_ASKINGPRICE, @HOUSE_SELLINGPRICE, @HOUSE_PICTURE)" UpdateCommand="UPDATE [HOUSE] SET [BUYER_ID] = @BUYER_ID, [SELLER_ID] = @SELLER_ID, [AGENT_ID] = @AGENT_ID, [HOUSE_ADDRESS] = @HOUSE_ADDRESS, [HOUSE_STATE] = @HOUSE_STATE, [HOUSE_ASKINGPRICE] = @HOUSE_ASKINGPRICE, [HOUSE_SELLINGPRICE] = @HOUSE_SELLINGPRICE, [HOUSE_PICTURE] = @HOUSE_PICTURE WHERE [HOUSE_ID] = @HOUSE_ID">
                    <DeleteParameters>
                        <asp:Parameter Name="HOUSE_ID" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="HOUSE_ID" Type="String" />
                        <asp:Parameter Name="BUYER_ID" Type="String" />
                        <asp:Parameter Name="SELLER_ID" Type="String" />
                        <asp:Parameter Name="AGENT_ID" Type="String" />
                        <asp:Parameter Name="HOUSE_ADDRESS" Type="String" />
                        <asp:Parameter Name="HOUSE_STATE" Type="String" />
                        <asp:Parameter Name="HOUSE_ASKINGPRICE" Type="Double" />
                        <asp:Parameter Name="HOUSE_SELLINGPRICE" Type="Double" />
                        <asp:Parameter Name="HOUSE_PICTURE" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="BUYER_ID" Type="String" />
                        <asp:Parameter Name="SELLER_ID" Type="String" />
                        <asp:Parameter Name="AGENT_ID" Type="String" />
                        <asp:Parameter Name="HOUSE_ADDRESS" Type="String" />
                        <asp:Parameter Name="HOUSE_STATE" Type="String" />
                        <asp:Parameter Name="HOUSE_ASKINGPRICE" Type="Double" />
                        <asp:Parameter Name="HOUSE_SELLINGPRICE" Type="Double" />
                        <asp:Parameter Name="HOUSE_PICTURE" Type="String" />
                        <asp:Parameter Name="HOUSE_ID" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:RealImaginaryConnectionString %>" SelectCommand="SELECT * FROM [HOUSE]" DeleteCommand="DELETE FROM [HOUSE] WHERE [HOUSE_ID] = @HOUSE_ID" InsertCommand="INSERT INTO [HOUSE] ([HOUSE_ID], [BUYER_ID], [SELLER_ID], [AGENT_ID], [HOUSE_ADDRESS], [HOUSE_STATE], [HOUSE_ASKINGPRICE], [HOUSE_SELLINGPRICE], [HOUSE_PICTURE]) VALUES (@HOUSE_ID, @BUYER_ID, @SELLER_ID, @AGENT_ID, @HOUSE_ADDRESS, @HOUSE_STATE, @HOUSE_ASKINGPRICE, @HOUSE_SELLINGPRICE, @HOUSE_PICTURE)" UpdateCommand="UPDATE [HOUSE] SET [BUYER_ID] = @BUYER_ID, [SELLER_ID] = @SELLER_ID, [AGENT_ID] = @AGENT_ID, [HOUSE_ADDRESS] = @HOUSE_ADDRESS, [HOUSE_STATE] = @HOUSE_STATE, [HOUSE_ASKINGPRICE] = @HOUSE_ASKINGPRICE, [HOUSE_SELLINGPRICE] = @HOUSE_SELLINGPRICE, [HOUSE_PICTURE] = @HOUSE_PICTURE WHERE [HOUSE_ID] = @HOUSE_ID">
                    <DeleteParameters>
                        <asp:Parameter Name="HOUSE_ID" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="HOUSE_ID" Type="String" />
                        <asp:Parameter Name="BUYER_ID" Type="String" />
                        <asp:Parameter Name="SELLER_ID" Type="String" />
                        <asp:Parameter Name="AGENT_ID" Type="String" />
                        <asp:Parameter Name="HOUSE_ADDRESS" Type="String" />
                        <asp:Parameter Name="HOUSE_STATE" Type="String" />
                        <asp:Parameter Name="HOUSE_ASKINGPRICE" Type="Double" />
                        <asp:Parameter Name="HOUSE_SELLINGPRICE" Type="Double" />
                        <asp:Parameter Name="HOUSE_PICTURE" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="BUYER_ID" Type="String" />
                        <asp:Parameter Name="SELLER_ID" Type="String" />
                        <asp:Parameter Name="AGENT_ID" Type="String" />
                        <asp:Parameter Name="HOUSE_ADDRESS" Type="String" />
                        <asp:Parameter Name="HOUSE_STATE" Type="String" />
                        <asp:Parameter Name="HOUSE_ASKINGPRICE" Type="Double" />
                        <asp:Parameter Name="HOUSE_SELLINGPRICE" Type="Double" />
                        <asp:Parameter Name="HOUSE_PICTURE" Type="String" />
                        <asp:Parameter Name="HOUSE_ID" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </div>

            <div id="addListing" style="padding: 15px; background-color: #FFFFFF;">
                <h2>Add a property below:</h2>
                <asp:Label ID="lblError" runat="server" EnableViewState="False"></asp:Label>
                <br />
                <table>


                    <tr>
                        <td>Buyer:</td>
                        <td class="auto-style1">
                            <asp:DropDownList ID="buyerDrop" runat="server" DataSourceID="SqlDataSource2" DataTextField="BUYER_LNAME" DataValueField="BUYER_ID">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:RealImaginaryConnectionString %>" SelectCommand="SELECT [BUYER_ID], [BUYER_LNAME], [BUYER_FNAME] FROM [BUYER] ORDER BY [BUYER_LNAME]"></asp:SqlDataSource>
                        </td>
                        <td class="auto-style1">&nbsp;</td>
                    </tr>
                    <tr>
                        <td>Seller:</td>
                        <td class="auto-style1">
                            <asp:DropDownList ID="sellerDrop" runat="server" DataSourceID="SqlDataSource3" DataTextField="SELLER_LNAME" DataValueField="SELLER_ID">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:RealImaginaryConnectionString %>" SelectCommand="SELECT [SELLER_ID], [SELLER_LNAME], [SELLER_FNAME] FROM [SELLER]"></asp:SqlDataSource>
                        </td>
                        <td class="auto-style1">&nbsp;</td>
                    </tr>
                    <tr>
                        <td>Agent:</td>
                        <td class="auto-style1">
                            <asp:DropDownList ID="agentDrop" runat="server" DataSourceID="SqlDataSource4" DataTextField="AGENT_LNAME" DataValueField="AGENT_ID">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:RealImaginaryConnectionString %>" SelectCommand="SELECT [AGENT_ID], [AGENT_LNAME], [AGENT_FNAME] FROM [AGENT]"></asp:SqlDataSource>
                        </td>
                        <td class="auto-style1">&nbsp;</td>
                    </tr>
                    <tr>
                        <td>Address:</td>
                        <td class="auto-style1">
                            <asp:TextBox ID="tbAddress" runat="server"></asp:TextBox></td>
                        <td class="auto-style1">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="required" ValidationGroup="add" ControlToValidate="tbAddress"></asp:RequiredFieldValidator></td>
                    </tr>
                    <tr>
                        <td>State:</td>
                        <td class="auto-style1">
                            <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem>unsold</asp:ListItem>
                                <asp:ListItem>sold</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                        <td class="auto-style1">&nbsp;</td>
                    </tr>
                    <tr>
                        <td>Asking price:</td>
                        <td class="auto-style1">
                            <asp:TextBox ID="tbAsking" runat="server"></asp:TextBox></td>
                        <td class="auto-style1">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="required" ValidationGroup="add" ControlToValidate="tbAsking"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="tbAsking" EnableViewState="False" ErrorMessage="number only" ValidationExpression="^[0-9]*$" ValidationGroup="add"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>Selling price:</td>
                        <td class="auto-style1">
                            <asp:TextBox ID="tbSelling" runat="server"></asp:TextBox></td>
                        <td class="auto-style1">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="required" ValidationGroup="add" ControlToValidate="tbSelling"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="tbSelling" EnableViewState="False" ErrorMessage="number only" ValidationExpression="^[0-9]*$" ValidationGroup="add"></asp:RegularExpressionValidator>
                        </td>

                    </tr>
                    <tr>
                        <td>
                            <asp:Button ID="btnAddProperty" runat="server" Text="Add new property" ValidationGroup="add" OnClick="btnAddAgent_Click" /></td>
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
