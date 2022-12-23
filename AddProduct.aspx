<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="AddProduct.aspx.cs" Inherits="AddProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table align="center">
          <tr>
            <td colspan="3" align="center">
                <h2>Add New Product</h2>
            </td>
        </tr>
        <tr>
            <td>Select Category:</td>
            <td><asp:DropDownList ID="optcat" runat="server" DataSourceID="SqlDataSource2" DataTextField="CatName" DataValueField="CatName"></asp:DropDownList></td>
        </tr>
        <tr>
            <td>
                Enter Product Id:
            </td>
            <td>
                <asp:TextBox ID="txtpid" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="rfvpid" runat="server" ControlToValidate="txtpid" ErrorMessage="Enter Product ID !" Display="None" ValidationGroup="addpdt"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="revpid" runat="server" ControlToValidate="txtpid" ValidationExpression="\d{4}" ErrorMessage="Enter 4 Digit Number Only !" Display="None" ValidationGroup="addpdt"></asp:RegularExpressionValidator>
            </td>
        </tr>
          <tr>
            <td>
                Enter Product Name :
            </td>
              <td>
                  <asp:TextBox ID="txtpname" runat="server"></asp:TextBox>
              </td>
              <td>
                  <asp:RequiredFieldValidator ID="rfvpname" runat="server" ControlToValidate="txtpname" ErrorMessage="Enter Product Name !" Display="None" ValidationGroup="addpdt"></asp:RequiredFieldValidator>
                  <asp:RegularExpressionValidator ID="revpname" runat="server" ControlToValidate="txtpname" ValidationExpression="[a-zA-z0-9_ ]*" ErrorMessage="Enter Valid Product Name !" Display="None" ValidationGroup="addpdt"></asp:RegularExpressionValidator>
              </td>
        </tr>
          <tr>
            <td>
                Enter Product Description :
            </td>
              <td>
                  <asp:TextBox ID="txtpdes" runat="server" TextMode="MultiLine"></asp:TextBox>
              </td>
              <td>
                  <asp:RequiredFieldValidator ID="rfvpdes" runat="server" ControlToValidate="txtpdes" ErrorMessage="Enter Product Description !" Display="None" ValidationGroup="addpdt"></asp:RequiredFieldValidator>
              </td>
        </tr>
          <tr>
            <td>
                Upload Product Image :
            </td>
              <td>
                  <asp:FileUpload ID="fupimg" runat="server" />
              </td>
              <td>
                  <asp:RequiredFieldValidator ID="rfvpimg" runat="server" ControlToValidate="fupimg" ErrorMessage="Enter Product Image !" Display="None" ValidationGroup="addpdt"></asp:RequiredFieldValidator>
              </td>
        </tr>
          <tr>
            <td>
                Enter Product Quantity :
            </td>
            <td>
                <asp:TextBox ID="txtpqnt" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="rfvpqnt" runat="server" ControlToValidate="txtpqnt" ErrorMessage="Enter Product Quantity !" Display="None" ValidationGroup="addpdt"></asp:RequiredFieldValidator>
                <asp:RangeValidator ID="rvpqnt" runat="server" ControlToValidate="txtpqnt" MinimumValue="1" MaximumValue="100" Type="Integer" ErrorMessage="Enter Between 1 To 100 !" Display="None" ValidationGroup="addpdt"></asp:RangeValidator> 
            </td>
        </tr>
          <tr>
            <td>
                Enter Product Price :
            </td>
              <td>
                  <asp:TextBox ID="txtpprice" runat="server"></asp:TextBox>
              </td>
              <td>
                  <asp:RequiredFieldValidator ID="rfvpprice" runat="server" ControlToValidate="txtpprice" ErrorMessage="Enter Product Price" Display="None" ValidationGroup="addpdt"></asp:RequiredFieldValidator>
                  <asp:RegularExpressionValidator ID="revpprice" runat="server" ControlToValidate="txtpprice" ValidationExpression="[0-9]*" ErrorMessage="Enter Numbers Only !" Display="None" ValidationGroup="addpdt"></asp:RegularExpressionValidator>
              </td>
        </tr>
        <tr>
            <td colspan="3" align="center">
                <asp:Button ID="cmdadd" runat="server" Text="Add" ValidationGroup="addpdt" OnClick="cmdadd_Click" />
            </td>
        </tr>
        <tr>
            <td colspan="3" align="center">
                <asp:Label ID="lblpmsg" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:ValidationSummary ID="vs" runat="server" ValidationGroup="addpdt" ForeColor="Red" />
            </td>
        </tr>
    </table>
    <asp:GridView ID="gvaddproducts" align="center" runat="server" AutoGenerateColumns="False" DataKeyNames="Product_Id" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="Product_Id" HeaderText="Product_Id" ReadOnly="True" SortExpression="Product_Id" />
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="Details" HeaderText="Details" SortExpression="Details" />
            <asp:BoundField DataField="Image" HeaderText="Image" SortExpression="Image" />
            <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
            <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
            <asp:BoundField DataField="Category" HeaderText="Category" SortExpression="Category" />
        </Columns>
    </asp:GridView>
    <div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Products]" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [Products] WHERE [Product_Id] = @original_Product_Id AND [Name] = @original_Name AND [Details] = @original_Details AND [Image] = @original_Image AND [Price] = @original_Price AND [Quantity] = @original_Quantity AND (([Category] = @original_Category) OR ([Category] IS NULL AND @original_Category IS NULL))" InsertCommand="INSERT INTO [Products] ([Product_Id], [Name], [Details], [Image], [Price], [Quantity], [Category]) VALUES (@Product_Id, @Name, @Details, @Image, @Price, @Quantity, @Category)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [Products] SET [Name] = @Name, [Details] = @Details, [Image] = @Image, [Price] = @Price, [Quantity] = @Quantity, [Category] = @Category WHERE [Product_Id] = @original_Product_Id AND [Name] = @original_Name AND [Details] = @original_Details AND [Image] = @original_Image AND [Price] = @original_Price AND [Quantity] = @original_Quantity AND (([Category] = @original_Category) OR ([Category] IS NULL AND @original_Category IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_Product_Id" Type="Int32" />
                <asp:Parameter Name="original_Name" Type="String" />
                <asp:Parameter Name="original_Details" Type="String" />
                <asp:Parameter Name="original_Image" Type="String" />
                <asp:Parameter Name="original_Price" Type="Double" />
                <asp:Parameter Name="original_Quantity" Type="Int32" />
                <asp:Parameter Name="original_Category" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Product_Id" Type="Int32" />
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Details" Type="String" />
                <asp:Parameter Name="Image" Type="String" />
                <asp:Parameter Name="Price" Type="Double" />
                <asp:Parameter Name="Quantity" Type="Int32" />
                <asp:Parameter Name="Category" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Details" Type="String" />
                <asp:Parameter Name="Image" Type="String" />
                <asp:Parameter Name="Price" Type="Double" />
                <asp:Parameter Name="Quantity" Type="Int32" />
                <asp:Parameter Name="Category" Type="String" />
                <asp:Parameter Name="original_Product_Id" Type="Int32" />
                <asp:Parameter Name="original_Name" Type="String" />
                <asp:Parameter Name="original_Details" Type="String" />
                <asp:Parameter Name="original_Image" Type="String" />
                <asp:Parameter Name="original_Price" Type="Double" />
                <asp:Parameter Name="original_Quantity" Type="Int32" />
                <asp:Parameter Name="original_Category" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Category]"></asp:SqlDataSource>
    </div>
</asp:Content>

