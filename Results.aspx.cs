using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Results : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DataView housingTable = (DataView)housingData.Select(DataSourceSelectArguments.Empty);
        var c = HttpContext.Current;
        housingTable.RowFilter = "HOUSE_ASKINGPRICE >=" + c.Request["budgetMin"] + "AND HOUSE_ASKINGPRICE <="+c.Request["budgetMax"];

        DataRowView house;
        string myscript = "<script>document.getElementById(\"resultsDiv\").innerHTML += \"";
        for (int i = 0; i < housingTable.Count; i++) {
            house = housingTable[i];
            myscript += "<p id='housenum" + i + "'>houseID = " + house[0].ToString() + " buyerID = " + house[1].ToString();
            myscript += " sellerID = " + house[2].ToString()+" agentID = "+house[3].ToString()+" house_address = "+house[4].ToString();
            myscript += " house_askingprice = "+house[6].ToString()+" house_sellingprice = "+house[7].ToString()+"</p>";
        }
        myscript += "\";</script>";

        Page.ClientScript.RegisterStartupScript(this.GetType(), "mykey", myscript, false);
    }
}