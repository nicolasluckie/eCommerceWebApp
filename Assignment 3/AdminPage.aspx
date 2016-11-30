<%@ Page Title="Admin - Nicolas Luckie" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminPage.aspx.cs" Inherits="Assignment_3.AdminPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <!-- HEADER -->
    <div class="well">
        <h1>Welcome, Administrator.</h1>
    </div>

    <div class="well">
        <h2>Product Analytics</h2>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th class="danger">Sale ID</th>
                    <th class="warning">Product Name</th>
                    <th class="success">Quantity</th>
                    <th class="info">Price per Unit</th>
                </tr>
            </thead>
            <tbody id="salesOutput" runat="server">
            </tbody>
            <tfoot id="salesFooter" runat="server">
            </tfoot>
        </table>
    </div>

    <div class="well">
        <h2>Product Ratings</h2>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th class="danger">Record ID</th>
                    <th class="warning">Product Name</th>
                    <th class="success">Rating</th>
                    <th class="info">Comment</th>
                </tr>
            </thead>
            <tbody id="ratingsOutput" runat="server">
            </tbody>
        </table>
    </div>

</asp:Content>
