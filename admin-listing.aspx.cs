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
        if (Session["username"] != null)
        {
            signin.Visible = false;
            signup.Visible = false;
            username.Visible = false;
            password.Visible = false;
            Label1.Text = "Welcome, " + Session["username"];
            signout.Visible = true;
            manage.Visible = false;

        }

    }


    protected void btnAddAgent_Click(object sender, EventArgs e)
    {
      
    }
    protected void signup_Click(object sender, EventArgs e)
    {

    }
    protected void signin_Click(object sender, EventArgs e)
    {

    }
    protected void manage_Click(object sender, EventArgs e)
    {

    }
    protected void signout_Click(object sender, EventArgs e)
    {
        Session["UserName"] = null;
        Session["AccountType"] = null;

        Response.Redirect("default.aspx");
    }
}

