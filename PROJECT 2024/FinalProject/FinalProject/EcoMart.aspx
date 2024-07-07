<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EcoMart.aspx.cs" Inherits="FinalProject.EcoForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Styles/StyleSheet1.css" rel="stylesheet" />
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Selection</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <style>
        th {
            background-color: #15494c;
            color: white;
        }
        .table{
            border-radius: 9px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="leftColumn">
        <h4>Product</h4>
        <p>
            Select category : &nbsp;
      <asp:DropDownList ID="ddlCategory" runat="server" AutoPostBack="True" DataSourceID="SqlDataSourceCategories" DataTextField="CategoryName" DataValueField="CategoryID" OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged"></asp:DropDownList>
        </p>
        <asp:GridView CssClass="table table-sm table-hover text-center" ID="GridViewProduct" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="ProductID" DataSourceID="SqlDataSourceProduct" PageSize="5">
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:CheckBox ID="SelectCheckBox" runat="server" AutoPostBack="true" OnCheckedChanged="SelectCheckBox_CheckedChanged" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="ProductID" HeaderText="Product ID" InsertVisible="False" ReadOnly="True" SortExpression="ProductID" />
                <asp:BoundField DataField="ProductName" HeaderText="Name" SortExpression="ProductName" />
                <asp:BoundField DataField="ProductPrice" DataFormatString="RM {0:N2}" HeaderText="Price" SortExpression="ProductPrice" />
                <asp:ImageField DataImageUrlField="ProductImage" DataImageUrlFormatString="Images/{0}" HeaderText="Image">
                    <ControlStyle Width="90px" />
                </asp:ImageField>
                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
            </Columns>
        </asp:GridView>

   <div class="modal fade" id="productModal" tabindex="-1" role="dialog" aria-labelledby="productModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="productModalLabel">Add to Cart</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label for="lblProductID">Product ID</label>
                            <asp:Label ID="lblProductID" runat="server" CssClass="form-control" />
                        </div>
                        <div class="form-group">
                            <label for="lblProductName">Product Name</label>
                            <asp:Label ID="lblProductName" runat="server" CssClass="form-control" />
                        </div>
                        <div class="form-group">
                            <label for="lblProductPrice">Product Price</label>
                            <asp:Label ID="lblProductPrice" runat="server" CssClass="form-control" />
                        </div>
                        <div class="form-group">
                            <label for="txtQuantity">Quantity</label>
                            <asp:TextBox ID="txtQuantity" runat="server" CssClass="form-control" Text="1" />
                        </div>
                    </div>
                    <div class="modal-footer">
                        <asp:Button ID="btnAddProduct" runat="server" CssClass="btn btn-login" Text="Add" OnClick="btnAddProduct_Click" />
                    </div>
                </div>
            </div>
        </div>

        <p>
            <asp:Label ID="lblMessage1" runat="server"></asp:Label>

            <asp:SqlDataSource ID="SqlDataSourceProduct" runat="server" ConnectionString="<%$ ConnectionStrings:EcoBase %>" SelectCommand="SELECT * FROM [Products] WHERE ([CategoryID] = @CategoryID)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddlCategory" Name="CategoryID" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>

            <asp:SqlDataSource ID="SqlDataSourceSales" runat="server" ConnectionString="<%$ ConnectionStrings:EcoBase %>" SelectCommand="spSalesGetProduct" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="lblSalesID" Name="salesid" PropertyName="Text" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </p>
    </div>
    <br />
    <div class="rightColumn">
        <h4>Shopping Cart</h4>
        <p>
            Cart Id:
      <asp:Label ID="lblSalesID" runat="server"></asp:Label>&nbsp;|
      Date and Time:
       <asp:Label ID="lblDateTime" runat="server"></asp:Label>
        </p>
        <p>
            <asp:GridView CssClass="table text-center" ID="GridViewSales" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceSales">
                <Columns>

                    <asp:BoundField DataField="ProductID" HeaderText="Product ID" SortExpression="ProductID" />

                    <asp:BoundField DataField="ProductName" HeaderText="Name" SortExpression="ProductName" />

                    <asp:BoundField DataField="ProductPrice" DataFormatString="RM {0:N2}" HeaderText="Price" SortExpression="ProductPrice" />

                    <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />

                    <asp:BoundField DataField="SubTotal" DataFormatString="RM {0:N2}" HeaderText="Sub Total" ReadOnly="True" SortExpression="SubTotal" />
                </Columns>
            </asp:GridView>
            Total Amount:
      <asp:Label ID="lblTotalAmountSales" runat="server" Text="RM 0.00"></asp:Label>
        </p>
        <div>
          <asp:Button CssClass="btn btn-login" ID="btnConfirm" runat="server" Text="Confirm" OnClick="btnConfirm_Click" />&nbsp;
          <asp:Button CssClass="btn btn-register" ID="btnNewSales" runat="server" Text="New" OnClick="btnNew_Click" />&nbsp;
            <asp:Button CssClass="btn btn-danger" ID="btnCancel" runat="server" Text="Clear" OnClick="btnCancel_Click" />
        </div>

        <p>
            <asp:Label ID="lblMessage2" runat="server"></asp:Label>
        </p>
        <p>
            <asp:Label ID="lblTotalAmount" runat="server"></asp:Label>
            <br />
            <asp:Label ID="lblServiceTax" runat="server"></asp:Label><br />
            <asp:Label ID="lblAmountAfterTax" runat="server"></asp:Label><br />
            <asp:Label ID="lblRounding" runat="server"></asp:Label>
            <br />
            <asp:Label ID="lblAmountRounded" runat="server"></asp:Label><br />

        </p>
        <asp:SqlDataSource ID="SqlDataSourceCategories" runat="server" ConnectionString="<%$ ConnectionStrings:EcoBase %>" SelectCommand="SELECT * FROM [Categories] ORDER BY [CategoryName]"></asp:SqlDataSource>

    </div>
</asp:Content>
