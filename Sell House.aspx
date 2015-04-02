<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Sell House.aspx.cs" Inherits="Sell_House" %>

<asp:Content ID="Content1" ContentPlaceHolderID="header" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RealImaginaryConnectionString %>" SelectCommand="SELECT * FROM [AGENT]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:RealImaginaryConnectionString %>" DeleteCommand="DELETE FROM [HOUSE] WHERE [HOUSE_ID] = @original_HOUSE_ID AND (([BUYER_ID] = @original_BUYER_ID) OR ([BUYER_ID] IS NULL AND @original_BUYER_ID IS NULL)) AND [SELLER_ID] = @original_SELLER_ID AND [AGENT_ID] = @original_AGENT_ID AND [HOUSE_ADDRESS] = @original_HOUSE_ADDRESS AND [HOUSE_STATE] = @original_HOUSE_STATE AND [HOUSE_ASKINGPRICE] = @original_HOUSE_ASKINGPRICE AND (([HOUSE_SELLINGPRICE] = @original_HOUSE_SELLINGPRICE) OR ([HOUSE_SELLINGPRICE] IS NULL AND @original_HOUSE_SELLINGPRICE IS NULL)) AND (([HOUSE_PICTURE] = @original_HOUSE_PICTURE) OR ([HOUSE_PICTURE] IS NULL AND @original_HOUSE_PICTURE IS NULL))" InsertCommand="INSERT INTO [HOUSE] ([HOUSE_ID], [BUYER_ID], [SELLER_ID], [AGENT_ID], [HOUSE_ADDRESS], [HOUSE_STATE], [HOUSE_ASKINGPRICE], [HOUSE_SELLINGPRICE], [HOUSE_PICTURE]) VALUES (@HOUSE_ID, @BUYER_ID, @SELLER_ID, @AGENT_ID, @HOUSE_ADDRESS, @HOUSE_STATE, @HOUSE_ASKINGPRICE, @HOUSE_SELLINGPRICE, @HOUSE_PICTURE)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [HOUSE]" UpdateCommand="UPDATE [HOUSE] SET [BUYER_ID] = @BUYER_ID, [SELLER_ID] = @SELLER_ID, [AGENT_ID] = @AGENT_ID, [HOUSE_ADDRESS] = @HOUSE_ADDRESS, [HOUSE_STATE] = @HOUSE_STATE, [HOUSE_ASKINGPRICE] = @HOUSE_ASKINGPRICE, [HOUSE_SELLINGPRICE] = @HOUSE_SELLINGPRICE, [HOUSE_PICTURE] = @HOUSE_PICTURE WHERE [HOUSE_ID] = @original_HOUSE_ID AND (([BUYER_ID] = @original_BUYER_ID) OR ([BUYER_ID] IS NULL AND @original_BUYER_ID IS NULL)) AND [SELLER_ID] = @original_SELLER_ID AND [AGENT_ID] = @original_AGENT_ID AND [HOUSE_ADDRESS] = @original_HOUSE_ADDRESS AND [HOUSE_STATE] = @original_HOUSE_STATE AND [HOUSE_ASKINGPRICE] = @original_HOUSE_ASKINGPRICE AND (([HOUSE_SELLINGPRICE] = @original_HOUSE_SELLINGPRICE) OR ([HOUSE_SELLINGPRICE] IS NULL AND @original_HOUSE_SELLINGPRICE IS NULL)) AND (([HOUSE_PICTURE] = @original_HOUSE_PICTURE) OR ([HOUSE_PICTURE] IS NULL AND @original_HOUSE_PICTURE IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_HOUSE_ID" Type="String" />
            <asp:Parameter Name="original_BUYER_ID" Type="String" />
            <asp:Parameter Name="original_SELLER_ID" Type="String" />
            <asp:Parameter Name="original_AGENT_ID" Type="String" />
            <asp:Parameter Name="original_HOUSE_ADDRESS" Type="String" />
            <asp:Parameter Name="original_HOUSE_STATE" Type="String" />
            <asp:Parameter Name="original_HOUSE_ASKINGPRICE" Type="Double" />
            <asp:Parameter Name="original_HOUSE_SELLINGPRICE" Type="Double" />
            <asp:Parameter Name="original_HOUSE_PICTURE" Type="String" />
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
            <asp:Parameter Name="original_HOUSE_ID" Type="String" />
            <asp:Parameter Name="original_BUYER_ID" Type="String" />
            <asp:Parameter Name="original_SELLER_ID" Type="String" />
            <asp:Parameter Name="original_AGENT_ID" Type="String" />
            <asp:Parameter Name="original_HOUSE_ADDRESS" Type="String" />
            <asp:Parameter Name="original_HOUSE_STATE" Type="String" />
            <asp:Parameter Name="original_HOUSE_ASKINGPRICE" Type="Double" />
            <asp:Parameter Name="original_HOUSE_SELLINGPRICE" Type="Double" />
            <asp:Parameter Name="original_HOUSE_PICTURE" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:RealImaginaryConnectionString %>" SelectCommand="SELECT [ACC_ID], [ACC_LINKID] FROM [ACCOUNT] WHERE ([ACC_USER] = @ACC_USER)">
        <SelectParameters>
            <asp:SessionParameter Name="ACC_USER" SessionField="username" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <h5>Add a house to the market:</h5>
    Select your agent: <asp:DropDownList ID="ddl_agent" runat="server" DataSourceID="SqlDataSource1" DataTextField="AGENT_FNAME" DataValueField="AGENT_ID"></asp:DropDownList>
    <br />
    Enter the address: <asp:TextBox ID="txt_address" runat="server"></asp:TextBox>
    <br />
    Enter your asking price: <asp:TextBox ID="txt_price" runat="server"></asp:TextBox>
    <br />
    <br />
    <asp:Button ID="btn_sell" runat="server" Text="Add to Market" OnClick="btn_sell_Click" />
    <asp:Label ID="lblError" runat="server" Text=""></asp:Label>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" Runat="Server">
</asp:Content>

