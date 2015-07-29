<%@ Page Title="gBudget Register" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="gBudget2.register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Register</h1>
    <h5>All fields are required</h5>

    <fieldset>
        <asp:Label ID="lblStatus" runat="server"></asp:Label>
    </fieldset>

    <fieldset>
    <label for="txtUsername">UserName:</label>
    <asp:TextBox ID="txtUsername" runat="server" />
    </fieldset>

    <fieldset>
    <label for="txtPassword">Password:</label>
    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" required />
    </fieldset>

    <fieldset>
    <label for="txtConfirm">Confirm:</label>
    <asp:TextBox ID="txtConfirm" runat="server" TextMode="Password" required />
    <asp:CompareValidator runat="server" Operator="Equal" ControlToValidate="txtPassword"
            controltocompare="txtConfirm" CssClass="label label-danger" ErrorMessage="Passwords must mach"></asp:CompareValidator>
    </fieldset>

    <div class="col-sm-offset-2">
        <asp:Button ID="btnRegister" runat="server" Text="Save" CssClass="btn btn-primary"
             OnClick="btnRegister_Click" />
    </div>
</asp:Content>
