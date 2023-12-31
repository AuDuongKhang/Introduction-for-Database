USE [QLBanHang]
GO
INSERT [dbo].[KHACH_HANG] ([makh], [hoten], [gioitinh], [dthoai], [diachi]) VALUES (12, N'khang     ', N'nam       ', 123, N'8dvt      ')
INSERT [dbo].[KHACH_HANG] ([makh], [hoten], [gioitinh], [dthoai], [diachi]) VALUES (13, N'muoi      ', N'nam       ', 456, N'1106llq   ')
INSERT [dbo].[KHACH_HANG] ([makh], [hoten], [gioitinh], [dthoai], [diachi]) VALUES (14, N'mck       ', N'nu        ', 789, N'11064llq  ')
INSERT [dbo].[KHACH_HANG] ([makh], [hoten], [gioitinh], [dthoai], [diachi]) VALUES (15, N'bevis     ', N'nu        ', 101, N'613ql22   ')
INSERT [dbo].[KHACH_HANG] ([makh], [hoten], [gioitinh], [dthoai], [diachi]) VALUES (16, N'khangnho  ', N'nam       ', 112, N'8advt     ')
GO
INSERT [dbo].[HOA_DON] ([mahd], [ngaylap], [makh]) VALUES (1, 5, 12)
INSERT [dbo].[HOA_DON] ([mahd], [ngaylap], [makh]) VALUES (2, 6, 13)
INSERT [dbo].[HOA_DON] ([mahd], [ngaylap], [makh]) VALUES (3, 28, 14)
INSERT [dbo].[HOA_DON] ([mahd], [ngaylap], [makh]) VALUES (4, 20, 15)
INSERT [dbo].[HOA_DON] ([mahd], [ngaylap], [makh]) VALUES (5, 18, 16)
GO
INSERT [dbo].[SAN_PHAM] ([masp], [tensp], [ngaysx], [dongia]) VALUES (1, N'daugoi    ', 20, 100)
INSERT [dbo].[SAN_PHAM] ([masp], [tensp], [ngaysx], [dongia]) VALUES (2, N'suaruamat ', 23, 100)
INSERT [dbo].[SAN_PHAM] ([masp], [tensp], [ngaysx], [dongia]) VALUES (3, N'botgiat   ', 19, 200)
INSERT [dbo].[SAN_PHAM] ([masp], [tensp], [ngaysx], [dongia]) VALUES (4, N'suatuoi   ', 17, 90)
INSERT [dbo].[SAN_PHAM] ([masp], [tensp], [ngaysx], [dongia]) VALUES (5, N'banchai   ', 8, 50)
GO
INSERT [dbo].[CT_HOA_DON] ([mahd], [masp], [soluong], [dongia]) VALUES (1, 1, 1, 100)
INSERT [dbo].[CT_HOA_DON] ([mahd], [masp], [soluong], [dongia]) VALUES (2, 2, 3, 300)
INSERT [dbo].[CT_HOA_DON] ([mahd], [masp], [soluong], [dongia]) VALUES (3, 3, 2, 400)
INSERT [dbo].[CT_HOA_DON] ([mahd], [masp], [soluong], [dongia]) VALUES (4, 4, 1, 90)
INSERT [dbo].[CT_HOA_DON] ([mahd], [masp], [soluong], [dongia]) VALUES (5, 5, 2, 100)
GO
