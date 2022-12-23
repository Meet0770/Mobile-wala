<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Bill.aspx.cs" Inherits="Bill" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 527px;
        }
        .auto-style2 {
            width: 452px;
        }
        .auto-style3 {
            width: 991px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Button ID="cmddownload" runat="server" Text="Download Invoice" Font-Size="Large" OnClick="cmddownload_Click" />
        <asp:HyperLink ID="HyperLink1" runat="server" Font-Bold="True" NavigateUrl="~/Home.aspx">Go To Home Page</asp:HyperLink>
            <table border="1">
                <tr>
                    <td style="text-align:center" class="auto-style3">
                        <h2 style="text-align:center">Retail Invoice</h2>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">order id
                        <asp:Label ID="lblordid" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        Order No:
                        <asp:Label ID="lblordno" runat="server"></asp:Label>
                        <br /><br />
                        Order Date:
                        <asp:Label ID="lblorddt" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <table border="1" align="center">
                            <tr>
                                <td class="auto-style2">
                                    Buyer Address :<br />
                                    <asp:Label ID="lblbuyeradrs" runat="server"></asp:Label>
                                </td>
                                <td class="auto-style1">
                                    Seller Address:<br />
                                   <asp:Label ID="lblslradrs" runat="server">"Apni Dukan"<br /> Shop No:13 , VJ Complex,Palace Road<br />Rajkot(360001),Gujarat
                                   </asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="1000px">
                            <Columns>
                                <asp:BoundField DataField="sno" HeaderText="SNo">
                                <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="productid" HeaderText="Product Id">
                                <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="pname" HeaderText="Product Name">
                                <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="quantity" HeaderText="Quantity">
                                <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="pprice" HeaderText="Price">
                                <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="totalprice" HeaderText="Total Price">
                                <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                            </Columns>
                        </asp:GridView>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        Grand Total:
                        <asp:Label ID="lblgt" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="center" class="auto-style3">This is a computer generated  invoice and does not required signature.</td>
                </tr>
            </table>
        <asp:Panel ID="Panel1" runat="server">
        </asp:Panel>
    </div>
    </form>
</body>