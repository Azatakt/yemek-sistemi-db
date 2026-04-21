USE yemek_sistemi;

CREATE TABLE siparis (
    siparis_id INT IDENTITY(1,1) PRIMARY KEY,
    musteri_id INT NOT NULL,
    siparis_tarihi DATETIME DEFAULT GETDATE(),
    toplam_tutar DECIMAL(10,2) NOT NULL CHECK (toplam_tutar > 0),
    durum NVARCHAR(50) NOT NULL,
    sehir NVARCHAR(50) NOT NULL,
    ilce NVARCHAR(50) NOT NULL,
    acik_adres NVARCHAR(MAX) NOT NULL,
    kayit_tarihi DATETIME DEFAULT GETDATE(),
    is_active BIT DEFAULT 1,

    FOREIGN KEY (musteri_id) REFERENCES musteri(musteri_id)
);






USE yemek_sistemi;

CREATE TABLE yemek (
    yemek_id INT IDENTITY(1,1) PRIMARY KEY,
    ad NVARCHAR(100) NOT NULL,
    fiyat DECIMAL(10,2) NOT NULL CHECK (fiyat > 0),
    restoran_id INT NOT NULL,
    kayit_tarihi DATETIME DEFAULT GETDATE(),
    is_active BIT DEFAULT 1,

    FOREIGN KEY (restoran_id) REFERENCES restoran(restoran_id)
);






CREATE DATABASE yemek_sistemi;
USE yemek_sistemi;
CREATE TABLE musteri (
    musteri_id INT IDENTITY(1,1) PRIMARY KEY,
    ad NVARCHAR(50) NOT NULL,
    soyad NVARCHAR(50) NOT NULL,
    email NVARCHAR(100) NOT NULL UNIQUE,
    telefon NVARCHAR(15) NOT NULL UNIQUE,
    sehir NVARCHAR(50) NOT NULL,
    ilce NVARCHAR(50) NOT NULL,
    acik_adres NVARCHAR(MAX) NOT NULL,
    kayit_tarihi DATETIME DEFAULT GETDATE(),
    is_active BIT DEFAULT 1
);


CREATE TABLE restoran (
    restoran_id INT IDENTITY(1,1) PRIMARY KEY,
    ad NVARCHAR(100) NOT NULL,
    telefon NVARCHAR(15) NOT NULL UNIQUE,
    sehir NVARCHAR(50) NOT NULL,
    ilce NVARCHAR(50) NOT NULL,
    acik_adres NVARCHAR(MAX) NOT NULL,
    puan DECIMAL(2,1) CHECK (puan BETWEEN 1 AND 5),
    kayit_tarihi DATETIME DEFAULT GETDATE(),
    is_active BIT DEFAULT 1
);