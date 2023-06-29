<%@ Page Title="" Language="C#" MasterPageFile="~/View/MasterPage.Master" AutoEventWireup="true" CodeBehind="AdminDriverPage.aspx.cs" Inherits="GoVege.View.AdminDriverPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h1>Driver Page</h1>

    <div runat="server">
        <div class="artistContainer" style="width: 100%; height: 100%; display: flex; justify-content: flex-start; flex-wrap: wrap;">
                <asp:Repeater ID="driverRepeater" runat="server">
                    <ItemTemplate>
                        <div class="artistCardContainer" style="width: 180px; height:300px; display: flex; flex-direction: row; align-items: center; justify-content: center; border-radius: 10px; border: 2px solid black; margin-bottom: 20px; margin-right: 10px">
                            <div class="imageInfoContainer" style="display: flex; flex-direction: column; gap: 50px">
                                <div class="imageAndTitleContainer" style="display: flex; align-items: center; justify-content: center; flex-direction:column">
                                    <asp:ImageButton ID="artistImage" runat="server" ImageUrl='<%# Eval("ArtistImage") %>' style="height: 90%; width: 120px;" OnCommand="selectButton_Command" CommandArgument='<%# Eval("ArtistId") %>'/>
                                    <a href='<%# "ArtistDetail.aspx?ArtistId=" + Eval("ArtistId") %>'>
                                        <h3 style="margin: 0; color: black; text-decoration:none"><%# Eval("ArtistName") %></h3>
                                    </a>
                                </div>
                                <div class="artistInfoContainer" style="height: 80%; width:75%; display: flex; flex-direction: column; justify-content: space-between">
                                    <div class="buttonActionContainer" style="width:120px; flex-direction: row;">
                                        <asp:Button ID="updateButton" runat="server" Text="Update" CommandArgument='<%# Eval("ArtistId") %>' OnCommand="updateButton_Command" Visible='<%# isAdmin %>' />
                                        <asp:Button ID="deleteButton" runat="server" Text="Delete" CommandArgument='<%# Eval("ArtistId") %>' OnCommand="deleteButton_Command" Visible='<%# isAdmin %>' />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
              </asp:Repeater>
            </div>
        <asp:Button ID="insertButton" runat="server" Text="Insert" OnClick="insertButton_Click" Visible="false"/>
    </div>

</asp:Content>
