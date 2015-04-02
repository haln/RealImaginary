using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Sell_House : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void btn_sell_Click(object sender, EventArgs e)
    {
        DataView dv = (DataView)SqlDataSource3.Select(DataSourceSelectArguments.Empty);
        DataTable dt = dv.ToTable();

        DataView dv2 = (DataView)SqlDataSource2.Select(DataSourceSelectArguments.Empty);

        SqlDataSource2.InsertParameters["HOUSE_ID"].DefaultValue = "" + dv2.Count;
        SqlDataSource2.InsertParameters["BUYER_ID"].DefaultValue = null;
        SqlDataSource2.InsertParameters["SELLER_ID"].DefaultValue = (string)dt.Rows[0]["ACC_LINKID"];
        SqlDataSource2.InsertParameters["AGENT_ID"].DefaultValue = ddl_agent.SelectedValue;
        SqlDataSource2.InsertParameters["HOUSE_ADDRESS"].DefaultValue = txt_address.Text;
        SqlDataSource2.InsertParameters["HOUSE_STATE"].DefaultValue = "unsold";
        SqlDataSource2.InsertParameters["HOUSE_ASKINGPRICE"].DefaultValue = txt_price.Text;
        SqlDataSource2.InsertParameters["HOUSE_SELLINGPRICE"].DefaultValue = null;
        SqlDataSource2.InsertParameters["HOUSE_PICTURE"].DefaultValue = null;


        try
        {
            SqlDataSource2.Insert();
            txt_address.Text = "";
            txt_price.Text = "";
            lblError.Text = "";

        }
        catch (Exception ex)
        {
            lblError.Text = "A database error has occurred. " + " Message: " + ex.Message;
        }
    }
}