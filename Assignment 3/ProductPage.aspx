<%@ Page Title="Product - Nicolas Luckie" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProductPage.aspx.cs" Inherits="Assignment_3.ProductPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <!-- HEADER -->
    <div class="well">
        <h1 id="prodName" runat="server">{ Product Name }</h1>
        <h2><span class="label label-success" id="prodPrice" runat="server">CDN$ 0.00</span></h2>

        <div style="margin-top: 15px;">
            <asp:Label runat="server" AssociatedControlID="prodQuantity" CssClass="label label-warning" style="font-size: 12pt;">Quantity</asp:Label>
            <div>
                <asp:TextBox runat="server" ID="prodQuantity" CssClass="form-control" TextMode="Number" min="1" max="5" value="1" style="max-width: 75px; margin-top: 10px;"  />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="prodQuantity" CssClass="text-danger" ErrorMessage="The quantity field is required." />
            </div>
        </div>

        <asp:LinkButton id="addToCartBtn" OnClick="addToCartBtn_Click" Text="Add to Cart &raquo;" runat="server" class="btn btn-danger" />
        <asp:Button id="rateBtn" OnClick="rateBtn_Click" Text="Rate this Product &#10003;" runat="server" CssClass="btn btn-primary" />
    </div>

    <hr />

    <div class="well">
        <div class="row">
            <div class="col-md-6" style="text-align: center;">
                <img id="prodImg" runat="server" style="height: 200px;" />
            </div>
            <div class="col-md-6">
                <p><strong>Product Information:</strong>
                    <p id="prodDesc" runat="server">
                    { Product Description }
                    </p>
                </p>
            </div>
        </div>
    </div>

</asp:Content>
