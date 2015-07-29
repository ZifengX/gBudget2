<%@ Page Title="gBudget Login" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="gBudget2.login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Log In</h1>

    <fieldset>
        <asp:Label ID="lblStatus" runat="server"></asp:Label>
    </fieldset>

    <fieldset>
    <label for="txtUsername">UserName:</label>
    <asp:TextBox ID="txtUsername" runat="server" />
    </fieldset>

    <fieldset>
    <label for="txtPassword">Password:</label>
    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" />
    </fieldset>

    <div class="col-sm-offset-2">
        <asp:Button ID="btnLogin" runat="server" Text="Save" CssClass="btn btn-primary"
             OnClick="btnLogin_Click" />
    </div>
</asp:Content>
