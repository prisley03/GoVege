<%@ Page Title="" Language="C#" MasterPageFile="~/View/MasterPage.Master" AutoEventWireup="true" CodeBehind="AdminVendorPage.aspx.cs" Inherits="GoVege.View.VendorAdminPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .topSection {
            height: 80vh;
            background: black;
            overflow: hidden;
        }

        .topText {
            font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
            display: flex;
            justify-content: space-between;
            color: white;
        }

        .searchAddressContainer {
            height: auto;
            display: flex;
            flex-direction: column;
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

        .Button-Search{
            width: 15%;
            height: 5vh;
        }

        .Button-ViewMore{
            height: 5vh;
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
            width: 80%;
            height: 4vh;
        }

        .searchRestaurantContainer {
            display: flex;
            align-items: center;
            justify-content: space-between;
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
            padding: 5px 5px 15px 5px;
        }

        .vendorItemContainer:hover {
            box-shadow: 2px 4px 10px rgba(0,0,0,0.5)
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
            padding: 4vh;
        }

        .img-home{
            height: inherit;
            width: 100%;
            object-fit: cover;
            opacity: 0.5;
            position: absolute;
        }

        .search-container{
            position: absolute;
            top: 50%;
            padding-left: 5vw;
            width: 60%;
        }
        .LinkContainer {
            display: flex;
            width: 90%;
            justify-content: space-around;
        }

        .insert-button{
            display: flex;
            justify-content: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="topSection">
        <img src="../Assets/gadoGadoImage.png" class="img-home"/>
        <div class="search-container">
            <div class="searchAddressContainer">
                <div class="topLabel">
                    <h1><asp:Label CssClass="topText" ID="Label1" runat="server" Text="Vendor Page"></asp:Label></h1>
                </div>
            </div>
            <div class="searchRestaurantContainer">
                <asp:TextBox CssClass="Textbox" ID="txtSearched" placeholder="Search Your Restaurant Here" runat="server"></asp:TextBox>
                <asp:Button CssClass="Button Button-Search" ID="ButtonSearchRestaurant" runat="server" Text="Search" OnClick="ButtonSearchRestaurant_Click" />
            </div>
        </div>
    </div>
    <div class="errorContainer">
        <asp:Label ID="LblError" runat="server" Text=""></asp:Label>
        <asp:Button CssClass="Button" ID="InsertButton" runat="server" Text="Insert New Vendor" OnClick="InsertButton_Click" />
    </div>

        <hr />
    <div class="vegetarianRestaurant" runat="server" id="searchedRestaurantID" visible="false">
        <h2>
            Searched Restaurant.
        </h2>
        <div class="vendorContainer">
            <asp:ListView ID="LVVendorSearched" runat="server">
                <ItemTemplate>
                    <a href='VendorDetailsPage.aspx?VendorID=<%#Eval("vendorID")%>'>
                        <div class="vendorItemContainer">
                            <image class="contentImage" src='../Assets/Vendor/<%#Eval("vendorImage")%>'></image>
                            <p><%#Eval("vendorName")%></p>
                            <p><%#Eval("vendorRating")%>/5 Stars</p>
                            <div class="LinkContainer">
                                <a class="Button" href='<%# ResolveUrl("AdminUpdateVendorPage.aspx") + "?VendorID=" + Eval("vendorID") %>'>Update</a>
                                <asp:LinkButton CssClass="Button" ID="BtnDelete" runat="server" OnClick="BtnDelete_Click" CommandArgument= '<%#Eval("VendorID")%>'>Delete</asp:LinkButton>
                            </div>
                        </div>
                    </a>
                </ItemTemplate>
            </asp:ListView>
        </div>
    </div>
    <div class="vegetarianRestaurant" runat="server" id="vegetarianRestaurantID">
        <h2>
            Vegetarian Restaurants.
        </h2>
        <div class="vendorContainer">
            <asp:ListView ID="LVVendorVegetarian" runat="server">
                <ItemTemplate>
                    <a href='VendorDetailsPage.aspx?VendorID=<%#Eval("vendorID")%>'>
                        <div class="vendorItemContainer">
                            <image class="contentImage" src='../Assets/Vendor/<%#Eval("vendorImage")%>'></image>
                            <p><%#Eval("vendorName")%></p>
                            <p><%#Eval("vendorRating")%>/5 Stars</p>
                            <div class="LinkContainer">
                                <a class="Button" href='<%# ResolveUrl("AdminUpdateVendorPage.aspx") + "?VendorID=" + Eval("vendorID") %>'>Update</a>
                                <asp:LinkButton CssClass="Button" ID="BtnDelete" runat="server" OnClick="BtnDelete_Click" CommandArgument= '<%#Eval("VendorID")%>'>Delete</asp:LinkButton>
                            </div>
                        </div>
                    </a>
                </ItemTemplate>
            </asp:ListView>
        </div>
        <hr />
    </div>


    <div class="veganRestaurant" runat="server" id="veganRestaurantID">
        <h2>
            Vegan Restaurants.
        </h2>
        <div class="vendorContainer">
            <asp:ListView ID="LVVendorVegan" runat="server">
                <ItemTemplate>
                    <a href='VendorDetailsPage.aspx?VendorID=<%#Eval("vendorID")%>'>
                        <div class="vendorItemContainer">
                            <image class="contentImage" src='../Assets/Vendor/<%#Eval("vendorImage")%>'></image>
                            <p><%#Eval("vendorName")%></p>
                            <p><%#Eval("vendorRating")%>/5 Stars</p>
                            <div class="LinkContainer">
                                <a class="Button" href='<%# ResolveUrl("AdminUpdateVendorPage.aspx") + "?VendorID=" + Eval("vendorID") %>'>Update</a>
                                <asp:LinkButton CssClass="Button" ID="BtnDelete" runat="server" OnClick="BtnDelete_Click" CommandArgument= '<%#Eval("VendorID")%>'>Delete</asp:LinkButton>
                            </div>
                        </div>
                    </a>
                </ItemTemplate>
            </asp:ListView>
        </div>
    </div>
</asp:Content>
