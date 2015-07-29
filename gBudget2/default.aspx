<%@ Page Title="gBudget" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="gBudget2._default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="jumbotron">
        <h1>Welcome to gBudget</h1>
        <p>This is a simple budget manager. Here are two test account, or you can register new one. </p>
        <p> a new user, there is no data. If you want to see example, please use test account.</p>
        <p>Username: admin, Password: 1234567</p>
        <p>Username: test, Password: 1234567</p>
        <p>
          <a class="btn btn-lg btn-primary" href="login.aspx" role="button">Log In</a>
          <a class="btn btn-lg btn-primary" href="register.aspx" role="button">Register</a>
        </p>
     </div>
</asp:Content>
