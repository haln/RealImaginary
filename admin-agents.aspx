<%@ Page Language="C#" AutoEventWireup="true" CodeFile="admin-agents.aspx.cs" MasterPageFile="~/MasterPage.master" Inherits="admin" %>
<asp:Content ContentPlaceHolderID="header" runat="server">        
        </asp:Content> 
<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">        
        
        <h1>Agents management</h1>
        <asp:Button ID="btnAgentsManage" runat="server" Text="Agents Management" Enabled="False" />
        <asp:Button ID="btnListingManage" runat="server" Text="Listing Management" Enabled="true" OnClick="btnListingManage_Click"/>
        <br />
    <div id="agentTable">
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False">
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
    </div>
   </asp:Content> 
<asp:Content ContentPlaceHolderID="footer" runat="server">
                </asp:Content>