<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        body{
            background-image:url("img/bg2.jpg");
        }
        table{
            margin-top:190px;
            width:500px;
            height:350px;
        }
         #cmdlogin{
            height:30px;
            width:80px;
        }
            #cmdlogin:hover {
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
                    <h1>Login</h1>
                </td>
            </tr>
            <tr>
                <td><h3>Enter Email_Id : </h3></td>
                <td>
                    <asp:TextBox ID="txtemail" runat="server" Height="32px" Width="189px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvemail" runat="server" ControlToValidate="txtemail" ErrorMessage="Email Id Is Empty !" ForeColor="Red" Display="None"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revemail" runat="server" ControlToValidate="txtemail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ErrorMessage="Enter Valid Email Address !" ForeColor="Red" Display="None"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td><h3>Enter Password : </h3></td>
                <td>
                    <asp:TextBox ID="txtpass" runat="server" Height="32px" Width="189px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvpass" runat="server" ControlToValidate="txtpass" ErrorMessag="Password Is Empty !" ForeColor="Red" Display="None"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <asp:Button ID="cmdlogin" runat="server" Text="Login" OnClick="cmdlogin_Click" />
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <asp:Label ID="lblmsg" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:ValidationSummary ID="rvlogin" runat="server" ForeColor="Red" />
                </td>
            </tr>
            <tr>
                <td colspan="2" align="right">
                    <asp:Label ID="lblreg" runat="server" ForeColor="White" Text="Don't Have Account ?"></asp:Label>
                    <asp:HyperLink ID="hlreg" runat="server" NavigateUrl="~/Register.aspx" ForeColor="Black" >click Here</asp:HyperLink>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
