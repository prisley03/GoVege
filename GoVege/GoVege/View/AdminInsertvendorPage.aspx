<%@ Page Title="" Language="C#" MasterPageFile="~/View/MasterPage.Master" AutoEventWireup="true" CodeBehind="AdminInsertvendorPage.aspx.cs" Inherits="GoVege.View.AdminInsertvendorPage" %>
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
        <h1>INSERT VENDOR</h1>

        <div id="AlbumField">
            <div class="FieldContent">
                <asp:Label ID="LblVendorName" runat="server" Text="Vendor Name"></asp:Label>
                <asp:TextBox ID="TxtVendorName" runat="server"></asp:TextBox>
            </div>
            <div class="FieldContent">
                <asp:Label ID="LblVendorAddress" runat="server" Text="Vendor Address"></asp:Label>
                <br />
                <asp:TextBox ID="TxtVendorAddress" runat="server" Width="875px" ></asp:TextBox>
            </div>
            <div class="FieldContent">
                <asp:Label ID="LblRating" runat="server" Text="Rating"></asp:Label>
                <asp:TextBox ID="TxtRating" runat="server"></asp:TextBox>
            </div>
            <div class="FieldContent">
                <asp:Label ID="LblPreference" runat="server" Text="Preference"></asp:Label>
                <asp:TextBox ID="TxtPreference" runat="server"></asp:TextBox>
            </div>
            <div class="FieldContent">
                <asp:Label ID="Label1" runat="server" Text="Category"></asp:Label>
                <asp:TextBox ID="TxtCategory" runat="server"></asp:TextBox>
            </div>
            <div class="FieldContent">
                <asp:Label ID="LblImageUpload" runat="server" Text="Voucher Image"></asp:Label>
                <br />
                <asp:FileUpload ID="AlbumImageFileUpload" runat="server" />
            </div>
            
            <div id="BtnInsertContainer">
                <asp:Label ID="LblError" runat="server" Text=""></asp:Label>
                <br />
                <asp:Button ID="BtnInsert" runat="server" Text="Insert" OnClick="BtnInsert_Click" />
            </div>
            
            
        </div>
        
    </div>
</asp:Content>
