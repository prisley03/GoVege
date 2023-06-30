<%@ Page Title="" Language="C#" MasterPageFile="~/View/MasterPage.Master" AutoEventWireup="true" CodeBehind="AdminDriverPage.aspx.cs" Inherits="GoVege.View.AdminDriverPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        .driverContainer{
            width: 100%;
            height: 100%;
            display: flex;
            justify-content: flex-start;
            flex-wrap: wrap;
        }

        .driverCardContainer{
            width: 180px;
            height: 300px;
            display: flex;
            flex-direction: row;
            align-items: center;
            justify-content: center;
            border-radius: 10px;
            border: 2px solid black;
            margin-bottom: 20px;
            margin-right: 10px
        }

        .imageInfoContainer{
            display: flex;
            flex-direction: column;
            gap: 50px;
        }

        .imageAndTitleContainer{
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
        }

        .contentImage{
            height: 90%;
            width: 120px;
        }

        .contentText{
            margin: 0;
            color: black;
            text-decoration: none;
        }

        .driverInfoContainer{
            height: 80%;
            width:75%;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        .buttonActionContainer{
            width:120px;
            display: flex;
            flex-direction: row;
            justify-content: space-around;
        }

        .button {
            border: 2px solid #30D315;
            color: #30D315;
            background-color: white;
            border-radius: 3px;
            cursor: pointer;
            margin-left: 0;
            margin-right: 0;
            margin-top: 0;
        }

        .button:hover {
            color: white;
            background-color: #30D315;
            border-radius: 3px;
            margin: 0;
            cursor: pointer;
        }

        .contentContainer{
            padding-left: 5vh;
            padding-top: 15vh;
        }

        .insertButton{
            background-color: #2EB14B;
        }
        .insertButton:hover{
            color: white;
            background-color: #30D315;
            border-radius: 3px;
            margin: 0;
            cursor: pointer;
        }



    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="contentContainer">
        <div class="driverContainer">
            <asp:Repeater ID="driverRepeater" runat="server">
                <ItemTemplate>
                    <div class="driverCardContainer">
                        <div class="imageInfoContainer">
                            <div class="imageAndTitleContainer">
                                <image class="contentImage" src='../Assets/Driver/<%# Eval("driverImage")%>'></image>
                                <h3 class="contentText"><%# Eval("driverName") %></h3>
                            </div>
                            <div class="driverInfoContainer">
                                <div class="buttonActionContainer">
                                    <asp:LinkButton CssClass="button" ID="updateButton" runat="server" CommandArgument='<%# Eval("driverId") %>' OnClick="updateButton_Click">Update</asp:LinkButton>
                                    <asp:LinkButton CssClass="button" ID="deleteButton" runat="server" CommandArgument='<%# Eval("driverId") %>' OnClick="deleteButton_Click">Delete</asp:LinkButton>
                                </div>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
        <asp:Button ID="insertButton" runat="server" Text="Insert New Driver" OnClick="insertButton_Click" Height="46px" Width="209px" CssClass="insertButton"/>
    </div>
</asp:Content>
