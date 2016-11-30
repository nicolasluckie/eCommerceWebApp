<%@ Page Title="Login - Nicolas Luckie" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="Assignment_3.LoginPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <!-- HEADER -->
    <div class="row">
        <div class="col-md-3"></div>
        <div class="col-md-6">
            <div style="text-align: center; margin-top: 20px;margin-bottom: 20px;">
                <h1 class="label label-danger" style="font-size: 28pt; margin-top: 40px;margin-bottom:20px;">LOGIN</h1>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-4"></div>
        <div class="col-md-4">
            <div class="well">
                <div style="margin-top: 15px;">
                    <asp:Label runat="server" AssociatedControlID="username" CssClass="label label-primary" style="font-size: 12pt;">Username</asp:Label>
                    <div>
                        <asp:TextBox runat="server" ID="username" CssClass="form-control" TextMode="SingleLine" style="margin-top: 10px;" autofocus />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="username" CssClass="text-danger" ErrorMessage="The username field is required." />
                    </div>
                </div>
                <div style="margin-top: 15px;">
                    <asp:Label runat="server" AssociatedControlID="password" CssClass="label label-primary" style="font-size: 12pt;">Password</asp:Label>
                    <div>
                        <asp:TextBox runat="server" ID="password" CssClass="form-control" TextMode="Password" style="margin-top: 10px;"  />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="password" CssClass="text-danger" ErrorMessage="The password field is required." />
                    </div>
                </div>
                <div>
                    <asp:Button ID="loginBtn" OnClick="loginBtn_Click" runat="server" CssClass="btn btn-primary btn-lg" Text="Login &raquo;" />
                </div>
            </div>
        </div>
    </div>

</asp:Content>
