using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

public partial class SignUp : System.Web.UI.Page
{
    DataView accountTable;
    DataView accTable;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlDataSource2.DataBind();
        accountTable = (DataView)SqlDataSource2.Select(DataSourceSelectArguments.Empty);

        
        accTable = (DataView)SqlDataSource3.Select(DataSourceSelectArguments.Empty);
        string userName = this.UserName.Text;
        string passWord = this.Password.Text;
        string type = "customer";
        int accId = accTable.Count + 1;
        string linkId = "5";

        if (accountTable.Count == 0)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["RealImaginaryConnectionString"].ToString());
            String cmdstr = "insert into ACCOUNT(ACC_ID,ACC_USER,ACC_PASS,ACC_TYPE,ACC_LINKID)values('" + accId + "','" + userName + "','" + passWord + "','" + type + "','" + linkId + "')";
            SqlCommand cmd = new SqlCommand(cmdstr, conn);

            cmd.Parameters.Add("@ACC_ID", SqlDbType.Int).Value = accId;
            cmd.Parameters.Add("@ACC_USER",SqlDbType.VarChar).Value = userName;
            cmd.Parameters.Add("@ACC_PASS",SqlDbType.VarChar).Value = passWord;
            cmd.Parameters.Add("@ACC_TYPE", SqlDbType.VarChar).Value = type;
            cmd.Parameters.Add("@ACC_LINKID", SqlDbType.Char).Value = linkId;

            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
            Response.Write("<script>alert('successful!');location='SignUp.aspx'</script>");
            Response.Redirect("Default.aspx");

        }
        if (accountTable.Count == 1)
        {
            Response.Write("<script>alert('Sign Up failed, the user name already exists')</script>");
        }
        
    

   
    }
}