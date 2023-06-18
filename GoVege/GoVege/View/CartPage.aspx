<%@ Page Title="" Language="C#" MasterPageFile="~/View/MasterPage.Master" AutoEventWireup="true" CodeBehind="CartPage.aspx.cs" Inherits="GoVege.View.CartPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="store-container">
        <div class="vendor-header-container">
            <asp:Image ID="ImageVendor" runat="server" Height="150" Width="150" />
        
            <div class="vendor-info-container">
                <h1><%= vendorTarget.vendorName %></h1>
                <div><%= vendorTarget.vendorAddress %></div>
            </div>
        </div>
        
        <hr />
        
        <div class="product-container">
            <h2>Order Summary</h2>
            <div style="color: #2EB14B;">Add Items</div>
            <% foreach (var cart in cartList)
                {%>
                <div><%= cart.quantity %></div>
                <div><%= cart.MsProduct.productImage %></div>
                <div><%= cart.MsProduct.productName %></div>
                <div><%= cart.MsProduct.productPrice * cart.quantity %></div>
            <%} %>
        </div>
    </div>
</asp:Content>
