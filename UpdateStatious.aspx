<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="UpdateStatious.aspx.cs" Inherits="UpdateStatious" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div align="right">
        <asp:LinkButton ID="lballorder" runat="server" OnClick="lballorder_Click">Show All Order List</asp:LinkButton>
    </div>
    <div align="center">
    <%--Date Section--%>
    <b>Select Date:</b>
    <asp:TextBox ID="txtdate" runat="server" TextMode="Date" Height="30px" Width="168px"></asp:TextBox>

    <%--Btton to Process the data--%>
    <asp:Button ID="cmdsearch" runat="server" Text="Click" Font-Bold="true" Height="39px" Width="72px" OnClick="cmdsearch_Click" />
        </div>
    <br />
    <br />
    <div align="center">
    <%--Display order details based on selected data--%>
    <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#666666" BorderStyle="None" BorderWidth="12px" CellPadding="3" GridLines="Vertical" OnRowDataBound="GridView1_RowDataBound">
        <AlternatingRowStyle BackColor="#DCDCDC" />
        <Columns>
            <asp:TemplateField HeaderText="Product Status">
                <ItemTemplate>
                    
                    <asp:RadioButton ID="rbpending" runat="server" Text="Panding" Checked="true" GroupName="pstatus" />
                    <asp:RadioButton ID="rbcompleted" runat="server" Text="Completed" GroupName="pstatus"/>
                    
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
        <HeaderStyle BackColor="#000084" Font-Bold="true" ForeColor="White" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
        <SelectedRowStyle BackColor="#008A8c" Font-Bold="true" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#0000A9" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#000065" />
    </asp:GridView>
    </div>
    <div align="center">
    <%-- Button to update order status--%>
    <asp:Button ID="cmdupdtsts" runat="server" Text="Update Status" OnClick="cmdupdtsts_Click" Font-Bold="true" Height="37px" Width="136px" />
        </div>
</asp:Content>

