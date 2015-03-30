<%@ Page Language="C#" AutoEventWireup="true" CodeFile="HousingDetails.aspx.cs" MasterPageFile="~/MasterPage.master" Inherits="_Default" %>

<asp:Content ContentPlaceHolderID="header" runat="server">        
        </asp:Content> 
<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <br />
        <div id="propertyListings">
            
            <asp:SqlDataSource ID="HousingDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:RealImaginaryConnectionString %>" SelectCommand="SELECT * FROM [AGENT]"></asp:SqlDataSource>
        </div>
        <div id="houseDetail">
            <div class="detail1">
            <asp:Label ID="lbl_address" runat="server" Text="" CssClass="address"></asp:Label>           
                <br />
            House Type: <asp:Label ID="lbl_type" runat="server" Text=""></asp:Label> 
                <br />
            <br/>
            Bedrooms: <asp:Label ID="lbl_bed" runat="server" Text=""></asp:Label>
                <br />          
                <br />            
            Bathrooms: <asp:Label ID="lbl_bath" runat="server" Text=""></asp:Label>           
                <br />           
                <br />         
            Age: <asp:Label ID="lbl_age" runat="server" Text=""></asp:Label>
            </div>         
            <div class="detail2">
            <p class="askingPrice">$<asp:Label ID="lbl_ask" runat="server" Text="" CssClass="price"></asp:Label></p>
             Square Feet: <asp:Label ID="lbl_sqrFeet" runat="server" Text=""></asp:Label>
                <br />
            <br />
            Property Sqaure Feet: <asp:Label ID="lbl_propSqrFeet" runat="server" Text=""></asp:Label>
                <br/>
            Additional Features: <asp:Label ID="lbl_features" runat="server" Text=""></asp:Label>
            </div>
            <br />   
        <div class="detail3">
            <asp:Image ID="img_house" runat="server" />
        </div>     
        <div class="detail4">
            For more information, please contact: <br />
            <asp:Label ID="lbl_agentName" runat="server" CssClass="agentInfo"></asp:Label>
            <br />
            Phone: <asp:Label ID="lbl_agentPhone" runat="server" Text="" CssClass="agentPhone"></asp:Label>
            <br />
            Email: <asp:Label ID="lbl_agentEmail" runat="server" Text="" ></asp:Label>
            <asp:SqlDataSource ID="sqlds_agent" runat="server" ConnectionString="<%$ ConnectionStrings:RealImaginaryConnectionString %>" SelectCommand="SELECT * FROM [AGENT]"></asp:SqlDataSource>
          </div>
            <div class="detail5">
                <img src="images/map.png" alt="map"/>
             </div>
            
        </div>
</asp:Content>
