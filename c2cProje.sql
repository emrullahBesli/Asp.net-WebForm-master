USE [c2cProje]
GO
/****** Object:  Table [dbo].[KargoFirma]    Script Date: 3.03.2022 06:09:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KargoFirma](
	[KargoFirmaID] [int] IDENTITY(1,1) NOT NULL,
	[KargoFirmaAd] [nvarchar](50) NOT NULL,
	[Adres] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_KargoFirma] PRIMARY KEY CLUSTERED 
(
	[KargoFirmaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kullanici]    Script Date: 3.03.2022 06:09:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kullanici](
	[KullaniciID] [int] IDENTITY(1,1) NOT NULL,
	[KAd] [nvarchar](50) NOT NULL,
	[KSoyad] [nvarchar](50) NOT NULL,
	[KYas] [nvarchar](50) NOT NULL,
	[KAdres] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Kullanici] PRIMARY KEY CLUSTERED 
(
	[KullaniciID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Siparis]    Script Date: 3.03.2022 06:09:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Siparis](
	[SiparisID] [int] IDENTITY(1,1) NOT NULL,
	[KullaniciID] [int] NOT NULL,
	[UrunID] [int] NOT NULL,
	[KargoFirmaID] [int] NOT NULL,
 CONSTRAINT [PK_Siparis] PRIMARY KEY CLUSTERED 
(
	[SiparisID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Urun]    Script Date: 3.03.2022 06:09:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Urun](
	[UrunID] [int] IDENTITY(1,1) NOT NULL,
	[UrunAd] [nvarchar](50) NOT NULL,
	[UrunAciklama] [nvarchar](50) NULL,
 CONSTRAINT [PK_Urun] PRIMARY KEY CLUSTERED 
(
	[UrunID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[KargoFirma] ON 

INSERT [dbo].[KargoFirma] ([KargoFirmaID], [KargoFirmaAd], [Adres]) VALUES (1, N'Sürat', N'Ýstanbul')
SET IDENTITY_INSERT [dbo].[KargoFirma] OFF
GO
SET IDENTITY_INSERT [dbo].[Kullanici] ON 

INSERT [dbo].[Kullanici] ([KullaniciID], [KAd], [KSoyad], [KYas], [KAdres]) VALUES (3, N'Oðuzhan', N'Kahramann', N'21', N'Ýstanbul')
INSERT [dbo].[Kullanici] ([KullaniciID], [KAd], [KSoyad], [KYas], [KAdres]) VALUES (7, N'Osman', N'Sivrikaya', N'20', N'Ýstanbul')
SET IDENTITY_INSERT [dbo].[Kullanici] OFF
GO
SET IDENTITY_INSERT [dbo].[Siparis] ON 

INSERT [dbo].[Siparis] ([SiparisID], [KullaniciID], [UrunID], [KargoFirmaID]) VALUES (1, 1, 1, 1)
INSERT [dbo].[Siparis] ([SiparisID], [KullaniciID], [UrunID], [KargoFirmaID]) VALUES (2, 3, 1, 1)
SET IDENTITY_INSERT [dbo].[Siparis] OFF
GO
SET IDENTITY_INSERT [dbo].[Urun] ON 

INSERT [dbo].[Urun] ([UrunID], [UrunAd], [UrunAciklama]) VALUES (1, N'TELEFON', N'ASDASD')
SET IDENTITY_INSERT [dbo].[Urun] OFF
GO
/****** Object:  StoredProcedure [dbo].[spKargoFirmaEkle]    Script Date: 3.03.2022 06:09:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spKargoFirmaEkle]
(
@KargoFirmaAd nvarchar(50),
@Adres nvarchar(50)
)
as 
begin
insert into KargoFirma(KargoFirmaAd,Adres) values (@KargoFirmaAd,@Adres)
end
GO
/****** Object:  StoredProcedure [dbo].[spKargoFirmaGetir]    Script Date: 3.03.2022 06:09:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spKargoFirmaGetir]
as 
begin
select * from KargoFirma
end
GO
/****** Object:  StoredProcedure [dbo].[spKargoFirmaGuncelle]    Script Date: 3.03.2022 06:09:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spKargoFirmaGuncelle]
(
@KargoFirmaID int,
@KargoFirmaAd nvarchar(50),
@Adres nvarchar(50)
)
as 
begin
update KargoFirma set KargoFirmaAd=@KargoFirmaAd,Adres=@Adres where KargoFirmaID=@KargoFirmaID
end
GO
/****** Object:  StoredProcedure [dbo].[spKargoFirmaSil]    Script Date: 3.03.2022 06:09:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spKargoFirmaSil]
(
@KargoFirmaID int
)
as 
begin
delete from KargoFirma where KargoFirmaID = @KargoFirmaID
end
GO
/****** Object:  StoredProcedure [dbo].[spKullaniciEkle]    Script Date: 3.03.2022 06:09:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spKullaniciEkle]
(
@KAd nvarchar(50),
@KSoyad nvarchar(50),
@KYas int,
@KAdres nvarchar(50)
)
as begin
insert into Kullanici(KAd,KSoyad,KYas,KAdres) Values(@KAd,@KSoyad,@KYas,@KAdres)
end
GO
/****** Object:  StoredProcedure [dbo].[spKullaniciGetir]    Script Date: 3.03.2022 06:09:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spKullaniciGetir]
as begin 
select * from Kullanici
end
GO
/****** Object:  StoredProcedure [dbo].[spKullaniciGuncelle]    Script Date: 3.03.2022 06:09:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spKullaniciGuncelle]
(
@KullaniciID int,
@KAd nvarchar(50),
@KSoyad nvarchar(50),
@KYas int,
@KAdres nvarchar(50)
)
as 
begin
update Kullanici set KAd = @KAd,KSoyad=@KSoyad,KYas=@KYas,KAdres=@KAdres where KullaniciID=@KullaniciID
end
GO
/****** Object:  StoredProcedure [dbo].[spKullaniciSil]    Script Date: 3.03.2022 06:09:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spKullaniciSil](
@KullaniciID int
)
as begin 
delete from Kullanici where KullaniciID = @KullaniciID
end
GO
/****** Object:  StoredProcedure [dbo].[spSiparisEkle]    Script Date: 3.03.2022 06:09:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spSiparisEkle](
@KullaniciID int,
@UrunID int,
@KargoFirmaID int
)
as 
begin
insert into Siparis(KullaniciID,UrunID,KargoFirmaID) values (@KullaniciID,@UrunID,@KargoFirmaID)
end
GO
/****** Object:  StoredProcedure [dbo].[spSiparisGetir]    Script Date: 3.03.2022 06:09:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spSiparisGetir]
as 
begin
select * from Siparis
end
GO
/****** Object:  StoredProcedure [dbo].[spSiparisGuncelle]    Script Date: 3.03.2022 06:09:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spSiparisGuncelle]
(
@SiparisID int,
@KullaniciID int,
@UrunID int,
@KargoFirmaID int
)
as 
begin
update Siparis set KullaniciID=@KullaniciID,@UrunID=@KullaniciID,KargoFirmaID=@KargoFirmaID where SiparisID=@SiparisID
end
GO
/****** Object:  StoredProcedure [dbo].[spSiparisSil]    Script Date: 3.03.2022 06:09:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spSiparisSil]
(
@SiparisID int
)
as 
begin
delete from Siparis where SiparisID = @SiparisID
end
GO
/****** Object:  StoredProcedure [dbo].[spTumTabloGetir]    Script Date: 3.03.2022 06:09:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spTumTabloGetir]
as begin
select s.SiparisID,u.UrunAd,u.UrunAciklama,k.KAd,k.KSoyad,k.KAdres,k.KYas,kf.KargoFirmaAd,kf.Adres from Siparis s 
inner join Urun u on u.UrunID=s.UrunID
inner join Kullanici k on k.KullaniciID=s.KullaniciID
inner join KargoFirma kf on kf.KargoFirmaID=s.KargoFirmaID
end
GO
/****** Object:  StoredProcedure [dbo].[spUrunEkle]    Script Date: 3.03.2022 06:09:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spUrunEkle]
(
@UrunAd nvarchar(50),
@UrunAciklama nvarchar(50)
)
as begin
insert into Urun(UrunAd,UrunAciklama) Values(@UrunAd,@UrunAciklama)
end
GO
/****** Object:  StoredProcedure [dbo].[spUrunGetir]    Script Date: 3.03.2022 06:09:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spUrunGetir]
as begin
select * from Urun
end
GO
/****** Object:  StoredProcedure [dbo].[spUrunGuncelle]    Script Date: 3.03.2022 06:09:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spUrunGuncelle]
(
@UrunID int,
@UrunAd nvarchar(50),
@UrunAciklama nvarchar(50)
)
as 
begin
update Urun set UrunAd = @UrunAd,UrunAciklama=@UrunAciklama where UrunID=@UrunID
end
GO
