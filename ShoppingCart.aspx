<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ShoppingCart.aspx.cs" Inherits="ShoppingCart" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
       #cmdbuy{
            height:50px;
            width:140px;
            background-color:darkorchid;
            color:white;
            align-self:center;
            margin-left:550px;
        }
            #cmdbuy:hover {
                background-color: gray;
                color: white;
            }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
      <h2 style="text-decoration:underline overline blink; color:#5f98f3">You Have Following Products In Your Cart</h2>
        <br />
        <%--Redirect You To Products Page--%>
        <asp:HyperLink ID="hpbckprds" runat="server" Font-Bold="true" Font-Names="Colonna MT" Font-Size="X-Large" NavigateUrl="~/Home.aspx">Continue Shopping</asp:HyperLink>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

        <%--Clear All Products Present In Your Cart--%>
        <asp:LinkButton ID="lbclrcart" runat="server" OnClick="lbclrcart_Click">Clear Cart</asp:LinkButton>
        <br /><br />

        <%--Displays Products Present In Your Cart--%>
        <asp:GridView ID="GridView1" runat="server" align="center" AutoGenerateColumns="false" BackColor="#0984e3" BorderColor="#333333" BorderWidth="5px" EmptyDataText="No Products Available In Shopping Cart"
            Font-Bold="true" Height="257px" ShowFooter="true" Width="1100px" OnRowDeleting="GridView1_RowDeleting">
            <Columns>
                <asp:BoundField DataField="sno" HeaderText="Sr No">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="pid" HeaderText="Product ID">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:ImageField DataImageUrlField="pimage" HeaderText="Product Image">
                    <ControlStyle Height="300px" Width="340px" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:ImageField>
                <asp:BoundField DataField="pname" HeaderText="Product Name">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="pdesc" HeaderText="Description">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="pprice" HeaderText="Price">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="pquantity" HeaderText="Quantity">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="ptotalprice" HeaderText="Total Price">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:CommandField DeleteText="Remove" ShowDeleteButton="true" />
            </Columns>
            <FooterStyle BackColor="DarkOrchid" Font-Bold="true" ForeColor="White" />
            <HeaderStyle BackColor="DarkOrchid" ForeColor="White" />
        </asp:GridView>
        <br />
        <%--Button to place an order which redirects you to Patment Page--%>
        <asp:Button ID="cmdbuy" runat="server" Text="Place Order" Font-Bold="true" OnClick="cmdbuy_Click" />
    </div>
    </form>
</body></html>
