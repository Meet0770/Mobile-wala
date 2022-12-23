using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Products : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=C:\Users\dipak\OneDrive\Documents\Visual Studio 2013\WebSites\ApniDukan\App_Data\Apni Dulan.mdf;Integrated Security=True");
    protected void Page_Load(object sender, EventArgs e)
    {
        if(Session["username"]!=null)
        {
            lblstsmsg.Text = "Welcome," + Session["username"].ToString();
        }
        else
        {
            lblstsmsg.Text = "Welcome To Apni Dukan";
        }
    }
    
    

    protected void DataList1_ItemCommand1(object source, DataListCommandEventArgs e)
    {
        Session["addproduct"] = "true";
        if (e.CommandName == "AddToCart")
        {
            DropDownList List = (DropDownList)(e.Item.FindControl("selitm"));
           Response.Redirect("ShoppingCart.aspx?id=" + e.CommandArgument.ToString() + "&quantity=" + List.SelectedItem.ToString());
        }
    }
    protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        
    }


    protected void srchbtn_Click(object sender, ImageClickEventArgs e)
    {
        SqlConnection cn = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=C:\Users\dipak\OneDrive\Documents\Visual Studio 2013\WebSites\ApniDukan\App_Data\Apni Dulan.mdf;Integrated Security=True");
        SqlDataAdapter sda = new SqlDataAdapter("select * from Products where (Name like '%" + txtsearch.Text + "%') or (Category like '%" + txtsearch.Text + "%')", cn);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        DataList1.DataSourceID = null; 
        DataList1.DataBind();
    }
}