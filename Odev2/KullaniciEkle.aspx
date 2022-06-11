<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="KullaniciEkle.aspx.cs" Inherits="Odev2.KullaniciEkle" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
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
                    <asp:Label Text="Kullanıcı Adı" runat="server" />
                </div>
                <div class="col">
                    <asp:TextBox runat="server" CssClass="input-group-text" ID="txtKAd" />
                </div>
            </div>
            <div class="row my-2">
                <div class="col">
                    <asp:Label Text="Kullanıcı Soyadı" runat="server" />
                </div>
                <div class="col">
                    <asp:TextBox runat="server" CssClass="input-group-text" ID="txtKSoyad" />
                </div>
            </div>
            <div class="row my-2">
                <div class="col">
                    <asp:Label Text="Kullanıcı Yaş" runat="server" />
                </div>
                <div class="col">
                    <asp:TextBox runat="server" CssClass="input-group-text" ID="txtKYas" />
                </div>
            </div>
             <div class="row my-2">
                <div class="col">
                    <asp:Label Text="Kullanıcı Adres" runat="server" />
                </div>
                <div class="col">
                    <asp:TextBox runat="server" CssClass="input-group-text" ID="txtKAdres" />
                </div>
            </div>
            <div class="row my-2">
                <div class="col">
                    
                </div>
                <div class="col">
                    <asp:Button Text="KAYDET" runat="server" CssClass="btn btn-primary" ID="btnKaydet" OnClick="btnKaydet_Click" />
                </div>
            </div>
            <div class="row my-2">
                <div class="col">


                     <div class="col-md-8 col-md-offset-2">
                         <asp:GridView ID="kullaniciGrid" runat="server" CssClass="table" OnRowDeleting="kullaniciGrid_RowDeleting" OnRowCancelingEdit="kullaniciGrid_RowCancelingEdit" OnRowEditing="kullaniciGrid_RowEditing" OnRowUpdating="kullaniciGrid_RowUpdating" AutoGenerateColumns="false" DataKeyNames="KullaniciID" >
                             <Columns>
                                 <asp:BoundField HeaderText="Kullanıcı ID" DataField="KullaniciID" />

                                 <asp:TemplateField HeaderText="Kullanıcı Adı">
                                     <ItemTemplate>
                                         <asp:Label runat="server" Text='<%#Eval("KAd") %>'></asp:Label>
                                     </ItemTemplate>
                                     <EditItemTemplate>
                                         <asp:TextBox ID="txtAd" runat="server" Text='<%#Bind("KAd") %>'></asp:TextBox>
                                     </EditItemTemplate>
                                 </asp:TemplateField>

                                 <asp:TemplateField HeaderText="Kullanıcı Soyad">
                                     <ItemTemplate>
                                         <asp:Label runat="server" Text='<%#Eval("KSoyad") %>'></asp:Label>
                                     </ItemTemplate>
                                     <EditItemTemplate>
                                         <asp:TextBox ID="txtSoyad" runat="server" Text='<%#Bind("KSoyad") %>'></asp:TextBox>
                                     </EditItemTemplate>
                                 </asp:TemplateField>
                                 
                                  <asp:TemplateField HeaderText="Kullanıcı Yaş">
                                     <ItemTemplate>
                                         <asp:Label runat="server" Text='<%#Eval("KYas") %>'></asp:Label>
                                     </ItemTemplate>
                                     <EditItemTemplate>
                                         <asp:TextBox ID="txtYas" runat="server" Text='<%#Bind("KYas") %>'></asp:TextBox>
                                     </EditItemTemplate>
                                 </asp:TemplateField>

                                 <asp:TemplateField HeaderText="Kullanıcı Adres">
                                     <ItemTemplate>
                                         <asp:Label runat="server" Text='<%#Eval("KAdres") %>'></asp:Label>
                                     </ItemTemplate>                        
                                     <EditItemTemplate>
                                         <asp:TextBox ID="txtAdres" runat="server" Text='<%#Bind("KAdres") %>'></asp:TextBox>
                                     </EditItemTemplate>
                                 </asp:TemplateField>

                                 <asp:CommandField ShowDeleteButton="true" ControlStyle-CssClass="btn btn-danger" HeaderText="Sil"/>
                                  <asp:CommandField ShowEditButton="true" ControlStyle-CssClass="btn btn-primary" HeaderText="Güncelle"/>
                             </Columns>
                         </asp:GridView>
                     </div>
                </div>
            </div>
        </div>


        

    </form>
</body>
</html>
