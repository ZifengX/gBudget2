<%@ Page Title="gBudget Accounts" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="accounts.aspx.cs" Inherits="gBudget2.accounts" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Accounts</h1>

    <a href="account.aspx">Add Account</a> <br />

    <label for="ddlPageSize">Records Per Page:</label>
    <asp:DropDownList ID="ddlPageSize" runat="server" AutoPostBack="true"
        OnSelectedIndexChanged="ddlPageSize_SelectedIndexChanged">
        <asp:ListItem Value="3" Text="3" />
        <asp:ListItem Value="5" Text="5" />
        <asp:ListItem Value="10" Text="10" />
    </asp:DropDownList>

    <asp:GridView ID="grdAccounts" runat="server" CssClass="table table-striped table-hover"
        AutoGenerateColumns="false" OnRowDeleting="grdAccounts_RowDeleting" DataKeyNames="AccountID"
        AllowPaging="true" PageSize="3" OnPageIndexChanging="grdAccounts_PageIndexChanging"
        AllowSorting="true" OnSorting="grdAccounts_Sorting" OnRowDataBound="grdAccounts_RowDataBound" >
        <Columns>
            <asp:BoundField DataField="AccountID" HeaderText="Account ID" SortExpression="AccountID"/>
            <asp:BoundField DataField="Account1" HeaderText="Account Type" SortExpression="Account1" />
         
            <asp:HyperLinkField HeaderText="Edit" Text="Edit" NavigateUrl="account.aspx"
                DataNavigateUrlFields="AccountID" 
                DataNavigateUrlFormatString="account.aspx?AccountID={0}" />
            <asp:CommandField HeaderText="Delete" DeleteText="Delete" ShowDeleteButton="true" />
        </Columns>
    </asp:GridView>

</asp:Content>
