<%@ Page Title="gBudget Mechants" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="mechants.aspx.cs" Inherits="gBudget2.mechants" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Mechants</h1>

    <a href="mechant.aspx">Add Mechant</a> <br />

    <label for="ddlPageSize">Records Per Page:</label>
    <asp:DropDownList ID="ddlPageSize" runat="server" AutoPostBack="true"
        OnSelectedIndexChanged="ddlPageSize_SelectedIndexChanged">
        <asp:ListItem Value="3" Text="3" />
        <asp:ListItem Value="5" Text="5" />
        <asp:ListItem Value="10" Text="10" />
    </asp:DropDownList>

    <asp:GridView ID="grdMechants" runat="server" CssClass="table table-striped table-hover"
        AutoGenerateColumns="false" OnRowDeleting="grdMechants_RowDeleting" DataKeyNames="MechantID"
        AllowPaging="true" PageSize="3" OnPageIndexChanging="grdMechants_PageIndexChanging"
        AllowSorting="true" OnSorting="grdMechants_Sorting" OnRowDataBound="grdMechants_RowDataBound" >
        <Columns>
            <asp:BoundField DataField="Mechant1" HeaderText="Mechant Name" SortExpression="Mechant1" />
         
            <asp:HyperLinkField HeaderText="Edit" Text="Edit" NavigateUrl="mechant.aspx"
                DataNavigateUrlFields="MechantID" 
                DataNavigateUrlFormatString="mechant.aspx?MechantID={0}" />
            <asp:CommandField HeaderText="Delete" DeleteText="Delete" ShowDeleteButton="true" />
        </Columns>
    </asp:GridView>
</asp:Content>
