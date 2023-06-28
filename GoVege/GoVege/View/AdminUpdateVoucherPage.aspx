<%@ Page Title="" Language="C#" MasterPageFile="~/View/MasterPage.Master" AutoEventWireup="true" CodeBehind="AdminUpdateVoucherPage.aspx.cs" Inherits="GoVege.View.AdminUpdateVoucherPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #UpdateContent{
            padding-top:15vh;
        }
        #AlbumFieldBefore {
            display: flex;
            align-content: center;
            justify-content: flex-start;
            flex-direction: column;
        }

        #AlbumFieldAfter {
            display: flex;
            align-content: center;
            justify-content: flex-start;
            flex-direction: column;
        }

        .FieldContent{
            margin: 10px;
        }
        #BtnInsertContainer{
            justify-self: center;
            width: fit-content;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id ="UpdateContent">
        <h1>UPDATE VOUCHER</h1>
         <br />
        <h3>Selected Voucher to be Updated</h3>
        <div id="AlbumFieldBefore">
            <div class="FieldContent">
                <asp:Label ID="LblVoucherNameBefore" runat="server" Text="Voucher Name"></asp:Label>
                <asp:TextBox ID="TxtNameBefore" runat="server" ReadOnly="true"></asp:TextBox>
            </div>
            <div class="FieldContent">
                <asp:Label ID="LblVoucherDescBefore" runat="server" Text="Voucher Description" ></asp:Label>
                <br />
                <asp:TextBox ID="TxtVoucherDescBefore" runat="server" Width="875px" ReadOnly="true"></asp:TextBox>
            </div>
            <div class="FieldContent">
                <asp:Label ID="LblDateStartBefore" runat="server" Text="Date Start"></asp:Label>
                <asp:TextBox ID="TxtDateStartBefore" runat="server" ReadOnly="true"></asp:TextBox>
            </div>
            <div class="FieldContent">
                <asp:Label ID="LblDateEndBefore" runat="server" Text="Date End"></asp:Label>
                <asp:TextBox ID="TxtDateEndBefore" runat="server" ReadOnly="true"></asp:TextBox>
            </div>
            <div class="FieldContent">
                <asp:Label ID="LblDiscountBefore" runat="server" Text="Discount"></asp:Label>
                <asp:TextBox ID="TxtDiscountBefore" runat="server" ReadOnly="true"></asp:TextBox>
            </div>
            <div class="FieldContent">
                <asp:Label ID="LblImageUpload" runat="server" Text="Voucher Image"></asp:Label>
                <br />
                <asp:Image ID="ImageBefore" runat="server" Height="200" Width="200" />
            </div>
        </div>

         <h2>New Album Data Input</h2>

        <div id="AlbumFieldAfter">
            <div class="FieldContent">
                <asp:Label ID="Label1" runat="server" Text="Voucher Name"></asp:Label>
                <asp:TextBox ID="TxtNameAfter" runat="server"></asp:TextBox>
            </div>
            <div class="FieldContent">
                <asp:Label ID="Label2" runat="server" Text="Voucher Description" ></asp:Label>
                <br />
                <asp:TextBox ID="DescAfter" runat="server" Width="875px" ></asp:TextBox>
            </div>
            <div class="FieldContent">
                <asp:Label ID="Label3" runat="server" Text="Date Start"></asp:Label>
                <asp:TextBox ID="DSAfter" runat="server"></asp:TextBox>
            </div>
            <div class="FieldContent">
                <asp:Label ID="Label4" runat="server" Text="Date End"></asp:Label>
                <asp:TextBox ID="DEAfter" runat="server"></asp:TextBox>
            </div>
            <div class="FieldContent">
                <asp:Label ID="Label5" runat="server" Text="Discount"></asp:Label>
                <asp:TextBox ID="DiscAfter" runat="server"></asp:TextBox>
            </div>
            <div class="FieldContent">
                <asp:Label ID="Label6" runat="server" Text="Voucher Image"></asp:Label>
                <br />
                <asp:FileUpload ID="VoucherImageFileUpload" runat="server" />
            </div>
            
            <div id="BtnInsertContainer">
                <asp:Label ID="LblError" runat="server" Text=""></asp:Label>
                <br />
                <asp:Button ID="BtnUpdate" runat="server" Text="Update" OnClick="BtnUpdate_Click" />
            </div>
        </div>
    </div>
</asp:Content>
