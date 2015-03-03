<%@ Page Language="C#" AutoEventWireup="true" CodeFile="HousingDetails.aspx.cs" MasterPageFile="~/MasterPage.master" Inherits="_Default" %>

<asp:Content ContentPlaceHolderID="header" runat="server">        
        </asp:Content> 
<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <br />
        <div id="propertyListings">
            <h2>Property Listings</h2>
            <asp:SqlDataSource ID="HousingDataSource" runat="server"></asp:SqlDataSource>
        </div>
        <div>
            Address: <asp:Label ID="lbl_address" runat="server" Text=""></asp:Label>
            <br />
            House Type: <asp:Label ID="lbl_type" runat="server" Text=""></asp:Label>
            <br />
            Asking Price: <asp:Label ID="lbl_ask" runat="server" Text=""></asp:Label>
            <br />
            <br />
            Details: <br />
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
        </div>
        <div>
            For more information, please contact: <br />
            <asp:Label ID="lbl_agentName" runat="server" Text=""></asp:Label>
            <br />
            Phone: <asp:Label ID="lbl_agentPhone" runat="server" Text=""></asp:Label>
            <br />
            Email: <asp:Label ID="lbl_agentEmail" runat="server" Text=""></asp:Label>
        </div>
</asp:Content>
