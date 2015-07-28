<%@ Page Title="gBudget Mechant" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="mechant.aspx.cs" Inherits="gBudget2.mechant" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Mechant</h1>
    <h5>All fields are required</h5>

    <fieldset>
        <label for="txtMechant" class="col-sm-2">Mechant Name:</label>
        <asp:TextBox ID="txtMechant" runat="server" required MaxLength="50" />
    </fieldset>

    <div class="col-sm-offset-2">
        <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-primary"
             OnClick="btnSave_Click"/>
    </div>

    <%--<h2>Courses</h2>
    <asp:GridView ID="grdCourses" runat="server" AutoGenerateColumns="false"
        DataKeyNames="EnrollmentID" OnRowDeleting="grdCourses_RowDeleting"
        CssClass="table table-striped table-hover">
        <Columns>
            <asp:BoundField DataField="Name" HeaderText="Department" />
            <asp:BoundField DataField="Title" HeaderText="Course" />
            <asp:BoundField DataField="Grade" HeaderText="Grade" />
            <asp:CommandField ShowDeleteButton="true" DeleteText="Delete" HeaderText="Delete" />
        </Columns>
    </asp:GridView>--%>
</asp:Content>
