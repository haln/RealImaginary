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
        Session["results"] = new Result("","0","9999999999","","1","1","0",null);
        Response.Redirect("Results.aspx");
    }
}