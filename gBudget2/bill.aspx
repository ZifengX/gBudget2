<%@ Page Title="gBudget Bill" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="bill.aspx.cs" Inherits="gBudget2.bill" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Bill Details</h1>
    <h5>All fields are required</h5>

    <fieldset>
        <label for="txtAmount" class="col-sm-2">Amount:</label>
        <asp:TextBox ID="txtAmount" runat="server" required MaxLength="50" />
    </fieldset>

    <fieldset>
        <label for="ddlCategory" class="col-sm-2">Category:</label>
        <asp:DropDownList ID="ddlCategory" runat="server" DataValueField="CategoryID" DataTextField="Category1" />
    </fieldset>

    <fieldset>
        <label for="ddlAccount" class="col-sm-2">Account:</label>
        <asp:DropDownList ID="ddlAccount" runat="server" DataValueField="AccountID" DataTextField="Account1" />
    </fieldset>

    <fieldset>
        <label for="ddlMechant" class="col-sm-2">Mechant:</label>
        <asp:DropDownList ID="ddlMechant" runat="server" DataValueField="MechantID" DataTextField="Mechant1" />
    </fieldset>

    <fieldset>
        <label for="txtNote" class="col-sm-2">Note:</label>
        <asp:TextBox ID="txtNote" runat="server" MaxLength="100" />
    </fieldset>

    <fieldset>
        <label for="txtDate" class="col-sm-2">Date:</label>
        <asp:TextBox ID="txtDate" runat="server" required TextMode="Date" />
        <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="Must be a Date"
            ControlToValidate="txtDate" CssClass="alert alert-danger"
            Type="Date" MinimumValue="2000-01-01" MaximumValue="2999-12-30">
        </asp:RangeValidator>
    </fieldset>   

    <div class="col-sm-offset-2">
        <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-primary"
             OnClick="btnSave_Click" />
    </div>

    <asp:Label ID="lblCategory" runat="server"></asp:Label>
    <asp:Label ID="lblAccount" runat="server"></asp:Label>
    <asp:Label ID="lblMechant" runat="server"></asp:Label>
    <%--<h2>Students</h2>
    <asp:GridView ID="grdStudents" runat="server" AutoGenerateColumns="false"
        DataKeyNames="EnrollmentID" OnRowDeleting="grdStudents_RowDeleting"
        CssClass="table table-striped table-hover">
        <Columns>
            <asp:BoundField DataField="LastName" HeaderText="Last Name" />
            <asp:BoundField DataField="FirstMidName" HeaderText="First Name" />
            <asp:BoundField DataField="Grade" HeaderText="Grade" />
            <asp:BoundField DataField="EnrollmentDate" HeaderText="Enrollment Date" DataFormatString="{0:MM-dd-yyyy}" SortExpression="EnrollmentDate"/>
            <asp:CommandField ShowDeleteButton="true" DeleteText="Delete" HeaderText="Delete" />
        </Columns>
    </asp:GridView>--%>

</asp:Content>
