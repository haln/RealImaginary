<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ContactUs.aspx.cs" MasterPageFile="~/MasterPage.master" Inherits="Contact_us" %>


<asp:Content ContentPlaceHolderID="header" runat="server">
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="agentMain">
        <h1>Our agents</h1>

        <asp:DataList ID="agentList" runat="server" BackColor="#0E86CB" BorderColor="White" BorderStyle="None" BorderWidth="2px" CellPadding="14" DataKeyField="AGENT_ID" DataSourceID="SqlDataSource1" GridLines="Both" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Size="Large" Font-Strikeout="False" Font-Underline="False" RepeatColumns="3" HorizontalAlign="Center" CellSpacing="4">


            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
            <ItemStyle ForeColor="#000066" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center" />
            <ItemTemplate>
                <%--AGENT_ID:
                <asp:Label ID="AGENT_IDLabel" runat="server" Text='<%# Eval("AGENT_ID") %>' />
                <br />
                AGENCY_ID:
                <asp:Label ID="AGENCY_IDLabel" runat="server" Text='<%# Eval("AGENCY_ID") %>' />--%>
                <br />
                <asp:Label ID="AGENT_FNAMELabel" runat="server" Text='<%# Eval("AGENT_FNAME") %>' Font-Bold="True" />
                <asp:Label ID="AGENT_LNAMELabel" runat="server" Text='<%# Eval("AGENT_LNAME") %>' Font-Bold="True" />

                <br />
                <%--AGENT_ADDRESS:
                <asp:Label ID="AGENT_ADDRESSLabel" runat="server" Text='<%# Eval("AGENT_ADDRESS") %>' />--%>
                <br />
                PHONE:
                <asp:Label ID="AGENT_PHONELabel" runat="server" Text='<%# Eval("AGENT_PHONE") %>' ForeColor="White" />
                <br />
                EMAIL:
                <asp:Label ID="AGENT_EMAILLabel" runat="server" Text='<%# Eval("AGENT_EMAIL") %>' ForeColor="White" />
                <br />
                <br />
            </ItemTemplate>
            <SelectedItemStyle BackColor="#ececec" Font-Bold="True" ForeColor="White" />
            <SeparatorStyle BackColor="#0E86CB" />
            <SeparatorTemplate>
                <br />
            </SeparatorTemplate>
        </asp:DataList>
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RealImaginaryConnectionString %>" SelectCommand="SELECT * FROM [AGENT] ORDER BY [AGENCY_ID]"></asp:SqlDataSource>
    <br />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
