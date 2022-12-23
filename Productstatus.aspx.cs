using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Productstatus : System.Web.UI.Page
{

    SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=C:\Users\dipak\OneDrive\Documents\Visual Studio 2013\WebSites\ApniDukan\App_Data\Apni Dulan.mdf;Integrated Security=True");
    public int val;
    public void page_Init(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            status();
            DataBind();
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    public void status()
    {
        if (Session["username"] == null)
        {
            Response.Redirect("Login.aspx");
        }
        else
        {
            string status = "";
            string orderid = "";
            string userid = Session["username"].ToString();
            SqlDataAdapter sda = new SqlDataAdapter("select * from orderdate inner join(select max(orderdate)as LatestDate,id as userid from Orderdtls Group by id) SubMax on Orderdtls.id=SubMax.userid where id ='" + userid + "'", con);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            if (dt.Rows.Count == 1)
            {
                orderid = dt.Rows[0][0].ToString();
                status = dt.Rows[0][8].ToString();
                //lblOrderID.text = orderid;
                val = 25;
                SqlDataAdapter sda1 = new SqlDataAdapter("selet * from orderdtls where id='" + userid + "'", con);
                DataTable dt1 = new DataTable();
                sda1.Fill(dt1);
                if (dt1.Rows.Count > 1)
                {
                    HyperLink1.Visible = true;
                }
                else
                {
                    HyperLink1.Visible = false;
                }
            }
            else
            {
                Response.Redirect("Home.aspx");
            }
            if (status == "complete")
            {
                val = 0;
                Page.Header.Controls.Add(new System.Web.UI.LiteralControl("<link rel=\"stylesheet\"text/css\"href=\"" + ResolveUrl("~/CSS/StatusStyle.css") + "\"/>"));
            }
        }
    }
}