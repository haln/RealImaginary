<%@ Page Language="C#" AutoEventWireup="true" CodeFile="admin-agents.aspx.cs" MasterPageFile="~/MasterPage.master" Inherits="admin" %>
<asp:Content ContentPlaceHolderID="header" runat="server">        
        </asp:Content> 
<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">        
        
        <h1>Agents management</h1>
        <asp:Button ID="btnAgentsManage" runat="server" Text="Agents Management" Enabled="False" />
        <asp:Button ID="btnListingManage" runat="server" Text="Listing Management" Enabled="true" OnClick="btnListingManage_Click"/>
        <br />
    <div id="agentTable">
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="AGENT_ID,AGENCY_ID">
            <Columns>
                <asp:BoundField DataField="AGENT_ID" HeaderText="AGENT_ID" ReadOnly="True" SortExpression="AGENT_ID" />
                <asp:BoundField DataField="AGENCY_ID" HeaderText="AGENCY_ID" ReadOnly="True" SortExpression="AGENCY_ID" />
                <asp:BoundField DataField="AGENT_LNAME" HeaderText="AGENT_LNAME" SortExpression="AGENT_LNAME" />
                <asp:BoundField DataField="AGENT_FNAME" HeaderText="AGENT_FNAME" SortExpression="AGENT_FNAME" />
                <asp:BoundField DataField="AGENT_ADDRESS" HeaderText="AGENT_ADDRESS" SortExpression="AGENT_ADDRESS" />
                <asp:BoundField DataField="AGENT_PHONE" HeaderText="AGENT_PHONE" SortExpression="AGENT_PHONE" />
                <asp:BoundField DataField="AGENT_EMAIL" HeaderText="AGENT_EMAIL" SortExpression="AGENT_EMAIL" />
                <asp:ButtonField ButtonType="Button" CommandName="Edit" Text="Edit" />
                <asp:ButtonField ButtonType="Button" CommandName="Cancel" Text="Cancel" />
                <asp:ButtonField ButtonType="Button" CommandName="Delete" Text="Delete" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RealImaginaryConnectionString %>" SelectCommand="SELECT * FROM [AGENT]"></asp:SqlDataSource>
    </div>
   </asp:Content> 
<asp:Content ContentPlaceHolderID="footer" runat="server">
                </asp:Content>