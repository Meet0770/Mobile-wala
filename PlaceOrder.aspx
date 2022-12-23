<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PlaceOrder.aspx.cs" Inherits="PlaceOrder" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
     table{
            background-color:#0984e3;
            margin-top:190px;
            width:500px;
            height:350px;
        }
         #cmdconord{
            height:30px;
            width:150px;
        }
            #cmdconord:hover {
                background-color: gray;
                color: white;
            }
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table align="center">
        <tr>
            <td colspan="2" align="center">
                <asp:Label ID="lblhead" runat="server" Text="Payment" Font-Size="Larger"></asp:Label>
            </td>
        </tr>
         <tr>
            <td>
                <asp:TextBox ID="txtfname" runat="server" placeholder="First Name" Font-Bold="true" Font-Size="Medium"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ID="rfvfname" runat="server" ControlToValidate="txtfname" ErrorMessage="Enter First Name !" Display="None"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="revfname" runat="server" ControlToValidate="txtfname" ValidationExpression="[a-zA-Z ]*" ErrorMessage="Enter Characters Only !" Display="None"></asp:RegularExpressionValidator>
            </td>
             <td>
                 <asp:TextBox ID="txtlname" runat="server" placeholder="Last Name" Font-Bold="true" Font-Size="Medium"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ID="rfvlname" runat="server" ControlToValidate="txtlname" ErrorMessage="Enter Last Name !" Display="None"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="revlname" runat="server" ControlToValidate="txtlname" ValidationExpression="[a-zA-Z ]*" ErrorMessage="Enter Characters Only !" Display="None"></asp:RegularExpressionValidator>
             </td>
        </tr>
         <tr>
            <td colspan="2" align="center">
                <asp:TextBox ID="txtcardnum" runat="server" placeholder="CardNumber" Font-Bold="true" Font-Size="Medium"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ID="rfvcardnum" runat="server" ControlToValidate="txtcardnum" ErrorMessage="Enter Your Card Number !" Display="None"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="revcardnum" runat="server" ControlToValidate="txtcardnum" ValidationExpression="\d{16}" ErrorMessage="Enter Valid Number !" Display="None"></asp:RegularExpressionValidator>
            </td>
        </tr>
         <tr>
            <td align="center">
                <asp:TextBox ID="txtexpdt" runat="server" placeholder="MM/YY" Font-Bold="true" Font-Size="Medium"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ID="rfvexpdt" runat="server" ControlToValidate="txtexpdt" ErrorMessage="Enter Expiry Date !" Display="None" ></asp:RequiredFieldValidator>
                
            </td>
            <td align="center"> 
                <asp:TextBox ID="txtcvv" runat="server" placeholder="CVV" Font-Bold="true" Font-Size="Medium"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ID="rfvcvv" runat="server" ControlToValidate="txtcvv" ErrorMessage="Enter CVV !" Display="None" ></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="revcvv" runat="server" ControlToValidate="txtcvv" ErrorMessage="Enter in Valid CVV !" Display="None" ValidationExpression="\d{3}"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td>Delivery Address:</td>
            <td align="center">
                <asp:TextBox ID="txtaddress" TextMode="MultiLine" runat="server"></asp:TextBox>
            <br />
                <asp:RequiredFieldValidator ID="rfvaddress" runat="server" ControlToValidate="txtaddress" ErrorMessage="Enter Delivery Address" Display="None" ></asp:RequiredFieldValidator>
            </td>
        </tr>
         <tr>
            <td colspan="2" align="center">
                <asp:Button ID="cmdconord" runat="server" Text="Confirm Order" OnClick="cmdconord_Click" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:ValidationSummary ID="vs" runat="server" ForeColor="Red" />
            </td>
        </tr>
    </table>
    </div>
    </form>
</body>
</html>
