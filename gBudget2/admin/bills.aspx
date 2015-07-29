<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="bills.aspx.cs" Inherits="gBudget2.bills" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Bills</h1>

    <a href="bill.aspx">Add Bill</a><br />

    <label for="ddlPageSize">Records Per Page:</label>
    <asp:DropDownList ID="ddlPageSize" runat="server" AutoPostBack="true"
        OnSelectedIndexChanged="ddlPageSize_SelectedIndexChanged">
        <asp:ListItem Value="3" Text="3" />
        <asp:ListItem Value="5" Text="5" />
        <asp:ListItem Value="10" Text="10" />
    </asp:DropDownList>

    <asp:GridView ID="grdBills" runat="server" CssClass="table table-striped table-hover"
        AutoGenerateColumns="false" OnRowDeleting="grdBills_RowDeleting" DataKeyNames="DatainfoID"
        AllowPaging="true" PageSize="3" OnPageIndexChanging="grdBills_PageIndexChanging"
        AllowSorting="true" OnSorting="grdBills_Sorting" OnRowDataBound="grdBills_RowDataBound" >
        <Columns>
            <asp:BoundField DataField="Date" HeaderText="Date" DataFormatString="{0:yyyy-MM-dd}" SortExpression="Date"/>
            <asp:BoundField DataField="Amount" HeaderText="Amount" SortExpression="Amount" />
            <asp:BoundField DataField="Category1" HeaderText="Category" SortExpression="Category1" />
            <asp:BoundField DataField="Account1" HeaderText="Account" SortExpression="Account1" />
            <asp:BoundField DataField="Mechant1" HeaderText="Mechant" SortExpression="Mechant1" />
            <asp:BoundField DataField="Note" HeaderText="Note" SortExpression="Note" />
            <asp:HyperLinkField HeaderText="Edit" Text="Edit" NavigateUrl="bill.aspx"
                DataNavigateUrlFields="DatainfoID" 
                DataNavigateUrlFormatString="bill.aspx?DatainfoID={0}" />
            <asp:CommandField HeaderText="Delete" DeleteText="Delete" ShowDeleteButton="true" />
           
        </Columns>
    </asp:GridView>
</asp:Content>
