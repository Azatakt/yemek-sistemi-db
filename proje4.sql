USE [yemek_sistemi]
GO

/****** Object:  Table [dbo].[askida_kullanim]    Script Date: 16.05.2026 23:45:44 ******/
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


