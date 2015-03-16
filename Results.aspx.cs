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
        var masterPost = Master.Request;
        
        //Setup and grab data from database
        housingTable = (DataView)housingData.Select(DataSourceSelectArguments.Empty);
        evalTable = (DataView)evalData.Select(DataSourceSelectArguments.Empty);
        
        //The string used to filter for the desired houses
        String houseFilterString = "HOUSE_ASKINGPRICE >=" + masterPost["ctl00$budgetMin"] + " AND HOUSE_ASKINGPRICE <=" + masterPost["ctl00$budgetMax"];

        //Grab data from the house and evaluation tables
        //Fill the DataList with the filtered grabbed data
        DataView allTable = (DataView)HouseJoinEvalDataSource.Select(DataSourceSelectArguments.Empty);
        allTable.RowFilter = houseFilterString;
        DataList1.DataSource = allTable;
        DataList1.DataBind();
        
        /*Script for generated HTML to display search results - not necessary with DataList
         * 
        //Generate javascript to generate results page by individual houses
        housingTable.RowFilter = houseFilterString;
        String evalid;
        string myscript = "<script>document.getElementById(\"resultsDiv\").innerHTML += \"";
        for (int i = 0; i < housingTable.Count; i++) {
            house = housingTable[i];
            //Filter evaluation table for the desired house
            evalTable.RowFilter = "HOUSE_ID = " + house[0].ToString();
            //Every line added to myscript represents one piece of data
            myscript += "<p id='housenum" + i + "'>";
            myscript += "houseID = " + house[0].ToString();
            myscript += " buyerID = " + house[1].ToString();
            myscript += " sellerID = " + house[2].ToString();
            myscript += " agentID = " + house[3].ToString();
            myscript += " house_address = " + house[4].ToString();
            myscript += " house_askingprice = " + house[6].ToString();
            myscript += " house_sellingprice = " + house[7].ToString();
            //If there is an evaluation, add some survey data
            if (evalTable.Count > 0)
            {
                eval = evalTable[0];
                evalid = eval[0].ToString();
                myscript += " eval_id = " + evalid;
                myscript += " eval_house_sqft = " + eval[4].ToString();
                myscript += " eval_prop_sqft = " + eval[5].ToString();
            }
            else
            {
                evalid = "-1";
                myscript += " no evaluation done ";
            }
            //myscript += " <asp:LinkButton runat=\"server\" OnCommand=\"LinkButton1_Click\" CommandArgument=\""+house[0].ToString()+","+evalid+"\">Link to house details</asp:LinkButton>";
            myscript += "</p>";
        }
        myscript += "\";</script>";
        //Run the generated javascript to populate the page
        Page.ClientScript.RegisterStartupScript(this.GetType(), "mykey", myscript, false);
        */
    }
    protected void LinkButton1_Click(object sender, CommandEventArgs e)
    {
        House theHouse;
        String[] args = e.CommandArgument.ToString().Split(',');
        housingTable.RowFilter = "HOUSE_ID = " + args[0];
        house = housingTable[0];
        //Pass a House object with evaluation data
        if (args[1] != "")
        {
            evalTable.RowFilter = "EVAL_ID = " + args[1];
            eval = evalTable[0];
            theHouse = new House(house[0].ToString(), house[4].ToString(), house[6].ToString(),
            house[8].ToString(), eval[11].ToString(), eval[4].ToString(), eval[5].ToString(),
            eval[8].ToString(), eval[10].ToString(), eval[12].ToString(), eval[7].ToString());
        }
        //If there is no evaluation then pass only the house data
        else
        {
            theHouse = new House(house[0].ToString(), house[4].ToString(), house[6].ToString(),
            house[8].ToString());
        }
        //Fill the Session with data and transfer to housingdetails
        Session["House"] = theHouse;
        Session["AgentID"] = house[3].ToString();
        Server.Transfer("HousingDetails.aspx");
    }
}