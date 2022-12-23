<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Productstatus.aspx.cs" Inherits="Productstatus" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div align="center">
        <ul>
            <li>
                <i class="fa" aria-hidden="true"></i>
                <p><b>Dispatched</b></p>
            </li>
            <li>
                <i class="fa" aria-hidden="false"></i>
                <p><b>Dispatched</b></p>
            </li>
        </ul>
    </div>
        <br />
        <div align="center">
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Productstatus.aspx" BackColor="Blue" Font-Size="Large" ForeColor="White" BorderColor="White">Want to check all ordered Products?</asp:HyperLink>
        </div>
        <br />
        <div align="center">
            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Home.aspx" Font-Size="Large" Font-Bold="true" ForeColor="WhiteSmoke" BorderColor="White" BackColor="DarkOrchid">Back to Home page</asp:HyperLink>
        </div>
    </form>
</body>
</html>
