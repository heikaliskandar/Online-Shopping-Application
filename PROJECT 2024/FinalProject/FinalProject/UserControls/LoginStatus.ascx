<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LoginStatus.ascx.cs" Inherits="FinalProject.UserControls.Login" %>

&nbsp;&nbsp;
<asp:Label CssClass="loginStatus" ID="lblLoginStatus" runat="server" Text=""></asp:Label>&nbsp;&nbsp;
<div class="float-right mt-3">
    <asp:HyperLink CssClass="btn btn-sm btn-login" ID="HyperLinkLogin" runat="server" NavigateUrl="~/Login.aspx">Login</asp:HyperLink>
    &nbsp;&nbsp;
    <asp:HyperLink CssClass="btn btn-sm btn-register" ID="HyperLinkRegister" runat="server" NavigateUrl="~/SignUp.aspx">Register</asp:HyperLink>
    <asp:Button CssClass="btn btn-sm btn-danger" ID="btnLogout" runat="server" Text="Logout" OnClick="btnLogout_Click"/>
</div>
