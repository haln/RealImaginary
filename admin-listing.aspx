<%@ Page Language="C#" AutoEventWireup="true" CodeFile="admin-listing.aspx.cs" Inherits="admin_listing" %>

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
            <h1>Listing management</h1>
            <asp:Button ID="btnAgentsManage" runat="server" Text="Agents Management" Enabled="true" PostBackUrl="~/admin-agents.aspx" />
            <asp:Button ID="btnListingManage" runat="server" Text="Listing Management" Enabled="false" />
            <br />
            <div id="agentTable">
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="HOUSE_ID" DataSourceID="SqlDataSource1">
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
            </div>
            <footer>
                <p>Created by Real Imaginary</p>
            </footer>
        </div>
        </form>
</body>
</html>
