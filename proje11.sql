
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


INSERT INTO siparis_detay
(siparis_id, yemek_id, adet, birim_fiyat)
VALUES
(15, 1, 2, 250),
(15, 5, 1, 80),

(16, 3, 1, 180),
(16, 12, 2, 160),

(17, 2, 1, 320),

(18, 10, 2, 240),
(18, 11, 1, 310),

(19, 6, 1, 140),

(20, 17, 2, 340),
(20, 20, 1, 260),

(21, 4, 2, 120),

(22, 7, 1, 160),

(23, 18, 1, 320),
(23, 15, 1, 150),

(24, 8, 1, 350);

SELECT * FROM siparis_detay;



