<%@ Page Title="gBudget Bill" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="bill.aspx.cs" Inherits="gBudget2.bill" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="form-group">
        <h1>Bill Details</h1>
        <h5>All fields are required</h5>
    </div>

    <div class="form-group">
        <label for="txtAmount" class="col-sm-2 control-label">Amount:</label>
        <div class="col-sm-10">
            <asp:TextBox ID="txtAmount" runat="server" required MaxLength="50" />
        </div>
    </div>

    <div class="form-group">
        <label for="ddlCategory" class="col-sm-2 control-label">Category:</label>
        <div class="col-sm-10">
            <asp:DropDownList ID="ddlCategory" runat="server" DataValueField="CategoryID" DataTextField="Category1" />
        </div>
    </div>

    <div class="form-group">
        <label for="ddlAccount" class="col-sm-2 control-label">Account:</label>
        <div class="col-sm-10">
            <asp:DropDownList ID="ddlAccount" runat="server" DataValueField="AccountID" DataTextField="Account1" />
        </div>
    </div>

    <div class="form-group">
        <label for="ddlMechant" class="col-sm-2 control-label">Mechant:</label>
        <div class="col-sm-10">
            <asp:DropDownList ID="ddlMechant" runat="server" DataValueField="MechantID" DataTextField="Mechant1" />
        </div>
    </div>

    <div class="form-group">
        <label for="txtNote" class="col-sm-2 control-label">Note:</label>
        <div class="col-sm-10">
            <asp:TextBox ID="txtNote" runat="server" MaxLength="100" />
        </div>
    </div>

    <div class="form-group">
        <label for="txtDate" class="col-sm-2 control-label">Date:</label>
        <div class="col-sm-10">
            <asp:TextBox ID="txtDate" runat="server" required TextMode="Date" />
            <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="Must be a Date"
            ControlToValidate="txtDate" CssClass="alert alert-danger"
            Type="Date" MinimumValue="2000-01-01" MaximumValue="2999-12-30">
            </asp:RangeValidator>
        </div>
    </div>   

    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">
        <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-primary"
             OnClick="btnSave_Click" />
        </div>
    </div>
</asp:Content>
