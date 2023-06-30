<%@ Page Title="GoVege - Promotions" Language="C#" MasterPageFile="~/View/MasterPage.Master" AutoEventWireup="true" CodeBehind="PromotionPage.aspx.cs" Inherits="GoVege.View.PromotionPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .bannerPromotion {
            position: relative;
            text-align: center;
            font-size: 5rem;
            max-width: 100%;
            padding-top: 20rem;
            padding-bottom: 20rem;
            color: white;
        }

            .bannerPromotion::after {
                content: "";
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-image: url('../Assets/sales.jpg');
                background-size: cover;
                background-position: center;
                filter: brightness(70%);
                z-index: -1;
            }

        .headerPromotion {
            margin-left: 1rem;
            line-height: 2rem;
        }

        .headerPromotion #<%= txtHeader.ClientID %> {
            font-size: 2rem;

        }
        .bodyPromotion {
            padding: 10px;
            margin-bottom: 10px;
        }

        .contentPromotion {
            position: relative;
            display: inline-block;
            vertical-align: top;
            text-align: left;
            margin: 1rem;
            line-height: 2rem;
        }

            .contentPromotion h3 {
                font-size: 1.5rem;
                font-weight: bold;
                margin-bottom: 0;
            }

        #lblPromoDescription {
            font-size: 0.8rem;
            font-weight: lighter;
            margin-bottom: 0;
        }

        #lblTimePromotion {
            font-size: 0.8rem;
            position: absolute;
            bottom: 0;
            left: 0;
            margin-top: 0.5rem;
        }

        .contentPromotion btnAddCart {
            display: block;
            margin-top: 0.5rem;
        }

        .promoPhoto {
            width: 10rem;
            height: 10rem;
            object-fit: fill;
            display: inline-block;
            border: 0.001rem solid;
            border-color: gray;
            margin: 1rem;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div>
    </div>
    <div class="bannerPromotion">

        <div class="bannerPromotionDetails">
            <asp:Label ID="txtBanner" runat="server" Text="20% Off at Our Partner Store"></asp:Label>
            <br />
            <asp:Button ID="restoBtn" CssClass="button" runat="server" Text="Go To Restaurant Button" OnClick="restoBtn_Click" />
        </div>
    </div>
    <div class="headerPromotion">
        <asp:Label ID="txtHeader" runat="server" Text="Promos on GoVege"></asp:Label>
        <br />
        <asp:Label ID="txtSubheader" runat="server" Text="Spend less on your money with our offers"></asp:Label>
    </div>
    <div class="bodyPromotion">
        <asp:Repeater ID="PromotionRepeater" runat="server">
            <ItemTemplate>
                <image class="promoPhoto" src='../Assets/Voucher/<%#Eval("Photo")%>'></image>

                <div class="contentPromotion">
                    <h3><%# Eval("VoucherName") %></h3>
                    <asp:Label ID="lblPromoDescription" runat="server" Text=""><%# Eval("Description") %></asp:Label>
                    <br />

                    <asp:Label ID="lblTimePromotion" runat="server" Text=""><%# Convert.ToDateTime(Eval("StartDate")).ToString("dd MMMM yyyy") %> - 
                <%# Convert.ToDateTime(Eval("EndDate")).ToString("dd MMMM yyyy") %></asp:Label>
                    <br />
                </div>
                <asp:Button CssClass="button" ID="btnAddToCart" runat="server" Text="Apply Offer" OnClick="btnAddToCart_Click" CommandArgument='<%# Eval("VoucherID") %>' />

                <hr />
            </ItemTemplate>
        </asp:Repeater>
    </div>
</asp:Content>
