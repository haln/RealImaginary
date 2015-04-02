using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
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
        if ((string)Session["AccountType"] != "admin")
        {
            btnAgentsManage.Visible = false;
            btnListingManage.Visible = false;
        }

    }


    protected void btnAddProperty_Click(object sender, EventArgs e)
    {
        DataView houseTable = (DataView)SqlDataSource6.Select(DataSourceSelectArguments.Empty);

        SqlDataSource1.InsertParameters["HOUSE_ID"].DefaultValue = (houseTable.Count + 6001).ToString();
        SqlDataSource1.InsertParameters["BUYER_ID"].DefaultValue = buyerDrop.SelectedValue;
        SqlDataSource1.InsertParameters["SELLER_ID"].DefaultValue = sellerDrop.SelectedValue;
        SqlDataSource1.InsertParameters["AGENT_ID"].DefaultValue = agentDrop.SelectedValue;
        SqlDataSource1.InsertParameters["HOUSE_ADDRESS"].DefaultValue = tbAddress.Text;
        SqlDataSource1.InsertParameters["HOUSE_STATE"].DefaultValue = RadioButtonList1.SelectedValue;
        SqlDataSource1.InsertParameters["HOUSE_ASKINGPRICE"].DefaultValue = tbAsking.Text;
        SqlDataSource1.InsertParameters["HOUSE_SELLINGPRICE"].DefaultValue = tbSelling.Text;
        SqlDataSource1.InsertParameters["HOUSE_PICTURE"].DefaultValue = null;

        try
        {
            SqlDataSource1.Insert();
            buyerDrop.SelectedValue = "";
            sellerDrop.SelectedValue = "";
            agentDrop.SelectedValue = "";
            tbAddress.Text = "";
            RadioButtonList1.SelectedValue = null;
            tbAsking.Text = "";
            tbSelling.Text = "";


        }
        catch (Exception ex)
        {
            lblError.Text = "A database error has occurred. " + " Message: " + ex.Message;
        }
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

