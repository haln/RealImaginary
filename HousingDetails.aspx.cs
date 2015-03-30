using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    DataView agentTable;
    DataRowView agentRow;
    Agent agent;

    protected void Page_Load(object sender, EventArgs e)
    {
        // Create the agent object for agent contact info
        if (Session["AgentID"] != null)
        {
            agentTable = (DataView)sqlds_agent.Select(DataSourceSelectArguments.Empty);
            agentTable.RowFilter = "AGENT_ID = " + Session["AgentID"];
            agentRow = agentTable[0];
            agent = new Agent(agentRow[3].ToString() + " " + agentRow[2].ToString(),
                agentRow[5].ToString(), agentRow[6].ToString());
        }

        //Display house details using house object sent with session object
        if (Session["House"] != null)
        {
            lbl_address.Text = ((House)Session["House"]).address.ToString();
            lbl_age.Text = ((House)Session["House"]).age;
            lbl_ask.Text = ((House)Session["House"]).askPrice;
            lbl_bath.Text = ((House)Session["House"]).baths;
            lbl_bed.Text = ((House)Session["House"]).beds;
            lbl_features.Text = ((House)Session["House"]).features;
            lbl_propSqrFeet.Text = ((House)Session["House"]).propSqrFeet;
            lbl_sqrFeet.Text = ((House)Session["House"]).sqrFeet;
            lbl_type.Text = ((House)Session["House"]).buildingType;
            img_house.ImageUrl = ((House)Session["House"]).picture;
        }

        //Display the agent details using the agent object
        if (agent != null)
        {
            lbl_agentEmail.Text = agent.email;
            lbl_agentName.Text = agent.name;
            lbl_agentPhone.Text = agent.phone;
        }
    }
}