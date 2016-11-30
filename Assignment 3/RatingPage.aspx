<%@ Page Title="Rate - Nicolas Luckie" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RatingPage.aspx.cs" Inherits="Assignment_3.RatingPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <!-- HEADER -->
    <div class="well">
        <h1 id="prodName" runat="server">{ Product Name }</h1>
        <h2><span class="label label-danger" id="currRating" runat="server">{ CURRENT RATING }</span></h2>
        <hr />
        <div style="margin-top: 30px;">
            <asp:Label runat="server" AssociatedControlID="prodRating" CssClass="label label-success" style="font-size: 12pt;">Rating</asp:Label>
            <div>
                <asp:TextBox runat="server" ID="prodRating" CssClass="form-control" TextMode="Number" min="1" max="5" value="1" style="max-width: 75px; margin-top: 10px;"  />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="prodRating" CssClass="text-danger" ErrorMessage="The quantity field is required." />
            </div>
        </div>

        <div>
            <asp:Label runat="server" AssociatedControlID="prodComment" CssClass="label label-success" style="font-size: 12pt;">Comment <small>(optional)</small></asp:Label>
            <div>
                <asp:TextBox runat="server" ID="prodComment" CssClass="form-control" TextMode="MultiLine" style="margin-top: 10px;max-width: 100%;"  />
            </div>
        </div>

        <asp:Button ID="submitRating" runat="server" OnClick="submitRating_Click" Text="Submit Rating" CssClass="btn btn-primary btn-lg" style="margin-top:15px;" />

    </div>

</asp:Content>
