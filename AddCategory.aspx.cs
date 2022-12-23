using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddCategory : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
      
    }
    protected void cmdaddctg_Click(object sender, EventArgs e)
    {
        string cn = (@"Data Source=(LocalDB)\v11.0;AttachDbFilename=C:\Users\dipak\OneDrive\Documents\Visual Studio 2013\WebSites\ApniDukan\App_Data\Apni Dulan.mdf;Integrated Security=True");
        SqlConnection con= new SqlConnection(cn);
        SqlDataAdapter sda = new SqlDataAdapter("select * from Category where CatId='"+txtcatid.Text.ToString()+"'",con);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        if(dt.Rows.Count == 1)
        {
            lblcategory.Text= "This Category Already Exists";
        }
        else
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("insert into Category (CatId,CatName) values(@CatId,@CatName)", con);
            cmd.Parameters.AddWithValue("@CatId", txtcatid.Text);
            cmd.Parameters.AddWithValue("@CatName", txtaddctg.Text);
            cmd.ExecuteNonQuery();
            con.Close();
            lblcategory.Text = "Category Added";
            txtcatid.Text = "";
            txtaddctg.Text = "";
        }
    }
}