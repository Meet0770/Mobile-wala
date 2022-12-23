using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Home : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(Session["username"]!=null)
        {
            cmdlogout.Visible = true;
            cmdlogin.Visible = false;
        }
        else
        {
            cmdlogout.Visible = false;
            cmdlogin.Visible = true;
        }
        DataTable dt = new DataTable();
        dt = (DataTable)Session["buyitems"];
        if (dt != null)
        {
            lblcrtcnt.Text = dt.Rows.Count.ToString();
        }
        else
        {
            lblcrtcnt.Text = "0";
        }
       
    }
    protected void cmdlogout_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        cmdlogin.Visible = true;
        cmdlogout.Visible = false;
    }
    protected void cmdlogin_Click(object sender, EventArgs e)
    {
        Response.Redirect("Login.aspx");
        cmdlogout.Visible = true;
        cmdlogin.Visible = false;
    }
    protected void cmdaddpdt_Click(object sender, EventArgs e)
    {
        if (Session["username"] != null)
        {
            string userid = Session["username"].ToString();
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=C:\Users\dipak\OneDrive\Documents\Visual Studio 2013\WebSites\ApniDukan\App_Data\Apni Dulan.mdf;Integrated Security=True");
            SqlDataAdapter sda = new SqlDataAdapter("select * from orderdtls where id='" + userid + "'", con);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                Response.Redirect("Productstatus.aspx");
            }
        }
        else
        {
            Response.Redirect("Login.aspx");
        }
    }
    protected void cmdsearch_Click(object sender, ImageClickEventArgs e)
    {
       // SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=C:\Users\dipak\OneDrive\Documents\Visual Studio 2013\WebSites\ApniDukan\App_Data\Apni Dulan.mdf;Integrated Security=True");
       // SqlDataAdapter sda = new SqlDataAdapter("select * from Products where (Name like'%" + txtsearch.Text + "%') or (Category like '%" + txtsearch.Text + "%')", con);
       // DataTable dt = new DataTable();
       // sda.Fill(dt);
       // Request.Form["DataList1.DataSourceID"] = null;
       // Request.Form["DataList1.DataSource"] = dt;

    }
}
