<%@ Page Title="gBudget Categories" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="categories.aspx.cs" Inherits="gBudget2.categories" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Categories</h1>

    <a href="category.aspx">Add Categories</a> <br />

    <label for="ddlPageSize">Records Per Page:</label>
    <asp:DropDownList ID="ddlPageSize" runat="server" AutoPostBack="true"
        OnSelectedIndexChanged="ddlPageSize_SelectedIndexChanged">
        <asp:ListItem Value="3" Text="3" />
        <asp:ListItem Value="5" Text="5" />
        <asp:ListItem Value="10" Text="10" />
    </asp:DropDownList>

    <asp:GridView ID="grdCategories" runat="server" CssClass="table table-striped table-hover"
        AutoGenerateColumns="false" OnRowDeleting="grdCategories_RowDeleting" DataKeyNames="CategoryID"
        AllowPaging="true" PageSize="3" OnPageIndexChanging="grdCategories_PageIndexChanging"
        AllowSorting="true" OnSorting="grdCategories_Sorting" OnRowDataBound="grdCategories_RowDataBound" >
        <Columns>
            <asp:BoundField DataField="CategoryID" HeaderText="Category ID" SortExpression="CategoryID"/>
            <asp:BoundField DataField="Category1" HeaderText="Category Name" SortExpression="Category1" />
         
            <asp:HyperLinkField HeaderText="Edit" Text="Edit" NavigateUrl="category.aspx"
                DataNavigateUrlFields="CategoryID" 
                DataNavigateUrlFormatString="category.aspx?CategoryID={0}" />
            <asp:CommandField HeaderText="Delete" DeleteText="Delete" ShowDeleteButton="true" />
        </Columns>
    </asp:GridView>
</asp:Content>
