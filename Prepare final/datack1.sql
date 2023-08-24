USE [master]
GO
DROP DATABASE [QLThuVienCKY1]
GO
/****** Object:  Database [QLThuVienCKY1]    Script Date: 14/8/2023 9:28:37 AM ******/
CREATE DATABASE [QLThuVienCKY1]
 
GO
USE [QLThuVienCKY1]
GO
/****** Object:  Table [dbo].[CT_PhieuMuon]    Script Date: 14/8/2023 9:28:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CT_PhieuMuon](
	[mapm] [varchar](10) NOT NULL,
	[isbn] [varchar](12) NOT NULL,
	[masach] [varchar](5) NOT NULL,
	[songayquydinh] [int] NULL,
 CONSTRAINT [PK_CT_PhieuMuon] PRIMARY KEY CLUSTERED 
(
	[mapm] ASC,
	[isbn] ASC,
	[masach] ASC
)--WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CT_PhieuTra]    Script Date: 14/8/2023 9:28:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CT_PhieuTra](
	[mapt] [varchar](10) NOT NULL,
	[isbn] [varchar](12) NOT NULL,
	[masach] [varchar](5) NOT NULL,
	[mucgiaphat] [float] NULL,
	[tienphat] [float] NULL,
 CONSTRAINT [PK_CT_PhieuTra] PRIMARY KEY CLUSTERED 
(
	[mapt] ASC,
	[isbn] ASC,
	[masach] ASC
)--WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CuonSach]    Script Date: 14/8/2023 9:28:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CuonSach](
	[isbn] [varchar](12) NOT NULL,
	[masach] [varchar](5) NOT NULL,
	[tinhtrang] [nvarchar](50) NULL,
 CONSTRAINT [PK_CuonSach] PRIMARY KEY CLUSTERED 
(
	[isbn] ASC,
	[masach] ASC
)--WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DauSach]    Script Date: 14/8/2023 9:28:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DauSach](
	[isbn] [varchar](12) NOT NULL,
	[tensach] [nvarchar](100) NULL,
	[tacgia] [nvarchar](50) NULL,
	[namxb] [int] NULL,
	[nhaxb] [nvarchar](20) NULL,
	[soluong] [int] NULL,
	[Dongiaphat] [float] NULL,
	[theloai] [nvarchar](70) NULL,
 CONSTRAINT [PK_DauSach] PRIMARY KEY CLUSTERED 
(
	[isbn] ASC
)--WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DocGia]    Script Date: 14/8/2023 9:28:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DocGia](
	[madg] [varchar](10) NOT NULL,
	[hoten] [nvarchar](70) NULL,
	[socmnd] [varchar](10) NULL,
	[ngsinh] [date] NULL,
	[gioitinh] [nvarchar](3) NULL,
	[email] [varchar](40) NULL,
	[matkhau] [varchar](10) NULL,
	[diachi] [nvarchar](70) NULL,
	[TongPhat] [int] NULL,
 CONSTRAINT [PK_DocGia] PRIMARY KEY CLUSTERED 
(
	[madg] ASC
)--WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhanVien_TV]    Script Date: 14/8/2023 9:28:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien_TV](
	[MaNV] [varchar](5) NOT NULL,
	[HoTenNV] [nvarchar](50) NOT NULL,
	[NamSinh] [int] NOT NULL,
	[NgayVaoLam] [datetime] NOT NULL,
	[NgayNghiViec] [datetime] NULL,
	[LuongHienTai] [int] NOT NULL,
 CONSTRAINT [PK_NhanVien_TV] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)--WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhieuMuon]    Script Date: 14/8/2023 9:28:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuMuon](
	[mapm] [varchar](10) NOT NULL,
	[madg] [varchar](10) NULL,
	[ngaymuon] [date] NULL,
	[SoCuonTra] [int] NULL,
	[SoCuonMuon] [int] NULL,
	[NVienLapPM] [varchar](5) NULL,
	[SoLanTra] [int] NULL,
 CONSTRAINT [PK_PhieuMuon] PRIMARY KEY CLUSTERED 
(
	[mapm] ASC
)--WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhieuTra]    Script Date: 14/8/2023 9:28:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuTra](
	[mapt] [varchar](10) NOT NULL,
	[mapm] [varchar](10) NULL,
	[ngaytra] [date] NULL,
	[NVienLapPT] [varchar](5) NULL,
 CONSTRAINT [PK_PhieuTra] PRIMARY KEY CLUSTERED 
(
	[mapt] ASC
)--WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuaTrinhLuongNV]    Script Date: 14/8/2023 9:28:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuaTrinhLuongNV](
	[MaNV] [varchar](5) NOT NULL,
	[NgayHuongLuong] [datetime] NOT NULL,
	[HeSoLuong] [decimal](3, 2) NULL,
	[MucLuongCoBan] [money] NULL,
	[PhuCap] [money] NULL,
 CONSTRAINT [PK_QuaTrinhLuongNV] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC,
	[NgayHuongLuong] ASC
)--WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[CT_PhieuMuon] ([mapm], [isbn], [masach], [songayquydinh]) VALUES (N'PM001', N'116525441', N'S001', 8)
INSERT [dbo].[CT_PhieuMuon] ([mapm], [isbn], [masach], [songayquydinh]) VALUES (N'PM001', N'245676441', N'S002', 8)
INSERT [dbo].[CT_PhieuMuon] ([mapm], [isbn], [masach], [songayquydinh]) VALUES (N'PM001', N'369874112', N'S001', 2)
INSERT [dbo].[CT_PhieuMuon] ([mapm], [isbn], [masach], [songayquydinh]) VALUES (N'PM002', N'116525441', N'S002', 8)
INSERT [dbo].[CT_PhieuMuon] ([mapm], [isbn], [masach], [songayquydinh]) VALUES (N'PM002', N'245676441', N'S001', 8)
INSERT [dbo].[CT_PhieuMuon] ([mapm], [isbn], [masach], [songayquydinh]) VALUES (N'PM002', N'245676441', N'S002', 4)
INSERT [dbo].[CT_PhieuMuon] ([mapm], [isbn], [masach], [songayquydinh]) VALUES (N'PM003', N'245676441', N'S002', 4)
GO
INSERT [dbo].[CT_PhieuTra] ([mapt], [isbn], [masach], [mucgiaphat], [tienphat]) VALUES (N'PT001', N'116525441', N'S001', NULL, 0)
INSERT [dbo].[CT_PhieuTra] ([mapt], [isbn], [masach], [mucgiaphat], [tienphat]) VALUES (N'PT001', N'245676441', N'S002', NULL, 0)
INSERT [dbo].[CT_PhieuTra] ([mapt], [isbn], [masach], [mucgiaphat], [tienphat]) VALUES (N'PT002', N'116525441', N'S002', NULL, 0)
INSERT [dbo].[CT_PhieuTra] ([mapt], [isbn], [masach], [mucgiaphat], [tienphat]) VALUES (N'PT002', N'245676441', N'S001', NULL, 0)
INSERT [dbo].[CT_PhieuTra] ([mapt], [isbn], [masach], [mucgiaphat], [tienphat]) VALUES (N'PT002', N'245676441', N'S002', 0, 0)
GO
INSERT [dbo].[CuonSach] ([isbn], [masach], [tinhtrang]) VALUES (N'116525441', N'S001', N'Có thể mượn')
INSERT [dbo].[CuonSach] ([isbn], [masach], [tinhtrang]) VALUES (N'116525441', N'S002', N'Có thể mượn')
INSERT [dbo].[CuonSach] ([isbn], [masach], [tinhtrang]) VALUES (N'245676441', N'S001', N'Có thể mượn')
INSERT [dbo].[CuonSach] ([isbn], [masach], [tinhtrang]) VALUES (N'245676441', N'S002', N'Có thể mượn')
INSERT [dbo].[CuonSach] ([isbn], [masach], [tinhtrang]) VALUES (N'369874112', N'S001', N'Có thể mượn')
INSERT [dbo].[CuonSach] ([isbn], [masach], [tinhtrang]) VALUES (N'587422656', N'S001', N'Có thể mượn')
GO
INSERT [dbo].[DauSach] ([isbn], [tensach], [tacgia], [namxb], [nhaxb], [soluong], [Dongiaphat], [theloai]) VALUES (N'116525441', N'Toán cao cấp A1', N'Trần Phuơng', 2001, N'Giáo dục', 2, 6092.45, N'khoa học cơ bản')
INSERT [dbo].[DauSach] ([isbn], [tensach], [tacgia], [namxb], [nhaxb], [soluong], [Dongiaphat], [theloai]) VALUES (N'245676441', N'Toeic 600', N'Lê Ngọc Quý', 2010, N'Giáo dục', 2, 5500, N'ngoại ngữ')
INSERT [dbo].[DauSach] ([isbn], [tensach], [tacgia], [namxb], [nhaxb], [soluong], [Dongiaphat], [theloai]) VALUES (N'369874112', N'Lập trình C', N'Trần Bá Khang', 2014, N'Giáo dục', 1, 6500, N'khoa học ứng dụng')
INSERT [dbo].[DauSach] ([isbn], [tensach], [tacgia], [namxb], [nhaxb], [soluong], [Dongiaphat], [theloai]) VALUES (N'587422656', N'Lịch sử thế giới hiện đại', N'Phan Hoài Vu', 2001, N'Giáo dục', 1, 2500, N'xã hội')
GO
INSERT [dbo].[DocGia] ([madg], [hoten], [socmnd], [ngsinh], [gioitinh], [email], [matkhau], [diachi], [TongPhat]) VALUES (N'DG01', N'Lê Ngọc Bình', N'2157836254', CAST(N'1980-01-11' AS Date), N'Nữ ', N'binh@yahoo.com.vn', NULL, N'125 Lê Lợi, Q1, TP.HCM', NULL)
INSERT [dbo].[DocGia] ([madg], [hoten], [socmnd], [ngsinh], [gioitinh], [email], [matkhau], [diachi], [TongPhat]) VALUES (N'DG02', N'Trần Thái An', N'8362541255', CAST(N'1987-05-22' AS Date), N'Nữ ', N'tako@gmail.com', NULL, N'227 Nguyễn Huệ, Q3, TP.HCM', NULL)
INSERT [dbo].[DocGia] ([madg], [hoten], [socmnd], [ngsinh], [gioitinh], [email], [matkhau], [diachi], [TongPhat]) VALUES (N'DG03', N'Nguyễn Ngọc', N'6252541542', CAST(N'1988-08-30' AS Date), N'Nam', N'ngocngoc@yahoo.com', NULL, N'16 Lý Chính Thắng, Q3, TP.HCM', NULL)
INSERT [dbo].[DocGia] ([madg], [hoten], [socmnd], [ngsinh], [gioitinh], [email], [matkhau], [diachi], [TongPhat]) VALUES (N'DG04', N'Trần Thanh', N'8795246254', CAST(N'1989-10-16' AS Date), N'Nam', N'tthanh@gmail.com', NULL, N'12 Cao Lỗ, Q8, TP.HCM', NULL)
INSERT [dbo].[DocGia] ([madg], [hoten], [socmnd], [ngsinh], [gioitinh], [email], [matkhau], [diachi], [TongPhat]) VALUES (N'DG05', N'Hoàng Khanh', N'2524625541', CAST(N'1982-11-19' AS Date), N'Nam', N'khanh@hotmail.com', NULL, N'67 Kha Vạn Cân, Q9, TP.HCM', NULL)
GO
INSERT [dbo].[NhanVien_TV] ([MaNV], [HoTenNV], [NamSinh], [NgayVaoLam], [NgayNghiViec], [LuongHienTai]) VALUES (N'001', N'Trần Văn Phương', 1990, CAST(N'2020-02-03T00:00:00.000' AS DateTime), NULL, 2500000)
INSERT [dbo].[NhanVien_TV] ([MaNV], [HoTenNV], [NamSinh], [NgayVaoLam], [NgayNghiViec], [LuongHienTai]) VALUES (N'002', N'Nguyễn Trúc Linh', 1995, CAST(N'2021-05-08T00:00:00.000' AS DateTime), NULL, 2500000)
INSERT [dbo].[NhanVien_TV] ([MaNV], [HoTenNV], [NamSinh], [NgayVaoLam], [NgayNghiViec], [LuongHienTai]) VALUES (N'003', N'Trần Thế Anh', 1989, CAST(N'2019-04-07T00:00:00.000' AS DateTime), NULL, 2800000)
GO
INSERT [dbo].[PhieuMuon] ([mapm], [madg], [ngaymuon], [SoCuonTra], [SoCuonMuon], [NVienLapPM], [SoLanTra]) VALUES (N'PM001', N'DG01', CAST(N'2014-01-12' AS Date), 1, 3, NULL, NULL)
INSERT [dbo].[PhieuMuon] ([mapm], [madg], [ngaymuon], [SoCuonTra], [SoCuonMuon], [NVienLapPM], [SoLanTra]) VALUES (N'PM002', N'DG02', CAST(N'2014-02-26' AS Date), 1, 2, NULL, NULL)
INSERT [dbo].[PhieuMuon] ([mapm], [madg], [ngaymuon], [SoCuonTra], [SoCuonMuon], [NVienLapPM], [SoLanTra]) VALUES (N'PM003', N'DG04', CAST(N'2014-09-25' AS Date), NULL, 2, NULL, NULL)
INSERT [dbo].[PhieuMuon] ([mapm], [madg], [ngaymuon], [SoCuonTra], [SoCuonMuon], [NVienLapPM], [SoLanTra]) VALUES (N'PM005', N'DG01', CAST(N'2022-01-13' AS Date), NULL, 1, NULL, NULL)
INSERT [dbo].[PhieuMuon] ([mapm], [madg], [ngaymuon], [SoCuonTra], [SoCuonMuon], [NVienLapPM], [SoLanTra]) VALUES (N'PM006', N'DG01', CAST(N'2014-11-14' AS Date), 2, 1, NULL, NULL)
INSERT [dbo].[PhieuMuon] ([mapm], [madg], [ngaymuon], [SoCuonTra], [SoCuonMuon], [NVienLapPM], [SoLanTra]) VALUES (N'PM007', N'DG01', CAST(N'2023-03-01' AS Date), 1, 0, NULL, NULL)
GO
INSERT [dbo].[PhieuTra] ([mapt], [mapm], [ngaytra], [NVienLapPT]) VALUES (N'PT001     ', N'PM001     ', CAST(N'2014-01-18' AS Date), NULL)
INSERT [dbo].[PhieuTra] ([mapt], [mapm], [ngaytra], [NVienLapPT]) VALUES (N'PT002     ', N'PM002     ', CAST(N'2014-03-04' AS Date), NULL)
INSERT [dbo].[PhieuTra] ([mapt], [mapm], [ngaytra], [NVienLapPT]) VALUES (N'PT003     ', N'PM007     ', CAST(N'2023-07-31' AS Date), NULL)
GO
INSERT [dbo].[QuaTrinhLuongNV] ([MaNV], [NgayHuongLuong], [HeSoLuong], [MucLuongCoBan], [PhuCap]) VALUES (N'001', CAST(N'2020-02-03T00:00:00.000' AS DateTime), CAST(2.00 AS Decimal(3, 2)), 1000000.0000, 500000.0000)
INSERT [dbo].[QuaTrinhLuongNV] ([MaNV], [NgayHuongLuong], [HeSoLuong], [MucLuongCoBan], [PhuCap]) VALUES (N'002', CAST(N'2021-05-08T00:00:00.000' AS DateTime), CAST(2.00 AS Decimal(3, 2)), 1000000.0000, 500000.0000)
INSERT [dbo].[QuaTrinhLuongNV] ([MaNV], [NgayHuongLuong], [HeSoLuong], [MucLuongCoBan], [PhuCap]) VALUES (N'003', CAST(N'2019-04-07T00:00:00.000' AS DateTime), CAST(2.30 AS Decimal(3, 2)), 1000000.0000, 500000.0000)
GO
ALTER TABLE [dbo].[CT_PhieuMuon]  WITH CHECK ADD  CONSTRAINT [FK_CT_PhieuMuon_CuonSach] FOREIGN KEY([isbn], [masach])
REFERENCES [dbo].[CuonSach] ([isbn], [masach])
GO
ALTER TABLE [dbo].[CT_PhieuMuon] CHECK CONSTRAINT [FK_CT_PhieuMuon_CuonSach]
GO
ALTER TABLE [dbo].[CT_PhieuMuon]  WITH CHECK ADD  CONSTRAINT [FK_CT_PhieuMuon_PhieuMuon] FOREIGN KEY([mapm])
REFERENCES [dbo].[PhieuMuon] ([mapm])
GO
ALTER TABLE [dbo].[CT_PhieuMuon] CHECK CONSTRAINT [FK_CT_PhieuMuon_PhieuMuon]
GO
ALTER TABLE [dbo].[CT_PhieuTra]  WITH CHECK ADD  CONSTRAINT [FK_CT_PhieuTra_CuonSach] FOREIGN KEY([isbn], [masach])
REFERENCES [dbo].[CuonSach] ([isbn], [masach])
GO
ALTER TABLE [dbo].[CT_PhieuTra] CHECK CONSTRAINT [FK_CT_PhieuTra_CuonSach]
GO
ALTER TABLE [dbo].[CT_PhieuTra]  WITH CHECK ADD  CONSTRAINT [FK_CT_PhieuTra_PhieuTra] FOREIGN KEY([mapt])
REFERENCES [dbo].[PhieuTra] ([mapt])
GO
ALTER TABLE [dbo].[CT_PhieuTra] CHECK CONSTRAINT [FK_CT_PhieuTra_PhieuTra]
GO
ALTER TABLE [dbo].[CuonSach]  WITH CHECK ADD  CONSTRAINT [FK_CuonSach_DauSach] FOREIGN KEY([isbn])
REFERENCES [dbo].[DauSach] ([isbn])
GO
ALTER TABLE [dbo].[CuonSach] CHECK CONSTRAINT [FK_CuonSach_DauSach]
GO
ALTER TABLE [dbo].[PhieuMuon]  WITH CHECK ADD  CONSTRAINT [FK_PhieuMuon_DocGia] FOREIGN KEY([madg])
REFERENCES [dbo].[DocGia] ([madg])
GO
ALTER TABLE [dbo].[PhieuMuon] CHECK CONSTRAINT [FK_PhieuMuon_DocGia]
GO
ALTER TABLE [dbo].[PhieuMuon]  WITH CHECK ADD  CONSTRAINT [FK_PhieuMuon_NhanVien_TV] FOREIGN KEY([NVienLapPM])
REFERENCES [dbo].[NhanVien_TV] ([MaNV])
GO
ALTER TABLE [dbo].[PhieuMuon] CHECK CONSTRAINT [FK_PhieuMuon_NhanVien_TV]
GO
ALTER TABLE [dbo].[PhieuTra]  WITH CHECK ADD  CONSTRAINT [FK_PhieuTra_NhanVien_TV] FOREIGN KEY([NVienLapPT])
REFERENCES [dbo].[NhanVien_TV] ([MaNV])
GO
ALTER TABLE [dbo].[PhieuTra] CHECK CONSTRAINT [FK_PhieuTra_NhanVien_TV]
GO
ALTER TABLE [dbo].[PhieuTra]  WITH CHECK ADD  CONSTRAINT [FK_PhieuTra_PhieuMuon] FOREIGN KEY([mapm])
REFERENCES [dbo].[PhieuMuon] ([mapm])
GO
ALTER TABLE [dbo].[PhieuTra] CHECK CONSTRAINT [FK_PhieuTra_PhieuMuon]
GO
ALTER TABLE [dbo].[QuaTrinhLuongNV]  WITH CHECK ADD  CONSTRAINT [FK_QuaTrinhLuongNV_NhanVien_TV] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien_TV] ([MaNV])
GO
ALTER TABLE [dbo].[QuaTrinhLuongNV] CHECK CONSTRAINT [FK_QuaTrinhLuongNV_NhanVien_TV]
GO
USE [master]
GO
ALTER DATABASE [QLThuVienCKY1] SET  READ_WRITE 
GO