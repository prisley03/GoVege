<%@ Page Title="GoVege - Register" Language="C#" MasterPageFile="~/View/MasterPage.Master" AutoEventWireup="true" CodeBehind="RegisterPage.aspx.cs" Inherits="GoVege.View.RegisterPage" %>

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
        #registerBox{
            position: absolute;
            top: 20vh;
            left: 15vw;
            background-color: white;
            width: fit-content;
            padding: 30px;
        }
        h1{
            color: #30D315;
        }
        .btnCss{
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        .btnCont{
            font-size: 18px;
            color: white;
            background-color: #30D315;
            border: none;
            padding: 15px;
            border-radius: 5px;
        }
        .btnAlreadyAccount{
            border: none;
            background-color: white;
            font-size: 18px;
            text-decoration: underline;
        }
        .txtBox{
            width: 15rem;
            border-radius: 5px;
            border: 1px solid;
            color: #808080;
        }
        .txtBoxRegion{
            width: 3rem;
            border-radius: 5px;
            border: 1px solid;
            color: #808080;
        }
        .txtBoxNums{
            width: 10rem;
            border-radius: 5px;
            border: 1px solid;
            color: #808080;
        }
        .numField{
            display: flex;
            flex-direction: row;
            gap: 1.6rem;
        }
        .fields{
            display: flex;
            flex-direction: row;
            justify-content: space-between;
        }
        .inputContainer{
            padding: 20px;
            display: flex;
            flex-direction: column;
            gap: 2em;
        }
        .inputDataContainer{
            display: flex;
            flex-direction: column;
            gap: 22px;
        }
        .rblCss{
            position: relative;
            right: 8.5rem;
        }
        .rblCss input[type="radio"]{
            margin-right: 1rem;
            accent-color: #30D315;
        }
        .termsCss{
            display: flex;
            flex-direction: row;
            gap: 1vw;
        }
        .termsCss input[type="checkbox"]{
            accent-color: #30D315;
            width: 20px;
            height: 20px;
        }
        .btnCss{
            display: flex;
            flex-direction: column;
            gap: 1em;
        }
        .btnCont, .btnAlreadyAccount{
            cursor: pointer;
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div CssClass="container">
        <asp:Image CssClass="backgroundCss" ID="backgroundImg" runat="server" ImageUrl="~/Assets/hermes-rivera-Ww8eQWjMJWk-unsplash.jpg" />

        <div id="registerBox">
            <div class="inputContainer">
                <h1>Become GoVege Member Now.</h1>
                <div class="inputDataContainer">

                    <div class="fields">
                        <asp:Label ID="lblFullName" runat="server" Text="Full Name"></asp:Label>
                        <asp:TextBox ID="txtFullName" runat="server" CssClass="txtBox"></asp:TextBox>
                    </div>
                    <div class="fields">
                        <asp:Label ID="lblPhoneNumber" runat="server" Text="Phone Number"></asp:Label>
                        <div class="numField">
                            <asp:TextBox ID="txtRegionNumber" runat="server" CssClass="txtBoxRegion" Text="+62"></asp:TextBox>
                            <asp:TextBox ID="txtNumber" runat="server" CssClass="txtBoxNums"></asp:TextBox>
                        </div>
                    </div>
                    <div class="fields">
                        <asp:Label ID="lblEmail" runat="server" Text="Email"></asp:Label>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="txtBox"></asp:TextBox>
                    </div>
                    <div class="fields">    
                        <asp:Label ID="lblPassword" runat="server" Text="Password"></asp:Label>
                        <asp:TextBox ID="txtPassword" runat="server" CssClass="txtBox" TextMode="Password"></asp:TextBox>
                    </div>
                    <div class="fields">
                        <asp:Label ID="lblRePassword" runat="server" Text="Re-Type Password"></asp:Label>
                        <asp:TextBox ID="txtRePassword" runat="server" CssClass="txtBox" TextMode="Password"></asp:TextBox>
                    </div>
                    <div class="fields">
                        <asp:Label ID="lblFoodPref" runat="server" Text="Food Preference"></asp:Label>
                        <asp:RadioButtonList ID="rblFoodPref" runat="server" CssClass="rblCss">
                            <asp:ListItem Value="Vegan">Vegan</asp:ListItem>
                            <asp:ListItem Value="Vegetarian">Vegetarian</asp:ListItem>
                        </asp:RadioButtonList>
                    </div>
                </div>

                <div class="termsCss">
                    <asp:CheckBox ID="checkTerms" runat="server" Text="Agree to terms & condition"/>
                </div>

                <div class="btnCss">
                    <asp:Button CssClass="btnCont" ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click"/>
                    <asp:Button CssClass="btnAlreadyAccount" ID="btnHaveAccount" runat="server" Text="Already have an account?" Font-Bold="False" OnClick="btnHaveAccount_Click" />
                </div>
            </div>
        </div>
    </div>

</asp:Content>
