<%@ Page Title="" Language="C#" MasterPageFile="~/Home.master" AutoEventWireup="true" CodeFile="ViewProduct.aspx.cs" Inherits="ViewProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        DataList1{
            width:100%;
        }
        .auto-style3 {
            height: 43px;
            width: 499px;
        }
        .auto-style5 {
            width: 499px;
        }
        .auto-style6 {
            width: 499px;
            height: 36px;
        }
        .auto-style7 {
            width: 499px;
            height: 7px;
        }
        .auto-style8 {
            height: 37px;
            width: 499px;
        }
        .auto-style9 {
            width: 499px;
            height: 180px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:DataList ID="DataList1" runat="server" DataKeyField="Product_Id" DataSourceID="SqlDataSource1" RepeatColumns="1" RepeatDirection="Horizontal" Width="100%" OnItemCommand="DataList1_ItemCommand" >
        <ItemTemplate>
            <table  align="center" border="1">
                <tr>
                    <td class="auto-style6">
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5">
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("Product_Id") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style9">
                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("Image") %>' Width="490px" Height="463px" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("Price") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="center" class="auto-style8">
                        Quantity
                        <asp:DropDownList ID="selqnt" runat="server">
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                            <asp:ListItem>5</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td align="center" class="auto-style7">
                        <asp:Button ID="cmdaddtocart" runat="server" Text="Add To Cart" CommandArgument='<%# Eval("Product_Id")%>' CommandName="AddToCart" Height="26px" />
                    </td>
                </tr>
            </table>
            <br />
            <br />
        </ItemTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Product_Id], [Name], [Image], [Price] FROM [Products]"></asp:SqlDataSource>
</asp:Content>

