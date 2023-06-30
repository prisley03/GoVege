<%@ Page Title="GoVege - Login" Language="C#" MasterPageFile="~/View/MasterPage.Master" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="GoVege.View.LoginPage" %>
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
            max-height: 100vh;
            position: inherit;
            max-width: 100%;
            overflow-x: hidden;
        }
        #loginBox{
            position: absolute;
            top: 20vh;
            left: 15vw;
            background-color: white;
            width: fit-content;
            padding: 60px;
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 4vh;
        }
        h1{
            color: #30D315;
        }
        #inputContainer{
            display: flex;
            flex-direction: column;
            gap: 4vh;
            
        }
        #inputArea{
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }
        .btnCont, .txtBtn{
            max-width: fit-content;
        }
        #emailCss, #passwordCss{
            display: flex;
            flex-direction: row;
            justify-content: space-between;
            gap: 10vw;
        }
        .txtBox{
            width: 15vw;
            border-radius: 5px;
            border: 1px solid;
            color: #808080;
        }
        .btnCont{
            font-size: 18px;
            color: white;
            background-color: #30D315;
            border: none;
            padding: 15px;
            border-radius: 5px;
        }
        .miscBtn{
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 4vh;
        }
        .txtBtnContainer{
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        .txtBtn{
            border: none;
            background-color: white;
            font-size: 18px;
            text-decoration: underline; 
        }
        #rememberMeCss{
            display: flex;
            flex-direction: row;
            gap: 1vw;
        }
        #rememberMeCss input[type="checkbox"]{
            accent-color: #30D315;
            width: 20px;
            height: 20px;
        }
        .btnCont, .txtBtn{
            cursor: pointer;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <asp:Image CssClass="backgroundCss" ID="backgroundImg" runat="server" ImageUrl="~/Assets/koftaFlatbreads.jpg" />
        <div id="loginBox">

            <div id="inputContainer">
                <h1>Login Today.</h1>
                <div id="inputArea">
                    <div id="emailCss">
                        <asp:Label ID="lblEmail" runat="server" Text="Email"></asp:Label>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="txtBox"></asp:TextBox>
                    </div><br />
                    <div id="passwordCss">
                        <asp:Label ID="lblPassword" runat="server" Text="Password">
                        </asp:Label><asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="txtBox"></asp:TextBox>
                    </div><br />
                    <div id="errMsg">
                        <asp:Label ID="lblError" runat="server" Text=""></asp:Label>
                    </div>
                 </div>
                <div id="rememberMeCss">
                    <asp:CheckBox ID="checkRememberMe" runat="server" Text="Remember Me" />
                </div>
            </div>

            <div class="miscBtn">
                <asp:Button CssClass="btnCont" ID="btnContinue" runat="server" Text="Continue" OnClick="btnContinue_Click"/>
                <div class="txtBtnContainer">
                     <asp:Button CssClass="txtBtn" ID="btnDontHaveAccount" runat="server" Text="Don't Have an Account?" OnClick="btnDontHaveAccount_Click"/>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
