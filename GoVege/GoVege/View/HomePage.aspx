<%@ Page Title="" Language="C#" MasterPageFile="~/View/MasterPage.Master" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="GoVege.View.HomePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .topSection {
            background-image: url("/Assets/gadoGadoImage.png");
            object-fit: cover;
            height: 60vh;
            background-size: cover;
            background-repeat: no-repeat;
            position: relative;
        }

        .topText {
            font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
            display: flex;
            justify-content: space-between;
            color: white;
        }

        .searchAddressContainer {
            height: auto;
            top: 50%;
            display: flex;
            position: absolute;
            width: 35vw;
            flex-direction: column;
            padding-left: 5vw;
        }

        .topLabel {
            padding-bottom: 10px;
        }

        .Button {
            border: 2px solid #30D315;
            color: #30D315;
            background-color: white;
            border-radius: 3px;
            cursor: pointer;
            margin-left: 0;
            margin-right: 0;
            margin-top: 0;
        }

            .Button:hover {
                color: white;
                background-color: #30D315;
                border-radius: 3px;
                margin: 0;
                cursor: pointer;
            }

        .Textbox {
            border: 2px solid #30D315;
            background-color: white;
            border-radius: 3px;
            margin: 0;
        }

        .searchRestaurantContainer {
            display: flex;
            justify-content: center;
            align-content: center;
            margin-top: 20px;
            margin-bottom: 10px;
        }

        .contentImage {
            width: 100%;
            height: 75%;
            border-radius: 5px;
            object-fit: cover;
        }

        hr {
            display: block;
            margin: 0px 32px 0px 32px;
        }

        h2 {
            margin-bottom: 10px;
            color: #30D315;
        }

        p {
            color: black;
        }

        .veganRestaurant {
            margin: 20px 32px 20px 32px;
            display: flex;
            flex-direction: column;
        }

        .vendorContainer {
            display: flex;
            border-radius: 3px;
            flex-wrap: wrap;
            justify-content: space-around;
        }

        .vendorItemContainer {
            width: 175px;
            cursor: pointer;
            height: 200px;
            background-color: #CBF7D2;
            border-radius: 5px;
            margin: 5px 5px 5px 5px;
            padding: 5px 5px 5px 5px;
        }

        .vendorItemContainer:hover {
            box-shadow: 5px 10px black;
        }

        .vegetarianRestaurant {
            margin: 20px 32px 20px 32px;
            display: flex;
            flex-direction: column;
        }

        .recommendedCategories {
            margin: 20px 32px 20px 32px;
            display: flex;
            flex-direction: column;
        }

        .vendorImage {
            border-radius: 5px;
            width: 100%;
            height: 100px;
        }

        .buttonContainer {
            height: auto;
            width: auto;
            align-self: center;
            cursor: pointer;
            margin: 10px 0px 10px 0px;
        }

        .errorContainer {
            display: flex;
            justify-content: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="topSection">
        <div class="searchAddressContainer">
            <div class="topLabel">
                <asp:Label CssClass="topText" ID="Label1" runat="server" Text="Order Food to Your Door"></asp:Label>
            </div>
        </div>
    </div>
    <div class="searchRestaurantContainer">
        <asp:TextBox CssClass="Textbox" ID="txtSearched" placeholder="Search Your Restaurant Here" runat="server" Width="347px"></asp:TextBox>
        <asp:Button CssClass="Button" ID="ButtonSearchRestaurant" runat="server" Text="Search" OnClick="ButtonSearchRestaurant_Click" />
    </div>
    <div class="errorContainer">
        <asp:Label ID="LblError" runat="server" Text=""></asp:Label>
    </div>


    <hr />
    <div class="vegetarianRestaurant" runat="server" id="searchedRestaurantID" visible="false">
        <h2>Searched Restaurant
        </h2>
        <div class="vendorContainer">
            <asp:ListView ID="LVVendorSearched" runat="server">
                <ItemTemplate>
                    <a href='StorePage.aspx?VendorID=<%#Eval("vendorID")%>'>
                        <div class="vendorItemContainer">
                            <image class="contentImage" src='../Assets/Vendor/<%#Eval("vendorImage")%>'></image>
                            <p><%#Eval("vendorName")%></p>
                            <p><%#Eval("vendorRating")%>/5 Stars</p>
                        </div>
                    </a>
                </ItemTemplate>
            </asp:ListView>
        </div>
    </div>
    <div class="vegetarianRestaurant" runat="server" id="vegetarianRestaurantID">
        <h2>Top Vegetarian Restaurants in Jakarta.
        </h2>
        <div class="vendorContainer">
            <asp:ListView ID="LVVendorVegetarian" runat="server">
                <ItemTemplate>
                    <a href='StorePage.aspx?VendorID=<%#Eval("vendorID")%>'>
                        <div class="vendorItemContainer">
                            <image class="contentImage" src='../Assets/Vendor/<%#Eval("vendorImage")%>'></image>
                            <p><%#Eval("vendorName")%></p>
                            <p><%#Eval("vendorRating")%>/5 Stars</p>
                        </div>
                    </a>
                </ItemTemplate>
            </asp:ListView>
        </div>
        <div class="buttonContainer">
            <asp:Button CssClass="Button" ID="Button1" runat="server" Text="View More Suggestions" OnClick="Button1_Click" />
        </div>
        <hr />
    </div>


    <div class="veganRestaurant" runat="server" id="veganRestaurantID">
        <h2>Top Vegan Restaurants in Jakarta.
        </h2>
        <div class="vendorContainer">
            <asp:ListView ID="LVVendorVegan" runat="server">
                <ItemTemplate>
                    <a href='StorePage.aspx?VendorID=<%#Eval("vendorID")%>'>
                        <div class="vendorItemContainer">
                            <image class="contentImage" src='../Assets/Vendor/<%#Eval("vendorImage")%>'></image>
                            <p><%#Eval("vendorName")%></p>
                            <p><%#Eval("vendorRating")%>/5 Stars</p>
                        </div>
                    </a>
                </ItemTemplate>
            </asp:ListView>
        </div>
        <div class="buttonContainer">
            <asp:Button CssClass="Button" ID="Button2" runat="server" Text="View More Suggestions" OnClick="Button2_Click" />
        </div>
        <hr />
    </div>

    <div class="recommendedCategories" runat="server" id="recommendedRestaurantID">
        <h2>Recommended Categories.
        </h2>
        <div class="vendorContainer">
            <asp:ListView ID="LVVendorRecommended" runat="server">
                <ItemTemplate>
                    <a href='HomePage.aspx?categoryID=<%#Eval("categoryID")%>'>
                        <div class="vendorItemContainer">
                            <image class="contentImage" src='../Assets/VendorCategory/<%#Eval("categoryImage")%>'></image>
                            <p><%#Eval("categoryName")%></p>
                        </div>
                    </a>
                </ItemTemplate>
            </asp:ListView>
        </div>
        <div class="buttonContainer">
            <asp:Button CssClass="Button" ID="Button3" runat="server" Text="View More Suggestions" OnClick="Button3_Click" />
        </div>
    </div>


</asp:Content>
