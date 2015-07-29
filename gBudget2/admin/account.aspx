<%@ Page Title="gBudget Account" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="account.aspx.cs" Inherits="gBudget2.account" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="form-group">
        <h1>Account Type</h1>
        <h4>All fields are required</h4>
    </div>

    <div class="form-group">
        <label for="txtAccount" class="col-sm-2 control-label">Account Type:</label>
        <div class="col-sm-10">
            <asp:TextBox ID="txtAccount" runat="server" required MaxLength="50" />
        </div>
    </div>

    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">
            <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-primary"
             OnClick="btnSave_Click" />
        </div>
    </div>
</asp:Content>
