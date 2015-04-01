using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_listing : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        String auth = (String)Session["AccountType"];
        if (auth != "admin")
        {
            btnAgentsManage.Visible = false;
            btnListingManage.Visible = false;
        }
        else if (auth == "admin")
        {
            btnAgentsManage.Visible = true;
            btnListingManage.Visible = true;
        }
    }
    protected void signout_Click1(object sender, EventArgs e)
    {
        Session["UserName"] = null;
        Session["AccountType"] = null;

        Response.Redirect("default.aspx");
    }
}

