<%@ Page Title="GoVege - Contact Us" Language="C#" MasterPageFile="~/View/MasterPage.Master" AutoEventWireup="true" CodeBehind="ContactUsPage.aspx.cs" Inherits="GoVege.View.ContactUsPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>

        #headText{
            margin:auto;
            width:70%;
            padding:10px;
            text-align:center;
            padding:20px;
        }

        #line1{
            
            margin-left:70px;
            margin-right:70px;
            color:black;
        }

        #infoText{
            margin: auto;
            display: flex;
            color: white;
            width: 55%;
        }

        #leftBox{
            margin: 25px;
        }

        #contactInfo{
            background-color: #2EB14B;
            border-radius: 25px;
            margin: 25px;
            padding: 25px;
            width: 400px;
        }

        #address{
            background-color: #2EB14B;
            border-radius: 25px;
            margin: 25px;
            padding: 25px;
            width: 400px;
        }

        #rightBox{
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            background-color: #2EB14B;
            border-radius: 25px;
            margin: 25px;
            padding: 25px;
            vertical-align: middle;
        }

        .timeText{
            text-align: right;
            border-bottom: 1px dashed white;
        }

        .contactInfoText{
            display: flex;
            align-items: center;
        }

        #addressText{
            display: flex;
            align-items: center;
        }

        .imageIcon{
            width: 2rem;
            height: 2rem;
            margin: 5px;
        }

    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div>
        <div id="headText">
            <h1>Get In Touch</h1><br />
            <h5>
                Our business is nothing without trust. Over time, we have built a strong connection with our loyal customers with communication, trained skills, and experience. From basic questions to complex inquiries, we are ready to help!
            </h5>
        </div>

        <hr id="line1">


        <div id="infoText">
            <div id="leftBox">
                <div id="contactInfo">
                    <h2>CONTACT INFO</h2>
                    <div class="contactInfoText">
                        <asp:Image ID="Image1" runat="server" ImageUrl="~/Assets/ContactUs/Phone.png" CssClass="imageIcon"/> 
                        <p>Sales:  +62 747-2842-386</p>
                    </div>
                    <div class="contactInfoText">
                        <asp:Image ID="Image2" runat="server" ImageUrl="~/Assets/ContactUs/Phone.png " CssClass="imageIcon"/> 
                        <p>Services:  +62 820-7169-655</p>
                    </div>
                    <div class="contactInfoText">
                        <asp:Image ID="Image3" runat="server" ImageUrl="~/Assets/ContactUs/email.png" CssClass="imageIcon"/> 
                        <p>Email: govege.official@gmail.com</p>
                    </div>
                </div>

                <div id="address">
                    <h2>ADDRESS</h2>
                    <div id="addressText">
                        <asp:Image ID="Image4" runat="server" ImageUrl="~/Assets/ContactUs/vector.png" CssClass="imageIcon"/>
                        <p>
                            Kampung Percik Terusan, Jl. Patimura KM. 1, Salatiga, Sidorejo, Salatiga, Kec. Sidorejo, Kota Salatiga, Jawa Tengah 50712
                        </p>
                    </div>
                </div>

            </div>

            <div id="rightBox">
                <h2>WORKING HOURS:</h2>
                <p>Monday</p><p class="timeText">09:00-20:00</p>
                <p>Tuesday</p><p class="timeText">09:00-20:00</p>
                <p>Wednesday</p><p class="timeText">09:00-20:00</p>
                <p>Thursday</p><p class="timeText">09:00-20:00</p>
                <p>Friday</p><p class="timeText">09:00-20:00</p>
                <p>Saturday</p><p class="timeText">10:00-20:00</p>
                <p>Sunday</p><p class="timeText">CLOSED</p>
            </div>
        </div>

    </div>

</asp:Content>
