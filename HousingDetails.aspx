<%@ Page Language="C#" AutoEventWireup="true" CodeFile="HousingDetails.aspx.cs" MasterPageFile="~/MasterPage.master" Inherits="_Default" %>

<asp:Content ContentPlaceHolderID="header" runat="server">        
        </asp:Content> 
<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <br />
        <div id="propertyListings">
            
            <asp:SqlDataSource ID="HousingDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:RealImaginaryConnectionString %>" SelectCommand="SELECT * FROM [AGENT]"></asp:SqlDataSource>
        </div>
        <div id="houseDetail">
            <p class="houseAddress"><asp:Label ID="lbl_address" runat="server" Text=""></asp:Label></p>
            
            House Type: <asp:Label ID="lbl_type" runat="server" Text=""></asp:Label>
            <br /><br />
            <p class="askingPrice">$<asp:Label ID="lbl_ask" runat="server" Text=""></asp:Label></p>
            <br />
            <br />
            Details: <br /><br />
            Square Feet: <asp:Label ID="lbl_sqrFeet" runat="server" Text=""></asp:Label>
            <br />
            Property Sqaure Feet: <asp:Label ID="lbl_propSqrFeet" runat="server" Text=""></asp:Label>
            <br />
            Bedrooms: <asp:Label ID="lbl_bed" runat="server" Text=""></asp:Label>
            <br />
            Bathrooms: <asp:Label ID="lbl_bath" runat="server" Text=""></asp:Label>
            <br />
            Age: <asp:Label ID="lbl_age" runat="server" Text=""></asp:Label>
            <br />
            Additional Features: <asp:Label ID="lbl_features" runat="server" Text=""></asp:Label>
            <br />
        
        <div>
            For more information, please contact: <br />
            <asp:Label ID="lbl_agentName" runat="server" Text=""></asp:Label>
            <br />
            Phone: <asp:Label ID="lbl_agentPhone" runat="server" Text=""></asp:Label>
            <br />
            Email: <asp:Label ID="lbl_agentEmail" runat="server" Text=""></asp:Label>
            <asp:SqlDataSource ID="sqlds_agent" runat="server" ConnectionString="<%$ ConnectionStrings:RealImaginaryConnectionString %>" SelectCommand="SELECT * FROM [AGENT]"></asp:SqlDataSource>
        </div>
            </div>
</asp:Content>
