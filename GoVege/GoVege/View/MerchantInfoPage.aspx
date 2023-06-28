<%@ Page Title="GoVege - Merchant Info" Language="C#" MasterPageFile="~/View/MasterPage.Master" AutoEventWireup="true" CodeBehind="CustomerInfoPage.aspx.cs" Inherits="GoVege.View.CustomerInfoPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        .container{
            background-image: url("/Assets/FAQ/Question.png");
            background-position: center;
            height: 100vh;
            background-size:cover;
            background-repeat:no-repeat;
            position: relative;
        }
        .content{
            display: flex;
            flex-direction: column;
            align-items: center;
            height: auto;
            width: auto;
            top: 45%;
            left: 20%;
            position: absolute;
            color: white;
            font-size: 50px;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
        <div class="content">
            <h1>UNDER CONSTRUCTION</h1>
        </div>
    </div>
    

</asp:Content>
