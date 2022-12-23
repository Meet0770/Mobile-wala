using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class PlaceOrder : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=C:\Users\dipak\OneDrive\Documents\Visual Studio 2013\WebSites\ApniDukan\App_Data\Apni Dulan.mdf;Integrated Security=True");
    bool isTrue = false;
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            if(Session["username"] == null)
            {
                Response.Redirect("Login.aspx");
            }
        }
    }
    //save order details into table , decrease product quantity,clear cart
    protected void cmdconord_Click(object sender, EventArgs e)
    {
        if (Session["buyitems"] != null && Session["orderid"] != null)
        {
            DataTable dt = (DataTable)Session["buyitems"];
            for (int i = 0; i <= dt.Rows.Count - 1; i++)
            {
                string pid = dt.Rows[i]["pid"].ToString();
                int pquantity = Convert.ToInt32(dt.Rows[i]["pid"].ToString());
                SqlDataAdapter sda = new SqlDataAdapter("select Quantity from Products where Product_Id='" + pid + "'", con);
                DataTable dt2 = new DataTable();
                sda.Fill(dt2);
                int quantity = Convert.ToInt32(dt2.Rows[0][0]);
                if (quantity > 0)
                {
                    con.Open();
                    //
                    SqlCommand cmd = new SqlCommand("insert into orderdtls (id,sno,productid,pname,pprice,quantity,orderdate,status) values(@id,@sno,@productid,@pname,@pprice,@quantity,@orderdate,@status)", con);
                    cmd.Parameters.AddWithValue("@id", Session["Orderid"].ToString());
                    cmd.Parameters.AddWithValue("@sno", dt.Rows[i]["sno"]);
                    cmd.Parameters.AddWithValue("@productid", dt.Rows[i]["pid"]);
                    cmd.Parameters.AddWithValue("@pname", dt.Rows[i]["pname"]);
                    cmd.Parameters.AddWithValue("@pprice", dt.Rows[i]["pprice"]);
                    cmd.Parameters.AddWithValue("@quantity", dt.Rows[i]["pquantity"]);
                    cmd.Parameters.AddWithValue("@orderdate", DateTime.Now.ToString("dd-MM-yyyy").ToString());
                    cmd.Parameters.AddWithValue("@status", "pending");
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
            DecreaseQuantity();
            ClearCart();
            Session["buyitems"] = null;
            Response.Redirect("Bill.aspx");
        }
        else
        {
            Response.Redirect("ShoppingCart.aspx");
        }
    }
    public void DecreaseQuantity()
    {
        DataTable dt = (DataTable)Session["buyitems"];
        for (int i = 0; i <= dt.Rows.Count - 1; i++)
        {
            string pid = dt.Rows[i]["pid"].ToString();
            int pquantity = Convert.ToInt32(dt.Rows[i]["pquantity"].ToString());
            SqlDataAdapter sda = new SqlDataAdapter("select Quantity from Products where Product_Id='" + pid + "'", con);
            DataTable dt2 = new DataTable();
            sda.Fill(dt2);
            int quantity = Convert.ToInt32(dt2.Rows[0][0]);
            if (quantity > 0)
            {
                int ReducedQuantity = quantity - pquantity;
                con.Open();
                SqlCommand cmd = new SqlCommand("update Products set Quantity='" + ReducedQuantity + "' where Product_Id='" + pid + "'", con);
                cmd.ExecuteNonQuery();
                con.Close();
                isTrue = true;
            }
            else
            {
                isTrue = false;
            }
        }
    }
    public void ClearCart()
    {
        if(Session["username"]!=null)
        {   
            DataTable dt = (DataTable)Session["buyitems"];
            for (int i = 0; i <= dt.Rows.Count - 1; i++)
            {
                int pid = Convert.ToInt32(dt.Rows[i]["pid"]);
                con.Open();
                SqlCommand cmd = new SqlCommand ("delete from Cart where Product_Id='"+pid+"' and email='"+Session["username"]+"'",con);
                cmd.ExecuteNonQuery();
                con.Close();
            }
        }
        else
        {
            Response.Redirect("Login.aspx");
        }
    }
}