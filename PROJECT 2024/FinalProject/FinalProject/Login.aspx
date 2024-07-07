<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="FinalProject.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Styles/StyleSheet1.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="card card-custom">
        <div class="card-body">
            <h1 class="text-login">Log In</h1>
            <p>
                Enter email as your username: <br />
            <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>
            </p>
            <p>
                Enter password:<br />
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
            </p>
            <p>
                <asp:Button CssClass="btn btn-login" ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" />
            </p>
            <p>
                <asp:Label CssClass="text-danger" ID="lblStatus" runat="server" Text=""></asp:Label>
            </p>
        </div>
    </div>
</asp:Content>
