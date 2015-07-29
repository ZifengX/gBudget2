<%@ Page Title="gBudget Category" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="category.aspx.cs" Inherits="gBudget2.category" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="form-group">
        <h1>Category Name</h1>
        <h5>All fields are required</h5>
    </div>

    <div class="form-group">
        <label for="txtCategory" class="col-sm-2 control-label">Category Name:</label>
        <div class="col-sm-10">
            <asp:TextBox ID="txtCategory" runat="server" required MaxLength="50" />
        </div>
    </div>

    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">
            <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-primary"
                OnClick="btnSave_Click" />
        </div>
    </div>
</asp:Content>
