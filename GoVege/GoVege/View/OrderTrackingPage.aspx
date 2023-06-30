<%@ Page Title="GoVege - Order Tracking" Language="C#" MasterPageFile="~/View/MasterPage.Master" AutoEventWireup="true" CodeBehind="OrderTrackingPage.aspx.cs" Inherits="GoVege.View.OrderTrackingPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        header{
            position: static;
        }

        .Location{
            padding: 5vh 0;
            line-height: 1rem;
        }

        .labelLocation{
            margin-left: 4rem;
        }

        .imageLocation{
            display: block;
            margin: 0 auto;
        }

        .driverDetails {
            margin: 2rem;
        }

        .contentDriver {
            margin-top: 2rem;
            display: flex;
            align-items: center;
        }

        .driverPhoto {
            display: inline-block;
            vertical-align: middle;
            padding-left: 4rem;
            width: 5rem;
            height: 5rem;
        }

        .driverLabels {
            margin-left: 1rem;
            position: relative;
            white-space: nowrap;
            width: 100%;
        }

        .labelLicensePlate {
            text-align: right;
            margin-right: 4rem;
            background-color: black;
            color: white;
            white-space: nowrap;
            padding: 0.5rem;
        }

        .deliveryDetails {
            margin: 2rem;
        }

        .deliveryTable {
            font-size: smaller;
            margin-top: 2rem;
            padding-left: 4rem;
            padding-right: 4rem;
            width: 100%;
        }

            .deliveryTable th.leftAlign {
                text-align: left;
            }

            .deliveryTable td.rightAlign {
                text-align: right;
                color: #30D315;
            }

        .orderDetails {
            margin-left: 5rem;
            margin-right: 5rem;
            line-height: 1rem;
        }

        .RepeaterOrder {
            text-align: center;
        }

        .order-table td {
            padding: 1rem;
        }

        .quantity {
            width: 5rem;
        }

        .food-name {
            width: 15rem;
            text-align: left;
        }

        .price, .subtotal {
            width: 10rem;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class ="Location">
        <h2><asp:Label ID="lblLocation" CssClass="labelLocation" runat="server" Text="Track your Delivery here"></asp:Label></h2>
        <br />
        <asp:Image ID="imgLocation" CssClass="imageLocation" ImageUrl="../Assets/MapSunib.png" runat="server" />
    </div>
    <div class="driverDetails">
        <h3>Driver Details</h3>
        <div class="contentDriver">
            <img class="driverPhoto" runat="server" id="imgDriverPhoto" />
            <div class="driverLabels">
                <asp:Label ID="lblDriverName" runat="server" Text=""><%# Eval("DriverName") %></asp:Label>
                <br />
                <asp:Label ID="lblDriverRating" runat="server" Text=""><%# Eval("DriverRating") %></asp:Label>
                <br />
                <asp:Label ID="lblVehicleName" runat="server" Text=""><%# Eval("DriverVehicleName") %></asp:Label>
                <br />
            </div>
            <div class="labelLicensePlate">
                <asp:Label ID="lblLicensePlate" runat="server" Text=""><%# Eval("DriverLicensePlate") %></asp:Label>
            </div>
        </div>
    </div>
    <div class="deliveryDetails">
        <h3>Delivery Details</h3>
        <asp:Table ID="DeliveryDetailTable" CssClass="deliveryTable" runat="server">
            <asp:TableRow>
                <asp:TableHeaderCell CssClass="leftAlign">Restaurant</asp:TableHeaderCell>
                <asp:TableCell CssClass="rightAlign"><%# Eval("RestaurantName") %></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableHeaderCell CssClass="leftAlign">Restaurant Address</asp:TableHeaderCell>
                <asp:TableCell CssClass="rightAlign"><%# Eval("RestaurantAddress") %></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableHeaderCell CssClass="leftAlign">Destination</asp:TableHeaderCell>
                <asp:TableCell CssClass="rightAlign"><%# Eval("Destination") %></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableHeaderCell CssClass="leftAlign">Delivery Notes</asp:TableHeaderCell>
                <asp:TableCell CssClass="rightAlign"><%# Eval("DeliveryNotes") %></asp:TableCell>
            </asp:TableRow>
        </asp:Table>
    </div>
    <div class="orderDetails">
        <h3>Order Summary</h3>
        <div class="RepeaterOrder">
            <table class="order-table">
                <tbody>
                    <asp:Repeater ID="RepeaterOrderSummary" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td class="quantity"><%# Eval("Quantity") %></td>
                                <td class="food-name"><%# Eval("FoodName") %></td>
                                <td class="price"> <%# string.Format("{0:N0}", Eval("Price")).Replace(",", ".") %></td>
                                <td class="subtotal"><%# string.Format("{0:N0}", Eval("Subtotal")).Replace(",", ".") %></td>
                            </tr>
                        </ItemTemplate>
                        
                    </asp:Repeater>
                </tbody>
            </table>
        </div>
    </div>
</asp:Content>
