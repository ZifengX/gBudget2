<%@ Page Title="gBudget Settings" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="settings.aspx.cs" Inherits="gBudget2.settings" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Settings</h1>

    <div class="well">
        <h3>Accounts</h3>
        <ul class="list-group">
            <li class="list-group-item"><a href="accounts.aspx">List Accounts</a></li>
            <li class="list-group-item"><a href="account.aspx">Add Account</a></li>
        </ul>
    </div>

    <div class="well">
        <h3>Categories</h3>
        <ul class="list-group">
            <li class="list-group-item"><a href="categories.aspx">List categories</a></li>
            <li class="list-group-item"><a href="category.aspx">Add category</a></li>
        </ul>
    </div>

    <div class="well">
        <h3>Mechants</h3>
        <ul class="list-group">
            <li class="list-group-item"><a href="mechants.aspx">List Mechants</a></li>
            <li class="list-group-item"><a href="mechant.aspx">Add Mechant</a></li>
        </ul>
    </div>
</asp:Content>
