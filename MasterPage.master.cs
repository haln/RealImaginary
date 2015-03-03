using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //If it's not the first page, grab filter settings and set them appropriately
        if (HttpContext.Current.Request["ctl00$budgetMin"] != null)
        {
            budgetMin.Items.FindByValue(HttpContext.Current.Request["ctl00$budgetMin"]).Selected = true;
            budgetMax.Items.FindByValue(HttpContext.Current.Request["ctl00$budgetMax"]).Selected = true;
        }
    }
}
