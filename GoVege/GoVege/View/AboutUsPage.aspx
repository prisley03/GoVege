<%@ Page Title="GoVege - About Us" Language="C#" MasterPageFile="~/View/MasterPage.Master" AutoEventWireup="true" CodeBehind="AboutUsPage.aspx.cs" Inherits="GoVege.View.AboutUsPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>

        #titleText{
            margin-left:50px;
            margin-right:50px;
            padding:20px;
            border-bottom: 2px solid black;
        }

        #headText{
            margin:auto;
            width:50%;
            padding:10px;
            text-align: center;
        }

        .imageHead{
            width: 7rem;
            height: 7rem;
        }

        #visionMission{
            margin: auto;
            width: 50%;
            display: flex;
            align-items: center;
        }

        .visionMissionText{
            background-color: #2EB14B;
            border-radius: 25px;
            color: white;
            text-align: center;
            padding: 25px;
            margin: 50px;
            width: 400px;
            height: 300px;
        }

        #values{
            margin:auto;
            width:70%;
            text-align: center;
        }

        #valuesTextbox{
            margin: auto;
            width: 65%;
            display: flex;
            align-items: center;
            text-align: center;
        }

        #fastTextbox{
            background-color: #FF5757;
            vertical-align: middle;
            margin: 25px;
            padding: 25px;
            border-radius: 25px;
            width: 200px;
            height: 200px;
        }

        #qualityTextbox{
            background-color: #FFD12F;
            margin: 25px;
            padding: 25px;
            border-radius: 25px;
            width: 200px;
            height: 200px;
        }

        #sustainableTextbox{
            background-color: #A1FFB0;
            margin: 25px;
            padding: 25px;
            border-radius: 25px;
            width: 200px;
            height: 200px;
        }

    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="padding-top:25px">
        <div id="titleText">
            <h1>About Us</h1>
        </div>

        <div id="headText">
            <div>
               <asp:image id="imagelogo1" runat="server" imageurl="~/Assets/pottedplant.png" CssClass="imageHead"/>
            </div>
            <p>
                GoVege is the first Food Delivery Web Application in Indonesia that supports vegetarian and vegan lifestyles. Be part of GoVege and make your life with healthy diet anywhere and anytime.
            </p>
        </div>

        <div id="visionMission">
            <div class="visionMissionText">
                <h2>Our Vision</h2><br />
                <p>Become the 1st Food Delivery in Indonesia to provide the best services and become a part of your healthy diet lifestyle</p>
            </div>
            <div class="visionMissionText">
                <h2>Our Mission</h2><br />
                <listview>
                    <p>1. Contribute in healthy vegetarian and vegan lifestyles.</p><br />
                    <p>2. GoVege provides you a platform to connect the consumer and the vegetarian and vegan food seller.</p><br />
                    <p>3. Working with all vegetarian and vegan restaurants, food courts, and food vendors in Indonesia.</p><br />
                </listview>
            </div>
        </div>

        <div id="values">
            <h2>Our Values</h2>
            <div id="valuesTextbox">
                <div id="fastTextbox">
                    <h3>Fast and Adaptive</h3><br />
                    <asp:image id="image2" runat="server" imageurl="~/Assets/AboutUs/Fast.png" CssClass="imageHead"/>
                    <p>We always prioritize your needs</p>
                </div>
                <div id="qualityTextbox">
                    <h3>Quality Control</h3><br />
                    <asp:image id="image3" runat="server" imageurl="~/Assets/AboutUs/Quality.png" CssClass="imageHead"/>
                    <p>We always check every transaction to make sure you get the best</p>
                </div>
                <div id="sustainableTextbox">
                    <h3>Sustainable Change</h3><br />
                    <asp:image id="image4" runat="server" imageurl="~/Assets/AboutUs/Sustainable.png" CssClass="imageHead"/>
                    <p>Always up to date</p>
                </div>
            </div>
        </div>

        <div id="">

        </div>

    </div>

</asp:Content>

