<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="FinalProject.SignUp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="card card-custom">
        <div class="card-body">
            <h1 class="text-login">Sign Up</h1>
            <p>
                Enter email as your username:<br />
            <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>
            </p>
            <p>
                Enter password:<br />
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
            </p>
            <p>
                <asp:Button CssClass="btn btn-login" ID="btnSignUp" runat="server" Text="Register" OnClick="btnSignUp_Click"  />
            </p>
            <p>
                <asp:Label CssClass="text-danger" ID="lblStatus" runat="server" Text=""></asp:Label>
            </p>
        </div>
    </div>
</asp:Content>

