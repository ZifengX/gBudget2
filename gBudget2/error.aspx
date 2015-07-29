<%@ Page Title="gBudget Error" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="error.aspx.cs" Inherits="gBudget2.error" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Error:</h2>
    <asp:Label ID="FriendlyErrorMsg" runat="server" Text="Label" Font-Size="Large" style="color: red"></asp:Label>
</asp:Content>
