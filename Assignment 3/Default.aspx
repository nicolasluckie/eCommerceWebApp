<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Assignment_3._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <!-- JUMBOTRON -->
    <div class="jumbotron">
        <h1 style="text-align: center;"><img style="width: 75%;" src="img/nozama.png" /></h1>
        <p class="lead"><strong>Nozama</strong>, is a Canadian electronic commerce and cloud computing company,
                 founded in November 25, 2016 by Nicolas Luckie and based in Mississauga, Ontario.
        </p>
        <p><a href="#products" class="btn btn-danger btn-lg" id="viewProductsBtn" onclick="viewProductsBtnClicked">View Products &raquo;</a></p>
    </div>

    <!-- HEADER -->
    <div class="jumbotron" style="text-align: center;">
        <h1>Browse Products</h1>
        <h2>Browse our vast collection of items!</h2>
    </div>
    
    <!-- PRODUCT ROW -->
    <div class="row" id="products">

        <!-- PRODUCT 1 -->
        <div class="col-md-4">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title"><strong id="product1Name" runat="server">{ Product Name }</strong></h3>
                </div>
                <div class="panel-body">
                    <div style="text-align: center;"><img id="product1Img" runat="server" style="height: 200px;" /></div>
                    <p><hr />
                        <strong>Product Information:<br /></strong>
                        <p id="product1Desc" runat="server">
                        Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
                        Proin dictum dui quis elit placerat lacinia. Mauris luctus bibendum arcu, a pellentesque odio finibus et. 
                        Cras volutpat fringilla libero, sollicitudin gravida lacus finibus et.
                        </p>
                    </p>
                    <asp:LinkButton id="Product_1" OnClick="viewProductBtn_Click" Text="View Product &raquo;" runat="server" class="btn btn-primary" />
                </div>
            </div>
        </div>

        <!-- PRODUCT 2 -->
        <div class="col-md-4">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title"><strong id="product2Name" runat="server">{ Product Name }</strong></h3>
                </div>
                <div class="panel-body">
                    <div style="text-align: center;"><img id="product2Img" runat="server" style="height: 200px;" /></div>
                    <p><hr />
                        <strong>Product Information:<br /></strong>
                        <p id="product2Desc" runat="server">
                        Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
                        Proin dictum dui quis elit placerat lacinia. Mauris luctus bibendum arcu, a pellentesque odio finibus et. 
                        Cras volutpat fringilla libero, sollicitudin gravida lacus finibus et.
                        </p>
                    </p>
                    <asp:LinkButton id="Product_2" OnClick="viewProductBtn_Click" Text="View Product &raquo;" runat="server" class="btn btn-primary" />
                </div>
            </div>
        </div>

        <!-- PRODUCT 3 -->
        <div class="col-md-4">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title"><strong id="product3Name" runat="server">{ Product Name }</strong></h3>
                </div>
                <div class="panel-body">
                    <div style="text-align: center;"><img id="product3Img" runat="server" style="height: 200px;" /></div>
                    <p><hr />
                        <strong>Product Information:<br /></strong>
                        <p id="product3Desc" runat="server">
                        Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
                        Proin dictum dui quis elit placerat lacinia. Mauris luctus bibendum arcu, a pellentesque odio finibus et. 
                        Cras volutpat fringilla libero, sollicitudin gravida lacus finibus et.
                        </p>
                    </p>
                    <asp:LinkButton id="Product_3" OnClick="viewProductBtn_Click" Text="View Product &raquo;" runat="server" class="btn btn-primary" />
                </div>
            </div>
        </div>

    </div>
    <!-- END OF PRODUCT ROW -->

</asp:Content>
