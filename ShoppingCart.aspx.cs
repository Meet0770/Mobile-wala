using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ShoppingCart : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=C:\Users\dipak\OneDrive\Documents\Visual Studio 2013\WebSites\ApniDukan\App_Data\Apni Dulan.mdf;Integrated Security=True");
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (!IsPostBack)
        {
            if (Session["username"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            //Adding Product To Gridview
            //Adding DataRow & Then Columns To DataTable
            DataTable dt = new DataTable();
            DataRow dr;
            dt.Columns.Add("sno");
            dt.Columns.Add("pid");
            dt.Columns.Add("pname");
            dt.Columns.Add("pdesc");
            dt.Columns.Add("pimage");
            dt.Columns.Add("pprice");
            dt.Columns.Add("pquantity");
            dt.Columns.Add("ptotalprice");
            if (Request.QueryString["id"] != null)
            {
                if (Session["buyitems"] == null)
                {
                    dr = dt.NewRow();
                    SqlDataAdapter da = new SqlDataAdapter("select * from Products where Product_Id=" + Request.QueryString["id"], con);
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    dr["sno"] = 1;
                    dr["pid"] = ds.Tables[0].Rows[0]["Product_Id"].ToString();
                    dr["pname"] = ds.Tables[0].Rows[0]["Name"].ToString();
                    dr["pdesc"] = ds.Tables[0].Rows[0]["Details"].ToString();
                    dr["pimage"] = ds.Tables[0].Rows[0]["Image"].ToString();
                    dr["pprice"] = ds.Tables[0].Rows[0]["Price"].ToString();
                    dr["pquantity"] = Request.QueryString["Quantity"].ToString();
                    int price = Convert.ToInt32(ds.Tables[0].Rows[0]["Price"].ToString());
                    int quantity = Convert.ToInt16(Request.QueryString["Quantity"].ToString());
                    int totalprice = price * quantity;
                    dr["Ptotalprice"] = totalprice;
                    dt.Rows.Add(dr);
                    con.Open();
                    SqlCommand cmd = new SqlCommand("insert into Cart (sno,Product_Id,pname,pimage,pdesc,pprice,pquantity,email) values(@sno,@Product_Id,@pname,@pimage,@pdesc,@pprice,@pquantity,@email)", con);
                    cmd.Parameters.AddWithValue("@sno", dr["sno"]);
                    cmd.Parameters.AddWithValue("@Product_Id", dr["pid"]);
                    cmd.Parameters.AddWithValue("@pname", dr["pname"]);
                    cmd.Parameters.AddWithValue("@pimage", dr["pimage"]);
                    cmd.Parameters.AddWithValue("@pdesc", dr["pdesc"]);
                    cmd.Parameters.AddWithValue("@pprice", dr["pprice"]);
                    cmd.Parameters.AddWithValue("@pquantity", dr["pquantity"]);
                    cmd.Parameters.AddWithValue("@email", Session["username"].ToString());

                    cmd.ExecuteNonQuery();
                    con.Close();
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                    Session["buyitems"] = dt;
                    cmdbuy.Enabled = true;
                    GridView1.FooterRow.Cells[6].Text = "Total Amount";
                    GridView1.FooterRow.Cells[7].Text = grandtotal().ToString();
                    Response.Redirect("ShoppingCart.aspx");
                }
                else
                {
                    dt = (DataTable)Session["buyitems"];
                    int sr;
                    sr = dt.Rows.Count;
                    dr = dt.NewRow();
                    SqlDataAdapter da = new SqlDataAdapter("select  *from Products where Product_Id=" + Request.QueryString["id"], con);
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    dr["sno"] = sr + 1;
                    dr["pid"] = ds.Tables[0].Rows[0]["Product_Id"].ToString();
                    dr["pname"] = ds.Tables[0].Rows[0]["Name"].ToString();
                    dr["pdesc"] = ds.Tables[0].Rows[0]["Details"].ToString();
                    dr["pimage"] = ds.Tables[0].Rows[0]["Image"].ToString();
                    dr["pprice"] = ds.Tables[0].Rows[0]["Price"].ToString();
                    dr["pquantity"] = Request.QueryString["Quantity"].ToString();
                    int price = Convert.ToInt32(ds.Tables[0].Rows[0]["Price"].ToString());
                    int quantity = Convert.ToInt16(Request.QueryString["Quantity"].ToString());
                    int totalprioce = price * quantity;
                    dr["Ptotalprice"] = totalprioce;
                    dt.Rows.Add(dr);
                    con.Open();
                    SqlCommand cmd = new SqlCommand("insert into Cart (sno,Product_Id,pname,pimage,pdesc,pprice,pquantity,email) values(@sno,@Product_Id,@pname,@pimage,@pdesc,@pprice,@pquantity,@email)", con);
                    cmd.Parameters.AddWithValue("@sno", dr["sno"]);
                    cmd.Parameters.AddWithValue("@Product_Id", dr["pid"]);
                    cmd.Parameters.AddWithValue("@pname", dr["pname"]);
                    cmd.Parameters.AddWithValue("@pimage", dr["pimage"]);
                    cmd.Parameters.AddWithValue("@pdesc", dr["pdesc"]);
                    cmd.Parameters.AddWithValue("@pprice", dr["pprice"]);
                    cmd.Parameters.AddWithValue("@pquantity", dr["pquantity"]);
                    cmd.Parameters.AddWithValue("@email", Session["username"].ToString());
                    cmd.ExecuteNonQuery();
                    con.Close();
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                    Session["buyitems"] = dt;
                    cmdbuy.Enabled = true;
                    GridView1.FooterRow.Cells[6].Text = "Total Amount";
                    GridView1.FooterRow.Cells[7].Text = grandtotal().ToString();
                    Response.Redirect("ShoppingCart.aspx");
                }
            }
            else
            {
                dt = (DataTable)Session["buyitems"];
                GridView1.DataSource = dt;
                GridView1.DataBind();
                if (GridView1.Rows.Count > 0)
                {
                    GridView1.FooterRow.Cells[6].Text = "Total Amount";
                    GridView1.FooterRow.Cells[7].Text = grandtotal().ToString();
                }
            }
        }
        if (GridView1.Rows.Count.ToString() == "0")
        {
            lbclrcart.Enabled = false;
            lbclrcart.ForeColor = System.Drawing.Color.White;
            cmdbuy.Enabled = false;
            cmdbuy.Text = "Oops";
        }
        else
        {
            lbclrcart.Enabled = true;
            cmdbuy.Enabled = true;
        }
        orderid();
    }
    
    public int grandtotal()
    {
        DataTable dt = new DataTable();
        dt = (DataTable)Session["buyitems"];
        int nrow = dt.Rows.Count;
        int i = 0;
        int totalprice = 0;
        while (i < nrow)
        {
            totalprice = totalprice + Convert.ToInt32(dt.Rows[i]["ptotalprice"].ToString());
            i = i + 1;
        }
        return totalprice;
    }
    public void orderid()
    {
        string alpha = "abcdefghijklmnopqrstuvwxyz1234567890";
        Random r = new Random();
        char[] myArray = new char[5];
        for (int i = 0; i < 5; i++)
        {
            myArray[i] = alpha[(int)(35 * r.NextDouble())];
        }
        string orderid;
        orderid = "id" + DateTime.Now.Hour.ToString() + DateTime.Now.Second.ToString() + DateTime.Now.Day.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Year.ToString() + new string(myArray) + DateTime.Now.Minute.ToString()
            + DateTime.Now.Second.ToString();
        Session["orderid"] = orderid;
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        DataTable dt = new DataTable();
        dt = (DataTable)Session["buyitems"];
        for (int i = 0; i <= dt.Rows.Count - 1; i++)
        {
            int sr;
            int sr1;
            string qdata;
            string dtdata;
            sr = Convert.ToInt32(dt.Rows[i]["sno"].ToString());
            TableCell cell = GridView1.Rows[e.RowIndex].Cells[0];
            qdata = cell.Text;
            dtdata = sr.ToString();
            sr1 = Convert.ToInt32(qdata);
            TableCell prID = GridView1.Rows[e.RowIndex].Cells[1];
            if (sr == sr1)
            {
                dt.Rows[i].Delete();
                dt.AcceptChanges();
                con.Open();
                SqlCommand cmd = new SqlCommand("delete top(1) from Cart where Product_Id='" + prID.Text + "'and email ='" + Session["username"] +"'", con);
                cmd.ExecuteNonQuery();
                con.Close();
                //Item Hass Been Deleted From Shopping  Cart
                break;
            }
        }
        //Setting Sno. After deleting Row Item From Cart
        for (int i = 1; i <= dt.Rows.Count; i++)
        {
            dt.Rows[i - 1]["sno"] = i;
            dt.AcceptChanges();
        }
        Session["buyitems"] = dt;
        Response.Redirect("ShoppingCart.aspx");
    }
    //Deleting All Products At Oece
    public void clearcart()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("delete from Cart where Email='" + Session["username"] + "'", con);
        cmd.ExecuteNonQuery();
        con.Close();
        Response.Redirect("ShoppingCart.aspx");
    }
    //Link Button For Clearing Cart Items
    protected void lbclrcart_Click(object sender, EventArgs e)
    {
        Session["buyitems"] = null;
        clearcart();
    }
    protected void cmdbuy_Click(object sender, EventArgs e)
    {
        bool isTrue = false;
        //First Lets Check that Existing product in Cart Is In Stock Or Not
        DataTable dt = (DataTable)Session["buyitems"];
        for(int i=0;i<=dt.Rows.Count-1;i++)
        { 
            int pId = Convert.ToInt16(dt.Rows[i]["pid"]);
            int pQuantity = Convert.ToInt16(dt.Rows[i]["pquantity"]);
            SqlDataAdapter sda = new SqlDataAdapter("select Quantity,Name from Products where Product_Id='" + pId + "' ", con);
            DataTable dt2 = new DataTable();
            sda.Fill(dt2);
            int quantity = Convert.ToInt16(dt2.Rows[0][0]);
            if (quantity == 0)
            {
                string pName = dt2.Rows[0][1].ToString();
                string msg = "" + pName + "Products is not in stock";
                Response.Write("<script>alert('" + msg + "');</script>");//Display prd is in stock or not
                isTrue = false;
            }
            else
            {
                isTrue = true;
            }      
        }
        if(GridView1.Rows.Count.ToString()=="0")
        {
            //If Empty
            Response.Write("<script>alart('Your Cart Is empty');</script>");
        }
       else
        {
            if(isTrue==true)
            {
                Response.Redirect("PlaceOrder.aspx");
            }
        }
    }
}