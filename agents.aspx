<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="agents.aspx.cs" Inherits="agents" %>

<asp:Content ID="Content1" ContentPlaceHolderID="header" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="agents">
        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
            <AlternatingItemTemplate>
                <span style="">NAME:
            <asp:Label ID="AGENT_FNAMELabel" runat="server" Text='<%# Eval("AGENT_FNAME") %>' />
                    <asp:Label ID="AGENT_LNAMELabel" runat="server" Text='<%# Eval("AGENT_LNAME") %>' />
                    <br />
                    AGENT_PHONE:
            <asp:Label ID="AGENT_PHONELabel" runat="server" Text='<%# Eval("AGENT_PHONE") %>' />
                    <br />
                    AGENT_ADDRESS:
            <asp:Label ID="AGENT_ADDRESSLabel" runat="server" Text='<%# Eval("AGENT_ADDRESS") %>' />
                    <br />
                    EMAIL:
            <asp:Label ID="AGENT_EMAILLabel" runat="server" Text='<%# Eval("AGENT_EMAIL") %>' />
                    <br />
                    AGENCY LOCATION:
            <asp:Label ID="AGENCY_IDLabel" runat="server" Text='<%# Eval("AGENCY_ID") %>' />
                    <br />
                    <br />
                </span>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <span style="">AGENT_LNAME:
            <asp:TextBox ID="AGENT_LNAMETextBox" runat="server" Text='<%# Bind("AGENT_LNAME") %>' />
                    <br />
                    AGENT_FNAME:
            <asp:TextBox ID="AGENT_FNAMETextBox" runat="server" Text='<%# Bind("AGENT_FNAME") %>' />
                    <br />
                    AGENT_PHONE:
            <asp:TextBox ID="AGENT_PHONETextBox" runat="server" Text='<%# Bind("AGENT_PHONE") %>' />
                    <br />
                    AGENT_ADDRESS:
            <asp:TextBox ID="AGENT_ADDRESSTextBox" runat="server" Text='<%# Bind("AGENT_ADDRESS") %>' />
                    <br />
                    AGENT_EMAIL:
            <asp:TextBox ID="AGENT_EMAILTextBox" runat="server" Text='<%# Bind("AGENT_EMAIL") %>' />
                    <br />
                    AGENCY_ID:
            <asp:TextBox ID="AGENCY_IDTextBox" runat="server" Text='<%# Bind("AGENCY_ID") %>' />
                    <br />
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                    <br />
                    <br />
                </span>
            </EditItemTemplate>
            <EmptyDataTemplate>
                <span>No data was returned.</span>
            </EmptyDataTemplate>
            <InsertItemTemplate>
                <span style="">AGENT_LNAME:
            <asp:TextBox ID="AGENT_LNAMETextBox" runat="server" Text='<%# Bind("AGENT_LNAME") %>' />
                    <br />
                    AGENT_FNAME:
            <asp:TextBox ID="AGENT_FNAMETextBox" runat="server" Text='<%# Bind("AGENT_FNAME") %>' />
                    <br />
                    AGENT_PHONE:
            <asp:TextBox ID="AGENT_PHONETextBox" runat="server" Text='<%# Bind("AGENT_PHONE") %>' />
                    <br />
                    AGENT_ADDRESS:
            <asp:TextBox ID="AGENT_ADDRESSTextBox" runat="server" Text='<%# Bind("AGENT_ADDRESS") %>' />
                    <br />
                    AGENT_EMAIL:
            <asp:TextBox ID="AGENT_EMAILTextBox" runat="server" Text='<%# Bind("AGENT_EMAIL") %>' />
                    <br />
                    AGENCY_ID:
            <asp:TextBox ID="AGENCY_IDTextBox" runat="server" Text='<%# Bind("AGENCY_ID") %>' />
                    <br />
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                    <br />
                    <br />
                </span>
            </InsertItemTemplate>
            <ItemTemplate>
                <span style="">NAME:
            <asp:Label ID="AGENT_FNAMELabel" runat="server" Text='<%# Eval("AGENT_FNAME") %>' />
                    <asp:Label ID="AGENT_LNAMELabel" runat="server" Text='<%# Eval("AGENT_LNAME") %>' />
                    <br />
                    AGENT_PHONE:
            <asp:Label ID="AGENT_PHONELabel" runat="server" Text='<%# Eval("AGENT_PHONE") %>' />
                    <br />
                    AGENT_ADDRESS:
            <asp:Label ID="AGENT_ADDRESSLabel" runat="server" Text='<%# Eval("AGENT_ADDRESS") %>' />
                    <br />
                    EMAIL:
            <asp:Label ID="AGENT_EMAILLabel" runat="server" Text='<%# Eval("AGENT_EMAIL") %>' />
                    <br />
                    AGENCY LOCATION:
            <asp:Label ID="AGENCY_IDLabel" runat="server" Text='<%# Eval("AGENCY_ID") %>' />
                    <br />
                    <br />
                </span>
            </ItemTemplate>
            <LayoutTemplate>
                <div id="itemPlaceholderContainer" runat="server" style="">
                    <span runat="server" id="itemPlaceholder" />
                </div>
                <div style="">
                </div>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <span style="">AGENT_LNAME:
            <asp:Label ID="AGENT_LNAMELabel" runat="server" Text='<%# Eval("AGENT_LNAME") %>' />
                    <br />
                    AGENT_FNAME:
            <asp:Label ID="AGENT_FNAMELabel" runat="server" Text='<%# Eval("AGENT_FNAME") %>' />
                    <br />
                    AGENT_PHONE:
            <asp:Label ID="AGENT_PHONELabel" runat="server" Text='<%# Eval("AGENT_PHONE") %>' />
                    <br />
                    AGENT_ADDRESS:
            <asp:Label ID="AGENT_ADDRESSLabel" runat="server" Text='<%# Eval("AGENT_ADDRESS") %>' />
                    <br />
                    AGENT_EMAIL:
            <asp:Label ID="AGENT_EMAILLabel" runat="server" Text='<%# Eval("AGENT_EMAIL") %>' />
                    <br />
                    AGENCY_ID:
            <asp:Label ID="AGENCY_IDLabel" runat="server" Text='<%# Eval("AGENCY_ID") %>' />
                    <br />
                    <br />
                </span>
            </SelectedItemTemplate>
        </asp:ListView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RealImaginaryConnectionString %>" SelectCommand="SELECT [AGENT_LNAME], [AGENT_FNAME], [AGENT_PHONE], [AGENT_ADDRESS], [AGENT_EMAIL], [AGENCY_ID] FROM [AGENT]"></asp:SqlDataSource>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="Server">
</asp:Content>

