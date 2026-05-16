USE [yemek_sistemi]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vw_askida_bakiye] AS
SELECT 
    ISNULL((SELECT SUM(tutar) FROM bagis),0) AS toplam_bagis,
    ISNULL((SELECT SUM(tutar) FROM askida_kullanim),0) AS toplam_kullanim,
    ISNULL((SELECT SUM(tutar) FROM bagis),0) 
    - ISNULL((SELECT SUM(tutar) FROM askida_kullanim),0) AS kalan_bakiye;
GO


