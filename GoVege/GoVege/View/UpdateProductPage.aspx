<%@ Page Title="GoVege - Update Product Page" Language="C#" MasterPageFile="~/View/MasterPage.Master" AutoEventWireup="true" CodeBehind="UpdateProductPage.aspx.cs" Inherits="GoVege.View.UpdateProductPage" %>
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

        .rbl-item td{
            display: flex;
            gap:1rem;
        }

        .rbl-item input{
            accent-color: #30D315;
        }

        .btnCont{
            color: white;
            background-color: #30D315;
            border: 2px solid #30D315;
            border-radius: 5px;
            font-size: medium;
            padding: 0.5rem 1rem;
            cursor: pointer;
        }
        .btnCont:hover{
            color: #30D315;
            background-color: white;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <asp:Image CssClass="backgroundCss" ID="backgroundImg" runat="server" ImageUrl="~/Assets/koftaFlatbreads.jpg" />
        <div id="loginBox">
            <h1>Update Product.</h1>
            <div id="inputContainer">
                
                <div class="flex-item">
                    <asp:Label ID="LblID" runat="server" Text="Product ID:" CssClass="flex-item__label"></asp:Label>
                    <asp:Label ID="LblValueID" runat="server" Text="" CssClass="flex-item__input"></asp:Label>
                </div>
                <div class="flex-item">
                    <asp:Label ID="LblName" runat="server" Text="Product Name:" CssClass="flex-item__label"></asp:Label>
                    <asp:TextBox ID="TxtName" runat="server" CssClass="flex-item__input"></asp:TextBox>
                </div>
                <div class="flex-item">
                    <asp:Label ID="LblPrice" runat="server" Text="Product Price:" CssClass="flex-item__label"></asp:Label>
                    <asp:TextBox ID="TxtPrice" TextMode="Number" runat="server" CssClass="flex-item__input"></asp:TextBox>
                </div>
                <div class="flex-item">
                    <asp:Label ID="LblImage" runat="server" Text="Product Image:" CssClass="flex-item__label"></asp:Label>
                    <asp:FileUpload ID="FileUploadImage" runat="server" CssClass="flex-item__input" />
                </div>
                <div class="flex-item">
                    <asp:Label ID="LblType" runat="server" Text="Product Food Type:" CssClass="flex-item__label"></asp:Label>
                    <asp:RadioButtonList ID="RBLType" runat="server" CssClass="rbl-item flex-item__input">
                        <asp:ListItem>Vegan</asp:ListItem>
                        <asp:ListItem>Vegetarian</asp:ListItem>
                    </asp:RadioButtonList>
                </div>
                <div class="flex-item">
                    <asp:Label ID="LblCal" runat="server" Text="Product Calories:" CssClass="flex-item__label"></asp:Label>
                    <asp:TextBox ID="TxtCal" TextMode="Number" runat="server" CssClass="flex-item__input"></asp:TextBox>
                </div>
                
            </div>
            <div>
                <asp:Label ID="LblError" runat="server" Text=""></asp:Label>
            </div>
            <div>
                <asp:Button ID="BtnUpdate" CssClass="btnCont" runat="server" Text="Update" OnClick="BtnUpdate_Click" />
            </div>
        </div>
    </div>
    
</asp:Content>
