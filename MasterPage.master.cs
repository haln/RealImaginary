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
            city.Items.FindByValue(HttpContext.Current.Request["ctl00$city"]).Selected = true;
            bedrooms.Items.FindByValue(HttpContext.Current.Request["ctl00$bedrooms"]).Selected = true;
            bathrooms.Items.FindByValue(HttpContext.Current.Request["ctl00$bathrooms"]).Selected = true;
            squareFootage.Items.FindByValue(HttpContext.Current.Request["ctl00$squareFootage"]).Selected = true;
            if (HttpContext.Current.Request["ctl00$propertyType"] != null)
            {
                String[] propType = HttpContext.Current.Request["ctl00$propertyType"].ToString().Split(',');
                for (int i = 0; i < propType.Length; i++)
                {
                    propertyType.Items.FindByValue(propType[i]).Selected = true;
                }
            }
        }
    }
}
