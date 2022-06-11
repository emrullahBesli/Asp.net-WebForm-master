<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Siparis.aspx.cs" Inherits="Odev2.Siparis" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <title>Sipariş Ekle</title>
</head>
<body>
    <form id="form1" runat="server">
        <a class="btn btn-info" href="KargoFirmaEkle.aspx">Kargo Firma Ekle</a>
        <a class="btn btn-info" href="KargoFirmaGoster.aspx">Kargo Firma Göster</a>
        <a class="btn btn-info" href="KullaniciEkle.aspx">Kullanıcı ekle</a>
        <a class="btn btn-info" href="KullaniciGetir.aspx">Kullanıcı Göster</a>
        <a class="btn btn-info" href="Siparis.aspx">Sipariş ekle</a>
        <a class="btn btn-info" href="SiparisGoster.aspx">sipariş göster</a>
        <a class="btn btn-info" href="TumTablolar.aspx">Tüm veriler</a>
        <a class="btn btn-info" href="UrunEkle.aspx">ürün ekle</a>
        <a class="btn btn-info" href="UrunGoster.aspx">ürün göster</a>
        <div class="container">
            <div class="row my-2">
                <div class="col">
                    <asp:Label Text="SiparisID" runat="server" />
                </div>
                <div class="col">
                    <asp:TextBox runat="server" CssClass="input-group-text" ID="txtSiparisID" />
                </div>
            </div>
            <div class="row my-2">
                <div class="col">
                    <asp:Label Text="KullaniciID" runat="server" />
                </div>
                <div class="col">
                    <asp:DropDownList runat="server" ID="drpKullaniciID" CssClass="dropdown-header" AutoPostBack="true"></asp:DropDownList>
                </div>
            </div>
            <div class="row my-2">
                <div class="col">
                    <asp:Label Text="UrunID" runat="server" />
                </div>
                <div class="col">
                    <asp:DropDownList runat="server" ID="drpUrunID" CssClass="dropdown-header" AutoPostBack="true"></asp:DropDownList>
                </div>
            </div>
            <div class="row my-2">
                <div class="col">
                    <asp:Label Text="KargoFirmaID" runat="server" />
                </div>
                <div class="col">
                    <asp:DropDownList runat="server" ID="drpKargoFirmaID" CssClass="dropdown-header" AutoPostBack="true"></asp:DropDownList>
                </div>
            </div>
            <div class="row my-2">
                <div class="col">
                    <asp:Label Text="KargoFirmaID" runat="server" />
                </div>
                <div class="col">
                    <asp:Button Text="Kaydet" runat="server" OnClick="Unnamed_Click" ID="btnKaydet" CssClass="btn btn-info" />
                    <asp:Button Text="Güncelle" runat="server" ID="btnGuncelle" OnClick="btnGuncelle_Click" CssClass="btn btn-success" />
                </div>
            </div>
            <table class="table border">
                <tr>
                    <td>Sipariş ID</td>
                    <td>Kullanıcı Ad</td>
                    <td>Kullanıcı Soyad</td>
                    <td>Kullanıcı Adres</td>
                    <td>Ürün Adı</td>
                    <td>Kargo Firma Adı</td>
                    <td>Kargo Firma Adres</td>
                </tr>
                <asp:Repeater ID="rptSiparis" runat="server">
                    <ItemTemplate>
                        <tr>
                            <td><%#Eval("SiparisID") %></td>
                            <td><%#Eval("KAd") %></td>
                            <td><%#Eval("KSoyad") %></td>
                            <td><%#Eval("KAdres") %></td>
                            <td><%#Eval("UrunAd") %></td>
                            <td><%#Eval("KargoFirmaAd") %></td>
                            <td><%#Eval("Adres") %></td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </table>
        </div>
    </form>
</body>
</html>
