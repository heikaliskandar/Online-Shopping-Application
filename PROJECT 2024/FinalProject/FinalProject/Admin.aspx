<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="FinalProject.Admin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Styles/StyleSheet1.css" rel="stylesheet" />
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        body {
            background-color: #f9f9f9;
            font-family: 'Arial', sans-serif;
        }
        .container {
            padding-bottom: 50px;
            margin-top: 20px;
        }
        .header-area h1 {
            color: #007bff;
        }
        .table {
            margin-top: 20px;
        }
        .btn-primary {
            background-color: #007bff;
            border: none;
        }
        .btn-primary:hover {
            background-color: #0056b3;
        }
        th {
            background-color: #15494c;
            color: white;
        }
        .table-hover tbody tr:hover {
            background-color: #f1f1f1;
        }
        .grid-view {
            border-collapse: collapse;
            overflow: hidden;
            border-radius: 5px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="header-area">
            <h1 class="text-login">Admin Page</h1>
        </div>

        <div class="card">
            <div class="card-body">
                <h3>User Management</h3>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EcoBase %>" 
                    DeleteCommand="DELETE FROM [Users] WHERE [UserID] = @UserID" 
                    InsertCommand="INSERT INTO [Users] ([UserName], [PasswordHash], [Role], [Enabled]) VALUES (@UserName, @PasswordHash, @Role, @Enabled)" 
                    SelectCommand="SELECT * FROM [Users]" 
                    UpdateCommand="UPDATE [Users] SET [UserName] = @UserName, [PasswordHash] = @PasswordHash, [Role] = @Role, [Enabled] = @Enabled WHERE [UserID] = @UserID">
                    <DeleteParameters>
                        <asp:Parameter Name="UserID" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="UserName" Type="String" />
                        <asp:Parameter Name="PasswordHash" Type="String" />
                        <asp:Parameter Name="Role" Type="String" />
                        <asp:Parameter Name="Enabled" Type="Boolean" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="UserName" Type="String" />
                        <asp:Parameter Name="PasswordHash" Type="String" />
                        <asp:Parameter Name="Role" Type="String" />
                        <asp:Parameter Name="Enabled" Type="Boolean" />
                        <asp:Parameter Name="UserID" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:GridView ID="GridViewUsers" runat="server" CssClass="table table-sm table-hover grid-view" AutoGenerateColumns="False" DataKeyNames="UserID" DataSourceID="SqlDataSource1">
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True"  />
                        <asp:BoundField DataField="UserID" HeaderText="User ID" InsertVisible="False" ReadOnly="True" SortExpression="UserID" />
                        <asp:BoundField DataField="UserName" HeaderText="Username" SortExpression="UserName" />
                        <asp:BoundField DataField="PasswordHash" HeaderText="Password" SortExpression="PasswordHash" />
                        <asp:BoundField DataField="Role" HeaderText="Role" SortExpression="Role" />
                        <asp:CheckBoxField DataField="Enabled" HeaderText="Enabled" SortExpression="Enabled" ><HeaderStyle Width="10%" /></asp:CheckBoxField>
                    </Columns>
                </asp:GridView>
            </div>
         </div>
          <br />
        <div class="card">
            <div class="card-body">
                <h3>Sales Reports - Executive Summary</h3>
                <asp:GridView ID="GridViewSummary" runat="server" CssClass="table table-sm table-hover grid-view" AutoGenerateColumns="False" DataSourceID="SqlDataSourceSummary">
                    <Columns>
                        <asp:BoundField DataField="ProductName" HeaderText="Product Name" SortExpression="ProductName" />
                        <asp:BoundField DataField="TotalQuantitySold" HeaderText="Total Quantity Sold" SortExpression="TotalQuantitySold" />
                        <asp:BoundField DataField="TotalSalesAmount" HeaderText="Total Sales Amount" SortExpression="TotalSalesAmount" />
                    </Columns>
                </asp:GridView>

                <asp:SqlDataSource ID="SqlDataSourceSummary" runat="server" ConnectionString="<%$ ConnectionStrings:EcoBase %>" SelectCommand="SELECT ProductName, TotalQuantitySold, TotalSalesAmount FROM SalesSummary"></asp:SqlDataSource>

                <asp:GridView ID="GridViewSalesSummary" runat="server" CssClass="table table-sm table-hover grid-view" AutoGenerateColumns="False" DataSourceID="SqlDataSourceSalesSummary">
                    <Columns>
                        <asp:BoundField DataField="Month" HeaderText="Month" SortExpression="Month" />
                        <asp:BoundField DataField="TotalSales" HeaderText="Total Sales" DataFormatString="{0:C}" SortExpression="TotalSales" />
                    </Columns>
                </asp:GridView>

                <asp:SqlDataSource ID="SqlDataSourceSalesSummary" runat="server" ConnectionString="<%$ ConnectionStrings:EcoBase %>"
                    SelectCommand="SELECT FORMAT(s.SalesDate, 'yyyy-MM') AS Month, SUM(p.ProductPrice * s.Quantity) AS TotalSales
                                   FROM Sales s
                                   JOIN Products p ON s.ProductID = p.ProductID
                                   GROUP BY FORMAT(s.SalesDate, 'yyyy-MM')
                                   ORDER BY Month DESC;">
                </asp:SqlDataSource>

                 <h3>Detailed Sales Report</h3>
                <asp:Button ID="ButtonLoadDetails" runat="server" CssClass="btn btn-login btn-sm button-load" Text="Load Details" OnClick="ButtonLoadDetails_Click" />
                <asp:GridView ID="GridViewDetails" runat="server" CssClass="table table-sm table-hover grid-view" AutoGenerateColumns="False" Visible="False">
                    <Columns>
                        <asp:BoundField DataField="SalesID" HeaderText="Sales ID" SortExpression="SalesID" />
                        <asp:BoundField DataField="ProductName" HeaderText="Product Name" SortExpression="ProductName" />
                        <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                        <asp:BoundField DataField="SalesDate" HeaderText="Sales Date" SortExpression="SalesDate" />
                        <asp:BoundField DataField="Confirmed" HeaderText="Confirmed" SortExpression="Confirmed" />
                        <asp:BoundField DataField="TotalAmount" HeaderText="Total Amount" SortExpression="TotalAmount" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>

