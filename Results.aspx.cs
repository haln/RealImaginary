using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Results : System.Web.UI.Page
{
    DataView housingTable;
    DataView evalTable;
    DataRowView house;
    DataRowView eval;
    protected void Page_Load(object sender, EventArgs e)
    {
        //Setup and grab data from database
        housingTable = (DataView)housingData.Select(DataSourceSelectArguments.Empty);
        evalTable = (DataView)evalData.Select(DataSourceSelectArguments.Empty);
        var c = HttpContext.Current;
        String houseFilterString = "HOUSE_ASKINGPRICE >=" + c.Request["budgetMin"] + "AND HOUSE_ASKINGPRICE <="+c.Request["budgetMax"];
        
        //Filter view for generating results page
        housingTable.RowFilter = houseFilterString;
        
        //Generate javascript to generate results page by individual houses
        string myscript = "<script>document.getElementById(\"resultsDiv\").innerHTML += \"";
        for (int i = 0; i < housingTable.Count; i++) {
            house = housingTable[i];
            //Filter evaluation table for the desired house
            evalTable.RowFilter = "HOUSE_ID = " + house[0].ToString();
            eval = evalTable[0];
            //Every line added to myscript represents one piece of data
            myscript += "<p id='housenum" + i + "'>";
            myscript += "houseID = " + house[0].ToString();
            myscript += " buyerID = " + house[1].ToString();
            myscript += " sellerID = " + house[2].ToString();
            myscript += " agentID = " + house[3].ToString();
            myscript += " house_address = " + house[4].ToString();
            myscript += " house_askingprice = " + house[6].ToString();
            myscript += " house_sellingprice = " + house[7].ToString();
            myscript += " eval_id = " + eval[0].ToString();
            myscript += " eval_house_sqft = " + eval[4].ToString();
            myscript += " eval_prop_sqft = " + eval[5].ToString();
            myscript += " <asp:LinkButton runat=\"server\" OnCommand=\"LinkButton1_Click\" CommandArguments=\""+house[0].ToString()+","+eval[0].ToString()+"\">Link to house details</asp:LinkButton>";
            myscript += "</p>";
        }
        myscript += "\";</script>";

        //Run the generated javascript to populate the page
        Page.ClientScript.RegisterStartupScript(this.GetType(), "mykey", myscript, false);
    }
    protected void LinkButton1_Click(object sender, CommandEventArgs e)
    {
        String[] args = e.CommandArgument.ToString().Split(new char[] { ',' });
        housingTable.RowFilter = "HOUSE_ID = " + args[0];
        evalTable.RowFilter = "EVAL_ID = " + args[1];
        house = housingTable[0];
        eval = evalTable[0];
        House theHouse = new House(house[0].ToString(), house[4].ToString(), house[6].ToString(),
            house[8].ToString(),eval[11].ToString(),eval[4].ToString(),eval[5].ToString(),
            eval[8].ToString(),eval[10].ToString(),eval[12].ToString(),eval[7].ToString());
        Session["House"] = theHouse;
    }
}