using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            if (Session["username"] != null)
                Response.Redirect("Home.aspx");
        }
    }
    protected void cmdlogin_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=C:\Users\dipak\OneDrive\Documents\Visual Studio 2013\WebSites\ApniDukan\App_Data\Apni Dulan.mdf;Integrated Security=True"); 
        SqlDataAdapter sda =new SqlDataAdapter("select * from Register where Email='" +txtemail.Text + "' and Password='"+txtpass.Text+"'",con);
        DataTable dt1 = new DataTable();
        sda.Fill(dt1);
        if(txtemail.Text=="admin@gmail.com"&txtpass.Text=="123")
        {
            Response.Redirect("Admin.aspx");
            lblmsg.Text = "Welcome Admin !";
        }
        else if(dt1.Rows.Count == 1)
        {
            Session["username"] = txtemail.Text;
            Session["buyitems"] = null;
            fillsavedcart();
            Response.Redirect("Home.aspx");
        }
        else
        {
            lblmsg.Text = "User Does Not Exists !";
            lblmsg.ForeColor = System.Drawing.Color.Red;
        }
    }
    private void fillsavedcart()
    {
        DataTable dt2 = new DataTable();
        DataRow dr;
        dt2.Columns.Add("sno");
        dt2.Columns.Add("pid");
        dt2.Columns.Add("pname");
        dt2.Columns.Add("pimage");
        dt2.Columns.Add("pdesc");
        dt2.Columns.Add("pprice");
        dt2.Columns.Add("pquantity");
        dt2.Columns.Add("ptotalprice");
        SqlConnection con2 = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=C:\Users\dipak\OneDrive\Documents\Visual Studio 2013\WebSites\ApniDukan\App_Data\Apni Dulan.mdf;Integrated Security=True");
        SqlDataAdapter sda = new SqlDataAdapter("select * from Cart where email='" + Session["username"].ToString()+"'", con2);
        DataSet ds = new DataSet();
        sda.Fill(ds);
        if(ds.Tables[0].Rows.Count>0)
        {
            int i = 0;
            int counter = ds.Tables[0].Rows.Count;
            while(i<counter)
            {
                dr = dt2.NewRow();
                dr["sno"] = i + 1;
                dr["pid"] = ds.Tables[0].Rows[i]["Product_Id"].ToString();
                dr["pname"] = ds.Tables[0].Rows[i]["pname"].ToString();
                dr["pimage"] = ds.Tables[0].Rows[i]["pimage"].ToString();
                dr["pdesc"] = ds.Tables[0].Rows[0]["pdesc"].ToString();
                dr["pprice"] = ds.Tables[0].Rows[i]["pprice"].ToString();
                dr["pquantity"] = ds.Tables[0].Rows[i]["pquantity"].ToString();
                int price = Convert.ToInt32(ds.Tables[0].Rows[i]["pprice"].ToString());
                int quantity = Convert.ToInt32(ds.Tables[0].Rows[i]["pquantity"].ToString());
                int totalprioce = price * quantity;
                dr["Ptotalprice"] = totalprioce;
                dt2.Rows.Add(dr);
                i = i + 1;
            }
        }
        else
        {
            Session["buyitems"]=null;
        }
        Session["buyitems"]=dt2;
    }
}