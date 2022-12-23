using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;


public partial class UpdateStatious : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            cmdupdtsts.Visible = true;
        }
    }
    protected void lballorder_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=C:\Users\dipak\OneDrive\Documents\Visual Studio 2013\WebSites\ApniDukan\App_Data\Apni Dulan.mdf;Integrated Security=True");
        con.Open();
        SqlDataAdapter sda = new SqlDataAdapter("select id as OrderId,pname as Pname,pprice as price,quantity as Quantity,orderdate as OrderedDate,status as status from orderdtls", con);
        DataSet ds = new DataSet();
        sda.Fill(ds, "orderdtls");
        GridView1.DataSource = ds;
        GridView1.DataBind();
        GridView1.Columns[0].Visible = false;
        cmdupdtsts.Visible = true;
    }
    protected void cmdsearch_Click(object sender, EventArgs e)
    {
        string Date = txtdate.Text;
        if(Date == "")
        {
            Response.Write("<script>alert('Please Select Date')</script>");
        }
        else
        {
            //cultureinfo provider = cutlure.invariantculter;
            IFormatProvider culture = new CultureInfo("en-US", true);
            DateTime dateTime = DateTime.ParseExact(Date, "yyyy-MM-dd", culture);
            string selectedDate = dateTime.ToString("dd-MM-yyyy");
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=C:\Users\dipak\OneDrive\Documents\Visual Studio 2013\WebSites\ApniDukan\App_Data\Apni Dulan.mdf;Integrated Security=True");
            con.Open();
            SqlDataAdapter sda = new SqlDataAdapter("select id as OrderId,pname as Pname,Pprice as Price,quantity as Quantity,orderdate as OrderDate from Orderdtls where orderdate='"+selectedDate+"'and status='Pending' ",con);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            if(dt.Rows.Count==0)
            {
                Response.Write("<script>alert('No Records to display')</script>");
            }
            else
            {
                GridView1.DataSource = dt;
                GridView1.DataBind();
                GridView1.Columns[0].Visible = true;
                cmdupdtsts.Visible = true;
            }
        }
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        e.Row.Cells[4].HorizontalAlign = HorizontalAlign.Center;
        e.Row.Cells[5].HorizontalAlign = HorizontalAlign.Center;
    }
    protected void cmdupdtsts_Click(object sender, EventArgs e)
    {
        foreach(GridViewRow row in GridView1.Rows)
        {
            string orderId = row.Cells[1].Text;
            RadioButton rb1 = (row.Cells[0].FindControl("rbpending") as RadioButton);
            RadioButton rb2 = (row.Cells[0].FindControl("rbcompleted") as RadioButton);
            string status;
            if(rb1.Checked) 
            {
                status = rb1.Text;
            }
            else
            {
                status = rb2.Text;
            }
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=C:\Users\dipak\OneDrive\Documents\Visual Studio 2013\WebSites\ApniDukan\App_Data\Apni Dulan.mdf;Integrated Security=True");
            con.Open();
            SqlCommand cmd = new SqlCommand("Update orderdtls set status=@a where id=@b", con);
            cmd.Parameters.AddWithValue("@a", status);
            cmd.Parameters.AddWithValue("@b", orderId);
            cmd.ExecuteNonQuery();
            con.Close();
        }
        Response.Write("<script>alart('Status updated successfully.')</script>");
    }
}