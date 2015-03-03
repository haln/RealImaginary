<%@ Page Language="C#" AutoEventWireup="true" enableEventValidation="false" MasterPageFile="~/MasterPage.master" CodeFile="Results.aspx.cs" Inherits="Results" %>

<asp:Content ContentPlaceHolderID="header" runat="server"></asp:Content> 
<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:SqlDataSource ID="housingData" runat="server" ConnectionString="<%$ ConnectionStrings:RealImaginaryConnectionString %>" SelectCommand="SELECT * FROM [HOUSE] ORDER BY [HOUSE_ID]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="evalData" runat="server" ConnectionString="<%$ ConnectionStrings:RealImaginaryConnectionString %>" SelectCommand="SELECT * FROM [EVALUATION] ORDER BY [HOUSE_ID]"></asp:SqlDataSource>
    <div id="resultsDiv">
        <asp:SqlDataSource ID="HouseJoinEvalDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:RealImaginaryConnectionString %>" SelectCommand="SELECT * FROM EVALUATION RIGHT OUTER JOIN HOUSE ON EVALUATION.HOUSE_ID = HOUSE.HOUSE_ID"></asp:SqlDataSource>
        <asp:DataList ID="DataList1" runat="server" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Horizontal">
            <FooterStyle BackColor="White" ForeColor="#333333" />
            <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
            <ItemStyle BackColor="White" ForeColor="#333333" />
            <ItemTemplate>
                HouseID: <asp:Label ID="houseID" runat="server" Text='<%# Eval("HOUSE_ID1") %>'></asp:Label><br />
                Asking Price: <asp:Label ID="Label1" runat="server" Text='<%# Eval("HOUSE_ASKINGPRICE") %>'></asp:Label><br />
                EvalID: <asp:Label ID="evalID" runat="server" Text='<%# Eval("EVAL_ID") %>'></asp:Label>
                <br />
                <asp:LinkButton ID="LinkButton1" runat="server" OnCommand="LinkButton1_Click" CommandArgument='<%# Eval("HOUSE_ID1") + "," + Eval("EVAL_ID")%>'>Get housing details</asp:LinkButton>
            </ItemTemplate>
            <SelectedItemStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
        </asp:DataList>
    </div>
</asp:Content>