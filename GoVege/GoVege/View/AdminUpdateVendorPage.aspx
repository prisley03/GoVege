<%@ Page Title="" Language="C#" MasterPageFile="~/View/MasterPage.Master" AutoEventWireup="true" CodeBehind="AdminUpdateVendorPage.aspx.cs" Inherits="GoVege.View.AdminUpdateVendorPage" %>
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
        <h1>UPDATE VENDOR</h1>
         <br />
        <h3>Selected Vendor to be Updated</h3>
        <div id="AlbumFieldBefore">
            <div class="FieldContent">
                <asp:Label ID="LblVendorNameBefore" runat="server" Text="Vendor Name"></asp:Label>
                <asp:TextBox ID="TxtVendorNameBefore" runat="server" ReadOnly="true"></asp:TextBox>
            </div>
            <div class="FieldContent">
                <asp:Label ID="LblVendorAddressBefore" runat="server" Text="Vendor Address" ></asp:Label>
                <br />
                <asp:TextBox ID="TxtVendorAddressBefore" runat="server" Width="875px" ReadOnly="true"></asp:TextBox>
            </div>
            <div class="FieldContent">
                <asp:Label ID="LblRatingBefore" runat="server" Text="Rating"></asp:Label>
                <asp:TextBox ID="TxtRatingBefore" runat="server" ReadOnly="true"></asp:TextBox>
            </div>
            <div class="FieldContent">
                <asp:Label ID="LblPreferenceBefore" runat="server" Text="Preference"></asp:Label>
                <asp:TextBox ID="TxtPreferenceBefore" runat="server" ReadOnly="true"></asp:TextBox>
            </div>
            <div class="FieldContent">
                <asp:Label ID="LblCategoryBefore" runat="server" Text="Category"></asp:Label>
                <asp:TextBox ID="TxtCategoryBefore" runat="server" ReadOnly="true"></asp:TextBox>
            </div>
            <div class="FieldContent">
                <asp:Label ID="LblImageUpload" runat="server" Text="Album Image"></asp:Label>
                <br />
                <asp:Image ID="ImageBefore" runat="server" Height="200" Width="200" />
            </div>
        </div>

         <h2>New Album Data Input</h2>

        <div id="AlbumFieldAfter">
            <div class="FieldContent">
                <asp:Label ID="Label1" runat="server" Text="Vendor Name"></asp:Label>
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            </div>
            <div class="FieldContent">
                <asp:Label ID="Label2" runat="server" Text="Vendor Address"></asp:Label>
                <br />
                <asp:TextBox ID="TextBox2" runat="server" Width="875px" ></asp:TextBox>
            </div>
            <div class="FieldContent">
                <asp:Label ID="Label3" runat="server" Text="Rating"></asp:Label>
                <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            </div>
            <div class="FieldContent">
                <asp:Label ID="Label4" runat="server" Text="Preference"></asp:Label>
                <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
            </div>
            <div class="FieldContent">
                <asp:Label ID="Label5" runat="server" Text="Category"></asp:Label>
                <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
            </div>
            <div class="FieldContent">
                <asp:Label ID="Label7" runat="server" Text="Album Image"></asp:Label>
                <br />
                <asp:FileUpload ID="VendorImageFileUpload" runat="server" />
            </div>
            
            <div id="BtnInsertContainer">
                <asp:Label ID="LblError" runat="server" Text=""></asp:Label>
                <br />
                <asp:Button ID="BtnUpdate" runat="server" Text="Update" OnClick="BtnUpdate_Click" />
            </div>
        </div>
    </div>
</asp:Content>
