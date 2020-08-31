<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="rentacar._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1><strong>rentacar</strong></h1>
        <h3>Sistema para controle de aluguel de veículos.</h3>
    </div>
    <div>
        <h3>Veículos disponíveis:</h3>
        <asp:GridView ID="VeiculosGridView" runat="server">
        </asp:GridView>
    </div>

</asp:Content>
