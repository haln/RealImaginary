<%@ Page Language="C#" AutoEventWireup="true" CodeFile="admin-listing.aspx.cs"  MasterPageFile="~/MasterPage.master" Inherits="admin_listing" %>

<asp:Content ContentPlaceHolderID="header" runat="server">        
        </asp:Content> 
<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">      

        <h1>Listing management</h1>
        <asp:Button ID="btnAgentsManage" runat="server" Text="Agents Management" Enabled="true" PostBackUrl="~/admin-agents.aspx" />
        <asp:Button ID="btnListingManage" runat="server" Text="Listing Management" Enabled="false"/>
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
                <asp:CommandField  ButtonType="Button" ShowEditButton="True" />
                <asp:CommandField  ButtonType="Button" ShowDeleteButton="True" />

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
   </asp:Content> 
<asp:Content ID="Content1" ContentPlaceHolderID="footer" runat="server">
                </asp:Content>