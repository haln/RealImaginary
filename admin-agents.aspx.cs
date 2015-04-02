using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
public partial class admin : System.Web.UI.Page
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
        DataView agentTable = (DataView)SqlDataSource3.Select(DataSourceSelectArguments.Empty);
        
        SqlDataSource1.InsertParameters["AGENT_ID"].DefaultValue = (agentTable.Count + 3001).ToString();
        SqlDataSource1.InsertParameters["AGENCY_ID"].DefaultValue = agencyDrop.SelectedValue;
        SqlDataSource1.InsertParameters["AGENT_LNAME"].DefaultValue = tbLName.Text;
        SqlDataSource1.InsertParameters["AGENT_FNAME"].DefaultValue = tbFName.Text;
        SqlDataSource1.InsertParameters["AGENT_ADDRESS"].DefaultValue = tbAddress.Text;
        SqlDataSource1.InsertParameters["AGENT_PHONE"].DefaultValue = tbPhone.Text;
        SqlDataSource1.InsertParameters["AGENT_EMAIL"].DefaultValue = tbEmail.Text;

        try
        {
            SqlDataSource1.Insert();
            agencyDrop.SelectedValue = "";
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
        Session["AccountType"] = null;

        Response.Redirect("default.aspx");
    }
    protected void manage_Click(object sender, EventArgs e)
    {

    }
    protected void signin_Click(object sender, EventArgs e)
    {

    }
    protected void signup_Click(object sender, EventArgs e)
    {

    }
}