<%@ Page Title="GoVege - FAQ" Language="C#" MasterPageFile="~/View/MasterPage.Master" AutoEventWireup="true" CodeBehind="FAQPage.aspx.cs" Inherits="GoVege.View.FAQPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        .topSection{
            background-image: url("/Assets/FAQ/Question.png");
            background-position: center;
            height:60vh;
            background-size:cover;
            background-repeat:no-repeat;
            position: relative;
        }

        .topSectionBody{
            display: flex;
            flex-direction: column;
            align-items: center;
            height: auto;
            width: auto;
            top: 40%;
            left: 40%;
            position: absolute;
        }

        .midSection{
            margin: 50px;
        }

        .midSectionBody{
            color: #2E9845;
            text-align: center;
            font-size: 30px;
        }


        .botSection{
            background-image: url("/Assets/FAQ/Vegetables.png");
            background-color: #F7FFF3;
            background-position: center;
            height:60vh;
            background-size:cover;
            background-repeat:no-repeat;
            position: relative;
        }

        .botSectionBody{
            display: flex;
            flex-direction: column;
            align-items: center;
            height: auto;
            width: auto;
            top: 40%;
            left: 40%;
            position: absolute;
            color: white;
        }

        .contactBtn{
            margin-top: 50px;
            background-color: #2EB14B;
            color: white;
            font-size: 30px;
        }

        .faqText{
            font-size: 30px;
        }

    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div>

        <div class="topSection">
            <div class="topSectionBody">
                <h1 style="margin-bottom: 20px; color: white;">Need Help?</h1>
                <asp:TextBox ID="TextBox2" runat="server" Height="40px" Width="376px" BorderWidth="2px" BorderColor="#2EB14B" placeholder="Search For FAQs" CssClass="faqText"></asp:TextBox>
            </div>
        </div>

        <div class="midSection">
            <div class="midSectionBody">
                <a href="/View/CustomerInfoPage.aspx"> <h3 style="color: #2E9845;">Customer</h3> </a>
                <a href="/View/DriverInfoPage.aspx"> <h3 style="color: #2E9845;">Driver</h3> </a>
                <a href="/View/MerchantInfoPage.aspx"> <h3 style="color: #2E9845;">Merchant</h3> </a>
            </div>
        </div>

        <div class="botSection">
            <div class="botSectionBody">
                <h3>Get faster and more personal help from our staff</h3>
                <asp:Button ID="Button1" runat="server" Text="Contact Us" OnClick="Button1_Click" CssClass="contactBtn" Height="70px" Width="247px"/>
                
            </div>
        </div>

    </div>

</asp:Content>
