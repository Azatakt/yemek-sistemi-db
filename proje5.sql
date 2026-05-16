USE [yemek_sistemi]
GO

/****** Object:  Table [dbo].[siparis_detay]    Script Date: 16.05.2026 23:48:09 ******/
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


