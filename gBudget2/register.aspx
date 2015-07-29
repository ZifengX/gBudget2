<%@ Page Title="gBudget Register" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="gBudget2.register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="form-group">
        <h1 class="form-signin-heading">Register</h1>
        <h4>All fields are required</h4>
        <asp:Label ID="lblStatus" runat="server"></asp:Label>
    </div>

    <div class="form-group">
        <label for="txtUsername" class="col-sm-2 control-label">UserName:</label>
        <div class="col-sm-10">
            <asp:TextBox ID="txtUsername" runat="server" />
        </div>
    </div>

    <div class="form-group">
        <label for="txtPassword" class="col-sm-2 control-label">Password:</label>
        <div class="col-sm-10">
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" required />
        </div>
    </div>

    <div class="form-group">
        <label for="txtConfirm" class="col-sm-2 control-label">Confirm:</label>
        <div class="col-sm-10">
            <asp:TextBox ID="txtConfirm" runat="server" TextMode="Password" required />
            <asp:CompareValidator runat="server" Operator="Equal" ControlToValidate="txtPassword"
                controltocompare="txtConfirm" CssClass="label label-danger" ErrorMessage="Passwords must mach"></asp:CompareValidator>
        </div>
    </div>

    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">
        <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="btn btn-primary"
             OnClick="btnRegister_Click" />
      </div>
    </div>
</asp:Content>
