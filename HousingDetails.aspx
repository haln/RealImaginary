<%@ Page Language="C#" AutoEventWireup="true" CodeFile="HousingDetails.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Real Imaginary - The Real Estate Agency</title>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.js"></script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1/jquery-ui.min.js"></script>
    <link rel="stylesheet" type="text/css" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1/themes/ui-lightness/jquery-ui.css" />
    <script src="jquery-ui-multiselect-widget-master/src/jquery.multiselect.js"></script>
    <link href="jquery-ui-multiselect-widget-master/jquery.multiselect.css" rel="stylesheet" />
    <script type="text/javascript">
        $(document).ready(function () {
            $(".singleSelect").multiselect({
                multiple: false,
                header: "Select an option",
                noneSelectedText: "Select an Option",
                selectedList: 1
            });
            $(".multipleSelect").multiselect({
                selectedList: 3
            });
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div id ="login">
            Username:<input id="userlogin" type="text" /> Password:<input id="passwordlogin" type="password" />
        </div>
        <div id="bannerMenu">
            <img src="realBanner.png" alt="Real Imaginary - The Real Estate Agency" /><br />
            <a href="HousingDetails.aspx"><img src="homeButton.png"/></a>
            <a href="SellHouse.aspx"><img src="sellHouse.png" /></a>
            <a href="ContactUs.aspx"><img src="contactUs.png" /></a>
        </div>
        <div id="search">
            <h4>Search Bar</h4>
            <input id="searchBar" type="text" />
            <input id="searchSubmit" runat="server" value="Submit" type="submit"/>
            <h4>Filters</h4>
            <label for="budgetMin"">Min</label>
            <select id="budgetMin" name="budgetMin" class="singleSelect">
                <option value="0">$0</option>
                <option value="50000">$50,000</option>
                <option value="100000">$100,000</option>
                <option value="200000">$200,000</option>
                <option value="500000">$500,000</option>
                <option value="1000000">$1,000,000</option>
                <option value="10000000">$10,000,000</option>
                <option value="0">Unlimited</option>
            </select>
            <label for="budgetMax">Max</label>
            <select id="budgetMax" name="budgetMax" class="singleSelect">
                <option value="50000">$50,000</option>
                <option value="100000">$100,000</option>
                <option value="200000">$200,000</option>
                <option value="500000">$500,000</option>
                <option value="1000000">$1,000,000</option>
                <option value="10000000">$10,000,000</option>
                <option value="9999999999">Unlimited</option>
            </select>
            <label for="city">City</label>
            <select id="city" name="city" class="singleSelect">
                <option>Vancouver</option>
                <option>Richmond</option>
                <option>Burnaby</option>
            </select>
            <label for="bedrooms">Bedrooms</label>
            <select id="bedrooms" name="bedrooms" class="singleSelect">
                <option>1+</option>
                <option>2+</option>
                <option>3+</option>
                <option>4+</option>
                <option>5+</option>
            </select>
            <label for="bathrooms">Bathrooms</label>
            <select id="bathrooms" name="bathrooms" class="singleSelect">
                <option>1+</option>
                <option>2+</option>
                <option>3+</option>
                <option>4+</option>
                <option>5+</option>
            </select>
            <label for="squareFootage">Sq. Ft.</label>
            <select id="squareFootage" name="squareFootage" class="singleSelect">
                <option>Any</option>
                <option>50ft+</option>
                <option>100ft+</option>
                <option>200ft+</option>
                <option>500ft+</option>
                <option>1000ft+</option>
                <option>2000ft+</option>
                <option>5000ft+</option>
                <option>10000ft+</option>
            </select>
            <label for="propertyType">Property Types</label>
            <select title="Property Type" id="propertyType" multiple="multiple" name="propertyType" class="multipleSelect">
                <option value="condo">Condominium</option>
                <option value="townhouse">Townhouse</option>
                <option value="house">House</option>
                <option value="rental">Lease/Rental</option>
                <option value="farm">Farmland</option>
                <option value="commercial">Commercial</option>
            </select>
        </div>
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
    </form>
</body>
</html>
