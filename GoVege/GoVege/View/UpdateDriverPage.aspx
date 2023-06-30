<%@ Page Title="" Language="C#" MasterPageFile="~/View/MasterPage.Master" AutoEventWireup="true" CodeBehind="UpdateDriverPage.aspx.cs" Inherits="GoVege.View.UpdateDriverPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>

        .updateContainer{
            padding-top: 15vh;
            padding-left: 5vh;
        }

    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="updateContainer">
        <h1>Update Driver</h1>
        <asp:Image ID="driverImage" runat="server" Width="220px" Height="220px"/><br />
        <asp:Label ID="driverName" runat="server" Text="" Font-Bold="true" Font-Size="Large"></asp:Label><br />
        
        <br />
        <asp:Label ID="Label1" runat="server" Text="Driver Name"></asp:Label> <br />
        <asp:TextBox ID="driverNameBox" runat="server"></asp:TextBox> <br /><br />

        <asp:Label ID="Label2" runat="server" Text="Image"></asp:Label><br />
        <asp:FileUpload ID="imageUpload" runat="server" /><br /><br />

        <asp:Label ID="Label3" runat="server" Text="License Plate"></asp:Label> <br />
        <asp:TextBox ID="driverLP" runat="server"></asp:TextBox> <br /><br />

        <asp:Label ID="Label4" runat="server" Text="Vehicle Name"></asp:Label> <br />
        <asp:TextBox ID="vehicleName" runat="server"></asp:TextBox> <br /><br />

        <asp:Button ID="updateButton" runat="server" Text="Update" OnClick="updateButton_Click"/><br />
        <asp:Label ID="warningLabel" runat="server" Text=""></asp:Label>
    </div>

</asp:Content>
