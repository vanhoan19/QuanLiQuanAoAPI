USE [QuanLyQuanAo]
GO
/****** Object:  Table [tChiTietHDB]    Script Date: 19/05/2024 11:55:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [tChiTietHDB](
	[MaHDB] [varchar](36) NOT NULL,
	[MaMH] [nvarchar](100) NOT NULL,
	[SLBan] [int] NOT NULL,
	[GiamGia] [int] NULL,
 CONSTRAINT [PK_tChiTietHDB] PRIMARY KEY CLUSTERED 
(
	[MaHDB] ASC,
	[MaMH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [tChiTietPN]    Script Date: 19/05/2024 11:55:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [tChiTietPN](
	[MaPN] [int] NOT NULL,
	[MaMH] [nvarchar](100) NOT NULL,
	[SLNhap] [int] NOT NULL,
	[GiaNhap] [money] NULL,
 CONSTRAINT [PK_ttChiTietPN] PRIMARY KEY CLUSTERED 
(
	[MaPN] ASC,
	[MaMH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [tHoaDonBan]    Script Date: 19/05/2024 11:55:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [tHoaDonBan](
	[MaHDB] [varchar](36) NOT NULL,
	[MaNV] [int] NULL,
	[MaKH] [int] NULL,
	[TongTien] [money] NULL,
	[GiamGia] [money] NULL,
	[ThanhToan] [money] NULL,
	[PhuongThucTT] [bit] NULL,
	[createdAt] [smalldatetime] NULL,
	[GhiChu] [nvarchar](500) NULL,
 CONSTRAINT [PK_tHoaDonBan] PRIMARY KEY CLUSTERED 
(
	[MaHDB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [tKhachHang]    Script Date: 19/05/2024 11:55:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [tKhachHang](
	[MaKH] [int] IDENTITY(1,1) NOT NULL,
	[TenKH] [nvarchar](100) NULL,
	[SDT] [nvarchar](100) NULL,
	[DiaChi] [nvarchar](100) NULL,
	[GhiChu] [nvarchar](1000) NULL,
	[MaNV] [int] NULL,
	[createdAt] [datetime] NOT NULL,
	[TongBan] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [tMatHang]    Script Date: 19/05/2024 11:55:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [tMatHang](
	[MaMH] [nvarchar](100) NOT NULL,
	[TenMH] [nvarchar](200) NOT NULL,
	[MaTheLoai] [int] NULL,
	[Mau] [nvarchar](50) NULL,
	[Size] [nvarchar](50) NOT NULL,
	[MaNCC] [int] NULL,
	[GiaBan] [money] NOT NULL,
	[GiaNhap] [money] NULL,
	[SLTon] [int] NULL,
	[Anh] [nvarchar](200) NULL,
	[GhiChu] [nvarchar](1000) NULL,
	[DonVi] [nvarchar](50) NULL,
	[IsDangBan] [bit] NULL,
 CONSTRAINT [PK_tMatHang] PRIMARY KEY CLUSTERED 
(
	[MaMH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [tNhaCungCap]    Script Date: 19/05/2024 11:55:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [tNhaCungCap](
	[MaNCC] [int] IDENTITY(1,1) NOT NULL,
	[TenNCC] [nvarchar](100) NOT NULL,
	[SDT] [nvarchar](50) NOT NULL,
	[DiaChi] [nvarchar](150) NULL,
	[GhiChu] [nvarchar](1000) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [tNhanVien]    Script Date: 19/05/2024 11:55:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [tNhanVien](
	[MaNV] [int] IDENTITY(1,1) NOT NULL,
	[TenNV] [nvarchar](100) NOT NULL,
	[GioiTinh] [bit] NOT NULL,
	[NgaySinh] [date] NULL,
	[NgayBD] [date] NOT NULL,
	[SDT] [nvarchar](50) NULL,
	[UserName] [nvarchar](50) NULL,
	[passWord] [nvarchar](100) NULL,
	[Role] [bit] NULL,
	[IsDeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [tPhieuNhap]    Script Date: 19/05/2024 11:55:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [tPhieuNhap](
	[MaPN] [int] IDENTITY(1,1) NOT NULL,
	[MaNV] [int] NULL,
	[TongTien] [money] NOT NULL,
	[GiamGia] [money] NULL,
	[ThanhToan] [money] NOT NULL,
	[PhuongThucTT] [bit] NULL,
	[GhiChu] [nvarchar](500) NULL,
	[CreatedAt] [datetime] NOT NULL,
	[TrangThai] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaPN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [tTheLoai]    Script Date: 19/05/2024 11:55:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [tTheLoai](
	[MaTheLoai] [int] IDENTITY(1,1) NOT NULL,
	[TenTheLoai] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaTheLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [tChiTietHDB] ([MaHDB], [MaMH], [SLBan], [GiamGia]) VALUES (N'06fa87f1-5469-4c1a-9899-d17be2834244', N'QS230001.be.S', 1, 10)
INSERT [tChiTietHDB] ([MaHDB], [MaMH], [SLBan], [GiamGia]) VALUES (N'4a93cd37-fb67-475f-9fc6-0b0cfb418f27', N'AD00333.đen.M', 1, NULL)
INSERT [tChiTietHDB] ([MaHDB], [MaMH], [SLBan], [GiamGia]) VALUES (N'4a93cd37-fb67-475f-9fc6-0b0cfb418f27', N'AD00333.trắng.M', 1, NULL)
INSERT [tChiTietHDB] ([MaHDB], [MaMH], [SLBan], [GiamGia]) VALUES (N'89629229-e02a-409b-bad9-34254c7c9da9', N'APL230001.ghi.L', 2, 10)
INSERT [tChiTietHDB] ([MaHDB], [MaMH], [SLBan], [GiamGia]) VALUES (N'8b01d3af-062e-4480-b67d-e127dd8589c3', N'AD00333.đen.L', 2, NULL)
INSERT [tChiTietHDB] ([MaHDB], [MaMH], [SLBan], [GiamGia]) VALUES (N'8b01d3af-062e-4480-b67d-e127dd8589c3', N'AD00333.trắng.L', 1, NULL)
INSERT [tChiTietHDB] ([MaHDB], [MaMH], [SLBan], [GiamGia]) VALUES (N'9cfb3fb6-c580-47e1-9c8a-439542ffd1ed', N'AHD0511231.đen.L', 1, 10)
INSERT [tChiTietHDB] ([MaHDB], [MaMH], [SLBan], [GiamGia]) VALUES (N'9cfb3fb6-c580-47e1-9c8a-439542ffd1ed', N'AHD0511231.đen.M', 1, 10)
INSERT [tChiTietHDB] ([MaHDB], [MaMH], [SLBan], [GiamGia]) VALUES (N'b07cbc73-5077-4f75-a99e-cb35498238f9', N'APL230001.ghi.M', 1, 0)
INSERT [tChiTietHDB] ([MaHDB], [MaMH], [SLBan], [GiamGia]) VALUES (N'b07cbc73-5077-4f75-a99e-cb35498238f9', N'QJM5005.xanh đậm.32', 1, 20)
INSERT [tChiTietHDB] ([MaHDB], [MaMH], [SLBan], [GiamGia]) VALUES (N'b2ff2830-2263-41e7-9237-48d5da971067', N'AD00333.đen.M', 1, NULL)
INSERT [tChiTietHDB] ([MaHDB], [MaMH], [SLBan], [GiamGia]) VALUES (N'b2ff2830-2263-41e7-9237-48d5da971067', N'AD00333.đen.S', 2, NULL)
INSERT [tChiTietHDB] ([MaHDB], [MaMH], [SLBan], [GiamGia]) VALUES (N'bb50e918-e6e0-4da1-9398-7435a0ad6c98', N'AD00333.đen.L', 1, NULL)
INSERT [tChiTietHDB] ([MaHDB], [MaMH], [SLBan], [GiamGia]) VALUES (N'bb50e918-e6e0-4da1-9398-7435a0ad6c98', N'AD00333.đen.M', 1, NULL)
INSERT [tChiTietHDB] ([MaHDB], [MaMH], [SLBan], [GiamGia]) VALUES (N'c01da1cd-35a9-4fad-9aab-54433d8639f0', N'AD00333.đen.XL', 2, NULL)
INSERT [tChiTietHDB] ([MaHDB], [MaMH], [SLBan], [GiamGia]) VALUES (N'c01da1cd-35a9-4fad-9aab-54433d8639f0', N'AD00333.trắng.L', 1, NULL)
INSERT [tChiTietHDB] ([MaHDB], [MaMH], [SLBan], [GiamGia]) VALUES (N'fa1e47da-00fd-4f60-9eef-3649562e64d0', N'QS230001.be.M', 1, 10)
GO
INSERT [tHoaDonBan] ([MaHDB], [MaNV], [MaKH], [TongTien], [GiamGia], [ThanhToan], [PhuongThucTT], [createdAt], [GhiChu]) VALUES (N'06fa87f1-5469-4c1a-9899-d17be2834244', 1, 18, 1000000.0000, 100000.0000, 900000.0000, 1, CAST(N'2023-11-14T11:48:00' AS SmallDateTime), N'')
INSERT [tHoaDonBan] ([MaHDB], [MaNV], [MaKH], [TongTien], [GiamGia], [ThanhToan], [PhuongThucTT], [createdAt], [GhiChu]) VALUES (N'4a93cd37-fb67-475f-9fc6-0b0cfb418f27', 1, 15, 800000.0000, 100000.0000, 700000.0000, 0, CAST(N'2024-05-15T10:18:00' AS SmallDateTime), NULL)
INSERT [tHoaDonBan] ([MaHDB], [MaNV], [MaKH], [TongTien], [GiamGia], [ThanhToan], [PhuongThucTT], [createdAt], [GhiChu]) VALUES (N'89629229-e02a-409b-bad9-34254c7c9da9', 1, 19, 1300000.0000, 170000.0000, 1130000.0000, 0, CAST(N'2023-11-07T11:16:00' AS SmallDateTime), N'tm')
INSERT [tHoaDonBan] ([MaHDB], [MaNV], [MaKH], [TongTien], [GiamGia], [ThanhToan], [PhuongThucTT], [createdAt], [GhiChu]) VALUES (N'8b01d3af-062e-4480-b67d-e127dd8589c3', 1, 15, 1200000.0000, 100000.0000, 1100000.0000, 0, CAST(N'2024-05-15T10:10:00' AS SmallDateTime), NULL)
INSERT [tHoaDonBan] ([MaHDB], [MaNV], [MaKH], [TongTien], [GiamGia], [ThanhToan], [PhuongThucTT], [createdAt], [GhiChu]) VALUES (N'9cfb3fb6-c580-47e1-9c8a-439542ffd1ed', 2, 15, 400000.0000, 80000.0000, 320000.0000, 1, CAST(N'2023-10-15T10:47:00' AS SmallDateTime), N'ck')
INSERT [tHoaDonBan] ([MaHDB], [MaNV], [MaKH], [TongTien], [GiamGia], [ThanhToan], [PhuongThucTT], [createdAt], [GhiChu]) VALUES (N'b07cbc73-5077-4f75-a99e-cb35498238f9', 1, 14, 450000.0000, 0.0000, 450000.0000, 0, CAST(N'2022-11-15T11:47:00' AS SmallDateTime), N'')
INSERT [tHoaDonBan] ([MaHDB], [MaNV], [MaKH], [TongTien], [GiamGia], [ThanhToan], [PhuongThucTT], [createdAt], [GhiChu]) VALUES (N'b2ff2830-2263-41e7-9237-48d5da971067', 2, 19, 1200000.0000, 200000.0000, 1000000.0000, 0, CAST(N'2024-05-15T10:27:00' AS SmallDateTime), NULL)
INSERT [tHoaDonBan] ([MaHDB], [MaNV], [MaKH], [TongTien], [GiamGia], [ThanhToan], [PhuongThucTT], [createdAt], [GhiChu]) VALUES (N'bb50e918-e6e0-4da1-9398-7435a0ad6c98', 2, 16, 800000.0000, 80000.0000, 720000.0000, 0, CAST(N'2024-05-15T10:29:00' AS SmallDateTime), NULL)
INSERT [tHoaDonBan] ([MaHDB], [MaNV], [MaKH], [TongTien], [GiamGia], [ThanhToan], [PhuongThucTT], [createdAt], [GhiChu]) VALUES (N'c01da1cd-35a9-4fad-9aab-54433d8639f0', 3, 15, 1400000.0000, 120000.0000, 1280000.0000, 0, CAST(N'2024-05-15T10:38:00' AS SmallDateTime), NULL)
INSERT [tHoaDonBan] ([MaHDB], [MaNV], [MaKH], [TongTien], [GiamGia], [ThanhToan], [PhuongThucTT], [createdAt], [GhiChu]) VALUES (N'fa1e47da-00fd-4f60-9eef-3649562e64d0', 1, 16, 6500000.0000, 650000.0000, 5850000.0000, 1, CAST(N'2023-11-14T10:48:00' AS SmallDateTime), N'ck 15/11')
GO
SET IDENTITY_INSERT [tKhachHang] ON 

INSERT [tKhachHang] ([MaKH], [TenKH], [SDT], [DiaChi], [GhiChu], [MaNV], [createdAt], [TongBan]) VALUES (14, N'Khách lẻ', N'', N'', N'', 1, CAST(N'2023-11-03T22:03:17.607' AS DateTime), 0.0000)
INSERT [tKhachHang] ([MaKH], [TenKH], [SDT], [DiaChi], [GhiChu], [MaNV], [createdAt], [TongBan]) VALUES (15, N'Nguyễn Thanh Dat', N'045678945', N'Thường Tín - Hà Nội', N'Nghịch tử Thường Tín', 1, CAST(N'2023-11-03T23:09:40.150' AS DateTime), 0.0000)
INSERT [tKhachHang] ([MaKH], [TenKH], [SDT], [DiaChi], [GhiChu], [MaNV], [createdAt], [TongBan]) VALUES (16, N'Phú Quốc', N'02233445566', N'Phú Quốc', N'', 1, CAST(N'2023-11-04T13:54:22.087' AS DateTime), 0.0000)
INSERT [tKhachHang] ([MaKH], [TenKH], [SDT], [DiaChi], [GhiChu], [MaNV], [createdAt], [TongBan]) VALUES (17, N'Nguyễn Việt Hoàng', N'0369382135', N'Thanh Thủy - Phú Thọ', N'nổ to nhất Phú Thọ', 1, CAST(N'2023-11-08T19:57:31.180' AS DateTime), 0.0000)
INSERT [tKhachHang] ([MaKH], [TenKH], [SDT], [DiaChi], [GhiChu], [MaNV], [createdAt], [TongBan]) VALUES (18, N'Lionel Messi', N'0223355566', N'Đông Triều - Quảng Ninh', N'', 1, CAST(N'2023-11-08T20:05:39.037' AS DateTime), 0.0000)
INSERT [tKhachHang] ([MaKH], [TenKH], [SDT], [DiaChi], [GhiChu], [MaNV], [createdAt], [TongBan]) VALUES (19, N'Nguyễn Đức Thắng', N'0936733182', N'Quỳnh Phụ - Thái Bình', N'Thắng cá chép', 1, CAST(N'2023-11-08T20:07:44.280' AS DateTime), 0.0000)
INSERT [tKhachHang] ([MaKH], [TenKH], [SDT], [DiaChi], [GhiChu], [MaNV], [createdAt], [TongBan]) VALUES (20, N'Hoàng Hà', N'01919191919', N'Hà Tĩnh', N'', 1, CAST(N'2023-11-08T20:11:59.237' AS DateTime), 0.0000)
INSERT [tKhachHang] ([MaKH], [TenKH], [SDT], [DiaChi], [GhiChu], [MaNV], [createdAt], [TongBan]) VALUES (21, N'Nguyễn Hà Trường', N'0364574223', N'Đông Hưng - Thái Bình', N'Trường Gấu Korrea', 1, CAST(N'2023-11-08T20:17:49.263' AS DateTime), 0.0000)
INSERT [tKhachHang] ([MaKH], [TenKH], [SDT], [DiaChi], [GhiChu], [MaNV], [createdAt], [TongBan]) VALUES (22, N'Nguyễn Tiến Đạt', N'05566447788', N'Thanh Hóa', N'', 1, CAST(N'2023-11-08T20:18:24.170' AS DateTime), 0.0000)
INSERT [tKhachHang] ([MaKH], [TenKH], [SDT], [DiaChi], [GhiChu], [MaNV], [createdAt], [TongBan]) VALUES (23, N'Nguyễn Công Minh', N'09999999999', N'Thái Bình', N'Minh Sex IT5', 1, CAST(N'2023-11-08T20:18:59.907' AS DateTime), 0.0000)
INSERT [tKhachHang] ([MaKH], [TenKH], [SDT], [DiaChi], [GhiChu], [MaNV], [createdAt], [TongBan]) VALUES (24, N'Đỗ Xuân Tráng', N'01555446678', N'', N'', 1, CAST(N'2023-11-14T17:08:00.847' AS DateTime), 0.0000)
INSERT [tKhachHang] ([MaKH], [TenKH], [SDT], [DiaChi], [GhiChu], [MaNV], [createdAt], [TongBan]) VALUES (25, N'Hà Thế Trường', N'05566112233', N'', N'', 2, CAST(N'2023-11-14T17:10:17.810' AS DateTime), 0.0000)
INSERT [tKhachHang] ([MaKH], [TenKH], [SDT], [DiaChi], [GhiChu], [MaNV], [createdAt], [TongBan]) VALUES (26, N'Hiền', N'0337629441', N'', N'', 2, CAST(N'2023-11-15T16:13:36.920' AS DateTime), 0.0000)
INSERT [tKhachHang] ([MaKH], [TenKH], [SDT], [DiaChi], [GhiChu], [MaNV], [createdAt], [TongBan]) VALUES (27, N'Nguyễn Duy Khánh', N'05556667778', N'Đông Triều - Quảng Ninh', NULL, 2, CAST(N'2024-05-10T22:58:53.210' AS DateTime), NULL)
INSERT [tKhachHang] ([MaKH], [TenKH], [SDT], [DiaChi], [GhiChu], [MaNV], [createdAt], [TongBan]) VALUES (28, N'Khach hang 28', N'01234567899', N'', NULL, 1, CAST(N'2024-05-12T00:38:06.260' AS DateTime), NULL)
INSERT [tKhachHang] ([MaKH], [TenKH], [SDT], [DiaChi], [GhiChu], [MaNV], [createdAt], [TongBan]) VALUES (29, N'1', N'b', N'c', NULL, 1, CAST(N'2024-05-12T00:39:22.453' AS DateTime), NULL)
INSERT [tKhachHang] ([MaKH], [TenKH], [SDT], [DiaChi], [GhiChu], [MaNV], [createdAt], [TongBan]) VALUES (30, N'Mesut18', N'0123456897', N'Hanoi', NULL, 1, CAST(N'2024-05-12T01:16:53.293' AS DateTime), NULL)
INSERT [tKhachHang] ([MaKH], [TenKH], [SDT], [DiaChi], [GhiChu], [MaNV], [createdAt], [TongBan]) VALUES (31, N'new customer', N'0555667899', N'Dong Trieu', NULL, 1, CAST(N'2024-05-14T22:30:13.667' AS DateTime), NULL)
SET IDENTITY_INSERT [tKhachHang] OFF
GO
INSERT [tMatHang] ([MaMH], [TenMH], [MaTheLoai], [Mau], [Size], [MaNCC], [GiaBan], [GiaNhap], [SLTon], [Anh], [GhiChu], [DonVi], [IsDangBan]) VALUES (N'AD00333.đen.L', N'Aó gió màu đen - L', 1, N'đen', N'L', 1, 400000.0000, 200000.0000, 2, N'https://aothudong.com/upload/product/atd-279/ao-gio-bomber-nam-cao-cap-2020.jpg', NULL, N'cái', 1)
INSERT [tMatHang] ([MaMH], [TenMH], [MaTheLoai], [Mau], [Size], [MaNCC], [GiaBan], [GiaNhap], [SLTon], [Anh], [GhiChu], [DonVi], [IsDangBan]) VALUES (N'AD00333.đen.M', N'Aó gió màu đen - M', 1, N'đen', N'M', 1, 400000.0000, 200000.0000, 2, N'https://aothudong.com/upload/product/atd-279/ao-gio-bomber-nam-cao-cap-2020.jpg', NULL, N'cái', 1)
INSERT [tMatHang] ([MaMH], [TenMH], [MaTheLoai], [Mau], [Size], [MaNCC], [GiaBan], [GiaNhap], [SLTon], [Anh], [GhiChu], [DonVi], [IsDangBan]) VALUES (N'AD00333.đen.S', N'Aó gió màu đen - S', 1, N'đen', N'S', 1, 400000.0000, 200000.0000, 3, N'https://aothudong.com/upload/product/atd-279/ao-gio-bomber-nam-cao-cap-2020.jpg', NULL, N'cái', 1)
INSERT [tMatHang] ([MaMH], [TenMH], [MaTheLoai], [Mau], [Size], [MaNCC], [GiaBan], [GiaNhap], [SLTon], [Anh], [GhiChu], [DonVi], [IsDangBan]) VALUES (N'AD00333.đen.XL', N'Aó gió màu đen - XL', 1, N'đen', N'XL', 1, 500000.0000, 300000.0000, 3, N'https://th.bing.com/th/id/R.d53c5e6e3bff984a5c3f48e069b89e17?rik=tbodK6gHaa8yIQ&pid=ImgRaw&r=0', NULL, N'cái', 1)
INSERT [tMatHang] ([MaMH], [TenMH], [MaTheLoai], [Mau], [Size], [MaNCC], [GiaBan], [GiaNhap], [SLTon], [Anh], [GhiChu], [DonVi], [IsDangBan]) VALUES (N'AD00333.trắng.L', N'Aó gió màu trắng - L', 1, N'trắng', N'L', 1, 400000.0000, 200000.0000, 3, N'https://th.bing.com/th/id/R.d53c5e6e3bff984a5c3f48e069b89e17?rik=tbodK6gHaa8yIQ&pid=ImgRaw&r=0', NULL, N'cái', 1)
INSERT [tMatHang] ([MaMH], [TenMH], [MaTheLoai], [Mau], [Size], [MaNCC], [GiaBan], [GiaNhap], [SLTon], [Anh], [GhiChu], [DonVi], [IsDangBan]) VALUES (N'AD00333.trắng.M', N'Aó gió màu trắng - M', 1, N'trắng', N'M', 1, 400000.0000, 200000.0000, 4, N'https://th.bing.com/th/id/R.d53c5e6e3bff984a5c3f48e069b89e17?rik=tbodK6gHaa8yIQ&pid=ImgRaw&r=0', NULL, N'cái', 1)
INSERT [tMatHang] ([MaMH], [TenMH], [MaTheLoai], [Mau], [Size], [MaNCC], [GiaBan], [GiaNhap], [SLTon], [Anh], [GhiChu], [DonVi], [IsDangBan]) VALUES (N'AD00333.trắng.S', N'Aó gió màu trắng - S', 1, N'trắng', N'S', 1, 400000.0000, 200000.0000, 5, N'https://th.bing.com/th/id/R.d53c5e6e3bff984a5c3f48e069b89e17?rik=tbodK6gHaa8yIQ&pid=ImgRaw&r=0', NULL, N'cái', 1)
INSERT [tMatHang] ([MaMH], [TenMH], [MaTheLoai], [Mau], [Size], [MaNCC], [GiaBan], [GiaNhap], [SLTon], [Anh], [GhiChu], [DonVi], [IsDangBan]) VALUES (N'AD00333.trắng.XL', N'Aó gió màu trắng - XL', 1, N'trắng', N'XL', 1, 400000.0000, 200000.0000, 5, N'https://th.bing.com/th/id/OIP.zOmOFW3xvBkmRy1igo1GPgHaHa?rs=1&pid=ImgDetMain', NULL, N'cái', 1)
INSERT [tMatHang] ([MaMH], [TenMH], [MaTheLoai], [Mau], [Size], [MaNCC], [GiaBan], [GiaNhap], [SLTon], [Anh], [GhiChu], [DonVi], [IsDangBan]) VALUES (N'AHD0511231.đen.L', N'Áo hoodie unisex tay dài phối mũ Checkerboard Big Lux Mega màu đen - L', 1, N'đen', N'L', 1, 3250000.0000, 2000000.0000, 14, N'https://th.bing.com/th/id/OIP.zOmOFW3xvBkmRy1igo1GPgHaHa?rs=1&pid=ImgDetMain', N'abcd', N'chiếc', 1)
INSERT [tMatHang] ([MaMH], [TenMH], [MaTheLoai], [Mau], [Size], [MaNCC], [GiaBan], [GiaNhap], [SLTon], [Anh], [GhiChu], [DonVi], [IsDangBan]) VALUES (N'AHD0511231.đen.M', N'Áo hoodie unisex tay dài phối mũ Checkerboard Big Lux Mega màu đen - M', 1, N'đen', N'M', 1, 3250000.0000, 2000000.0000, 15, N'https://th.bing.com/th/id/OIP.zOmOFW3xvBkmRy1igo1GPgHaHa?rs=1&pid=ImgDetMain', NULL, N'chiếc', 1)
INSERT [tMatHang] ([MaMH], [TenMH], [MaTheLoai], [Mau], [Size], [MaNCC], [GiaBan], [GiaNhap], [SLTon], [Anh], [GhiChu], [DonVi], [IsDangBan]) VALUES (N'AHD0511231.đen.S', N'Áo hoodie unisex tay dài phối mũ Checkerboard Big Lux Mega màu đen - S', 1, N'đen', N'S', 1, 3250000.0000, 2000000.0000, 12, N'https://th.bing.com/th/id/OIP.zOmOFW3xvBkmRy1igo1GPgHaHa?rs=1&pid=ImgDetMain', NULL, N'chiếc', 1)
INSERT [tMatHang] ([MaMH], [TenMH], [MaTheLoai], [Mau], [Size], [MaNCC], [GiaBan], [GiaNhap], [SLTon], [Anh], [GhiChu], [DonVi], [IsDangBan]) VALUES (N'AHD0511231.đen.XL', N'Áo hoodie unisex tay dài phối mũ Checkerboard Big Lux Mega màu đen - XL', 1, N'đen', N'XL', 1, 3250000.0000, 2000000.0000, 9, N'https://th.bing.com/th/id/OIP.zOmOFW3xvBkmRy1igo1GPgHaHa?rs=1&pid=ImgDetMain', NULL, N'chiếc', 1)
INSERT [tMatHang] ([MaMH], [TenMH], [MaTheLoai], [Mau], [Size], [MaNCC], [GiaBan], [GiaNhap], [SLTon], [Anh], [GhiChu], [DonVi], [IsDangBan]) VALUES (N'AHD0511231.đen.XS', N'Áo hoodie unisex tay dài phối mũ Checkerboard Big Lux Mega màu đen - XS', 1, N'đen', N'XS', 1, 3250000.0000, 2000000.0000, 5, N'https://dongphucdieplong.com.vn/wp-content/uploads/2019/11/ao-hoodie-trang-1.jpg', NULL, N'chiếc', 1)
INSERT [tMatHang] ([MaMH], [TenMH], [MaTheLoai], [Mau], [Size], [MaNCC], [GiaBan], [GiaNhap], [SLTon], [Anh], [GhiChu], [DonVi], [IsDangBan]) VALUES (N'AHD0511231.trắng.L', N'Áo hoodie unisex tay dài phối mũ Checkerboard Big Lux Mega màu trắng - L', 1, N'trắng', N'L', 1, 3250000.0000, 2000000.0000, 20, N'https://dongphucdieplong.com.vn/wp-content/uploads/2019/11/ao-hoodie-trang-1.jpg', NULL, N'chiếc', 1)
INSERT [tMatHang] ([MaMH], [TenMH], [MaTheLoai], [Mau], [Size], [MaNCC], [GiaBan], [GiaNhap], [SLTon], [Anh], [GhiChu], [DonVi], [IsDangBan]) VALUES (N'AHD0511231.trắng.M', N'Áo hoodie unisex tay dài phối mũ Checkerboard Big Lux Mega màu trắng - M', 1, N'trắng', N'M', 1, 3250000.0000, 2000000.0000, 10, N'https://dongphucdieplong.com.vn/wp-content/uploads/2019/11/ao-hoodie-trang-1.jpg', NULL, N'chiếc', 1)
INSERT [tMatHang] ([MaMH], [TenMH], [MaTheLoai], [Mau], [Size], [MaNCC], [GiaBan], [GiaNhap], [SLTon], [Anh], [GhiChu], [DonVi], [IsDangBan]) VALUES (N'AHD0511231.trắng.S', N'Áo hoodie unisex tay dài phối mũ Checkerboard Big Lux Mega màu trắng - S', 1, N'trắng', N'S', 1, 3250000.0000, 2000000.0000, 10, N'https://dongphucdieplong.com.vn/wp-content/uploads/2019/11/ao-hoodie-trang-1.jpg', NULL, N'chiếc', 1)
INSERT [tMatHang] ([MaMH], [TenMH], [MaTheLoai], [Mau], [Size], [MaNCC], [GiaBan], [GiaNhap], [SLTon], [Anh], [GhiChu], [DonVi], [IsDangBan]) VALUES (N'AHD0511231.trắng.XL', N'Áo hoodie unisex tay dài phối mũ Checkerboard Big Lux Mega màu trắng - XL', 1, N'trắng', N'XL', 1, 3250000.0000, 2000000.0000, 5, N'https://dongphucdieplong.com.vn/wp-content/uploads/2019/11/ao-hoodie-trang-1.jpg', NULL, N'chiếc', 1)
INSERT [tMatHang] ([MaMH], [TenMH], [MaTheLoai], [Mau], [Size], [MaNCC], [GiaBan], [GiaNhap], [SLTon], [Anh], [GhiChu], [DonVi], [IsDangBan]) VALUES (N'AHD0511231.trắng.XS', N'Áo hoodie unisex tay dài phối mũ Checkerboard Big Lux Mega màu trắng - XS', 1, N'trắng', N'XS', 1, 3250000.0000, 2000000.0000, 5, N'https://dongphucdieplong.com.vn/wp-content/uploads/2019/11/ao-hoodie-trang-1.jpg', NULL, N'chiếc', 1)
INSERT [tMatHang] ([MaMH], [TenMH], [MaTheLoai], [Mau], [Size], [MaNCC], [GiaBan], [GiaNhap], [SLTon], [Anh], [GhiChu], [DonVi], [IsDangBan]) VALUES (N'AHD061120232.Đen.L', N'Áo hoodie unisex tay dài phối mũ Checkerboard Big Logo Overfit màu Đen - L', 1, N'Đen', N'L', 1, 1000000.0000, 500000.0000, 10, N'https://cf.shopee.vn/file/e46ffba116a6a143e35de11d29a093e2', NULL, N'chiếc', 1)
INSERT [tMatHang] ([MaMH], [TenMH], [MaTheLoai], [Mau], [Size], [MaNCC], [GiaBan], [GiaNhap], [SLTon], [Anh], [GhiChu], [DonVi], [IsDangBan]) VALUES (N'AHD061120232.Đen.M', N'Áo hoodie unisex tay dài phối mũ Checkerboard Big Logo Overfit màu Đen - M', 1, N'Đen', N'M', 1, 1000000.0000, 500000.0000, 5, N'https://cf.shopee.vn/file/e46ffba116a6a143e35de11d29a093e2', NULL, N'chiếc', 1)
INSERT [tMatHang] ([MaMH], [TenMH], [MaTheLoai], [Mau], [Size], [MaNCC], [GiaBan], [GiaNhap], [SLTon], [Anh], [GhiChu], [DonVi], [IsDangBan]) VALUES (N'AHD061120232.Đen.S', N'Áo hoodie unisex tay dài phối mũ Checkerboard Big Logo Overfit màu Đen - S', 1, N'Đen', N'S', 1, 1000000.0000, 500000.0000, 10, N'https://cf.shopee.vn/file/e46ffba116a6a143e35de11d29a093e2', NULL, N'chiếc', 1)
INSERT [tMatHang] ([MaMH], [TenMH], [MaTheLoai], [Mau], [Size], [MaNCC], [GiaBan], [GiaNhap], [SLTon], [Anh], [GhiChu], [DonVi], [IsDangBan]) VALUES (N'AHD061120232.Đen.XL', N'Áo hoodie unisex tay dài phối mũ Checkerboard Big Logo Overfit màu Đen - XL', 1, N'Đen', N'XL', 1, 1000000.0000, 500000.0000, 10, N'https://cf.shopee.vn/file/e46ffba116a6a143e35de11d29a093e2', NULL, N'chiếc', 1)
INSERT [tMatHang] ([MaMH], [TenMH], [MaTheLoai], [Mau], [Size], [MaNCC], [GiaBan], [GiaNhap], [SLTon], [Anh], [GhiChu], [DonVi], [IsDangBan]) VALUES (N'AHD061120232.Đen.XS', N'Áo hoodie unisex tay dài phối mũ Checkerboard Big Logo Overfit màu Đen - XS', 1, N'Đen', N'XS', 1, 1000000.0000, 500000.0000, 5, N'https://i.pinimg.com/originals/2b/6c/c0/2b6cc029a5f827401b83e20b47af6e30.jpg', NULL, N'chiếc', 1)
INSERT [tMatHang] ([MaMH], [TenMH], [MaTheLoai], [Mau], [Size], [MaNCC], [GiaBan], [GiaNhap], [SLTon], [Anh], [GhiChu], [DonVi], [IsDangBan]) VALUES (N'AHD061120232.Ghi.L', N'Áo hoodie unisex tay dài phối mũ Checkerboard Big Logo Overfit màu Ghi - L', 1, N'Ghi', N'L', 1, 1000000.0000, 500000.0000, 5, N'https://i.pinimg.com/originals/2b/6c/c0/2b6cc029a5f827401b83e20b47af6e30.jpg', NULL, N'chiếc', 1)
INSERT [tMatHang] ([MaMH], [TenMH], [MaTheLoai], [Mau], [Size], [MaNCC], [GiaBan], [GiaNhap], [SLTon], [Anh], [GhiChu], [DonVi], [IsDangBan]) VALUES (N'AHD061120232.Ghi.M', N'Áo hoodie unisex tay dài phối mũ Checkerboard Big Logo Overfit màu Ghi - M', 1, N'Ghi', N'M', 1, 1000000.0000, 500000.0000, 5, N'https://i.pinimg.com/originals/2b/6c/c0/2b6cc029a5f827401b83e20b47af6e30.jpg', NULL, N'chiếc', 1)
INSERT [tMatHang] ([MaMH], [TenMH], [MaTheLoai], [Mau], [Size], [MaNCC], [GiaBan], [GiaNhap], [SLTon], [Anh], [GhiChu], [DonVi], [IsDangBan]) VALUES (N'AHD061120232.Ghi.S', N'Áo hoodie unisex tay dài phối mũ Checkerboard Big Logo Overfit màu Ghi - S', 1, N'Ghi', N'S', 1, 1000000.0000, 500000.0000, 5, N'https://i.pinimg.com/originals/2b/6c/c0/2b6cc029a5f827401b83e20b47af6e30.jpg', NULL, N'chiếc', 1)
INSERT [tMatHang] ([MaMH], [TenMH], [MaTheLoai], [Mau], [Size], [MaNCC], [GiaBan], [GiaNhap], [SLTon], [Anh], [GhiChu], [DonVi], [IsDangBan]) VALUES (N'AHD061120232.Ghi.XL', N'Áo hoodie unisex tay dài phối mũ Checkerboard Big Logo Overfit màu Ghi - XL', 1, N'Ghi', N'XL', 1, 1000000.0000, 500000.0000, 5, N'https://i.pinimg.com/originals/2b/6c/c0/2b6cc029a5f827401b83e20b47af6e30.jpg', NULL, N'chiếc', 1)
INSERT [tMatHang] ([MaMH], [TenMH], [MaTheLoai], [Mau], [Size], [MaNCC], [GiaBan], [GiaNhap], [SLTon], [Anh], [GhiChu], [DonVi], [IsDangBan]) VALUES (N'AHD061120232.Ghi.XS', N'Áo hoodie unisex tay dài phối mũ Checkerboard Big Logo Overfit màu Ghi - XS', 1, N'Ghi', N'XS', 1, 1000000.0000, 500000.0000, 5, N'https://i.pinimg.com/originals/2b/6c/c0/2b6cc029a5f827401b83e20b47af6e30.jpg', NULL, N'chiếc', 1)
INSERT [tMatHang] ([MaMH], [TenMH], [MaTheLoai], [Mau], [Size], [MaNCC], [GiaBan], [GiaNhap], [SLTon], [Anh], [GhiChu], [DonVi], [IsDangBan]) VALUES (N'AHD061120232.Trắng.L', N'Áo hoodie unisex tay dài phối mũ Checkerboard Big Logo Overfit màu Trắng - L', 1, N'Trắng', N'L', 1, 1000000.0000, 500000.0000, 5, N'https://dongphucdieplong.com.vn/wp-content/uploads/2019/11/ao-hoodie-trang-1.jpg', NULL, N'chiếc', 1)
INSERT [tMatHang] ([MaMH], [TenMH], [MaTheLoai], [Mau], [Size], [MaNCC], [GiaBan], [GiaNhap], [SLTon], [Anh], [GhiChu], [DonVi], [IsDangBan]) VALUES (N'AHD061120232.Trắng.M', N'Áo hoodie unisex tay dài phối mũ Checkerboard Big Logo Overfit màu Trắng - M', 1, N'Trắng', N'M', 1, 1000000.0000, 500000.0000, 5, N'https://dongphucdieplong.com.vn/wp-content/uploads/2019/11/ao-hoodie-trang-1.jpg', NULL, N'chiếc', 1)
INSERT [tMatHang] ([MaMH], [TenMH], [MaTheLoai], [Mau], [Size], [MaNCC], [GiaBan], [GiaNhap], [SLTon], [Anh], [GhiChu], [DonVi], [IsDangBan]) VALUES (N'AHD061120232.Trắng.S', N'Áo hoodie unisex tay dài phối mũ Checkerboard Big Logo Overfit màu Trắng - S', 1, N'Trắng', N'S', 1, 1000000.0000, 500000.0000, 5, N'https://dongphucdieplong.com.vn/wp-content/uploads/2019/11/ao-hoodie-trang-1.jpg', NULL, N'chiếc', 1)
INSERT [tMatHang] ([MaMH], [TenMH], [MaTheLoai], [Mau], [Size], [MaNCC], [GiaBan], [GiaNhap], [SLTon], [Anh], [GhiChu], [DonVi], [IsDangBan]) VALUES (N'AHD061120232.Trắng.XL', N'Áo hoodie unisex tay dài phối mũ Checkerboard Big Logo Overfit màu Trắng - XL', 1, N'Trắng', N'XL', 1, 1000000.0000, 500000.0000, 5, N'https://dongphucdieplong.com.vn/wp-content/uploads/2019/11/ao-hoodie-trang-1.jpg', NULL, N'chiếc', 1)
INSERT [tMatHang] ([MaMH], [TenMH], [MaTheLoai], [Mau], [Size], [MaNCC], [GiaBan], [GiaNhap], [SLTon], [Anh], [GhiChu], [DonVi], [IsDangBan]) VALUES (N'AHD061120232.Trắng.XS', N'Áo hoodie unisex tay dài phối mũ Checkerboard Big Logo Overfit màu Trắng - XS', 1, N'Trắng', N'XS', 1, 1000000.0000, 500000.0000, 5, N'https://dongphucdieplong.com.vn/wp-content/uploads/2019/11/ao-hoodie-trang-1.jpg', NULL, N'chiếc', 1)
INSERT [tMatHang] ([MaMH], [TenMH], [MaTheLoai], [Mau], [Size], [MaNCC], [GiaBan], [GiaNhap], [SLTon], [Anh], [GhiChu], [DonVi], [IsDangBan]) VALUES (N'AHD0611231.Ghi.L', N'Áo hoodie unisex phối mũ tay dài Clever Neddy Pullover màu Ghi - L', 1, N'Ghi', N'L', 1, 2000000.0000, 1000000.0000, 5, N'https://dongphucdieplong.com.vn/wp-content/uploads/2019/11/ao-hoodie-trang-1.jpg', NULL, N'chiếc', 1)
INSERT [tMatHang] ([MaMH], [TenMH], [MaTheLoai], [Mau], [Size], [MaNCC], [GiaBan], [GiaNhap], [SLTon], [Anh], [GhiChu], [DonVi], [IsDangBan]) VALUES (N'AHD0611231.Ghi.M', N'Áo hoodie unisex phối mũ tay dài Clever Neddy Pullover màu Ghi - M', 1, N'Ghi', N'M', 1, 2000000.0000, 1000000.0000, 10, N'https://dongphucdieplong.com.vn/wp-content/uploads/2019/11/ao-hoodie-trang-1.jpg', NULL, N'chiếc', 1)
INSERT [tMatHang] ([MaMH], [TenMH], [MaTheLoai], [Mau], [Size], [MaNCC], [GiaBan], [GiaNhap], [SLTon], [Anh], [GhiChu], [DonVi], [IsDangBan]) VALUES (N'AHD0611231.Ghi.S', N'Áo hoodie unisex phối mũ tay dài Clever Neddy Pullover màu Ghi - S', 1, N'Ghi', N'S', 1, 2000000.0000, 1000000.0000, 5, N'https://dongphucdieplong.com.vn/wp-content/uploads/2019/11/ao-hoodie-trang-1.jpg', NULL, N'chiếc', 1)
INSERT [tMatHang] ([MaMH], [TenMH], [MaTheLoai], [Mau], [Size], [MaNCC], [GiaBan], [GiaNhap], [SLTon], [Anh], [GhiChu], [DonVi], [IsDangBan]) VALUES (N'AHD0611231.Ghi.XL', N'Áo hoodie unisex phối mũ tay dài Clever Neddy Pullover màu Ghi - XL', 1, N'Ghi', N'XL', 1, 2000000.0000, 1000000.0000, 5, N'https://dongphucdieplong.com.vn/wp-content/uploads/2019/11/ao-hoodie-trang-1.jpg', NULL, N'chiếc', 1)
INSERT [tMatHang] ([MaMH], [TenMH], [MaTheLoai], [Mau], [Size], [MaNCC], [GiaBan], [GiaNhap], [SLTon], [Anh], [GhiChu], [DonVi], [IsDangBan]) VALUES (N'AHD0611231.Ghi.XS', N'Áo hoodie unisex phối mũ tay dài Clever Neddy Pullover màu Ghi - XS', 1, N'Ghi', N'XS', 1, 2000000.0000, 1000000.0000, 5, N'https://dongphucdieplong.com.vn/wp-content/uploads/2019/11/ao-hoodie-trang-1.jpg', NULL, N'chiếc', 1)
INSERT [tMatHang] ([MaMH], [TenMH], [MaTheLoai], [Mau], [Size], [MaNCC], [GiaBan], [GiaNhap], [SLTon], [Anh], [GhiChu], [DonVi], [IsDangBan]) VALUES (N'AHD0611231.Navy.L', N'Áo hoodie unisex phối mũ tay dài Clever Neddy Pullover màu Navy - L', 1, N'Navy', N'L', 1, 2000000.0000, 1000000.0000, 5, N'https://dongphucdieplong.com.vn/wp-content/uploads/2019/11/ao-hoodie-trang-1.jpg', NULL, N'chiếc', 1)
INSERT [tMatHang] ([MaMH], [TenMH], [MaTheLoai], [Mau], [Size], [MaNCC], [GiaBan], [GiaNhap], [SLTon], [Anh], [GhiChu], [DonVi], [IsDangBan]) VALUES (N'AHD0611231.Navy.M', N'Áo hoodie unisex phối mũ tay dài Clever Neddy Pullover màu Navy - M', 1, N'Navy', N'M', 1, 2000000.0000, 1000000.0000, 5, N'https://dongphucdieplong.com.vn/wp-content/uploads/2019/11/ao-hoodie-trang-1.jpg', NULL, N'chiếc', 1)
INSERT [tMatHang] ([MaMH], [TenMH], [MaTheLoai], [Mau], [Size], [MaNCC], [GiaBan], [GiaNhap], [SLTon], [Anh], [GhiChu], [DonVi], [IsDangBan]) VALUES (N'AHD0611231.Navy.S', N'Áo hoodie unisex phối mũ tay dài Clever Neddy Pullover màu Navy - S', 1, N'Navy', N'S', 1, 2000000.0000, 1000000.0000, 5, N'https://dongphucdieplong.com.vn/wp-content/uploads/2019/11/ao-hoodie-trang-1.jpg', NULL, N'chiếc', 1)
INSERT [tMatHang] ([MaMH], [TenMH], [MaTheLoai], [Mau], [Size], [MaNCC], [GiaBan], [GiaNhap], [SLTon], [Anh], [GhiChu], [DonVi], [IsDangBan]) VALUES (N'AHD0611231.Navy.XL', N'Áo hoodie unisex phối mũ tay dài Clever Neddy Pullover màu Navy - XL', 1, N'Navy', N'XL', 1, 2000000.0000, 1000000.0000, 5, N'https://dongphucdieplong.com.vn/wp-content/uploads/2019/11/ao-hoodie-trang-1.jpg', NULL, N'chiếc', 1)
INSERT [tMatHang] ([MaMH], [TenMH], [MaTheLoai], [Mau], [Size], [MaNCC], [GiaBan], [GiaNhap], [SLTon], [Anh], [GhiChu], [DonVi], [IsDangBan]) VALUES (N'AHD0611231.Navy.XS', N'Áo hoodie unisex phối mũ tay dài Clever Neddy Pullover màu Navy - XS', 1, N'Navy', N'XS', 1, 2000000.0000, 1000000.0000, 5, N'https://dongphucdieplong.com.vn/wp-content/uploads/2019/11/ao-hoodie-trang-1.jpg', NULL, N'chiếc', 1)
INSERT [tMatHang] ([MaMH], [TenMH], [MaTheLoai], [Mau], [Size], [MaNCC], [GiaBan], [GiaNhap], [SLTon], [Anh], [GhiChu], [DonVi], [IsDangBan]) VALUES (N'AHD0611231.Tím.L', N'Áo hoodie unisex phối mũ tay dài Clever Neddy Pullover màu Tím - L', 1, N'Tím', N'L', 1, 2000000.0000, 1000000.0000, 5, N'https://dongphucdieplong.com.vn/wp-content/uploads/2019/11/ao-hoodie-trang-1.jpg', NULL, N'chiếc', 1)
INSERT [tMatHang] ([MaMH], [TenMH], [MaTheLoai], [Mau], [Size], [MaNCC], [GiaBan], [GiaNhap], [SLTon], [Anh], [GhiChu], [DonVi], [IsDangBan]) VALUES (N'AHD0611231.Tím.M', N'Áo hoodie unisex phối mũ tay dài Clever Neddy Pullover màu Tím - M', 1, N'Tím', N'M', 1, 2000000.0000, 1000000.0000, 5, N'https://dongphucdieplong.com.vn/wp-content/uploads/2019/11/ao-hoodie-trang-1.jpg', NULL, N'chiếc', 1)
INSERT [tMatHang] ([MaMH], [TenMH], [MaTheLoai], [Mau], [Size], [MaNCC], [GiaBan], [GiaNhap], [SLTon], [Anh], [GhiChu], [DonVi], [IsDangBan]) VALUES (N'AHD0611231.Tím.S', N'Áo hoodie unisex phối mũ tay dài Clever Neddy Pullover màu Tím - S', 1, N'Tím', N'S', 1, 2000000.0000, 1000000.0000, 5, N'https://dongphucdieplong.com.vn/wp-content/uploads/2019/11/ao-hoodie-trang-1.jpg', NULL, N'chiếc', 1)
INSERT [tMatHang] ([MaMH], [TenMH], [MaTheLoai], [Mau], [Size], [MaNCC], [GiaBan], [GiaNhap], [SLTon], [Anh], [GhiChu], [DonVi], [IsDangBan]) VALUES (N'AHD0611231.Tím.XL', N'Áo hoodie unisex phối mũ tay dài Clever Neddy Pullover màu Tím - XL', 1, N'Tím', N'XL', 1, 2000000.0000, 1000000.0000, 5, N'https://dongphucdieplong.com.vn/wp-content/uploads/2019/11/ao-hoodie-trang-1.jpg', NULL, N'chiếc', 1)
INSERT [tMatHang] ([MaMH], [TenMH], [MaTheLoai], [Mau], [Size], [MaNCC], [GiaBan], [GiaNhap], [SLTon], [Anh], [GhiChu], [DonVi], [IsDangBan]) VALUES (N'AHD0611231.Tím.XS', N'Áo hoodie unisex phối mũ tay dài Clever Neddy Pullover màu Tím - XS', 1, N'Tím', N'XS', 1, 2000000.0000, 1000000.0000, 5, N'https://dongphucdieplong.com.vn/wp-content/uploads/2019/11/ao-hoodie-trang-1.jpg', NULL, N'chiếc', 1)
INSERT [tMatHang] ([MaMH], [TenMH], [MaTheLoai], [Mau], [Size], [MaNCC], [GiaBan], [GiaNhap], [SLTon], [Anh], [GhiChu], [DonVi], [IsDangBan]) VALUES (N'APL230001.ghi.2XL', N'Áo Polo Vải Dry Pique Ngắn Tay màu ghi - 2XL', 4, N'ghi', N'2XL', 1, 450000.0000, 300000.0000, 5, N'https://dongphucdieplong.com.vn/wp-content/uploads/2019/11/ao-hoodie-trang-1.jpg', NULL, N'chiếc', 1)
INSERT [tMatHang] ([MaMH], [TenMH], [MaTheLoai], [Mau], [Size], [MaNCC], [GiaBan], [GiaNhap], [SLTon], [Anh], [GhiChu], [DonVi], [IsDangBan]) VALUES (N'APL230001.ghi.3XL', N'Áo Polo Vải Dry Pique Ngắn Tay màu ghi - 3XL', 4, N'ghi', N'3XL', 1, 450000.0000, 300000.0000, 5, N'https://dongphucdieplong.com.vn/wp-content/uploads/2019/11/ao-hoodie-trang-1.jpg', NULL, N'chiếc', 1)
INSERT [tMatHang] ([MaMH], [TenMH], [MaTheLoai], [Mau], [Size], [MaNCC], [GiaBan], [GiaNhap], [SLTon], [Anh], [GhiChu], [DonVi], [IsDangBan]) VALUES (N'APL230001.ghi.L', N'Áo Polo Vải Dry Pique Ngắn Tay màu ghi - L', 4, N'ghi', N'L', 1, 450000.0000, 300000.0000, 3, N'https://dongphucdieplong.com.vn/wp-content/uploads/2019/11/ao-hoodie-trang-1.jpg', NULL, N'chiếc', 1)
INSERT [tMatHang] ([MaMH], [TenMH], [MaTheLoai], [Mau], [Size], [MaNCC], [GiaBan], [GiaNhap], [SLTon], [Anh], [GhiChu], [DonVi], [IsDangBan]) VALUES (N'APL230001.ghi.M', N'Áo Polo Vải Dry Pique Ngắn Tay màu ghi - M', 4, N'ghi', N'M', 1, 450000.0000, 300000.0000, 4, N'https://dongphucdieplong.com.vn/wp-content/uploads/2019/11/ao-hoodie-trang-1.jpg', NULL, N'chiếc', 1)
INSERT [tMatHang] ([MaMH], [TenMH], [MaTheLoai], [Mau], [Size], [MaNCC], [GiaBan], [GiaNhap], [SLTon], [Anh], [GhiChu], [DonVi], [IsDangBan]) VALUES (N'APL230001.ghi.S', N'Áo Polo Vải Dry Pique Ngắn Tay màu ghi - S', 4, N'ghi', N'S', 1, 450000.0000, 300000.0000, 5, N'https://dongphucdieplong.com.vn/wp-content/uploads/2019/11/ao-hoodie-trang-1.jpg', NULL, N'chiếc', 1)
INSERT [tMatHang] ([MaMH], [TenMH], [MaTheLoai], [Mau], [Size], [MaNCC], [GiaBan], [GiaNhap], [SLTon], [Anh], [GhiChu], [DonVi], [IsDangBan]) VALUES (N'APL230001.ghi.XL', N'Áo Polo Vải Dry Pique Ngắn Tay màu ghi - XL', 4, N'ghi', N'XL', 1, 450000.0000, 300000.0000, 5, N'https://dongphucdieplong.com.vn/wp-content/uploads/2019/11/ao-hoodie-trang-1.jpg', NULL, N'chiếc', 1)
INSERT [tMatHang] ([MaMH], [TenMH], [MaTheLoai], [Mau], [Size], [MaNCC], [GiaBan], [GiaNhap], [SLTon], [Anh], [GhiChu], [DonVi], [IsDangBan]) VALUES (N'APL230001.ghi.XS', N'Áo Polo Vải Dry Pique Ngắn Tay màu ghi - XS', 4, N'ghi', N'XS', 1, 450000.0000, 300000.0000, 5, N'https://dongphucdieplong.com.vn/wp-content/uploads/2019/11/ao-hoodie-trang-1.jpg', NULL, N'chiếc', 1)
INSERT [tMatHang] ([MaMH], [TenMH], [MaTheLoai], [Mau], [Size], [MaNCC], [GiaBan], [GiaNhap], [SLTon], [Anh], [GhiChu], [DonVi], [IsDangBan]) VALUES (N'APL230001.hồng.2XL', N'Áo Polo Vải Dry Pique Ngắn Tay màu hồng - 2XL', 4, N'hồng', N'2XL', 1, 450000.0000, 300000.0000, 5, N'https://dongphucdieplong.com.vn/wp-content/uploads/2019/11/ao-hoodie-trang-1.jpg', NULL, N'chiếc', 1)
INSERT [tMatHang] ([MaMH], [TenMH], [MaTheLoai], [Mau], [Size], [MaNCC], [GiaBan], [GiaNhap], [SLTon], [Anh], [GhiChu], [DonVi], [IsDangBan]) VALUES (N'APL230001.hồng.3XL', N'Áo Polo Vải Dry Pique Ngắn Tay màu hồng - 3XL', 4, N'hồng', N'3XL', 1, 450000.0000, 300000.0000, 5, N'https://dongphucdieplong.com.vn/wp-content/uploads/2019/11/ao-hoodie-trang-1.jpg', NULL, N'chiếc', 1)
INSERT [tMatHang] ([MaMH], [TenMH], [MaTheLoai], [Mau], [Size], [MaNCC], [GiaBan], [GiaNhap], [SLTon], [Anh], [GhiChu], [DonVi], [IsDangBan]) VALUES (N'APL230001.hồng.L', N'Áo Polo Vải Dry Pique Ngắn Tay màu hồng - L', 4, N'hồng', N'L', 1, 450000.0000, 300000.0000, 5, N'https://dongphucdieplong.com.vn/wp-content/uploads/2019/11/ao-hoodie-trang-1.jpg', NULL, N'chiếc', 1)
INSERT [tMatHang] ([MaMH], [TenMH], [MaTheLoai], [Mau], [Size], [MaNCC], [GiaBan], [GiaNhap], [SLTon], [Anh], [GhiChu], [DonVi], [IsDangBan]) VALUES (N'APL230001.hồng.M', N'Áo Polo Vải Dry Pique Ngắn Tay màu hồng - M', 4, N'hồng', N'M', 1, 450000.0000, 300000.0000, 5, N'https://dongphucdieplong.com.vn/wp-content/uploads/2019/11/ao-hoodie-trang-1.jpg', NULL, N'chiếc', 1)
INSERT [tMatHang] ([MaMH], [TenMH], [MaTheLoai], [Mau], [Size], [MaNCC], [GiaBan], [GiaNhap], [SLTon], [Anh], [GhiChu], [DonVi], [IsDangBan]) VALUES (N'APL230001.hồng.S', N'Áo Polo Vải Dry Pique Ngắn Tay màu hồng - S', 4, N'hồng', N'S', 1, 450000.0000, 300000.0000, 5, N'https://dongphucdieplong.com.vn/wp-content/uploads/2019/11/ao-hoodie-trang-1.jpg', NULL, N'chiếc', 1)
INSERT [tMatHang] ([MaMH], [TenMH], [MaTheLoai], [Mau], [Size], [MaNCC], [GiaBan], [GiaNhap], [SLTon], [Anh], [GhiChu], [DonVi], [IsDangBan]) VALUES (N'APL230001.hồng.XL', N'Áo Polo Vải Dry Pique Ngắn Tay màu hồng - XL', 4, N'hồng', N'XL', 1, 450000.0000, 300000.0000, 5, N'https://dongphucdieplong.com.vn/wp-content/uploads/2019/11/ao-hoodie-trang-1.jpg', NULL, N'chiếc', 1)
INSERT [tMatHang] ([MaMH], [TenMH], [MaTheLoai], [Mau], [Size], [MaNCC], [GiaBan], [GiaNhap], [SLTon], [Anh], [GhiChu], [DonVi], [IsDangBan]) VALUES (N'APL230001.hồng.XS', N'Áo Polo Vải Dry Pique Ngắn Tay màu hồng - XS', 4, N'hồng', N'XS', 1, 450000.0000, 300000.0000, 5, N'https://dongphucdieplong.com.vn/wp-content/uploads/2019/11/ao-hoodie-trang-1.jpg', NULL, N'chiếc', 1)
INSERT [tMatHang] ([MaMH], [TenMH], [MaTheLoai], [Mau], [Size], [MaNCC], [GiaBan], [GiaNhap], [SLTon], [Anh], [GhiChu], [DonVi], [IsDangBan]) VALUES (N'APL230001.navy.2XL', N'Áo Polo Vải Dry Pique Ngắn Tay màu navy - 2XL', 4, N'navy', N'2XL', 1, 450000.0000, 300000.0000, 5, N'https://dongphucdieplong.com.vn/wp-content/uploads/2019/11/ao-hoodie-trang-1.jpg', NULL, N'chiếc', 1)
INSERT [tMatHang] ([MaMH], [TenMH], [MaTheLoai], [Mau], [Size], [MaNCC], [GiaBan], [GiaNhap], [SLTon], [Anh], [GhiChu], [DonVi], [IsDangBan]) VALUES (N'APL230001.navy.3XL', N'Áo Polo Vải Dry Pique Ngắn Tay màu navy - 3XL', 4, N'navy', N'3XL', 1, 450000.0000, 300000.0000, 5, N'https://dongphucdieplong.com.vn/wp-content/uploads/2019/11/ao-hoodie-trang-1.jpg', NULL, N'chiếc', 1)
INSERT [tMatHang] ([MaMH], [TenMH], [MaTheLoai], [Mau], [Size], [MaNCC], [GiaBan], [GiaNhap], [SLTon], [Anh], [GhiChu], [DonVi], [IsDangBan]) VALUES (N'APL230001.navy.L', N'Áo Polo Vải Dry Pique Ngắn Tay màu navy - L', 4, N'navy', N'L', 1, 450000.0000, 300000.0000, 5, N'https://dongphucdieplong.com.vn/wp-content/uploads/2019/11/ao-hoodie-trang-1.jpg', NULL, N'chiếc', 1)
INSERT [tMatHang] ([MaMH], [TenMH], [MaTheLoai], [Mau], [Size], [MaNCC], [GiaBan], [GiaNhap], [SLTon], [Anh], [GhiChu], [DonVi], [IsDangBan]) VALUES (N'APL230001.navy.M', N'Áo Polo Vải Dry Pique Ngắn Tay màu navy - M', 4, N'navy', N'M', 1, 450000.0000, 300000.0000, 5, N'https://dongphucdieplong.com.vn/wp-content/uploads/2019/11/ao-hoodie-trang-1.jpg', NULL, N'chiếc', 1)
INSERT [tMatHang] ([MaMH], [TenMH], [MaTheLoai], [Mau], [Size], [MaNCC], [GiaBan], [GiaNhap], [SLTon], [Anh], [GhiChu], [DonVi], [IsDangBan]) VALUES (N'APL230001.navy.S', N'Áo Polo Vải Dry Pique Ngắn Tay màu navy - S', 4, N'navy', N'S', 1, 450000.0000, 300000.0000, 5, N'https://dongphucdieplong.com.vn/wp-content/uploads/2019/11/ao-hoodie-trang-1.jpg', NULL, N'chiếc', 1)
INSERT [tMatHang] ([MaMH], [TenMH], [MaTheLoai], [Mau], [Size], [MaNCC], [GiaBan], [GiaNhap], [SLTon], [Anh], [GhiChu], [DonVi], [IsDangBan]) VALUES (N'APL230001.navy.XL', N'Áo Polo Vải Dry Pique Ngắn Tay màu navy - XL', 4, N'navy', N'XL', 1, 450000.0000, 300000.0000, 5, N'https://dongphucdieplong.com.vn/wp-content/uploads/2019/11/ao-hoodie-trang-1.jpg', NULL, N'chiếc', 1)
INSERT [tMatHang] ([MaMH], [TenMH], [MaTheLoai], [Mau], [Size], [MaNCC], [GiaBan], [GiaNhap], [SLTon], [Anh], [GhiChu], [DonVi], [IsDangBan]) VALUES (N'APL230001.navy.XS', N'Áo Polo Vải Dry Pique Ngắn Tay màu navy - XS', 4, N'navy', N'XS', 1, 450000.0000, 300000.0000, 5, N'https://dongphucdieplong.com.vn/wp-content/uploads/2019/11/ao-hoodie-trang-1.jpg', NULL, N'chiếc', 1)
INSERT [tMatHang] ([MaMH], [TenMH], [MaTheLoai], [Mau], [Size], [MaNCC], [GiaBan], [GiaNhap], [SLTon], [Anh], [GhiChu], [DonVi], [IsDangBan]) VALUES (N'APL230001.trắng.2XL', N'Áo Polo Vải Dry Pique Ngắn Tay màu trắng - 2XL', 4, N'trắng', N'2XL', 1, 450000.0000, 300000.0000, 5, N'https://dongphucdieplong.com.vn/wp-content/uploads/2019/11/ao-hoodie-trang-1.jpg', NULL, N'chiếc', 1)
INSERT [tMatHang] ([MaMH], [TenMH], [MaTheLoai], [Mau], [Size], [MaNCC], [GiaBan], [GiaNhap], [SLTon], [Anh], [GhiChu], [DonVi], [IsDangBan]) VALUES (N'APL230001.trắng.3XL', N'Áo Polo Vải Dry Pique Ngắn Tay màu trắng - 3XL', 4, N'trắng', N'3XL', 1, 450000.0000, 300000.0000, 5, N'https://dongphucdieplong.com.vn/wp-content/uploads/2019/11/ao-hoodie-trang-1.jpg', NULL, N'chiếc', 1)
INSERT [tMatHang] ([MaMH], [TenMH], [MaTheLoai], [Mau], [Size], [MaNCC], [GiaBan], [GiaNhap], [SLTon], [Anh], [GhiChu], [DonVi], [IsDangBan]) VALUES (N'APL230001.trắng.L', N'Áo Polo Vải Dry Pique Ngắn Tay màu trắng - L', 4, N'trắng', N'L', 1, 450000.0000, 300000.0000, 5, N'https://dongphucdieplong.com.vn/wp-content/uploads/2019/11/ao-hoodie-trang-1.jpg', NULL, N'chiếc', 1)
INSERT [tMatHang] ([MaMH], [TenMH], [MaTheLoai], [Mau], [Size], [MaNCC], [GiaBan], [GiaNhap], [SLTon], [Anh], [GhiChu], [DonVi], [IsDangBan]) VALUES (N'APL230001.trắng.M', N'Áo Polo Vải Dry Pique Ngắn Tay màu trắng - M', 4, N'trắng', N'M', 1, 450000.0000, 300000.0000, 5, N'https://dongphucdieplong.com.vn/wp-content/uploads/2019/11/ao-hoodie-trang-1.jpg', NULL, N'chiếc', 1)
INSERT [tMatHang] ([MaMH], [TenMH], [MaTheLoai], [Mau], [Size], [MaNCC], [GiaBan], [GiaNhap], [SLTon], [Anh], [GhiChu], [DonVi], [IsDangBan]) VALUES (N'APL230001.trắng.S', N'Áo Polo Vải Dry Pique Ngắn Tay màu trắng - S', 4, N'trắng', N'S', 1, 450000.0000, 300000.0000, 5, N'https://dongphucdieplong.com.vn/wp-content/uploads/2019/11/ao-hoodie-trang-1.jpg', NULL, N'chiếc', 1)
INSERT [tMatHang] ([MaMH], [TenMH], [MaTheLoai], [Mau], [Size], [MaNCC], [GiaBan], [GiaNhap], [SLTon], [Anh], [GhiChu], [DonVi], [IsDangBan]) VALUES (N'APL230001.trắng.XL', N'Áo Polo Vải Dry Pique Ngắn Tay màu trắng - XL', 4, N'trắng', N'XL', 1, 450000.0000, 300000.0000, 5, N'https://dongphucdieplong.com.vn/wp-content/uploads/2019/11/ao-hoodie-trang-1.jpg', NULL, N'chiếc', 1)
INSERT [tMatHang] ([MaMH], [TenMH], [MaTheLoai], [Mau], [Size], [MaNCC], [GiaBan], [GiaNhap], [SLTon], [Anh], [GhiChu], [DonVi], [IsDangBan]) VALUES (N'APL230001.trắng.XS', N'Áo Polo Vải Dry Pique Ngắn Tay màu trắng - XS', 4, N'trắng', N'XS', 1, 450000.0000, 300000.0000, 5, N'https://dongphucdieplong.com.vn/wp-content/uploads/2019/11/ao-hoodie-trang-1.jpg', NULL, N'chiếc', 1)
INSERT [tMatHang] ([MaMH], [TenMH], [MaTheLoai], [Mau], [Size], [MaNCC], [GiaBan], [GiaNhap], [SLTon], [Anh], [GhiChu], [DonVi], [IsDangBan]) VALUES (N'QJM5005.xanh đậm.29', N'Quần Jeans Nam Ống Suông Lưng Thun màu xanh đậm - 29', 2, N'xanh đậm', N'29', 3, 400000.0000, 250000.0000, 5, N'https://m.yodycdn.com/fit-in/filters:format(webp)/products/qjm7007-xah-4.jpg', NULL, N'chiếc', 1)
INSERT [tMatHang] ([MaMH], [TenMH], [MaTheLoai], [Mau], [Size], [MaNCC], [GiaBan], [GiaNhap], [SLTon], [Anh], [GhiChu], [DonVi], [IsDangBan]) VALUES (N'QJM5005.xanh đậm.30', N'Quần Jeans Nam Ống Suông Lưng Thun màu xanh đậm - 30', 2, N'xanh đậm', N'30', 3, 400000.0000, 250000.0000, 8, N'https://m.yodycdn.com/fit-in/filters:format(webp)/products/qjm7007-xah-4.jpg', NULL, N'chiếc', 1)
INSERT [tMatHang] ([MaMH], [TenMH], [MaTheLoai], [Mau], [Size], [MaNCC], [GiaBan], [GiaNhap], [SLTon], [Anh], [GhiChu], [DonVi], [IsDangBan]) VALUES (N'QJM5005.xanh đậm.31', N'Quần Jeans Nam Ống Suông Lưng Thun màu xanh đậm - 31', 2, N'xanh đậm', N'31', 3, 400000.0000, 250000.0000, 10, N'https://m.yodycdn.com/fit-in/filters:format(webp)/products/qjm7007-xah-4.jpg', NULL, N'chiếc', 1)
INSERT [tMatHang] ([MaMH], [TenMH], [MaTheLoai], [Mau], [Size], [MaNCC], [GiaBan], [GiaNhap], [SLTon], [Anh], [GhiChu], [DonVi], [IsDangBan]) VALUES (N'QJM5005.xanh đậm.32', N'Quần Jeans Nam Ống Suông Lưng Thun màu xanh đậm - 32', 2, N'xanh đậm', N'32', 3, 400000.0000, 250000.0000, 9, N'https://m.yodycdn.com/fit-in/filters:format(webp)/products/qjm7007-xah-4.jpg', NULL, N'chiếc', 1)
INSERT [tMatHang] ([MaMH], [TenMH], [MaTheLoai], [Mau], [Size], [MaNCC], [GiaBan], [GiaNhap], [SLTon], [Anh], [GhiChu], [DonVi], [IsDangBan]) VALUES (N'QJM5005.xanh đậm.33', N'Quần Jeans Nam Ống Suông Lưng Thun màu xanh đậm - 33', 2, N'xanh đậm', N'33', 3, 400000.0000, 250000.0000, 9, N'https://m.yodycdn.com/fit-in/filters:format(webp)/products/qjm7007-xah-4.jpg', NULL, N'chiếc', 1)
INSERT [tMatHang] ([MaMH], [TenMH], [MaTheLoai], [Mau], [Size], [MaNCC], [GiaBan], [GiaNhap], [SLTon], [Anh], [GhiChu], [DonVi], [IsDangBan]) VALUES (N'QJM5005.xanh đậm.34', N'Quần Jeans Nam Ống Suông Lưng Thun màu xanh đậm - 34', 2, N'xanh đậm', N'34', 3, 400000.0000, 250000.0000, 5, N'https://m.yodycdn.com/fit-in/filters:format(webp)/products/qjm7007-xah-4.jpg', NULL, N'chiếc', 1)
INSERT [tMatHang] ([MaMH], [TenMH], [MaTheLoai], [Mau], [Size], [MaNCC], [GiaBan], [GiaNhap], [SLTon], [Anh], [GhiChu], [DonVi], [IsDangBan]) VALUES (N'qjm6005.Xanh đậm.29', N'Quần Jeans Nam Slimfit Lycra Co Giãn Mác Dệt màu Xanh đậm - 29', 2, N'Xanh đậm', N'29', 2, 600000.0000, 350000.0000, 5, N'https://m.yodycdn.com/fit-in/filters:format(webp)/products/qjm7007-xah-4.jpg', NULL, N'chiếc', 1)
INSERT [tMatHang] ([MaMH], [TenMH], [MaTheLoai], [Mau], [Size], [MaNCC], [GiaBan], [GiaNhap], [SLTon], [Anh], [GhiChu], [DonVi], [IsDangBan]) VALUES (N'qjm6005.Xanh đậm.30', N'Quần Jeans Nam Slimfit Lycra Co Giãn Mác Dệt màu Xanh đậm - 30', 2, N'Xanh đậm', N'30', 2, 600000.0000, 350000.0000, 5, N'https://m.yodycdn.com/fit-in/filters:format(webp)/products/qjm7007-xah-4.jpg', NULL, N'chiếc', 1)
INSERT [tMatHang] ([MaMH], [TenMH], [MaTheLoai], [Mau], [Size], [MaNCC], [GiaBan], [GiaNhap], [SLTon], [Anh], [GhiChu], [DonVi], [IsDangBan]) VALUES (N'qjm6005.Xanh đậm.31', N'Quần Jeans Nam Slimfit Lycra Co Giãn Mác Dệt màu Xanh đậm - 31', 2, N'Xanh đậm', N'31', 2, 600000.0000, 350000.0000, 5, N'https://m.yodycdn.com/fit-in/filters:format(webp)/products/qjm7007-xah-4.jpg', NULL, N'chiếc', 1)
INSERT [tMatHang] ([MaMH], [TenMH], [MaTheLoai], [Mau], [Size], [MaNCC], [GiaBan], [GiaNhap], [SLTon], [Anh], [GhiChu], [DonVi], [IsDangBan]) VALUES (N'qjm6005.Xanh đậm.32', N'Quần Jeans Nam Slimfit Lycra Co Giãn Mác Dệt màu Xanh đậm - 32', 2, N'Xanh đậm', N'32', 2, 600000.0000, 350000.0000, 5, N'https://m.yodycdn.com/fit-in/filters:format(webp)/products/qjm7007-xah-4.jpg', NULL, N'chiếc', 1)
INSERT [tMatHang] ([MaMH], [TenMH], [MaTheLoai], [Mau], [Size], [MaNCC], [GiaBan], [GiaNhap], [SLTon], [Anh], [GhiChu], [DonVi], [IsDangBan]) VALUES (N'qjm6005.Xanh đậm.33', N'Quần Jeans Nam Slimfit Lycra Co Giãn Mác Dệt màu Xanh đậm - 33', 2, N'Xanh đậm', N'33', 2, 600000.0000, 350000.0000, 5, N'https://m.yodycdn.com/fit-in/filters:format(webp)/products/qjm7007-xah-4.jpg', NULL, N'chiếc', 1)
INSERT [tMatHang] ([MaMH], [TenMH], [MaTheLoai], [Mau], [Size], [MaNCC], [GiaBan], [GiaNhap], [SLTon], [Anh], [GhiChu], [DonVi], [IsDangBan]) VALUES (N'qjm6005.Xanh đậm.34', N'Quần Jeans Nam Slimfit Lycra Co Giãn Mác Dệt màu Xanh đậm - 34', 2, N'Xanh đậm', N'34', 2, 600000.0000, 350000.0000, 5, N'https://m.yodycdn.com/fit-in/filters:format(webp)/products/qjm7007-xah-4.jpg', NULL, N'chiếc', 1)
INSERT [tMatHang] ([MaMH], [TenMH], [MaTheLoai], [Mau], [Size], [MaNCC], [GiaBan], [GiaNhap], [SLTon], [Anh], [GhiChu], [DonVi], [IsDangBan]) VALUES (N'qjm6005.Xanh nhạt.29', N'Quần Jeans Nam Slimfit Lycra Co Giãn Mác Dệt màu Xanh nhạt - 29', 2, N'Xanh nhạt', N'29', 2, 600000.0000, 350000.0000, 10, N'https://m.yodycdn.com/fit-in/filters:format(webp)/products/qjm7007-xah-4.jpg', NULL, N'chiếc', 1)
INSERT [tMatHang] ([MaMH], [TenMH], [MaTheLoai], [Mau], [Size], [MaNCC], [GiaBan], [GiaNhap], [SLTon], [Anh], [GhiChu], [DonVi], [IsDangBan]) VALUES (N'qjm6005.Xanh nhạt.30', N'Quần Jeans Nam Slimfit Lycra Co Giãn Mác Dệt màu Xanh nhạt - 30', 2, N'Xanh nhạt', N'30', 2, 600000.0000, 350000.0000, 10, N'https://m.yodycdn.com/fit-in/filters:format(webp)/products/qjm7007-xah-4.jpg', NULL, N'chiếc', 1)
INSERT [tMatHang] ([MaMH], [TenMH], [MaTheLoai], [Mau], [Size], [MaNCC], [GiaBan], [GiaNhap], [SLTon], [Anh], [GhiChu], [DonVi], [IsDangBan]) VALUES (N'qjm6005.Xanh nhạt.31', N'Quần Jeans Nam Slimfit Lycra Co Giãn Mác Dệt màu Xanh nhạt - 31', 2, N'Xanh nhạt', N'31', 2, 600000.0000, 350000.0000, 5, N'https://m.yodycdn.com/fit-in/filters:format(webp)/products/qjm7007-xah-4.jpg', NULL, N'chiếc', 1)
INSERT [tMatHang] ([MaMH], [TenMH], [MaTheLoai], [Mau], [Size], [MaNCC], [GiaBan], [GiaNhap], [SLTon], [Anh], [GhiChu], [DonVi], [IsDangBan]) VALUES (N'qjm6005.Xanh nhạt.32', N'Quần Jeans Nam Slimfit Lycra Co Giãn Mác Dệt màu Xanh nhạt - 32', 2, N'Xanh nhạt', N'32', 2, 600000.0000, 350000.0000, 5, N'https://m.yodycdn.com/fit-in/filters:format(webp)/products/qjm7007-xah-4.jpg', NULL, N'chiếc', 1)
INSERT [tMatHang] ([MaMH], [TenMH], [MaTheLoai], [Mau], [Size], [MaNCC], [GiaBan], [GiaNhap], [SLTon], [Anh], [GhiChu], [DonVi], [IsDangBan]) VALUES (N'qjm6005.Xanh nhạt.33', N'Quần Jeans Nam Slimfit Lycra Co Giãn Mác Dệt màu Xanh nhạt - 33', 2, N'Xanh nhạt', N'33', 2, 600000.0000, 350000.0000, 10, N'https://m.yodycdn.com/fit-in/filters:format(webp)/products/qjm7007-xah-4.jpg', NULL, N'chiếc', 1)
INSERT [tMatHang] ([MaMH], [TenMH], [MaTheLoai], [Mau], [Size], [MaNCC], [GiaBan], [GiaNhap], [SLTon], [Anh], [GhiChu], [DonVi], [IsDangBan]) VALUES (N'qjm6005.Xanh nhạt.34', N'Quần Jeans Nam Slimfit Lycra Co Giãn Mác Dệt màu Xanh nhạt - 34', 2, N'Xanh nhạt', N'34', 2, 600000.0000, 350000.0000, 5, N'https://m.yodycdn.com/fit-in/filters:format(webp)/products/qjm7007-xah-4.jpg', NULL, N'chiếc', 1)
INSERT [tMatHang] ([MaMH], [TenMH], [MaTheLoai], [Mau], [Size], [MaNCC], [GiaBan], [GiaNhap], [SLTon], [Anh], [GhiChu], [DonVi], [IsDangBan]) VALUES (N'QS230001.be.2XL', N'Quần Shorts Co Giãn Dáng Slim Fit màu be - 2XL', 3, N'be', N'2XL', 2, 500000.0000, 300000.0000, 5, N'https://image.uniqlo.com/UQ/ST3/AsianCommon/imagesgoods/463886/sub/goods_463886_sub14.jpg?width=750', NULL, N'chiếc', 1)
INSERT [tMatHang] ([MaMH], [TenMH], [MaTheLoai], [Mau], [Size], [MaNCC], [GiaBan], [GiaNhap], [SLTon], [Anh], [GhiChu], [DonVi], [IsDangBan]) VALUES (N'QS230001.be.3XL', N'Quần Shorts Co Giãn Dáng Slim Fit màu be - 3XL', 3, N'be', N'3XL', 2, 500000.0000, 300000.0000, 5, N'https://image.uniqlo.com/UQ/ST3/AsianCommon/imagesgoods/463886/sub/goods_463886_sub14.jpg?width=750', NULL, N'chiếc', 1)
INSERT [tMatHang] ([MaMH], [TenMH], [MaTheLoai], [Mau], [Size], [MaNCC], [GiaBan], [GiaNhap], [SLTon], [Anh], [GhiChu], [DonVi], [IsDangBan]) VALUES (N'QS230001.be.L', N'Quần Shorts Co Giãn Dáng Slim Fit màu be - L', 3, N'be', N'L', 2, 500000.0000, 300000.0000, 10, N'https://image.uniqlo.com/UQ/ST3/AsianCommon/imagesgoods/463886/sub/goods_463886_sub14.jpg?width=750', NULL, N'chiếc', 1)
INSERT [tMatHang] ([MaMH], [TenMH], [MaTheLoai], [Mau], [Size], [MaNCC], [GiaBan], [GiaNhap], [SLTon], [Anh], [GhiChu], [DonVi], [IsDangBan]) VALUES (N'QS230001.be.M', N'Quần Shorts Co Giãn Dáng Slim Fit màu be - M', 3, N'be', N'M', 2, 500000.0000, 300000.0000, 9, N'https://image.uniqlo.com/UQ/ST3/AsianCommon/imagesgoods/463886/sub/goods_463886_sub14.jpg?width=750', NULL, N'chiếc', 1)
INSERT [tMatHang] ([MaMH], [TenMH], [MaTheLoai], [Mau], [Size], [MaNCC], [GiaBan], [GiaNhap], [SLTon], [Anh], [GhiChu], [DonVi], [IsDangBan]) VALUES (N'QS230001.be.S', N'Quần Shorts Co Giãn Dáng Slim Fit màu be - S', 3, N'be', N'S', 2, 500000.0000, 300000.0000, 9, N'https://image.uniqlo.com/UQ/ST3/AsianCommon/imagesgoods/463886/sub/goods_463886_sub14.jpg?width=750', NULL, N'chiếc', 1)
INSERT [tMatHang] ([MaMH], [TenMH], [MaTheLoai], [Mau], [Size], [MaNCC], [GiaBan], [GiaNhap], [SLTon], [Anh], [GhiChu], [DonVi], [IsDangBan]) VALUES (N'QS230001.be.XL', N'Quần Shorts Co Giãn Dáng Slim Fit màu be - XL', 3, N'be', N'XL', 2, 500000.0000, 300000.0000, 5, N'https://image.uniqlo.com/UQ/ST3/AsianCommon/imagesgoods/463886/sub/goods_463886_sub14.jpg?width=750', NULL, N'chiếc', 1)
GO
INSERT [tMatHang] ([MaMH], [TenMH], [MaTheLoai], [Mau], [Size], [MaNCC], [GiaBan], [GiaNhap], [SLTon], [Anh], [GhiChu], [DonVi], [IsDangBan]) VALUES (N'QS230001.be.XS', N'Quần Shorts Co Giãn Dáng Slim Fit màu be - XS', 3, N'be', N'XS', 2, 500000.0000, 300000.0000, 5, N'https://image.uniqlo.com/UQ/ST3/AsianCommon/imagesgoods/463886/sub/goods_463886_sub14.jpg?width=750', NULL, N'chiếc', 1)
INSERT [tMatHang] ([MaMH], [TenMH], [MaTheLoai], [Mau], [Size], [MaNCC], [GiaBan], [GiaNhap], [SLTon], [Anh], [GhiChu], [DonVi], [IsDangBan]) VALUES (N'QS230001.navy.2XL', N'Quần Shorts Co Giãn Dáng Slim Fit màu navy - 2XL', 3, N'navy', N'2XL', 2, 500000.0000, 300000.0000, 5, N'https://image.uniqlo.com/UQ/ST3/AsianCommon/imagesgoods/463886/sub/goods_463886_sub14.jpg?width=750', NULL, N'chiếc', 1)
INSERT [tMatHang] ([MaMH], [TenMH], [MaTheLoai], [Mau], [Size], [MaNCC], [GiaBan], [GiaNhap], [SLTon], [Anh], [GhiChu], [DonVi], [IsDangBan]) VALUES (N'QS230001.navy.3XL', N'Quần Shorts Co Giãn Dáng Slim Fit màu navy - 3XL', 3, N'navy', N'3XL', 2, 500000.0000, 300000.0000, 5, N'https://image.uniqlo.com/UQ/ST3/AsianCommon/imagesgoods/463886/sub/goods_463886_sub14.jpg?width=750', NULL, N'chiếc', 1)
INSERT [tMatHang] ([MaMH], [TenMH], [MaTheLoai], [Mau], [Size], [MaNCC], [GiaBan], [GiaNhap], [SLTon], [Anh], [GhiChu], [DonVi], [IsDangBan]) VALUES (N'QS230001.navy.L', N'Quần Shorts Co Giãn Dáng Slim Fit màu navy - L', 3, N'navy', N'L', 2, 500000.0000, 300000.0000, 5, N'https://image.uniqlo.com/UQ/ST3/AsianCommon/imagesgoods/463886/sub/goods_463886_sub14.jpg?width=750', NULL, N'chiếc', 1)
INSERT [tMatHang] ([MaMH], [TenMH], [MaTheLoai], [Mau], [Size], [MaNCC], [GiaBan], [GiaNhap], [SLTon], [Anh], [GhiChu], [DonVi], [IsDangBan]) VALUES (N'QS230001.navy.M', N'Quần Shorts Co Giãn Dáng Slim Fit màu navy - M', 3, N'navy', N'M', 2, 500000.0000, 300000.0000, 5, N'https://image.uniqlo.com/UQ/ST3/AsianCommon/imagesgoods/463886/sub/goods_463886_sub14.jpg?width=750', NULL, N'chiếc', 1)
INSERT [tMatHang] ([MaMH], [TenMH], [MaTheLoai], [Mau], [Size], [MaNCC], [GiaBan], [GiaNhap], [SLTon], [Anh], [GhiChu], [DonVi], [IsDangBan]) VALUES (N'QS230001.navy.S', N'Quần Shorts Co Giãn Dáng Slim Fit màu navy - S', 3, N'navy', N'S', 2, 500000.0000, 300000.0000, 5, N'https://image.uniqlo.com/UQ/ST3/AsianCommon/imagesgoods/463886/sub/goods_463886_sub14.jpg?width=750', NULL, N'chiếc', 1)
INSERT [tMatHang] ([MaMH], [TenMH], [MaTheLoai], [Mau], [Size], [MaNCC], [GiaBan], [GiaNhap], [SLTon], [Anh], [GhiChu], [DonVi], [IsDangBan]) VALUES (N'QS230001.navy.XL', N'Quần Shorts Co Giãn Dáng Slim Fit màu navy - XL', 3, N'navy', N'XL', 2, 500000.0000, 300000.0000, 5, N'https://image.uniqlo.com/UQ/ST3/AsianCommon/imagesgoods/463886/sub/goods_463886_sub14.jpg?width=750', NULL, N'chiếc', 1)
INSERT [tMatHang] ([MaMH], [TenMH], [MaTheLoai], [Mau], [Size], [MaNCC], [GiaBan], [GiaNhap], [SLTon], [Anh], [GhiChu], [DonVi], [IsDangBan]) VALUES (N'QS230001.navy.XS', N'Quần Shorts Co Giãn Dáng Slim Fit màu navy - XS', 3, N'navy', N'XS', 2, 500000.0000, 300000.0000, 5, N'https://image.uniqlo.com/UQ/ST3/AsianCommon/imagesgoods/463886/sub/goods_463886_sub14.jpg?width=750', NULL, N'chiếc', 1)
GO
SET IDENTITY_INSERT [tNhaCungCap] ON 

INSERT [tNhaCungCap] ([MaNCC], [TenNCC], [SDT], [DiaChi], [GhiChu]) VALUES (1, N'Boutique Lạc Trung', N'0345678921', N'62 đường Hoàng Mai - Trương Định - Hai Bà Trưng - Hà Nội', N'quần áo boutique')
INSERT [tNhaCungCap] ([MaNCC], [TenNCC], [SDT], [DiaChi], [GhiChu]) VALUES (2, N'Boutique Trương Định', N'0123456789', N'62 đường Hoàng Mai - Trương Định - Hai Bà Trưng - Hà Nội', N'')
INSERT [tNhaCungCap] ([MaNCC], [TenNCC], [SDT], [DiaChi], [GhiChu]) VALUES (3, N'Boutique Láng Hạ', N'0123456798', N'Trương Định - Hai Bà Trưng - Hà Nội', N'')
INSERT [tNhaCungCap] ([MaNCC], [TenNCC], [SDT], [DiaChi], [GhiChu]) VALUES (4, N'Boutique Cầu Giấy', N'0123456745', N'số 3 Cầu Giấy - Hà Nội', N'')
INSERT [tNhaCungCap] ([MaNCC], [TenNCC], [SDT], [DiaChi], [GhiChu]) VALUES (5, N'VietTien', N'0123456798', N'Hà Đông - Hà Nội', N'')
INSERT [tNhaCungCap] ([MaNCC], [TenNCC], [SDT], [DiaChi], [GhiChu]) VALUES (6, N'Adidas Đông Triều', N'0123456700', N'Đông Triều - Quảng Ninh', N'')
INSERT [tNhaCungCap] ([MaNCC], [TenNCC], [SDT], [DiaChi], [GhiChu]) VALUES (7, N'Boutique Đống Đa', N'0123456701', N'Trương Định - Hai Bà Trưng - Hà Nội', N'')
SET IDENTITY_INSERT [tNhaCungCap] OFF
GO
SET IDENTITY_INSERT [tNhanVien] ON 

INSERT [tNhanVien] ([MaNV], [TenNV], [GioiTinh], [NgaySinh], [NgayBD], [SDT], [UserName], [passWord], [Role], [IsDeleted]) VALUES (1, N'Vũ Văn Hoàn', 1, CAST(N'2003-07-19' AS Date), CAST(N'2023-11-15' AS Date), N'0382906626', N'vuvanhoan', N'123', 1, 0)
INSERT [tNhanVien] ([MaNV], [TenNV], [GioiTinh], [NgaySinh], [NgayBD], [SDT], [UserName], [passWord], [Role], [IsDeleted]) VALUES (2, N'Hoàng Thị Hà', 0, CAST(N'2003-11-07' AS Date), CAST(N'2021-11-07' AS Date), N'0975992399', N'hoangthiha', N'123', 1, 0)
INSERT [tNhanVien] ([MaNV], [TenNV], [GioiTinh], [NgaySinh], [NgayBD], [SDT], [UserName], [passWord], [Role], [IsDeleted]) VALUES (3, N'Nguyễn Thành Đạt', 1, CAST(N'2003-11-21' AS Date), CAST(N'2022-11-21' AS Date), N'0382906666', N'nguyenthanhdat', N'123', 0, 0)
INSERT [tNhanVien] ([MaNV], [TenNV], [GioiTinh], [NgaySinh], [NgayBD], [SDT], [UserName], [passWord], [Role], [IsDeleted]) VALUES (4, N'Nguyễn Việt Hoàng', 1, CAST(N'2003-11-10' AS Date), CAST(N'2021-11-10' AS Date), N'099988999', N'nguyenviethoang', N'123', 0, 0)
INSERT [tNhanVien] ([MaNV], [TenNV], [GioiTinh], [NgaySinh], [NgayBD], [SDT], [UserName], [passWord], [Role], [IsDeleted]) VALUES (5, N'Nguyễn Đức Thắng', 1, CAST(N'2003-02-10' AS Date), CAST(N'2020-02-10' AS Date), N'0123456789', N'nguyenducthang', N'123', 0, 0)
SET IDENTITY_INSERT [tNhanVien] OFF
GO
SET IDENTITY_INSERT [tPhieuNhap] ON 

INSERT [tPhieuNhap] ([MaPN], [MaNV], [TongTien], [GiamGia], [ThanhToan], [PhuongThucTT], [GhiChu], [CreatedAt], [TrangThai]) VALUES (1, 1, 6000000.0000, 0.0000, 6000000.0000, 1, N'', CAST(N'2023-11-14T17:10:17.810' AS DateTime), 1)
INSERT [tPhieuNhap] ([MaPN], [MaNV], [TongTien], [GiamGia], [ThanhToan], [PhuongThucTT], [GhiChu], [CreatedAt], [TrangThai]) VALUES (2, 1, 98000000.0000, 0.0000, 98000000.0000, 0, N'', CAST(N'2023-11-14T17:10:17.810' AS DateTime), 1)
INSERT [tPhieuNhap] ([MaPN], [MaNV], [TongTien], [GiamGia], [ThanhToan], [PhuongThucTT], [GhiChu], [CreatedAt], [TrangThai]) VALUES (3, 2, 34700000.0000, 0.0000, 34700000.0000, 1, N'', CAST(N'2023-11-14T17:10:17.810' AS DateTime), 1)
INSERT [tPhieuNhap] ([MaPN], [MaNV], [TongTien], [GiamGia], [ThanhToan], [PhuongThucTT], [GhiChu], [CreatedAt], [TrangThai]) VALUES (4, 1, 66000000.0000, 0.0000, 66000000.0000, 1, N'', CAST(N'2023-11-14T17:10:17.810' AS DateTime), 1)
INSERT [tPhieuNhap] ([MaPN], [MaNV], [TongTien], [GiamGia], [ThanhToan], [PhuongThucTT], [GhiChu], [CreatedAt], [TrangThai]) VALUES (5, 1, 77000000.0000, 0.0000, 77000000.0000, 1, N'', CAST(N'2023-11-14T17:10:17.810' AS DateTime), 1)
INSERT [tPhieuNhap] ([MaPN], [MaNV], [TongTien], [GiamGia], [ThanhToan], [PhuongThucTT], [GhiChu], [CreatedAt], [TrangThai]) VALUES (6, 1, 9000000.0000, 0.0000, 9000000.0000, 1, N'', CAST(N'2023-11-14T17:10:17.810' AS DateTime), 1)
INSERT [tPhieuNhap] ([MaPN], [MaNV], [TongTien], [GiamGia], [ThanhToan], [PhuongThucTT], [GhiChu], [CreatedAt], [TrangThai]) VALUES (7, 1, 2500000.0000, 0.0000, 2500000.0000, 1, N'', CAST(N'2023-11-14T17:10:17.810' AS DateTime), 0)
INSERT [tPhieuNhap] ([MaPN], [MaNV], [TongTien], [GiamGia], [ThanhToan], [PhuongThucTT], [GhiChu], [CreatedAt], [TrangThai]) VALUES (8, 2, 20000000.0000, 0.0000, 20000000.0000, 1, N'', CAST(N'2023-11-14T17:10:17.810' AS DateTime), 0)
SET IDENTITY_INSERT [tPhieuNhap] OFF
GO
SET IDENTITY_INSERT [tTheLoai] ON 

INSERT [tTheLoai] ([MaTheLoai], [TenTheLoai]) VALUES (1, N'Áo hoodie')
INSERT [tTheLoai] ([MaTheLoai], [TenTheLoai]) VALUES (2, N'Quần Jean Nam')
INSERT [tTheLoai] ([MaTheLoai], [TenTheLoai]) VALUES (3, N'Quần short nam')
INSERT [tTheLoai] ([MaTheLoai], [TenTheLoai]) VALUES (4, N'Áo polo nam')
INSERT [tTheLoai] ([MaTheLoai], [TenTheLoai]) VALUES (5, N'Áo sơ mi nam')
SET IDENTITY_INSERT [tTheLoai] OFF
GO
ALTER TABLE [tHoaDonBan] ADD  DEFAULT ((0)) FOR [PhuongThucTT]
GO
ALTER TABLE [tNhanVien] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [tPhieuNhap] ADD  DEFAULT ((0)) FOR [PhuongThucTT]
GO
ALTER TABLE [tChiTietHDB]  WITH CHECK ADD  CONSTRAINT [FK_tChiTietHDB_tHoaDonBan] FOREIGN KEY([MaHDB])
REFERENCES [tHoaDonBan] ([MaHDB])
GO
ALTER TABLE [tChiTietHDB] CHECK CONSTRAINT [FK_tChiTietHDB_tHoaDonBan]
GO
ALTER TABLE [tChiTietHDB]  WITH CHECK ADD  CONSTRAINT [FK_tChiTietHDB_tMatHang] FOREIGN KEY([MaMH])
REFERENCES [tMatHang] ([MaMH])
GO
ALTER TABLE [tChiTietHDB] CHECK CONSTRAINT [FK_tChiTietHDB_tMatHang]
GO
ALTER TABLE [tChiTietPN]  WITH CHECK ADD  CONSTRAINT [FK_tChiTietPN_tMatHang] FOREIGN KEY([MaMH])
REFERENCES [tMatHang] ([MaMH])
GO
ALTER TABLE [tChiTietPN] CHECK CONSTRAINT [FK_tChiTietPN_tMatHang]
GO
ALTER TABLE [tChiTietPN]  WITH CHECK ADD  CONSTRAINT [FK_tChiTietPN_tPhieuNhap] FOREIGN KEY([MaPN])
REFERENCES [tPhieuNhap] ([MaPN])
GO
ALTER TABLE [tChiTietPN] CHECK CONSTRAINT [FK_tChiTietPN_tPhieuNhap]
GO
ALTER TABLE [tHoaDonBan]  WITH CHECK ADD  CONSTRAINT [FK_tHoaDonBan_tKhachHang] FOREIGN KEY([MaKH])
REFERENCES [tKhachHang] ([MaKH])
GO
ALTER TABLE [tHoaDonBan] CHECK CONSTRAINT [FK_tHoaDonBan_tKhachHang]
GO
ALTER TABLE [tHoaDonBan]  WITH CHECK ADD  CONSTRAINT [FK_tHoaDonBan_tNhanVien] FOREIGN KEY([MaNV])
REFERENCES [tNhanVien] ([MaNV])
GO
ALTER TABLE [tHoaDonBan] CHECK CONSTRAINT [FK_tHoaDonBan_tNhanVien]
GO
ALTER TABLE [tKhachHang]  WITH CHECK ADD  CONSTRAINT [FK_tKhachHang_tNhanVien] FOREIGN KEY([MaNV])
REFERENCES [tNhanVien] ([MaNV])
GO
ALTER TABLE [tKhachHang] CHECK CONSTRAINT [FK_tKhachHang_tNhanVien]
GO
ALTER TABLE [tMatHang]  WITH CHECK ADD  CONSTRAINT [FK_tMatHang_tNhaCungCap] FOREIGN KEY([MaNCC])
REFERENCES [tNhaCungCap] ([MaNCC])
GO
ALTER TABLE [tMatHang] CHECK CONSTRAINT [FK_tMatHang_tNhaCungCap]
GO
ALTER TABLE [tMatHang]  WITH CHECK ADD  CONSTRAINT [FK_tMatHang_tTheLoai] FOREIGN KEY([MaTheLoai])
REFERENCES [tTheLoai] ([MaTheLoai])
GO
ALTER TABLE [tMatHang] CHECK CONSTRAINT [FK_tMatHang_tTheLoai]
GO
ALTER TABLE [tPhieuNhap]  WITH CHECK ADD  CONSTRAINT [FK_tPhieuNhap_tNhanVien] FOREIGN KEY([MaNV])
REFERENCES [tNhanVien] ([MaNV])
GO
ALTER TABLE [tPhieuNhap] CHECK CONSTRAINT [FK_tPhieuNhap_tNhanVien]
GO
/****** Object:  StoredProcedure [proc_danh_sach_khach_hang]    Script Date: 19/05/2024 11:55:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   proc [proc_danh_sach_khach_hang]
as
begin
	select MaKH, TenKH, SDT, DiaChi
	from tKhachHang
end
GO
/****** Object:  StoredProcedure [proc_danh_sach_nhan_vien]    Script Date: 19/05/2024 11:55:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   proc [proc_danh_sach_nhan_vien]
as
begin
	select MaNV, UserName, tNhanVien.passWord
	from tNhanVien
end
GO
/****** Object:  StoredProcedure [proc_get_all_mat_hang]    Script Date: 19/05/2024 11:55:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [proc_get_all_mat_hang] 
as
begin
	select MaMH, TenMH, Mau, Size, GiaBan, SLTon, Anh
	from tMatHang
end
GO
/****** Object:  StoredProcedure [proc_update_khach_hang]    Script Date: 19/05/2024 11:55:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   proc [proc_update_khach_hang] 
	@MaKH int, 
	@TenKH nvarchar(100), 
	@SDT nvarchar(100),
	@DiaChi nvarchar(100)
as
begin
	update tKhachHang
	set TenKH = @TenKH, SDT = @SDT, DiaChi = @DiaChi
	where MaKH = @MaKH
end
GO
