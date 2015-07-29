<%@ Page Title="gBudget Reports" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="reports.aspx.cs" Inherits="gBudget2.reports" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Reports</h1>

    <fieldset>
        <label for="ddlCategoryReports">Report by Category:</label>
        <asp:DropDownList ID="ddlCategoryReport" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCategoryReport_SelectedIndexChanged" DataValueField="CategoryID" DataTextField="Category1" />
        <asp:GridView ID="grdCategoryReport" runat="server" CssClass="table table-striped table-hover"
             AutoGenerateColumns="false" AllowPaging="true" PageSize="3" OnPageIndexChanging="grdCategoryReport_PageIndexChanging">
            <Columns>
                <asp:BoundField DataField="Date" HeaderText="Date" DataFormatString="{0:yyyy-MM-dd}" />
                <asp:BoundField DataField="Amount" HeaderText="Amount" />
                <asp:BoundField DataField="Account1" HeaderText="Account" />
                <asp:BoundField DataField="Mechant1" HeaderText="Mechant" />
                <asp:BoundField DataField="Note" HeaderText="Note" />
            </Columns>
        </asp:GridView>
    </fieldset>

    <%--<asp:GridView ID="grdAccounts" runat="server" CssClass="table table-striped table-hover"
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
    </asp:GridView>--%>
</asp:Content>
