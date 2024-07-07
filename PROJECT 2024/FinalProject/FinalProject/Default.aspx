<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="FinalProject.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
    <div class="center-content">
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EcoBase %>" SelectCommand="SELECT * FROM [Products]"></asp:SqlDataSource>
        <asp:GridView CssClass="table table-bordered table-condensed table-responsive table-hover text-center" ID="GridView" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" DataKeyNames="ProductID" AllowPaging="True">
            <Columns>
                <asp:BoundField DataField="ProductID" HeaderText="Product ID" ReadOnly="True" InsertVisible="False" SortExpression="ProductID">
                    <ItemStyle CssClass="text-center"></ItemStyle>
                </asp:BoundField>

                <asp:BoundField DataField="ProductName" HeaderText="Product Name" SortExpression="ProductName">
                    <ItemStyle CssClass="text-center"></ItemStyle>
                </asp:BoundField>

                <asp:BoundField DataField="ProductPrice" DataFormatString="RM {0:N2}" HeaderText="Product Price" SortExpression="ProductPrice">
                    <ItemStyle CssClass="text-center"></ItemStyle>
                </asp:BoundField>

                <asp:ImageField DataImageUrlField="ProductImage" DataImageUrlFormatString="Images/{0}" HeaderText="Image">
                    <ItemStyle CssClass="text-center"></ItemStyle>
                    <ControlStyle Width="90px" />
                </asp:ImageField>

                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" >
                    <ItemStyle CssClass="text-left"></ItemStyle>
                </asp:BoundField>

            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
