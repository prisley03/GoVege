<%@ Page Title="" Language="C#" MasterPageFile="~/View/MasterPage.Master" AutoEventWireup="true" CodeBehind="AdminInsertVoucherPage.aspx.cs" Inherits="GoVege.View.AdminInsertVoucherPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #InsertContent{
            padding-top:15vh;
        }
        #AlbumField {
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
    <div id="InsertContent">
        <h1>INSERT Voucher</h1>

        <div id="AlbumField">
            <div class="FieldContent">
                <asp:Label ID="LblVoucherName" runat="server" Text="Voucher Name"></asp:Label>
                <asp:TextBox ID="TxtVoucherName" runat="server"></asp:TextBox>
            </div>
            <div class="FieldContent">
                <asp:Label ID="LblVoucherDesc" runat="server" Text="Voucher Description"></asp:Label>
                <br />
                <asp:TextBox ID="TxtVoucherDesc" runat="server" Width="875px" ></asp:TextBox>
            </div>
            <div class="FieldContent">
                <asp:Label ID="LblDateS" runat="server" Text="Start Date"></asp:Label>
                <asp:TextBox ID="TxtDateS" runat="server"></asp:TextBox>
            </div>
            <div class="FieldContent">
                <asp:Label ID="LblDateE" runat="server" Text="End Date"></asp:Label>
                <asp:TextBox ID="TxtDateE" runat="server"></asp:TextBox>
            </div>
            <div class="FieldContent">
                <asp:Label ID="LblDiscount" runat="server" Text="Discount"></asp:Label>
                <asp:TextBox ID="TxtDiscount" runat="server"></asp:TextBox>
            </div>
            <div class="FieldContent">
                <asp:Label ID="LblImageUpload" runat="server" Text="Voucher Image"></asp:Label>
                <br />
                <asp:FileUpload ID="VoucherImageFileUpload" runat="server" />
            </div>
            
            <div id="BtnInsertContainer">
                <asp:Label ID="LblError" runat="server" Text=""></asp:Label>
                <br />
                <asp:Button ID="BtnInsert" runat="server" Text="Insert" OnClick="BtnInsert_Click" />
            </div>
        </div>
    </div>
</asp:Content>
