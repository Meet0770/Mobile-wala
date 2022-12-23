using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            if(Session["username"]!=null)
            {
                Response.Redirect("Home.aspx");
            }
        }
    }
    protected void cmdsubmit_Click(object sender, EventArgs e)
    {
        string cn = (@"Data Source=(LocalDB)\v11.0;AttachDbFilename=C:\Users\dipak\OneDrive\Documents\Visual Studio 2013\WebSites\ApniDukan\App_Data\Apni Dulan.mdf;Integrated Security=True");
        SqlConnection con = new SqlConnection(cn);
        SqlDataAdapter sda = new SqlDataAdapter("select * from Register where (Email='" + txtemail.Text + "' ", con);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        if(dt.Rows.Count == 1)
        {
            lblmsg.Text = "User Already Exists !";
        }
        else
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("insert into Register" + "(Fname,Lname,Gender,Email,Phone,Address,City,Pincode,Password) values(@Fname,@Lname,@Gender,@Email,@Phone,@Address,@City,@Pincode,@Password)", con);
            cmd.Parameters.AddWithValue("@Fname", txtfname.Text);
            cmd.Parameters.AddWithValue("@Lname", txtlname.Text);
            cmd.Parameters.AddWithValue("@Gender", optgender.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@Email", txtemail.Text);
            cmd.Parameters.AddWithValue("@Phone", txtphone.Text);
            cmd.Parameters.AddWithValue("@Address", txtaddress.Text);
            cmd.Parameters.AddWithValue("@City", txtcity.Text);
            cmd.Parameters.AddWithValue("@Pincode", txtpincode.Text);
            cmd.Parameters.AddWithValue("@Password", txtpass.Text);
            cmd.ExecuteNonQuery();
            con.Close();
            lblmsg.Text = "Registered Successfully !";
        }
    }
}