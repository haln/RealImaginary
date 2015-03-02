using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["House"] != null && Session["Agent"] != null)
        {
            lbl_address.Text = ((House)Session["House"]).address;
            lbl_age.Text = ((House)Session["House"]).age;
            lbl_ask.Text = ((House)Session["House"]).askPrice;
            lbl_bath.Text = ((House)Session["House"]).baths;
            lbl_bed.Text = ((House)Session["House"]).beds;
            lbl_features.Text = ((House)Session["House"]).features;
            lbl_propSqrFeet.Text = ((House)Session["House"]).propSqrFeet;
            lbl_sqrFeet.Text = ((House)Session["House"]).sqrFeet;
            lbl_type.Text = ((House)Session["House"]).buildingType;
            lbl_agentEmail.Text = ((Agent)Session["Agent"]).email;
            lbl_agentName.Text = ((Agent)Session["Agent"]).name;
            lbl_agentPhone.Text = ((Agent)Session["Agent"]).phone;
        }
    }
}