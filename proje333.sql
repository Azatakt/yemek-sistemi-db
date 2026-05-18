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


