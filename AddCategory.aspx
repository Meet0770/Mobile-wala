<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="AddCategory.aspx.cs" Inherits="AddCategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table align="center">
        <tr>
            <td colspan="3" align="center">
                <h2>Add New Category</h2>
            </td>
        </tr>
        <tr>
            <td>Enter Category Id :</td>
            <td>
                <asp:TextBox ID="txtcatid" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="rfvcatid" runat="server" ControlToValidate="txtcatid" ErrorMessage="Enter Category Name !" ForeColor="Red" Display="None" ValidationGroup="addctg"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>Enter Category Name :</td>
            <td>
                <asp:TextBox ID="txtaddctg" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="rfvaddctg" runat="server" ControlToValidate="txtaddctg" ErrorMessage="Enter Category Name !" ForeColor="Red" Display="None" ValidationGroup="addctg"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td colspan="3" align="center">
                <asp:Button ID="cmdaddctg" runat="server" Text="Add" ValidationGroup="addctg" OnClick="cmdaddctg_Click" />
            </td>
        </tr>
        <tr>
            <td colspan="3" align="center">
                <asp:Label ID="lblcategory" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:ValidationSummary ID="vs" runat="server" ForeColor="Red" ValidationGroup="addctg"/>
            </td>
        </tr>
    </table>
    <div align="center">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="CatId" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="CatId" HeaderText="CatId" ReadOnly="True" SortExpression="CatId" />
                <asp:BoundField DataField="CatName" HeaderText="CatName" SortExpression="CatName" />
            </Columns>
        </asp:GridView>
        </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Category]" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [Category] WHERE [CatId] = @original_CatId AND [CatName] = @original_CatName" InsertCommand="INSERT INTO [Category] ([CatId], [CatName]) VALUES (@CatId, @CatName)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [Category] SET [CatName] = @CatName WHERE [CatId] = @original_CatId AND [CatName] = @original_CatName">
        <DeleteParameters>
            <asp:Parameter Name="original_CatId" Type="Int32" />
            <asp:Parameter Name="original_CatName" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="CatId" Type="Int32" />
            <asp:Parameter Name="CatName" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="CatName" Type="String" />
            <asp:Parameter Name="original_CatId" Type="Int32" />
            <asp:Parameter Name="original_CatName" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>


