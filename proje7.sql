USE [yemek_sistemi]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vw_siparis_detaylari] AS
SELECT 
    s.siparis_id,
    m.ad + ' ' + m.soyad AS musteri_adi,
    y.ad AS yemek_adi,
    sd.adet,
    sd.birim_fiyat,
    (sd.adet * sd.birim_fiyat) AS toplam_fiyat,
    s.siparis_tarihi
FROM siparis s
INNER JOIN musteri m ON s.musteri_id = m.musteri_id
INNER JOIN siparis_detay sd ON s.siparis_id = sd.siparis_id
INNER JOIN yemek y ON sd.yemek_id = y.yemek_id;
GO


