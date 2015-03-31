using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnAddAgent_Click(object sender, EventArgs e)
    {
        SqlDataSource1.InsertParameters["AGENT_ID"].DefaultValue = tbAgentID.Text;
        SqlDataSource1.InsertParameters["AGENCY_ID"].DefaultValue = tbAgencyID.Text;
        SqlDataSource1.InsertParameters["AGENT_LNAME"].DefaultValue = tbLName.Text;
        SqlDataSource1.InsertParameters["AGENT_FNAME"].DefaultValue = tbFName.Text;
        SqlDataSource1.InsertParameters["AGENT_ADDRESS"].DefaultValue = tbAddress.Text;
        SqlDataSource1.InsertParameters["AGENT_PHONE"].DefaultValue = tbPhone.Text;
        SqlDataSource1.InsertParameters["AGENT_EMAIL"].DefaultValue = tbEmail.Text;

        try
        {
            SqlDataSource1.Insert();
            tbAgentID.Text = "";
            tbAgencyID.Text = "";
            tbLName.Text = "";
            tbFName.Text = "";
            tbAddress.Text = "";
            tbPhone.Text = "";
            tbEmail.Text = "";

        }
        catch (Exception ex)
        {
            lblError.Text = "A database error has occurred. " + " Message: " + ex.Message;
        }
    }
    protected void GridView1_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {
        if (e.Exception != null)
        {
            lblError.Text = "A database error has occured. " + "Message: " + e.Exception.Message;
            e.ExceptionHandled = true;
            e.KeepInEditMode = true;
        }
        else if (e.AffectedRows == 0)
        {
            lblError.Text = "Another user may have updated that category." + "<br/> Please try again.";
        }
    }
    protected void GridView1_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        if (e.Exception != null)
        {
            lblError.Text = "A database error has occured. " + "Message: " + e.Exception.Message;
            e.ExceptionHandled = true;
        }
        else if (e.AffectedRows == 0)
        {
            lblError.Text = "Another user may have updated that category." + " Please try again.";
        }
    }

    protected void signout_Click(object sender, EventArgs e)
    {
        Session["UserName"] = null;
        Session["userType"] = null;

        Response.Redirect("default.aspx");
    }
}