<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        body{
            background-image:url("img/bg2.jpg");
        }
        .tbldiv{
            width:50%;
            margin-left:400px;
            margin-top:60px;
        }
        .td1{
            width:135px;
            font-size:x-large;
            margin-left:100px;
            font-size:medium;
            height:35px;
        }
        .txtbox{
            height:35px;
            width:200px;
        }
        #cmdsubmit{
            height:30px;
            width:80px;
        }
        #cmdsubmit:hover{
            color:white;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="tbldiv">
        <table id="table" align="center">
            <tr>
                <td colspan="2" align="center">
                    <h1>Registration</h1>
                </td>
            </tr>
            <tr>
                <td class="td1">Enter First Name :</td>
                <td class="td2">
                    <asp:TextBox ID="txtfname" CssClass="txtbox" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvfname" runat="server" ControlToValidate="txtfname" ErrorMessage="First Name Is Empty !" ForeColor="Red" Display="None"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revfname" runat="server" ControlToValidate="txtfname" ValidationExpression="[a-zA-Z ]*" ErrorMessage="Enter Characters Only !" ForeColor="Red" Display="None"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="td1">Enter Last Name :</td>
                <td class="td2">
                    <asp:TextBox ID="txtlname" CssClass="txtbox" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvlname" runat="server" ControlToValidate="txtlname" ErrorMessage="Last Name Is Empty !" ForeColor="Red" Display="None"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revlname" runat="server" ControlToValidate="txtlname" ValidationExpression="[a-zA-Z ]*" ErrorMessage="Enter Characters Only !" ForeColor="Red" Display="None"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="td1">Select Gender</td>
                <td class="td2">
                    <asp:RadioButtonList ID="optgender" CssClass="txtbox" runat="server">
                        <asp:ListItem>Male</asp:ListItem>
                        <asp:ListItem>Female</asp:ListItem>
                        <asp:ListItem>Other</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvgender" runat="server" ControlToValidate="optgender" ErrorMessage="Gender Is Empty !" ForeColor="Red" Display="None"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="td1">Enter Email_ID :</td>
                <td class="td2">
                    <asp:TextBox ID="txtemail" CssClass="txtbox" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvemail" runat="server" ControlToValidate="txtemail" ErrorMessage="Email Is Empty !" ForeColor="Red" Display="None"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revemail" runat="server" ControlToValidate="txtemail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ErrorMessage="Enter Valid Email Address !" ForeColor="Red" Display="None"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="td1">Enter Phone :</td>
                <td class="td2">
                    <asp:TextBox ID="txtphone" CssClass="txtbox" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvphone" runat="server" ControlToValidate="txtphone" ErrorMessage="Phone No Is Empty !" ForeColor="Red" Display="None"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revphone" runat="server" ControlToValidate="txtphone" ValidationExpression="\d{10}" ErrorMessage="Enter Valid Phone Number !" ForeColor="Red" Display="None"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="td1">Enter Address :</td>
                <td class="td2">
                    <asp:TextBox ID="txtaddress" CssClass="txtbox" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvaddress" runat="server" ControlToValidate="txtaddress" ErrorMessage="Address Is Empty !" ForeColor="Red" Display="None"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revaddress" runat="server" ControlToValidate="txtaddress" ValidationExpression="[a-zA-Z0-9-' ]*" ErrorMessage="Enter Valid Address !" ForeColor="Red" Display="None"></asp:RegularExpressionValidator> 
                </td>
            </tr>
            <tr>
                <td class="td1">Enter City Name :</td>
                <td class="td2">
                    <asp:TextBox ID="txtcity" CssClass="txtbox" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvcity" runat="server" ControlToValidate="txtcity" ErrorMessage="City Name Is Empty !" ForeColor="Red" Display="None"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revcity" runat="server" ControlToValidate="txtcity" ValidationExpression="[a-zA-Z ]*" ErrorMessage="Enter Characters Only !" ForeColor="Red" Display="None"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="td1">Enter Pincode :</td>
                <td class="td2">
                    <asp:TextBox ID="txtpincode" CssClass="txtbox" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvpincode" runat="server" ControlToValidate="txtpincode" ErrorMessage="City Name Is Empty !" ForeColor="Red" Display="None"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revpincode" runat="server" ControlToValidate="txtpincode" ValidationExpression="\d{6}" ErrorMessage="Enter Valid Pincode !" ForeColor="Red" Display="None"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="td1">Enter Password :</td>
                <td class="td2">
                    <asp:TextBox ID="txtpass" CssClass="txtbox" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvpass" runat="server" ControlToValidate="txtpass" ErrorMessage="Password Is Empty !" ForeColor="Red" Display="None"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="td1">Confirm Password :</td>
                <td class="td2">
                    <asp:TextBox ID="txtconpass" CssClass="txtbox" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvconpass" runat="server" ControlToValidate="txtconpass" ErrorMessage="Confirm Password Is Empty !" ForeColor="Red" Display="None"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="cvconpass" runat="server" ControlToCompare="txtpass" ControlToValidate="txtconpass" Operator="Equal" ErrorMessage="Password Does Not Matched !" ForeColor="Red" Display="None"></asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <asp:Button ID="cmdsubmit" runat="server" Text="Submit"  OnClick="cmdsubmit_Click" />
                </td>
            </tr>
            <tr>
                    <td>
                        <asp:Label ID="lblmsg" runat="server"></asp:Label>
                    </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:ValidationSummary ID="vsregister" runat="server" ForeColor="Red"/>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
