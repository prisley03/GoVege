<%@ Page Title="" Language="C#" MasterPageFile="~/View/MasterPage.Master" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="GoVege.View.HomePage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .topSection{
            background-image:url("/Assets/gadoGadoImage.png");
            height:60vh;
            background-size:cover;
            background-repeat:no-repeat;
            position:relative;
        }
        .informationText{
            font-family:'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
        }
        .searchAddressContainer{
            height:auto;
            top:50%;
            display:flex;
            position:absolute;
            width:35vw;
            flex-direction:column;
            padding-left:5vw;
        }
        .topLabel{
            padding-bottom:10px;
        }
        .informationText{
            display:flex;
            justify-content:space-between;
        }
        .Button{
            border:2px solid #30D315;
            color:#30D315;
            background-color:white;
            border-radius:3px;
            margin:0;
            cursor:pointer;
        }
        .Textbox{
            border:2px solid #30D315;
            color:#30D315;
            background-color:white;
            border-radius:3px;
            margin:0;
        }
        .searchRestaurantContainer{
            display:flex;
            justify-content:center;
            align-content:center;
            margin-top:20px;
            margin-bottom:20px;
        }
        hr{
            display: block;
            margin:0px 32px 0px 32px;
        }
        h2{
            margin-bottom:10px;
            color:#30D315;
        }        
        .veganRestaurant{
            margin:20px 32px 20px 32px;
            display:flex;
            flex-direction:column;
        }
        .vendorContainer{
            display: flex;
            border-radius: 3px;
            flex-wrap: wrap;
            justify-content:space-around;
        }
        .vendorItemContainer{
            width:175px;
            cursor: pointer;
            height:200px;
            background-color:#CBF7D2;
            border-radius:5px;
            margin:5px 5px 5px 5px;
            padding:5px 5px 5px 5px;
        }
        .vegetarianRestaurant{
            margin:20px 32px 20px 32px;
            display:flex;
            flex-direction:column;
        }
        .recommendedCategories{
            margin:20px 32px 20px 32px;
            display:flex;
            flex-direction:column;
        }
        .vendorImage{
            border-radius:5px;
            width:100%; 
            height:100px;
        }
        .buttonContainer{
            height:auto;
            width:auto;
            align-self:center;
            cursor:pointer;
            margin:10px 0px 10px 0px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="topSection">
      <div class="searchAddressContainer">
          <div class="topLabel">
              <asp:Label CssClass="informationText" ID="Label1" runat="server" Text="Order Food to Your Door"></asp:Label>
          </div>
          <div class="searchAdress">
             <asp:TextBox ID="TextBox1" placeholder="Enter Your Delivery Address" runat="server" Text="" Width="350px"></asp:TextBox>
             <asp:Button CssClass="Button" ID="SearchBox" runat="server" Text="Search" />
          </div>
      </div>
    </div>
    <div class="searchRestaurantContainer">
        <asp:TextBox CssClass="Textbox" ID="TextBox2" placeholder="Search Your Restaurant Here" runat="server" Width="347px"></asp:TextBox>
    </div>
    <hr/>
    <div class="veganRestaurant">
        <h2>
            Top Vegan Restaurants in Jakarta.
        </h2>
        <div class="vendorContainer">
            <%--<asp:ListView ID="LVVendor" runat="server">
                <ItemTemplate>
                    <image style="border-radius:3px; width:50px; height:50px" src="../Assets/gadoGadoImage.png"></image>
                    <p><%#Eval("vendorName")%></p>
                    <p><%#Eval("vendorRating")%>/5 Stars</p>
                </ItemTemplate
            </asp:ListView>--%>

            <%for (int i = 0; i < 5; i++){ %>
                <div class="vendorItemContainer">
                    <image class="vendorImage" src="../Assets/Vendor/gadogado.png"></image>
                    <p><%=temp.vendorName%></p>
                    <p><%=temp.vendorRating%>/5 Stars</p>
                </div>
            <%} %>
        </div>
        <div class="buttonContainer">
            <asp:Button ID="Button2" runat="server" Text="View More Suggestions" />
        </div>
    </div>

    <hr/>
    <div class="vegetarianRestaurant">
        <h2>
            Top Vegan Restaurants in Jakarta.
        </h2>
        <div class="vendorContainer">
            <%--<asp:ListView ID="LVVendor" runat="server">
                <ItemTemplate>
                    <image style="border-radius:3px; width:50px; height:50px" src="../Assets/gadoGadoImage.png"></image>
                    <p><%#Eval("vendorName")%></p>
                    <p><%#Eval("vendorRating")%>/5 Stars</p>
                </ItemTemplate>       
            </asp:ListView>--%>

            <%--<%for (int i = 0; i < 5; i++){ %>
                <div class="vendorItemContainer">
                    <image class="vendorImage" src="../Assets/Vendor/gadogado.png"></image>
                    <p><%="vendorName"%></p>
                    <p><%="vendorRating"%>/5 Stars</p>
                </div>
            <%} %>--%>
        </div>
        <div class="buttonContainer">
            <asp:Button ID="Button1" runat="server" Text="View More Suggestions" />
        </div>
    </div>
    <hr/>
    <div class="recommendedCategories">
        <h2>
            Recommended Categories.
        </h2>
        <div class="vendorContainer">
            <%--<asp:ListView ID="LVVendor" runat="server">
                <ItemTemplate>
                    <image style="border-radius:3px; width:50px; height:50px" src="../Assets/gadoGadoImage.png"></image>
                    <p><%#Eval("vendorName")%></p>
                    <p><%#Eval("vendorRating")%>/5 Stars</p>
                </ItemTemplate>       
            </asp:ListView>--%>

            <%--<%for (int i = 0; i < 5; i++){ %>
                <div class="vendorItemContainer">
                    <image class="vendorImage" src="../Assets/Vendor/gadogado.png"></image>
                    <p><%="vendorName"%></p>
                    <p><%="vendorRating"%>/5 Stars</p>
                </div>
            <%} %>--%>
        </div>
        <div class="buttonContainer">
            <asp:Button ID="Button3" runat="server" Text="View More Suggestions" />
        </div>
    </div>


</asp:Content>