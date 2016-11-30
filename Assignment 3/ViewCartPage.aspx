<%@ Page Title="Shopping Cart - Nicolas Luckie" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewCartPage.aspx.cs" Inherits="Assignment_3.ViewCartPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <!-- HEADER -->
    <div class="well">
        <h1>Shopping Cart</h1>
    </div>

    <hr />

    <div class="well">
        <div class="row">

            <asp:ListView ID="prodListing" runat="server">
                <LayoutTemplate>
                    <div class="col-md-8">
                        <asp:PlaceHolder ID="itemPlaceholder" runat="server" />
                    </div>
                </LayoutTemplate>
                <ItemTemplate>
                    <div class="row" style="border: 1px dashed black; margin-bottom: 5px;">
						<div class="col-md-3">
							<p style="margin-top: 10px; word-wrap: break-word;"><strong>Name: </strong><span><%#Eval ("Product.Name") %></span></p>
						</div>
						<div class="col-md-3">
							<p style="margin-top: 10px; word-wrap: break-word;"><strong>Quantity: </strong><span><%#Eval ("Quantity") %></span></p>
						</div>
						<div class="col-md-3">
							<p style="margin-top: 10px; word-wrap: break-word;"><strong>Total: </strong><span>CDN$ <%#Eval ("Product.Price") %></span></p>
						</div>
                        <div class="col-md-3">
                            <asp:Button ID="deleteBtn" OnClick="deleteBtn_Click" runat="server" Text='Remove' CssClass="btn btn-danger" style="margin-top: 3px;" ToolTip='<%# Eval("Product.Name") %>' />
                        </div>
				    </div>
                </ItemTemplate>
                <EmptyDataTemplate>
                    <div class="col-md-8">
                        <h3>No items in shopping cart.</h3>
                    </div>
                </EmptyDataTemplate>
            </asp:ListView>

            <!-- PRICING INFORMATION -->
            <div class="col-md-4">
                <h2>Subtotal: <br /><div class="label label-warning" id="subtotalText" runat="server">CDN$ 0.00</div></h2>
                <hr />
                <h2>Tax: <div class="label label-primary">13%</div></h2>
                <hr />
                <h2>Total: <br /><div class="label label-success" id="totalText" runat="server">CDN$ 0.00</div></h2>
                <asp:Button ID="checkoutBtn" runat="server" OnClick="checkoutBtn_Click" Text="Checkout" CssClass="btn btn-danger btn-lg" style="font-weight: bold; font-size: 18pt; margin-top: 10px; width: 200px;" />
            </div>
        </div>

    </div>

</asp:Content>
