using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ViewProduct : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
    {

        Session["addproduct"] = "true";
        if(e.CommandName=="AddToCart")
        {
            DropDownList List = (DropDownList)(e.Item.FindControl("selqnt"));
            Response.Redirect("ShoppingCart.aspx?id=" + e.CommandArgument.ToString() + "&quantity=" + List.SelectedItem.ToString());
        }
    }
}