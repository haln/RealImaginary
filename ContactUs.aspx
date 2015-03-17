<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ContactUs.aspx.cs" MasterPageFile="~/MasterPage.master" Inherits="Contact_us" %>


<asp:Content ContentPlaceHolderID="header" runat="server">        
        </asp:Content> 
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">   
        <h2>Our agents</h2>

            <asp:SqlDataSource ID="HousingDataSource" runat="server"></asp:SqlDataSource>

        <div class="agent">
            <div id="agentPic1" class ="agentPic">
                <img src="agent1.jpg" />
            </div>
            Name:<asp:Label ID="lblName1" runat="server" Text="" CssClass="agentName"></asp:Label>
            <br />
            Email:<asp:Label ID="lblEmail1" runat="server" Text="" CssClass="agentEmail"></asp:Label>
            <br />
            Phone:<asp:Label ID="lblPhone1" runat="server" Text="" CssClass="agentPhone"></asp:Label>
            <br />
            
            <asp:Label ID="lblListing1" runat="server" Text="" CssClass="agentListing"></asp:Label>
        </div>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="footer" runat="server">
                </asp:Content>