<%@ Page Title="gBudget Account" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="account.aspx.cs" Inherits="gBudget2.account" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Account Type</h1>
    <h5>All fields are required</h5>

    <fieldset>
        <label for="txtAccount" class="col-sm-2">Account Type:</label>
        <asp:TextBox ID="txtAccount" runat="server" required MaxLength="50" />
    </fieldset>

    <div class="col-sm-offset-2">
        <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-primary"
             OnClick="btnSave_Click" />
    </div>

</asp:Content>
