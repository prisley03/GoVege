<%@ Page Title="" Language="C#" MasterPageFile="~/View/MasterPage.Master" AutoEventWireup="true" CodeBehind="StorePage.aspx.cs" Inherits="GoVege.View.StorePage1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .store-container{
            padding: 3vh 6vw;
        }

        hr{
            left: 5.56%;
            right: 5.56%;
            border: 1px solid #000000;
        }

        use:nth-child(2) {
        transform: translate(20px);
        }
        use:nth-child(3) {
        transform: translate(40px);
        }
        use:nth-child(4) {
        transform: translate(60px);
        }
        use:nth-child(5) {
        transform: translate(80px);
        }

        .rating {
          display: block;
          height: 20px;
          width: 100px;
        }

        .img-product, .img-vendor{
            object-fit: cover;
        }

        .vendor-info-container{
            display: flex;
            flex-direction: column;
            gap: 0.5rem;
        }

        .rating-container{
            display: flex;
            gap: 1rem;
        }

        .vendor-header-container{
            display: flex;
    flex-flow: row-reverse;
    justify-content: space-between;
    padding-bottom: 3vh;
        }

        .product-container{
            padding-top: 3vh;
    display: flex;
    gap: 1rem;
    flex-direction: column;
        }

        .product-wrapper{
            display: flex;
            flex-wrap: wrap;
            justify-content:space-between;
            gap: 1rem;
        }

        .product-card{
            background: #CAF7D2;
    border-radius: 20px;
    padding: 1rem;
        }

        header{
            position: static;
        }

        #headerContainer {
            margin: 0;
    padding: 16px 32px;
    display: flex;
    justify-content: space-between;
    vertical-align: middle;
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <svg id="stars" style="display: none;" version="1.1">
        <symbol id="stars-empty-star" viewBox="0 0 102 18" fill="#F1E8CA">
        <path d="M9.5 14.25l-5.584 2.936 1.066-6.218L.465 6.564l6.243-.907L9.5 0l2.792 5.657 6.243.907-4.517 4.404 1.066 6.218" />
        </symbol>
        <symbol id="stars-full-star" viewBox="0 0 102 18" fill="#D3A81E">
        <path d="M9.5 14.25l-5.584 2.936 1.066-6.218L.465 6.564l6.243-.907L9.5 0l2.792 5.657 6.243.907-4.517 4.404 1.066 6.218" />
        </symbol>
        <symbol id="stars-half-star" viewBox="0 0 102 18" fill="#D3A81E">
        <use href="#stars-empty-star" />
        <path d="M9.5 14.25l-5.584 2.936 1.066-6.218L.465 6.564l6.243-.907L9.5 0l2.792" />
        </symbol>
    </svg>

    <div class="store-container">
        <div class="vendor-header-container">
            <asp:Image ID="ImageVendor" runat="server" Height="150" Width="150" CssClass="img-vendor" />
        
            <div class="vendor-info-container">
                <h1><%= vendorTarget.vendorName %></h1>
                <div class="rating-container">
                    <svg aria-hidden="true" focusable="false" class="rating">
            
                        <%for (int i = 0; i < fullStarCount; i++){%>
                        <use href="#stars-full-star" />
                        <%}%>
                        <%for (int i = 0; i < halfStarCount; i++){%>
                            <use href="#stars-half-star" />
                            <%}%>
                        <%for (int i = 0; i < emptyStarCount; i++){%>
                            <use href="#stars-empty-star" />
                            <%}%>
                    </svg>
                    <% Response.Write(vendorRating.ToString("0.0")); %>
                </div>
                <div><%= vendorTarget.vendorAddress %></div>
            </div>
        </div>
        
        
        <hr />
        <div class="product-container">
            <h2 style="color: #2EB14B;">Today’s Specials</h2>
            
            <asp:ListView ID="ListViewProduct" runat="server" OnItemCommand="ListViewProduct_ItemCommand">
                <LayoutTemplate>
                    <div class="product-wrapper">
                        
                            <asp:PlaceHolder ID="ItemPlaceHolder" runat="server"></asp:PlaceHolder>
                        
                    </div>
                </LayoutTemplate>
                <ItemTemplate>
                    <div class="product-card">
                        <asp:Image ID="ImageProduct" runat="server" Height="150" Width="150" CssClass="img-product" ImageUrl=<%#"~/Assets/Product/" +  Eval("productImage") %> />
                        <div><%# Eval("productName") %></div>
                        <div><%# "Rp " + Eval("productPrice") %></div>
                        <asp:TextBox ID="TxtQty" runat="server"></asp:TextBox>
                        <asp:LinkButton ID="BtnAddCart" runat="server" Text="+" CommandArgument='<%# Eval("productID") %>' CommandName="save"/>
                    </div>
                </ItemTemplate>
            </asp:ListView>
            <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
        </div>
    </div>
</asp:Content>
