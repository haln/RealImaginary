<%@ Page Language="C#" AutoEventWireup="true" enableEventValidation="false" MasterPageFile="~/MasterPage.master" CodeFile="Results.aspx.cs" Inherits="Results" %>

<asp:Content ContentPlaceHolderID="header" runat="server"></asp:Content> 
<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:SqlDataSource ID="housingData" runat="server" ConnectionString="<%$ ConnectionStrings:RealImaginaryConnectionString %>" SelectCommand="SELECT * FROM [HOUSE] ORDER BY [HOUSE_ID]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="evalData" runat="server" ConnectionString="<%$ ConnectionStrings:RealImaginaryConnectionString %>" SelectCommand="SELECT * FROM [EVALUATION] ORDER BY [HOUSE_ID]"></asp:SqlDataSource>
    <div id="resultsDiv">
        <asp:SqlDataSource ID="HouseJoinEvalDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:RealImaginaryConnectionString %>" SelectCommand="SELECT * FROM EVALUATION RIGHT OUTER JOIN HOUSE ON EVALUATION.HOUSE_ID = HOUSE.HOUSE_ID"></asp:SqlDataSource>
        <asp:DataList ID="DataList1" runat="server" BackColor="White" BorderColor="#0E86CB" BorderStyle="Solid" BorderWidth="2px" CellPadding="19" GridLines="Both" RepeatDirection="Horizontal" ShowHeader="False"  RepeatColumns="3" CellSpacing="8" ShowFooter="False">
            <EditItemStyle CssClass="itemResult" />
            <ItemStyle ForeColor="#666666" HorizontalAlign="Left" />

            <SeparatorTemplate><b></SeparatorTemplate>
            <ItemTemplate>
                <div class="result">
                    <img width="300" height="200" class="housePicture" alt="houseImage" src='<%# "HousePictures/" + Eval("HOUSE_ID1") + "/" + Eval("HOUSE_PICTURE") %>' />
                    <div class="houseResult">
                        <asp:Label class="houseAddress" ID="houseAddress" runat="server" Text='<%# Eval("HOUSE_ADDRESS") %>'></asp:Label><br />
                        <asp:Label class="askingPrice" ID="askingPrice" runat="server" Text='<%# String.Format("{0:C}", Decimal.Parse(Eval("HOUSE_ASKINGPRICE").ToString()))  %>'></asp:Label><br /><br />
                        ListingID: <asp:Label class="houseResultInfo" ID="evalID" runat="server" Text='<%# Eval("HOUSE_ID1") %>'></asp:Label><br />
                        Building Type: <asp:Label class="houseResultInfo" ID="propType" runat="server" Text='<%# Eval("EVAL_PTYPE") %>'></asp:Label><br />
                    </div>
                    <br />
                    <asp:LinkButton class="link" ID="LinkButton1" runat="server" OnCommand="LinkButton1_Click" CommandArgument='<%# Eval("HOUSE_ID1") + "," + Eval("EVAL_ID")%>'>Get housing details</asp:LinkButton>
                </div>
            </ItemTemplate>
            <SeparatorTemplate><b><br/></SeparatorTemplate>
            <SelectedItemStyle BackColor="#ECECEC" Font-Bold="True" ForeColor="#666666" HorizontalAlign="Center" />
            <SeparatorStyle BackColor="#ECECEC" BorderStyle="None" HorizontalAlign="Center" />
        </asp:DataList>
    </div>
</asp:Content>