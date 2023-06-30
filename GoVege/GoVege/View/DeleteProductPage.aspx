<%@ Page Title="GoVege - Delete Product" Language="C#" MasterPageFile="~/View/MasterPage.Master" AutoEventWireup="true" CodeBehind="DeleteProductPage.aspx.cs" Inherits="GoVege.View.DeleteProductPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .container{
            position: relative;
        }

        .backgroundCss{
            display: block;
            margin-left: auto;
            margin-right: auto;
            width: 100vw;
            object-fit: cover;
            height: 150vh;
            position: inherit;
            max-width: 100%;
            overflow-x: hidden;
        }

        #loginBox{
            position: absolute;
            top: 20%;
            left: 10%;
            background-color: white;
            width: 40%;
            padding: 3rem;
            display: flex;
            flex-direction: column;
            gap: 2rem;
        }

        h1{
            color: #30D315;
        }

        #inputContainer{
            display: flex;
            flex-direction: column;
            gap: 2vh;
            width: 100%;
        }

        .flex-item{
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .flex-item__label{
            width: 40%;
            font-family: 'Franklin Gothic', 'Arial Narrow', Arial, sans-serif;
        }

        .flex-item__input{
            width: 55%;
            height: 1.5rem;
            font-size: medium;
            font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
        }

        .flex-item__input--img{
            width: 40%;
            height: auto;
            object-fit: cover;
            aspect-ratio: 1 / 1;
        }

        .btnDelete{
            font-size: medium;
            color: white;
            background-color: red;
            border: 2px solid red;
            padding: 0.5rem 1rem;
            border-radius: 5px;
            cursor: pointer;
        }
        .btnDelete:hover{
            color: red;
            background-color:  white;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <asp:Image CssClass="backgroundCss" ID="backgroundImg" runat="server" ImageUrl="~/Assets/koftaFlatbreads.jpg" />
        <div id="loginBox">
            <h1>Delete Product.</h1>
            <div id="inputContainer">
                <div class="flex-item">
                    <asp:Label ID="LblID" runat="server" Text="Product ID:" CssClass="flex-item__label"></asp:Label>
                    <asp:Label ID="LblValueID" runat="server" Text="" CssClass="flex-item__input"></asp:Label>
                </div>
                <div class="flex-item">
                    <asp:Label ID="LblName" runat="server" Text="Product Name:" CssClass="flex-item__label"></asp:Label>
                    <asp:Label ID="LblValueName" runat="server" Text="" CssClass="flex-item__input"></asp:Label>
                </div>
                <div class="flex-item">
                    <asp:Label ID="LblPrice" runat="server" Text="Product Price:" CssClass="flex-item__label"></asp:Label>
                    <asp:Label ID="LblValuePrice" runat="server" Text="" CssClass="flex-item__input"></asp:Label>
                </div>
                <div class="flex-item" style="flex-direction: column;
    align-items: flex-start;
    gap: 1rem;">
                    <asp:Label ID="LblImage" runat="server" Text="Product Image:" CssClass="flex-item__label"></asp:Label>
                    <asp:Image ID="LblValueImage" runat="server" CssClass="flex-item__input flex-item__input--img" />
                </div>
                <div class="flex-item">
                    <asp:Label ID="LblType" runat="server" Text="Product Food Type:" CssClass="flex-item__label"></asp:Label>
                    <asp:Label ID="LblValueType" runat="server" Text="" CssClass="flex-item__input"></asp:Label>
                </div>
                <div class="flex-item">
                    <asp:Label ID="LblCal" runat="server" Text="Product Calories:" CssClass="flex-item__label"></asp:Label>
                    <asp:Label ID="LblValueCal" runat="server" Text="" CssClass="flex-item__input"></asp:Label>
                </div>
                
            </div>
            <div>
                <asp:Button Class="btnDelete" ID="BtnDelete" runat="server" Text="Delete" OnClick="BtnDelete_Click" />
            </div>
        </div>
    </div>
    
</asp:Content>
