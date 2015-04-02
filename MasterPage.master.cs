using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    DataView accountTable;
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
            manage.Visible = true;

        }
        //If it's not the first page, grab filter settings and set them appropriately
        if (Session["results"] != null)
        {
            searchBar.Text = ((Result)Session["results"]).searchStr;
            budgetMin.Items.FindByValue(((Result)Session["results"]).budgetMin).Selected = true;
            budgetMax.Items.FindByValue(((Result)Session["results"]).budgetMax).Selected = true;
            city.Items.FindByValue(((Result)Session["results"]).city).Selected = true;
            bedrooms.Items.FindByValue(((Result)Session["results"]).bedrooms).Selected = true;
            bathrooms.Items.FindByValue(((Result)Session["results"]).bathrooms).Selected = true;
            squareFootage.Items.FindByValue(((Result)Session["results"]).sqft).Selected = true;
            if (((Result)Session["results"]).ptype != null)
            {
                String[] propType = ((Result)Session["results"]).ptype.ToString().Split(',');
                for (int i = 0; i < propType.Length; i++)
                {
                    propertyType.Items.FindByValue(propType[i]).Selected = true;
                }
            }
        }


    }
    protected void signin_Click(object sender, EventArgs e)
    {

        SqlDataSource1.DataBind();
        accountTable = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
        if (accountTable != null)
        {
            if (accountTable.Count == 0)
            {
                Response.Write("<script>alert('Login failed!')</script>");
            }
            if (accountTable.Count == 1)
            {
                Session["UserName"] = username.Text;
                DataRowView thing = accountTable[0];
                Session["AccountType"] = thing[3];
                string accountType = Session["AccountType"] as string;


                Response.Redirect(Request.RawUrl);

            }
        }
    }
    protected void signup_Click(object sender, EventArgs e)
    {
        Response.Redirect("SignUp.aspx");
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        System.Web.HttpRequest req = HttpContext.Current.Request;
        Session["results"] = new Result(req["ctl00$searchBar"], req["ctl00$budgetMin"], req["ctl00$budgetMax"], req["ctl00$city"],
            req["ctl00$bedrooms"], req["ctl00$bathrooms"], req["ctl00$squareFootage"], req["ctl00$propertyType"]);
        Response.Redirect("Results.aspx");
    }
    protected void manage_Click(object sender, EventArgs e)
    {
        string accountType = Session["AccountType"] as string;
        switch (accountType)
        {
            case "agent":
                Response.Redirect("admin-listing.aspx");
                break;
            case "admin":
                Response.Redirect("admin-agents.aspx");
                break;
            case "customer":
                Response.Write("<script>alert('The management page for user profile is still in construction ^_^ ')</script>");
                break;
            default:
                return;

        }

    }
    protected void signout_Click(object sender, EventArgs e)
    {
        Session["UserName"] = null;
        Session["AccountType"] = null;

        Response.Redirect(Request.RawUrl);
    }
}
