
----//// TEST VERÝLERÝ
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




INSERT INTO restoran
(ad, telefon, sehir, ilce, acik_adres, puan)
VALUES
('Lezzet Duraðý', '04320000000', 'Van', 'Ýpekyolu', 'Merkez', 4.5),
('Burger Steak', '04321111111', 'Van', 'Ýpekyolu', 'Merkez', 4.9),
('Burger House', '04322222222', 'Van', 'Tuþba', 'Sahil Yolu', 4.2),
('Pizza Star', '04323333333', 'Van', 'Edremit', 'Ýskele', 4.8),
('Kebapçý Baba', '04324444444', 'Van', 'Ýpekyolu', 'Maraþ Caddesi', 4.1),
('Tatlýcý Mehmet', '04325555555', 'Van', 'Tuþba', 'Çarþý Merkezi', 4.7);




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


SELECT * FROM yemek;
SELECT * FROM musteri;
SELECT * FROM restoran;