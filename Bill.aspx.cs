using iTextSharp.text;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Bill : System.Web.UI.Page
{
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                //Check wether user is logged in or not
                if(Session["username"]==null)
                {
                    Response.Redirect("Login.aspx");
                }
            }
            string Orderid = Session["orderid"].ToString();
            lblordid.Text = Orderid;
            findorderdate(lblorddt.Text);
            //string Address = Session["address"].ToString();
            //lblorddt.Text = Address;
            showgrid(lblordid.Text);
        }
        public override void VerifyRenderingInServerForm(Control Control)
        {
            //base.VerifyRenderingInServerForm(Control);
        }
    //Will Generate PDF
    
        protected void cmddownload_Click(object sender, EventArgs e)
        {
            exportpdf();
        }
    //Function for exporting PDF
    private void exportpdf()
        {
            //Document Tyoe i.e PDF
            Response.ContentType = "application/pdf";
            //Generate PDF with following Name
            Response.AddHeader("content-disposition", "attachment;filename=OrderInvoice.pdf");
        //Cache is not saved
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
        //class for writing the content
            StringWriter sw = new StringWriter();
        //class for writing HTML
            HtmlTextWriter hw = new HtmlTextWriter(sw);
        //Function to Render All Content which is inside of pannel
            Panel1.RenderControl(hw);
            StringReader sr = new StringReader(sw.ToString());
        //Defines Document Page Size
            Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 100f, 0f);
            HTMLWorker htmlparcer = new HTMLWorker(pdfDoc);
        //class for getting it into PDF Format
            PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
        //Open Connection
            pdfDoc.Open();
        //Parse all HTML's Pannel Data
            htmlparcer.Parse(sr);
        //Close Connection
            pdfDoc.Close();
        //Will give PDF as a Response
            Response.Write(pdfDoc);
            Response.End();
        //After This it wll get downloaded into your local drive
        }

    //Function to find what is order date
    private void findorderdate(string Orderid)
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=C:\Users\dipak\OneDrive\Documents\Visual Studio 2013\WebSites\ApniDukan\App_Data\Apni Dulan.mdf;Integrated Security=True");
        SqlCommand cmd = new SqlCommand("select * from orderdtls where id='" + lblordid.Text + "'");
        cmd.Connection = con;
        SqlDataAdapter da = new SqlDataAdapter();
        da.SelectCommand = cmd;
        DataSet ds = new DataSet();
        da.Fill(ds);
        if(ds.Tables[0].Rows.Count>0)
        {
            lblorddt.Text = ds.Tables[0].Rows[0]["orderdate"].ToString();
        }
        
        con.Close();
    }

    //Displays Purchased Item In GridView
    private void showgrid(string orderid)
    {
        DataTable dt = new DataTable();
        DataRow dr;
        dt.Columns.Add("sno");
        dt.Columns.Add("productid");
        dt.Columns.Add("pname");
        dt.Columns.Add("quantity");
        dt.Columns.Add("pprice");
        dt.Columns.Add("totalprice");
        SqlConnection scon = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=C:\Users\dipak\OneDrive\Documents\Visual Studio 2013\WebSites\ApniDukan\App_Data\Apni Dulan.mdf;Integrated Security=True");
        SqlCommand cmd = new SqlCommand("select * from orderdtls where id='" + lblordid.Text + "'");
        cmd.Connection = scon;
        SqlDataAdapter da = new SqlDataAdapter();
        da.SelectCommand = cmd;
        DataSet ds = new DataSet();
        da.Fill(ds);
        int totalrows = ds.Tables[0].Rows.Count;
        int i = 0;
        int grandtotal = 0;
        while(i<totalrows)
        {
            dr = dt.NewRow();
            dr["sno"] = ds.Tables[0].Rows[i]["sno"].ToString();
            dr["productid"] = ds.Tables[0].Rows[i]["productid"].ToString();
            dr["pname"] = ds.Tables[0].Rows[i]["pname"].ToString();
            dr["quantity"] = ds.Tables[0].Rows[i]["quantity"].ToString();
            dr["pprice"] = ds.Tables[0].Rows[i]["pprice"].ToString();
            int price = Convert.ToInt32(ds.Tables[0].Rows[i]["pprice"].ToString());
            int quantity = Convert.ToInt16(ds.Tables[0].Rows[i]["quantity"].ToString());
            int totalprice = price * quantity;
            dr["totalprice"] = totalprice;
            grandtotal = grandtotal + totalprice;
            dt.Rows.Add(dr);
            i = i + 1;
        }
        GridView1.DataSource = dt;
        GridView1.DataBind();
        lblgt.Text = grandtotal.ToString();
    }

}
