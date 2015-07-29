<%@ Page Title="gBudget Login" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="gBudget2.login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="form-group">
        <h1 class="form-signin-heading">Please sign in</h1>
        <asp:Label ID="lblStatus" runat="server"></asp:Label>
    </div>

    <div class="form-group">
        <label for="txtUsername" class="col-sm-2 control-label">UserName:</label>
        <div class="col-sm-10">
            <asp:TextBox ID="txtUsername" runat="server" required/>
        </div>
    </div>

    <div class="form-group">
        <label for="txtPassword" class="col-sm-2 control-label">Password:</label>
        <div class="col-sm-10">
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" />
        </div>
    </div>

    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">
            <asp:Button ID="btnLogin" runat="server" Text="Sign in" CssClass="btn btn-lg btn-primary"
                        OnClick="btnLogin_Click" />
        </div>
    </div>
</asp:Content>
