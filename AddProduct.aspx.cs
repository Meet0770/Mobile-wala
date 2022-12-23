using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class AddProduct : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void cmdadd_Click(object sender, EventArgs e)
    {
        string cn = (@"Data Source=(LocalDB)\v11.0;AttachDbFilename=C:\Users\dipak\OneDrive\Documents\Visual Studio 2013\WebSites\ApniDukan\App_Data\Apni Dulan.mdf;Integrated Security=True");
        SqlConnection con = new SqlConnection(cn);
        SqlDataAdapter sda = new SqlDataAdapter("select * from Products where Product_Id='" + txtpid.Text.ToString() + "' ", con);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        if(dt.Rows.Count == 1)
        {
            lblpmsg.Text="Product Already Exists !";
            lblpmsg.ForeColor = System.Drawing.Color.Red;
        }
        else
        {
            if(fupimg.HasFile)
                {
                    string filename = fupimg.PostedFile.FileName;
                    string filepath = "img/" + fupimg.FileName;
                    fupimg.PostedFile.SaveAs(Server.MapPath("~/img/") + filename);
                    con.Open();
                    SqlCommand cmd = new SqlCommand("insert into Products(Product_Id,Name,Details,Image,Price,Quantity,Category) values('" + txtpid.Text + "','" + txtpname.Text + "','" + txtpdes.Text + "','" + filepath + "','" + txtpqnt.Text + "','" + txtpprice.Text + "','"+optcat.Text+"')",con);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    lblpmsg.Text = "Product Uploaded !";
                    lblpmsg.ForeColor = System.Drawing.Color.Green;
                }
        }
        
    }
}