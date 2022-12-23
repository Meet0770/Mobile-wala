<%@ Page Title="" Language="C#" MasterPageFile="~/Home.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        .status{
            
            right:0;
            left:0;
            height:30px;
            background:#0984e3;
        }
       .lblstsmsg{
           font-size:x-large;
           color:yellow;
           
       }
       .all{
           background-color:green;
           border-radius:0% 50% 50% 0% / 0% 50% 50% 0%;
           position:relative;
           bottom:20px;
           left:1px;
           text-align:left;
           color:white;
           float:left;
       }
       /*Head bar search Section Css Starts*/
       .srchcntr
       {
           background-color:#808080;
           margin-top:-180px;
           
       }
        .search{
            background-color:#fff;
            border-radius:50px;
            height:50px;
            margin-left:460px;
            width:600px;
            
        }
        .srchbox
        {
           border-radius:47px;
           height:47px;
           width:400px;
           border:none;
           outline:none;
        }
        .srchbtn{
            margin-left:30px;
        }
        table{
            width:100%;
            height:auto;
        }
        .dtlst
        {
            margin-top:100px;
        }
        /*Head bar search Section Css Starts*/
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table>
        <tr>
        <td>
            <div class="srchcntr">
    <div class="search">
        <asp:TextBox ID="txtsearch" CssClass="srchbox" runat="server"  placeholder="Search Here..." Font-Bold="true" Font-Size="Larger"></asp:TextBox>
        <asp:ImageButton ID="srchbtn" CssClass="srchbtn" runat="server" ImageUrl="~/img/soldout.png" Height="35px" Width="40px" OnClick="srchbtn_Click" />
    </div>
        </div>
     <div class="status" align="center">
        <asp:Label ID="lblstsmsg" CssClass="lblstsmsg" runat="server"></asp:Label>
    </div>   
    <div>
        <asp:DataList ID="DataList1" CssClass="dtlst" runat="server" DataSourceID="SqlDataSource2" 
            DataKeyField="Product_Id" Height="293px" Width="100%" RepeatColumns="2" 
            RepeatDirection="Horizontal" OnItemCommand="DataList1_ItemCommand1" 
            OnItemDataBound="DataList1_ItemDataBound" >
            <ItemTemplate>
                <table>
                    <%--Product Name--%>
                    <tr>
                        <td style="text-align:center; background-color:#5f98f3">
                            <asp:Label ID="lblname" runat="server" Font-Size="Large" Text='<%#Eval("Name")%>' Font-Bold="true" Font-Names="Open Sans Extrabold" ForeColor="White"></asp:Label>
                        </td>
                    </tr>
                     <%--Product Image & Stock of Product--%>
                    <tr>
                        <td style="text-align:center">
                            <asp:Image ID="imgprd" runat="server" BorderColor="#5f98f3" BorderWidth="1px" Height="279px" Width="278px" 
                                ImageUrl='<%#Eval("Image")%>' />
                            <div class="all">
                                &nbsp;Stock:&nbsp;
                                <asp:Label CssClass="txtstock" ID="lblstck" runat="server"
                                     Text='<%#Eval("Quantity")%>' BackColor='<%#(int)Eval("Quantity")<=10 ? System.Drawing.Color.Red : System.Drawing.Color.Green %>'>
                                </asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            </div>
                        </td>
                    </tr>
                    <%--Product Description--%>
                    <tr>
                        <td style="text-align:center; background-color:#5f98f3; ">
                            <asp:Label ID="lblprddes" runat="server" Text='<%#Eval("Details")%>' ForeColor="Wheat"></asp:Label>
                        </td>
                    </tr>
                    <%--Product Price--%>
                    <tr>
                        <td style="text-align:center; background-color:#5f98f3;">
                            <asp:Label ID="lblprc1" runat="server" Text="Price:" Font-Bold="true" Font-Names="Arial"
                                ForeColor="White" align="center"></asp:Label>
                            <asp:Label ID="lblprc2" runat="server" Text='<%#Eval("Price")%>' Font-Bold="true" Font-Names="Arial" ForeColor="White" ></asp:Label>
                        </td>
                    </tr>
                    <%--Product Quantity to buy--%>
                    <tr>
                        <td align="center">
                            Quantity
                            <asp:DropDownList ID="selitm" runat="server">
                                <asp:ListItem>1</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem>3</asp:ListItem>
                                <asp:ListItem>4</asp:ListItem>
                                <asp:ListItem>5</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <%--Button to Add Product into Cart--%>
                    <tr>
                        <td style="text-align:center">
                            <asp:Button ID="cmdaddtocrt" runat="server" Text="Add To Cart" CommandArgument='<%# Eval("Product_Id")%>' CommandName="AddToCart" Height="26px" />
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
           
            </asp:DataList>
    </div>
    <%--<div>
        
    </div>--%>
   
  
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Category]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Products]"></asp:SqlDataSource>
        </td>
           </tr></table>
    
</asp:Content>

