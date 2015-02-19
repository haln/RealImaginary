<%@ Page Language="C#" AutoEventWireup="true" CodeFile="admin-listing.aspx.cs" Inherits="admin_listing" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
         <div id="bannerMenu">
            <img src="realBanner.png" alt="Real Imaginary - The Real Estate Agency" /><br />
            <a href="Default.aspx"><img src="homeButton.png"/></a>
            <a href="SellHouse.aspx"><img src="sellHouse.png" /></a>
            <a href="ContactUs.aspx"><img src="contactUs.png" /></a>
        </div>
        <h1>Listing management</h1>
        <asp:Button ID="btnAgentsManage" runat="server" Text="Agents Management" Enabled="true" OnClick="btnAgentsManage_Click" />
        <asp:Button ID="btnListingManage" runat="server" Text="Listing Management" Enabled="false"/>
        <br />
    <div id="agentTable">
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="IncidentID" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="IncidentID" HeaderText="IncidentID" InsertVisible="False" ReadOnly="True" SortExpression="IncidentID" />
                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                <asp:BoundField DataField="DateOpened" HeaderText="DateOpened" SortExpression="DateOpened" />

                <asp:BoundField DataField="DateClosed" HeaderText="DateClosed" SortExpression="DateClosed" />
                <asp:CommandField ShowEditButton="True" />
                <asp:CommandField ShowDeleteButton="True" />

            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TechSupportConnectionString %>" SelectCommand="SELECT [IncidentID], [Description], [DateOpened], [DateClosed] FROM [Incidents]"></asp:SqlDataSource>
    </div>
    </form>
</body>
</html>
