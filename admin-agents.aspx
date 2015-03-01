<%@ Page Language="C#" AutoEventWireup="true" CodeFile="admin-agents.aspx.cs" Inherits="admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
         <div id="bannerMenu">
            <img src="realBanner.png" alt="Real Imaginary - The Real Estate Agency" /><br />
            <a href="Default.aspx"><img src="images/homeButton.png"/></a>
            <a href="SellHouse.aspx"><img src="sellHouse.png" /></a>
            <a href="ContactUs.aspx"><img src="contactUs.png" /></a>
        </div>
        <h1>Agents management</h1>
        <asp:Button ID="btnAgentsManage" runat="server" Text="Agents Management" Enabled="False" />
        <asp:Button ID="btnListingManage" runat="server" Text="Listing Management" Enabled="true" OnClick="btnListingManage_Click"/>
        <br />
    <div id="agentTable">
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="CustomerID" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="CustomerID" HeaderText="AgentID" InsertVisible="False" ReadOnly="True" SortExpression="CustomerID" />
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />

                <asp:CommandField ShowEditButton="True" />
                <asp:CommandField ShowDeleteButton="True" />

            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TechSupportConnectionString %>" SelectCommand="SELECT [CustomerID], [Name], [Address] FROM [Customers] ORDER BY [Name]"></asp:SqlDataSource>
    </div>
    </form>
</body>
</html>
