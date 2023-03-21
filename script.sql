USE [QuanLyDeAn]
GO
/****** Object:  Table [dbo].[DEAN]    Script Date: 21/03/2023 3:45:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DEAN](
	[TENDA] [nvarchar](50) NOT NULL,
	[MADA] [varchar](2) NOT NULL,
	[DDIEMDA] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MADA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NHANVIEN]    Script Date: 21/03/2023 3:45:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NHANVIEN](
	[MANV] [varchar](9) NOT NULL,
	[HONV] [nvarchar](15) NOT NULL,
	[TENLOT] [nvarchar](30) NOT NULL,
	[TENNV] [nvarchar](30) NOT NULL,
	[NGSINH] [smalldatetime] NULL,
	[DIACHI] [nvarchar](150) NOT NULL,
	[PHAI] [nvarchar](3) NOT NULL,
	[LUONG] [numeric](18, 0) NULL,
	[PHONG] [varchar](2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MANV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PHANCONG]    Script Date: 21/03/2023 3:45:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PHANCONG](
	[MANV] [varchar](9) NOT NULL,
	[MADA] [varchar](2) NOT NULL,
	[THOIGIAN] [numeric](18, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[MANV] ASC,
	[MADA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PHONGBAN]    Script Date: 21/03/2023 3:45:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PHONGBAN](
	[TENPHG] [nvarchar](20) NOT NULL,
	[MAPHG] [varchar](2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MAPHG] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[THANNHAN]    Script Date: 21/03/2023 3:45:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[THANNHAN](
	[MANV] [varchar](9) NOT NULL,
	[TENTN] [varchar](20) NOT NULL,
	[PHAI] [varchar](3) NOT NULL,
	[NGSINH] [smalldatetime] NULL,
	[QUANHE] [varchar](15) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MANV] ASC,
	[TENTN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[NHANVIEN]  WITH NOCHECK ADD  CONSTRAINT [FK_NHANVIEN_PHONGBAN] FOREIGN KEY([PHONG])
REFERENCES [dbo].[PHONGBAN] ([MAPHG])
GO
ALTER TABLE [dbo].[NHANVIEN] NOCHECK CONSTRAINT [FK_NHANVIEN_PHONGBAN]
GO
ALTER TABLE [dbo].[PHANCONG]  WITH NOCHECK ADD  CONSTRAINT [FK_PHANCONG_DEAN] FOREIGN KEY([MADA])
REFERENCES [dbo].[DEAN] ([MADA])
GO
ALTER TABLE [dbo].[PHANCONG] CHECK CONSTRAINT [FK_PHANCONG_DEAN]
GO
ALTER TABLE [dbo].[PHANCONG]  WITH NOCHECK ADD  CONSTRAINT [FK_PHANCONG_NHANVIEN] FOREIGN KEY([MANV])
REFERENCES [dbo].[NHANVIEN] ([MANV])
GO
ALTER TABLE [dbo].[PHANCONG] CHECK CONSTRAINT [FK_PHANCONG_NHANVIEN]
GO
ALTER TABLE [dbo].[THANNHAN]  WITH NOCHECK ADD  CONSTRAINT [FK_THANNHAN_NHANVIEN] FOREIGN KEY([MANV])
REFERENCES [dbo].[NHANVIEN] ([MANV])
GO
ALTER TABLE [dbo].[THANNHAN] CHECK CONSTRAINT [FK_THANNHAN_NHANVIEN]
GO
