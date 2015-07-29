<%@ Page Title="gBudget Mechant" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="mechant.aspx.cs" Inherits="gBudget2.mechant" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="form-group">
        <h1>Mechant</h1>
        <h5>All fields are required</h5>
    </div>

    <div class="form-group">
        <label for="txtMechant" class="col-sm-2 control-label">Mechant Name:</label>
        <div class="col-sm-10">
            <asp:TextBox ID="txtMechant" runat="server" required MaxLength="50" />
        </div>
    </div>

    <div class="form-group">
        <div class="col-sm-offset-2">
            <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-primary"
                OnClick="btnSave_Click"/>
        </div>
    </div>
</asp:Content>
