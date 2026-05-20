CREATE DATABASE yemek_sistemi;
GO

USE yemek_sistemi;
GO

-- =============================================
-- MÜÞTERÝ TABLOSU
-- =============================================

USE [yemek_sistemi]
GO


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[musteri](
	[musteri_id] [int] IDENTITY(1,1) NOT NULL,
	[ad] [nvarchar](50) NOT NULL,
	[soyad] [nvarchar](50) NOT NULL,
	[email] [nvarchar](100) NOT NULL,
	[telefon] [nvarchar](15) NOT NULL,
	[sehir] [nvarchar](50) NOT NULL,
	[ilce] [nvarchar](50) NOT NULL,
	[acik_adres] [nvarchar](max) NOT NULL,
	[kayit_tarihi] [datetime] NULL,
	[is_active] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[musteri_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[telefon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[musteri] ADD  DEFAULT (getdate()) FOR [kayit_tarihi]
GO

ALTER TABLE [dbo].[musteri] ADD  DEFAULT ((1)) FOR [is_active]
GO


-- =============================================
-- RESTORAN TABLOSU
-- =============================================


USE [yemek_sistemi]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[restoran](
	[restoran_id] [int] IDENTITY(1,1) NOT NULL,
	[ad] [nvarchar](100) NOT NULL,
	[telefon] [nvarchar](15) NOT NULL,
	[sehir] [nvarchar](50) NOT NULL,
	[ilce] [nvarchar](50) NOT NULL,
	[acik_adres] [nvarchar](max) NOT NULL,
	[puan] [decimal](2, 1) NULL,
	[kayit_tarihi] [datetime] NULL,
	[is_active] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[restoran_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[telefon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[restoran] ADD  DEFAULT (getdate()) FOR [kayit_tarihi]
GO

ALTER TABLE [dbo].[restoran] ADD  DEFAULT ((1)) FOR [is_active]
GO

ALTER TABLE [dbo].[restoran]  WITH CHECK ADD CHECK  (([puan]>=(1) AND [puan]<=(5)))
GO





-- =============================================
-- YEMEK TABLOSU
-- =============================================


USE [yemek_sistemi]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[yemek](
	[yemek_id] [int] IDENTITY(1,1) NOT NULL,
	[ad] [nvarchar](100) NOT NULL,
	[fiyat] [decimal](10, 2) NOT NULL,
	[restoran_id] [int] NOT NULL,
	[kayit_tarihi] [datetime] NULL,
	[is_active] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[yemek_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[yemek] ADD  DEFAULT (getdate()) FOR [kayit_tarihi]
GO

ALTER TABLE [dbo].[yemek] ADD  DEFAULT ((1)) FOR [is_active]
GO

ALTER TABLE [dbo].[yemek]  WITH CHECK ADD FOREIGN KEY([restoran_id])
REFERENCES [dbo].[restoran] ([restoran_id])
GO

ALTER TABLE [dbo].[yemek]  WITH CHECK ADD CHECK  (([fiyat]>(0)))
GO


-- =============================================
-- SÝPARÝÞ TABLOSU
-- =============================================

USE [yemek_sistemi]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[siparis](
	[siparis_id] [int] IDENTITY(1,1) NOT NULL,
	[musteri_id] [int] NOT NULL,
	[siparis_tarihi] [datetime] NULL,
	[toplam_tutar] [decimal](10, 2) NOT NULL,
	[durum] [nvarchar](50) NOT NULL,
	[sehir] [nvarchar](50) NOT NULL,
	[ilce] [nvarchar](50) NOT NULL,
	[acik_adres] [nvarchar](max) NOT NULL,
	[kayit_tarihi] [datetime] NULL,
	[is_active] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[siparis_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[siparis] ADD  DEFAULT (getdate()) FOR [siparis_tarihi]
GO

ALTER TABLE [dbo].[siparis] ADD  DEFAULT (getdate()) FOR [kayit_tarihi]
GO

ALTER TABLE [dbo].[siparis] ADD  DEFAULT ((1)) FOR [is_active]
GO

ALTER TABLE [dbo].[siparis]  WITH CHECK ADD FOREIGN KEY([musteri_id])
REFERENCES [dbo].[musteri] ([musteri_id])
GO


ALTER TABLE [dbo].[siparis]  WITH CHECK ADD CHECK  (([toplam_tutar]>(0)))
GO

ALTER TABLE [dbo].[siparis]  WITH CHECK ADD CHECK  (([toplam_tutar]>(0)))
GO



-- =============================================
-- SÝPARÝÞ DETAYI TABLOSU
-- =============================================

USE [yemek_sistemi]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[siparis_detay](
	[siparis_detay_id] [int] IDENTITY(1,1) NOT NULL,
	[siparis_id] [int] NOT NULL,
	[yemek_id] [int] NOT NULL,
	[adet] [int] NOT NULL,
	[birim_fiyat] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[siparis_detay_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[siparis_detay]  WITH CHECK ADD FOREIGN KEY([siparis_id])
REFERENCES [dbo].[siparis] ([siparis_id])
GO

ALTER TABLE [dbo].[siparis_detay]  WITH CHECK ADD FOREIGN KEY([yemek_id])
REFERENCES [dbo].[yemek] ([yemek_id])
GO

ALTER TABLE [dbo].[siparis_detay]  WITH CHECK ADD CHECK  (([birim_fiyat]>(0)))
GO

ALTER TABLE [dbo].[siparis_detay]  WITH CHECK ADD CHECK  (([adet]>(0)))
GO


-- =============================================
-- BAÐIÞ TABLOSU
-- =============================================

USE [yemek_sistemi]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[bagis](
	[bagis_id] [int] IDENTITY(1,1) NOT NULL,
	[musteri_id] [int] NOT NULL,
	[tutar] [decimal](10, 2) NOT NULL,
	[bagis_tarihi] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[bagis_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[bagis] ADD  DEFAULT (getdate()) FOR [bagis_tarihi]
GO


ALTER TABLE [dbo].[bagis]  WITH CHECK ADD FOREIGN KEY([musteri_id])
REFERENCES [dbo].[musteri] ([musteri_id])
GO

ALTER TABLE [dbo].[bagis]  WITH CHECK ADD CHECK  (([tutar]>(0)))
GO

ALTER TABLE [dbo].[bagis]  WITH CHECK ADD CHECK  (([tutar]>(0)))
GO


-- =============================================
-- ASKIDA KULLANIM TABLOSU
-- =============================================

USE [yemek_sistemi]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[askida_kullanim](
	[kullanim_id] [int] IDENTITY(1,1) NOT NULL,
	[musteri_id] [int] NOT NULL,
	[siparis_id] [int] NOT NULL,
	[tutar] [decimal](10, 2) NOT NULL,
	[kullanim_tarihi] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[kullanim_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[askida_kullanim] ADD  DEFAULT (getdate()) FOR [kullanim_tarihi]
GO

ALTER TABLE [dbo].[askida_kullanim]  WITH CHECK ADD FOREIGN KEY([musteri_id])
REFERENCES [dbo].[musteri] ([musteri_id])
GO

ALTER TABLE [dbo].[askida_kullanim]  WITH CHECK ADD FOREIGN KEY([siparis_id])
REFERENCES [dbo].[siparis] ([siparis_id])
GO

ALTER TABLE [dbo].[askida_kullanim]  WITH CHECK ADD CHECK  (([tutar]>(0)))
GO





-- =============================================
-- INDEXLER
-- =============================================

CREATE INDEX idx_musteri_email
ON musteri(email);

CREATE INDEX idx_siparis_musteri
ON siparis(musteri_id);



-- =============================================
-- TRIGGER
-- =============================================
GO

USE [yemek_sistemi]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[trg_askida_kullanim_kontrol]
ON [dbo].[askida_kullanim]
INSTEAD OF INSERT
AS
BEGIN
    DECLARE @toplam_bagis DECIMAL(10,2);
    DECLARE @toplam_kullanim DECIMAL(10,2);
    DECLARE @yeni_kullanim DECIMAL(10,2);

    SELECT @toplam_bagis = ISNULL(SUM(tutar),0) FROM bagis;
    SELECT @toplam_kullanim = ISNULL(SUM(tutar),0) FROM askida_kullanim;
    SELECT @yeni_kullanim = SUM(tutar) FROM inserted;

    IF (@toplam_bagis - @toplam_kullanim >= @yeni_kullanim)
    BEGIN
        INSERT INTO askida_kullanim (musteri_id, siparis_id, tutar, kullanim_tarihi)
        SELECT musteri_id, siparis_id, tutar, kullanim_tarihi FROM inserted;
    END
    ELSE
    BEGIN
        RAISERROR('Yetersiz askýda bakiye!', 16, 1);
    END
END;





-- =============================================
-- VIEWLER
-- =============================================
GO

-- ---------- Askýda bakiye ---------- --

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



-- --------- Sipariþ detaylarý ---------- --

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




-- =============================================
-- TEST VERILERI
-- =============================================

------- müþteri verileri----------
INSERT INTO musteri 
(ad, soyad, email, telefon, sehir, ilce, acik_adres)
VALUES
('Ali', 'Veli', 'alv@gmail.com', '0509999999', 'izmir', 'Merkez', 'Ýstasyon'),
('Esin', 'Iþýk', 'esn@gmail.com', '0507418540', 'Adana', 'Merkez', 'Ýstasyon'),
('Ali', 'Duþlu', 'ahkl@gmail.com', '0508799999', 'Ankara', 'Merkez', 'ulus'),
('Hayri', 'Cepli', 'hyr@gmail.com', '050452999', 'Muðla', 'Menteþe', '>Sahil'),
('cabbar', 'Belli', 'acbr@gmail.com', '050900000', 'Samsun', 'Merkez', 'HAstane'),
('Abdulrezzak', 'Halil', 'abdl@gmail.com', '0501023529', 'Diyarbakýr', 'Amed', 'Zagros'),
('Büþra', 'Çalýk', 'bþr@gmail.com', '0429856320', 'Batman', 'Merkez', 'ptt'),
('Ceyda', 'Satýlmýþ', 'cyd@gmail.com', '0795427895', 'Mardin', 'Eski Mardin', 'Awm'),
('Sanem', 'Varlý', 'snm@gmail.com', '09625215420', 'Manýsa', 'Salihli', 'Kampüs'),
('Tudem', 'Aktaþ', 'tudem@gmail.com', '05026666666', 'izmir', 'bayýndýr', 'merkez'),
('Havva', 'Yýldýz', 'hvva@gmail.com', '05037777777', 'Ýstanbul', 'Niþantaþý', 'Köprülü'),
('Nursima', 'Demir', 'dmr@gmail.com', '05048527419', 'Van', 'Edremit', 'Memursen'),
('Tuðba', 'Ataþ Yýldýz', 'tgb@gmail.com', '05087865296', 'Aðrý', 'merkez', 'Hastane caddesi'),
('Muhammed', 'Bilir', 'mhd@gmail.com', '0503862562', 'Ýzmir', 'Konak', 'Sahil Yolu'),
('Rüzgar', 'Yýldýz', 'rzgr@gmail.com', '05041234567', 'Van', 'Edremit', 'Eski cami'),
('Ahmet', 'Yýlmaz', 'ahmet@gmail.com', '05001111111', 'Van', 'Ýpekyolu', 'Cumhuriyet Mahallesi'),
('Ayþe', 'Demir', 'ayse@gmail.com', '05002222222', 'Van', 'Tuþba', 'Maraþ Caddesi'),
('Mehmet', 'Kaya', 'mehmet@gmail.com', '05003333333', 'Van', 'Edremit', 'Sahil Yolu'),
('Zeynep', 'Çelik', 'zeynep@gmail.com', '05004444444', 'Van', 'Ýpekyolu', 'Kazým Karabekir'),
('Ali', 'Arslan', 'ali@gmail.com', '05005555555', 'Van', 'Tuþba', 'Yeni Mahalle');



-----------restoran verileri---------------
INSERT INTO restoran
(ad, telefon, sehir, ilce, acik_adres, puan)
VALUES
('Lezzet Duraðý', '04320000000', 'Van', 'Ýpekyolu', 'Merkez', 4.5),
('Burger Steak', '04321111111', 'Van', 'Ýpekyolu', 'Merkez', 4.9),
('Burger House', '04322222222', 'Van', 'Tuþba', 'Sahil Yolu', 4.2),
('Pizza Star', '04323333333', 'Van', 'Edremit', 'Ýskele', 4.8),
('Kebapçý Baba', '04324444444', 'Van', 'Ýpekyolu', 'Maraþ Caddesi', 4.1),
('Tatlýcý Mehmet', '04325555555', 'Van', 'Tuþba', 'Çarþý Merkezi', 4.7);



------------yemek verileri---------------
INSERT INTO yemek
(ad, fiyat, restoran_id)
VALUES


('Makarnaa', 450, 4),
('Tavuk Burger', 210, 2),
('Sucuklu Tost', 130, 1),
('Çikolatalý Waffle', 190, 5),
('Kremalý Makarna', 240, 1),
('Mexicano Pizza', 410, 3),
('Acýlý Tavuk Kanat', 260, 2),
('Fettuccine Alfredo', 290, 1),
('Çýtýr Tavuk', 220, 2),
('Ballý Kaymak', 160, 5),
('Vejeteryan Pizza',275 ,3 ),
('Et Pizza',480,3 ),
('Karýþýk Pizza',450 ,3 ),
('Büryan',560 ,4 ),
('Pirzola',700 ,4 ),
('Kuþbaþý',820 ,4 ),
('Kanat Porsyon',430 ,4 ),
('Tavuk Dürüm',250 ,2 ),
('Hatay Soslu',290 ,2 ),
('Hatay Soslu Zurna',350 ,2 ),
('Et Döner', 190, 1),
('Tavuk Þiþ', 230, 1),
('Kaþarlý Pide', 170, 1),
('Mega Burger', 260, 2),
('Patates Kýzartmasý', 90, 2),
('Soðan Halkasý', 110, 2),
('Karýþýk Pizza Büyük', 420, 3),
('Margarita Pizza', 280, 3),
('Ton Balýklý Pizza', 390, 3),
('Acýlý Kebap', 270, 4),
('Beyti Kebap', 310, 4),
('Adana Dürüm', 160, 4),
('Sütlaç', 95, 5),
('Kadayýf', 130, 5),
('Profiterol', 150, 5),
('Mozaik Pasta', 140, 5),
('Ýskender', 340, 1),
('Double Cheeseburger', 320, 2),
('Vejetaryen Pizza', 300, 3),
('Kuþbaþýlý Pide', 260, 1),
('Adana Kebap', 250, 4),
('Karýþýk Pizza', 320, 3),
('Cheeseburger', 180, 2),
('Künefe', 120, 5),
('Lahmacun', 80, 1),
('Tavuk Döner', 140, 1),
('Hamburger', 160, 2),
('Sucuklu Pizza', 350, 3),
('Fýstýklý Baklava', 200, 5),
('Urfa Kebap', 240, 4);

---100'den fazla sipariþ döngü ile
USE yemek_sistemi;
GO
DECLARE @i INT = 1;

WHILE @i <= 100
BEGIN
    INSERT INTO siparis
    (musteri_id, toplam_tutar, durum, sehir, ilce, acik_adres)
    VALUES
    (
        (@i % 10) + 1,
        (50 + (@i * 5)),
        'Teslim Edildi',
        'Van',
        'Ýpekyolu',
        'Test Adres'
    );

    SET @i = @i + 1;
END;

USE yemek_sistemi;
GO

DECLARE @i INT = 11;

WHILE @i <= 120
BEGIN
    INSERT INTO siparis_detay
    (siparis_id, yemek_id, adet, birim_fiyat)
    VALUES
    (
        @i,
        ((@i % 20) + 1),
        1 + (@i % 3),
        100 + (@i % 200)
    );

    SET @i = @i + 1;
END;

SELECT COUNT(*) 
FROM siparis_detay;

SELECT COUNT(*) FROM siparis;


SELECT * FROM yemek;
SELECT * FROM musteri;
SELECT * FROM restoran;


--------sipariþ verileri dögü olmadan------------
INSERT INTO siparis
(musteri_id, toplam_tutar, durum, sehir, ilce, acik_adres)
VALUES
(1, 450, 'Teslim Edildi', 'Van', 'Ýpekyolu', 'Cumhuriyet Mahallesi'),
(2, 320, 'Hazýrlanýyor', 'Van', 'Tuþba', 'Maraþ Caddesi'),
(3, 210, 'Yolda', 'Van', 'Edremit', 'Sahil Yolu'),
(4, 580, 'Teslim Edildi', 'Van', 'Ýpekyolu', 'Kazým Karabekir'),
(5, 140, 'Hazýrlanýyor', 'Van', 'Tuþba', 'Yeni Mahalle'),
(2, 760, 'Teslim Edildi', 'Ýzmir', 'Konak', 'Sahil'),
(5, 290, 'Yolda', 'Van', 'Edremit', 'Merkez'),
(1, 180, 'Teslim Edildi', 'Van', 'Ýpekyolu', 'Halilaða'),
(3, 410, 'Hazýrlanýyor', 'Van', 'Edremit', 'Memursen'),
(2, 350, 'Teslim Edildi', 'Van', 'Tuþba', 'Ýskele');

SELECT * FROM siparis;

--------sipariþ detayý verileri-------------
INSERT INTO siparis_detay
(siparis_id, yemek_id, adet, birim_fiyat)
VALUES
(1, 1, 2, 250),
(1, 5, 1, 80),

(2, 3, 1, 180),
(2, 12, 2, 160),

(3, 2, 1, 320),

(4, 10, 2, 240),
(4, 11, 1, 310),

(5, 6, 1, 140),

(6, 17, 2, 340),
(6, 20, 1, 260),

(7, 4, 2, 120),

(8, 7, 1, 160),

(9, 18, 1, 320),
(9, 15, 1, 150),

(10, 8, 1, 350);

SELECT * FROM siparis_detay;


--------baðýþ verileri-----------
INSERT INTO bagis
(musteri_id, tutar)
VALUES
(1, 500),
(2, 300),
(3, 250),
(5, 400),
(4, 150);

SELECT * FROM bagis;


---------askýda kullaným verileri-----------
INSERT INTO askida_kullanim
(musteri_id, siparis_id, tutar)
VALUES
(4, 4, 150),
(6, 6, 200),
(2, 10, 100);

SELECT * FROM askida_kullanim;




-- =============================================
-- ANALITIK SORGULAR
-- =============================================


-------Join sorgusu-----------

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

-------GROUP BY + HAVING---------

-- 5'ten fazla siparis alan restoranlar

SELECT 
    r.ad AS restoran,
    COUNT(s.siparis_id) AS siparis_sayisi,
    AVG(s.toplam_tutar) AS ortalama_tutar
FROM restoran r
INNER JOIN yemek y ON r.restoran_id = y.restoran_id
INNER JOIN siparis_detay sd ON y.yemek_id = sd.yemek_id
INNER JOIN siparis s ON sd.siparis_id = s.siparis_id
GROUP BY r.ad
HAVING COUNT(s.siparis_id) > 5;


----------SUBQUERY----------

-- Hic bagis yapmamis musteriler

SELECT *
FROM musteri
WHERE musteri_id NOT IN (
    SELECT DISTINCT musteri_id FROM bagis
);