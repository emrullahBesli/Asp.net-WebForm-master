<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="KargoFirmaEkle.aspx.cs" Inherits="Odev2.KargoFirmaEkle" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
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

        <br />
        <br />
        <div class="container">
            <div class="row my-2">
                <div class="col">
                    <asp:Label Text="Kargo Firma Adı" runat="server" />
                </div>
                <div class="col">
                    <asp:TextBox runat="server" CssClass="input-group-text" ID="txtKargoAd" />
                </div>
            </div>

            <div class="row my-2">
                <div class="col">
                    <asp:Label Text="Kargo Firma Adres" runat="server" />
                </div>
                <div class="col">
                    <asp:TextBox runat="server" CssClass="input-group-text" ID="txtKargoAdres" />
                </div>
            </div>

            <div class="row my-2">
                <div class="col">
                </div>
                <div class="col">
                    <asp:Button Text="KAYDET" runat="server" ID="btnKaydet" CssClass="btn btn-primary" OnClick="btnKaydet_Click" />
                </div>
            </div>

            <div class="row my-2">
                <div class="col">
                    <div class="col-md-8 col-md-offset-2">
                        <asp:GridView ID="KargoFirmaGrid" runat="server" CssClass="table" OnRowDeleting="KargoFirmaGrid_RowDeleting" OnRowCancelingEdit="KargoFirmaGrid_RowCancelingEdit" OnRowEditing="KargoFirmaGrid_RowEditing" OnRowUpdating="KargoFirmaGrid_RowUpdating" AutoGenerateColumns="false" DataKeyNames="KargoFirmaID">
                            <Columns>
                                <asp:BoundField HeaderText="Kargo Firma ID" DataField="KargoFirmaID" />

                                <asp:TemplateField HeaderText="Kargo Firma Adı">
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%#Eval("KargoFirmaAd") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtKAd" runat="server" Text='<%#Bind("KargoFirmaAd") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Kargo Firma Adres">
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%#Eval("Adres") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtKAdres" runat="server" Text='<%#Bind("Adres") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                </asp:TemplateField>

                                <asp:CommandField ShowDeleteButton="true" ControlStyle-CssClass="btn btn-danger" HeaderText="Sil" />

                                <asp:CommandField ShowEditButton="true" ControlStyle-CssClass="btn btn-primary" HeaderText="Güncelle" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>



        </div>
    </form>
</body>
</html>
