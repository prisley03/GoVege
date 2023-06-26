<%@ Page Title="" Language="C#" MasterPageFile="~/View/MasterPage.Master" AutoEventWireup="true" CodeBehind="CartPage.aspx.cs" Inherits="GoVege.View.CartPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .store-container{
            padding: 3vh 6vw;
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

        hr{
            left: 5.56%;
            right: 5.56%;
            border: 1px solid #000000;
        }

        .img-product{
            object-fit: cover;
        }

        .vendor-info-container{
            display: flex;
            flex-direction: column;
            gap: 0.5rem;
        }

        .vendor-header-container{
            display: flex;
            flex-flow: row-reverse;
            justify-content: space-between;
            padding-bottom: 3vh;
            color: #2EB14B;
        }

        .product-container, .payment-container{
            padding: 3vh 0;
            display: flex;
            gap: 1rem;
            flex-direction: column;
        }

        .product-wrapper{
            display: flex;
            flex-direction:column;
            gap: 1rem;
        }

        .product-row{
            display: flex;
            padding: 1rem;
            font-size: 3vh;
            justify-content: space-between;
            align-items: center;
        }

        .delivery-container{
            padding: 3vh 0;
            display: flex;
            gap: 1rem;
            flex-direction: column;
        }

        .textbox{
            border: 4px solid #2EB14B;
            border-radius: 10px;
            height: 4.5vh;
            font-size: 2.5vh;
            font-family: 'Franklin Gothic';
            padding: 1vw;
            width: 60%;
        }

        .input-item{
            display:flex;
            justify-content: space-between;
            align-items: center;
        }

        .input-item span{
            font-size: 3vh;
            font-family: 'Franklin Gothic Regular';
        }

        .dropdown{
            border: 4px solid #2EB14B;
            border-radius: 10px;
            font-size: 2.5vh;
            font-family: 'Franklin Gothic';
            padding: 1vw;
            width: 100%;
        }

        .button-order{
            background: #2EB14B;
            border-radius: 10px;
            width: 100%;
            font-size: 2.5vh;
            font-family: 'Franklin Gothic';
            color: white;
            padding: 1vw;
            border: none;
        }

        .sum-container{
            display: flex;
            padding: 1rem;
            font-size: 3vh;
            justify-content: space-between;
            align-items: center;
        }

        .sum-label{
            
        }

        .sum-value{
            text-align: center;
            width: 25%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="store-container">
        <div class="vendor-header-container">
            <asp:Image ID="ImageVendor" runat="server" Height="150" Width="150" CssClass="img-vendor" />
        
            <div class="vendor-info-container">
                <h1><%= vendorTarget.vendorName %></h1>
                <div><%= vendorTarget.vendorAddress %></div>
            </div>
        </div>
        
        <hr />

        <div class="delivery-container">
            <h2>Delivery Details</h2>
            <div class="input-item">
                <asp:Label ID="LblDate" runat="server" Text="Delivery Date"></asp:Label>
                <asp:TextBox ID="TxtDate" runat="server" CssClass="textbox" TextMode="Date"></asp:TextBox>
            </div>
            <div class="input-item">
                <asp:Label ID="LblTime" runat="server" Text="Delivery Time"></asp:Label>
                <asp:TextBox ID="TxtTime" runat="server" CssClass="textbox" TextMode="Time"></asp:TextBox>
            </div>
            <div class="input-item">
                <asp:Label ID="LblAddress" runat="server" Text="Delivery Address"></asp:Label>
                <asp:TextBox ID="TxtAddress" runat="server" CssClass="textbox"></asp:TextBox>
            </div>
            <div class="input-item">
                <asp:Label ID="LblNotes" runat="server" Text="Delivery Notes"></asp:Label>
                <asp:TextBox ID="TxtNotes" runat="server" CssClass="textbox"></asp:TextBox>
            </div>
        </div>

        <hr />
        
        <div class="product-container">
            <div style="width: 100%; display: flex; justify-content: space-between;">
                <h2>Order Summary</h2>
                <a href=<%= "StorePage.aspx?VendorID=" + vendorTarget.vendorID %>><div style="color: #2EB14B;color: #2EB14B;
    font-size: 3.5vh;
    font-family: 'Franklin Gothic Regular';">Add Items</div></a>
            </div>
            <asp:ListView ID="ListViewCart" runat="server" GroupPlaceholderID="rowGroupPlaceholder" ItemPlaceholderID="colItemPlaceholder" OnItemCommand="ListViewCart_ItemCommand" OnLayoutCreated="ListViewCart_LayoutCreated">
                <LayoutTemplate>
                    <div class="product-wrapper">
                        <asp:PlaceHolder ID="rowGroupPlaceholder" runat="server"></asp:PlaceHolder>
                    </div>
                    <div class="sum-container">
                        <div class="sum-label">Sub Total</div>
                        <div class="sum-value">
                            <asp:Label ID="LblSum" runat="server" Text=""></asp:Label>
                        </div>
                    </div>
                    <div class="sum-container" id="PromoContainer" runat="server">
                        <div class="sum-label">
                            <asp:Label ID="LblPromo" runat="server" Text=""></asp:Label>
                        </div>
                        <div class="sum-value">
                            <asp:Label ID="LblPromoValue" runat="server" Text=""></asp:Label>
                        </div>
                    </div>
                    <div class="sum-container">
                        <div class="sum-label">Grand Total</div>
                        <div class="sum-value">
                            <asp:Label ID="LblTotal" runat="server" Text=""></asp:Label>
                        </div>
                    </div>
                </LayoutTemplate>
                <GroupTemplate>
                    <div class="product-row">
                        <asp:PlaceHolder ID="colItemPlaceholder" runat="server"></asp:PlaceHolder>
                    </div>
                </GroupTemplate>
                <ItemTemplate>
                    <div style="display:flex; gap: 0.5rem;font-size: 4vh;width: 10%;">
                        <asp:LinkButton ID="BtnRemoveItem" runat="server" Text="-" CommandArgument='<%# Eval("MsProduct.productID") %>' CommandName="remove"/>
                        <div>
                            <asp:Label ID="LblQty" runat="server" Text=<%# Eval("quantity").ToString() %>></asp:Label>
                        </div>
                        <asp:LinkButton ID="BtnAddItem" runat="server" Text="+" CommandArgument='<%# Eval("MsProduct.productID") %>' CommandName="add"/>
                    </div>
                    <asp:Image ID="ImageProduct" runat="server" Height="150" Width="150" CssClass="img-product" ImageUrl=<%#"~/Assets/Product/" +  Eval("MsProduct.productImage") %> />
                    <div style="width: 30%;"><%# Eval("MsProduct.productName") %></div>
                    <div style="width: 25%;
    text-align: center;"><%# "Rp " + int.Parse(Eval("MsProduct.productPrice").ToString()) * int.Parse(Eval("quantity").ToString()) %></div>
                </ItemTemplate>
                </asp:ListView>
        </div>
        <hr />
        <div class="payment-container">
                <h2>Payment Method</h2>
                <div>
                    <asp:DropDownList ID="DropDownPayment" runat="server" CssClass="dropdown">
                        <asp:ListItem Selected="True">Choose a Payment Method</asp:ListItem>
                        <asp:ListItem>Mandiry</asp:ListItem>
                        <asp:ListItem>DCA</asp:ListItem>
                        <asp:ListItem>UVU</asp:ListItem>
                        <asp:ListItem>VegPay</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div>
                    <asp:DropDownList ID="DropDownPromo" runat="server" CssClass="dropdown" AutoPostBack="True">
                        <asp:ListItem Selected="True">Choose a Promotion</asp:ListItem>
                        <asp:ListItem Value="1">35% off for our new users</asp:ListItem>
                        <asp:ListItem Value="2">50% off on christmas eve</asp:ListItem>
                        <asp:ListItem Value="3">10% off at the market</asp:ListItem>
                        <asp:ListItem Value="4">70% off at black friday</asp:ListItem>
                        <asp:ListItem Value="5">60% off on Labor Day</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
        <asp:Button ID="BtnOrder" runat="server" Text="Place Order" CssClass="button-order" />
    </div>
</asp:Content>
