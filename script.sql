USE [master]
GO
/****** Object:  Database [QLPHIM]    Script Date: 6/17/2020 1:24:12 PM ******/
CREATE DATABASE [QLPHIM]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLPHIM', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\QLPHIM.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QLPHIM_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\QLPHIM_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [QLPHIM] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLPHIM].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLPHIM] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLPHIM] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLPHIM] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLPHIM] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLPHIM] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLPHIM] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QLPHIM] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLPHIM] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLPHIM] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLPHIM] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLPHIM] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLPHIM] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLPHIM] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLPHIM] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLPHIM] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QLPHIM] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLPHIM] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLPHIM] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLPHIM] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLPHIM] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLPHIM] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLPHIM] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLPHIM] SET RECOVERY FULL 
GO
ALTER DATABASE [QLPHIM] SET  MULTI_USER 
GO
ALTER DATABASE [QLPHIM] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLPHIM] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLPHIM] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLPHIM] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QLPHIM] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'QLPHIM', N'ON'
GO
ALTER DATABASE [QLPHIM] SET QUERY_STORE = OFF
GO
USE [QLPHIM]
GO
/****** Object:  Table [dbo].[BINHLUAN]    Script Date: 6/17/2020 1:24:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BINHLUAN](
	[MABL] [bigint] IDENTITY(1,1) NOT NULL,
	[NOIDUNG] [nvarchar](max) NOT NULL,
	[NGAY] [datetime] NOT NULL,
	[EMAIL] [nvarchar](200) NOT NULL,
	[MAPHIM] [nvarchar](50) NOT NULL,
	[RECOMMENT] [bigint] NULL,
 CONSTRAINT [PK_BINHLUAN] PRIMARY KEY CLUSTERED 
(
	[MABL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CATEGORY]    Script Date: 6/17/2020 1:24:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CATEGORY](
	[MALOAI] [nvarchar](50) NOT NULL,
	[TENLOAI] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_CATELOGY] PRIMARY KEY CLUSTERED 
(
	[MALOAI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CategoryOfPhim]    Script Date: 6/17/2020 1:24:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoryOfPhim](
	[MAPHIM] [nvarchar](50) NOT NULL,
	[MALOAI] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_CatelogyOfPhim] PRIMARY KEY CLUSTERED 
(
	[MALOAI] ASC,
	[MAPHIM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CTPHIM]    Script Date: 6/17/2020 1:24:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTPHIM](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[TAP] [int] NOT NULL,
	[LINK] [nvarchar](max) NOT NULL,
	[NGAY] [datetime] NOT NULL,
	[MAPHIM] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_CTPHIM] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PHIM]    Script Date: 6/17/2020 1:24:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PHIM](
	[MAPHIM] [nvarchar](50) NOT NULL,
	[TENPHIM] [nvarchar](100) NOT NULL,
	[NOIDUNG] [nvarchar](max) NOT NULL,
	[TRANGTHAI] [int] NOT NULL,
	[NAM] [int] NOT NULL,
	[HINH] [nvarchar](max) NOT NULL,
	[HINH2] [nvarchar](max) NOT NULL,
	[SOTAP] [int] NOT NULL,
	[NGAYTHEM] [date] NULL,
 CONSTRAINT [PK_PHIM] PRIMARY KEY CLUSTERED 
(
	[MAPHIM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RECORD]    Script Date: 6/17/2020 1:24:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RECORD](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[EMAIL] [nvarchar](200) NOT NULL,
	[NOIDUNG] [nvarchar](max) NOT NULL,
	[NGAY] [datetime] NOT NULL,
 CONSTRAINT [PK_RECORD] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SUBSCRIBE]    Script Date: 6/17/2020 1:24:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SUBSCRIBE](
	[EMAIL] [nvarchar](200) NOT NULL,
	[MAPHIM] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_SUBSCRIBE] PRIMARY KEY CLUSTERED 
(
	[EMAIL] ASC,
	[MAPHIM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 6/17/2020 1:24:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[EMAIL] [nvarchar](200) NOT NULL,
	[PASSWORD] [nvarchar](50) NOT NULL,
	[NAME] [nvarchar](100) NOT NULL,
	[VERIFY] [bit] NOT NULL,
	[ISADMIN] [bit] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[EMAIL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[BINHLUAN] ON 

INSERT [dbo].[BINHLUAN] ([MABL], [NOIDUNG], [NGAY], [EMAIL], [MAPHIM], [RECOMMENT]) VALUES (1, N'Phim hay quá <3', CAST(N'2020-06-12T00:00:00.000' AS DateTime), N'n17dcat041@student.ptithcm.edu.vn', N'MV4', 0)
INSERT [dbo].[BINHLUAN] ([MABL], [NOIDUNG], [NGAY], [EMAIL], [MAPHIM], [RECOMMENT]) VALUES (3, N'rep comment', CAST(N'2020-06-13T00:00:00.000' AS DateTime), N'n17dcat041@student.ptithcm.edu.vn', N'MV4', 1)
INSERT [dbo].[BINHLUAN] ([MABL], [NOIDUNG], [NGAY], [EMAIL], [MAPHIM], [RECOMMENT]) VALUES (4, N'rep 2', CAST(N'2020-06-14T00:00:00.000' AS DateTime), N'judy.mylinh1999@gmail.com', N'MV4', 1)
SET IDENTITY_INSERT [dbo].[BINHLUAN] OFF
GO
INSERT [dbo].[CATEGORY] ([MALOAI], [TENLOAI]) VALUES (N'TL0001', N'giả tưởng')
INSERT [dbo].[CATEGORY] ([MALOAI], [TENLOAI]) VALUES (N'TL0002', N'hành động')
INSERT [dbo].[CATEGORY] ([MALOAI], [TENLOAI]) VALUES (N'TL0003', N'hài hước')
INSERT [dbo].[CATEGORY] ([MALOAI], [TENLOAI]) VALUES (N'TL0004', N'lịch sử')
INSERT [dbo].[CATEGORY] ([MALOAI], [TENLOAI]) VALUES (N'TL0005', N'mystery')
INSERT [dbo].[CATEGORY] ([MALOAI], [TENLOAI]) VALUES (N'TL0006', N'phiêu lưu')
INSERT [dbo].[CATEGORY] ([MALOAI], [TENLOAI]) VALUES (N'TL0007', N'phép thuật')
INSERT [dbo].[CATEGORY] ([MALOAI], [TENLOAI]) VALUES (N'TL0008', N'siêu nhiên')
INSERT [dbo].[CATEGORY] ([MALOAI], [TENLOAI]) VALUES (N'TL0009', N'trinh thám')
INSERT [dbo].[CATEGORY] ([MALOAI], [TENLOAI]) VALUES (N'TL0010', N'võ thuật')
INSERT [dbo].[CATEGORY] ([MALOAI], [TENLOAI]) VALUES (N'TL0011', N'viễn tưởng')
INSERT [dbo].[CATEGORY] ([MALOAI], [TENLOAI]) VALUES (N'TL0012', N'abc')
INSERT [dbo].[CATEGORY] ([MALOAI], [TENLOAI]) VALUES (N'TL0013', N'abc dư')
GO
INSERT [dbo].[CategoryOfPhim] ([MAPHIM], [MALOAI]) VALUES (N'MV4', N'TL0001')
INSERT [dbo].[CategoryOfPhim] ([MAPHIM], [MALOAI]) VALUES (N'MV8', N'TL0001')
INSERT [dbo].[CategoryOfPhim] ([MAPHIM], [MALOAI]) VALUES (N'MV4', N'TL0002')
INSERT [dbo].[CategoryOfPhim] ([MAPHIM], [MALOAI]) VALUES (N'MV8', N'TL0002')
INSERT [dbo].[CategoryOfPhim] ([MAPHIM], [MALOAI]) VALUES (N'MV4', N'TL0005')
INSERT [dbo].[CategoryOfPhim] ([MAPHIM], [MALOAI]) VALUES (N'MV4', N'TL0006')
INSERT [dbo].[CategoryOfPhim] ([MAPHIM], [MALOAI]) VALUES (N'MV8', N'TL0011')
GO
SET IDENTITY_INSERT [dbo].[CTPHIM] ON 

INSERT [dbo].[CTPHIM] ([ID], [TAP], [LINK], [NGAY], [MAPHIM]) VALUES (1, 1, N'https://www.youtube.com/embed/AeaD3Q-bFjU', CAST(N'2020-04-30T00:00:00.000' AS DateTime), N'MV1')
INSERT [dbo].[CTPHIM] ([ID], [TAP], [LINK], [NGAY], [MAPHIM]) VALUES (2, 2, N'https://www.youtube.com/embed/mOUQwVUO4q0', CAST(N'2020-04-30T00:00:00.000' AS DateTime), N'MV1')
INSERT [dbo].[CTPHIM] ([ID], [TAP], [LINK], [NGAY], [MAPHIM]) VALUES (3, 3, N'https://www.youtube.com/embed/tzv86xibN6s', CAST(N'2020-04-30T00:00:00.000' AS DateTime), N'MV1')
INSERT [dbo].[CTPHIM] ([ID], [TAP], [LINK], [NGAY], [MAPHIM]) VALUES (4, 4, N'https://www.youtube.com/embed/puHNx_44koE', CAST(N'2020-04-30T00:00:00.000' AS DateTime), N'MV1')
INSERT [dbo].[CTPHIM] ([ID], [TAP], [LINK], [NGAY], [MAPHIM]) VALUES (6, 5, N'https://www.youtube.com/embed/baTDwbN7mNo', CAST(N'2020-05-20T00:00:00.000' AS DateTime), N'MV1')
INSERT [dbo].[CTPHIM] ([ID], [TAP], [LINK], [NGAY], [MAPHIM]) VALUES (7, 1, N'https://www.youtube.com/embed/9XWG8QoP4aU', CAST(N'2020-05-05T00:00:00.000' AS DateTime), N'MV7')
INSERT [dbo].[CTPHIM] ([ID], [TAP], [LINK], [NGAY], [MAPHIM]) VALUES (8, 2, N'https://www.youtube.com/embed/kVhMasqjqko', CAST(N'2020-05-05T00:00:00.000' AS DateTime), N'MV7')
INSERT [dbo].[CTPHIM] ([ID], [TAP], [LINK], [NGAY], [MAPHIM]) VALUES (9, 3, N'https://www.youtube.com/embed/ISFWccJXwNg', CAST(N'2020-05-05T00:00:00.000' AS DateTime), N'MV7')
INSERT [dbo].[CTPHIM] ([ID], [TAP], [LINK], [NGAY], [MAPHIM]) VALUES (11, 4, N'https://www.youtube.com/embed/nH2SBgreVfQ', CAST(N'2020-05-05T00:00:00.000' AS DateTime), N'MV7')
INSERT [dbo].[CTPHIM] ([ID], [TAP], [LINK], [NGAY], [MAPHIM]) VALUES (12, 5, N'https://www.youtube.com/embed/9-bksnW6K1k', CAST(N'2020-05-20T00:00:00.000' AS DateTime), N'MV7')
INSERT [dbo].[CTPHIM] ([ID], [TAP], [LINK], [NGAY], [MAPHIM]) VALUES (13, 1, N'https://www.youtube.com/embed/p90V7QNJuX8', CAST(N'2020-05-06T00:00:00.000' AS DateTime), N'MV2')
INSERT [dbo].[CTPHIM] ([ID], [TAP], [LINK], [NGAY], [MAPHIM]) VALUES (14, 2, N'https://www.youtube.com/embed/9mbGOrXLMhE', CAST(N'2020-05-06T00:00:00.000' AS DateTime), N'MV2')
INSERT [dbo].[CTPHIM] ([ID], [TAP], [LINK], [NGAY], [MAPHIM]) VALUES (15, 3, N'https://www.youtube.com/embed/YdjnQJLiouE', CAST(N'2020-05-06T00:00:00.000' AS DateTime), N'MV2')
INSERT [dbo].[CTPHIM] ([ID], [TAP], [LINK], [NGAY], [MAPHIM]) VALUES (17, 4, N'https://www.youtube.com/embed/n1FXesD4tQA', CAST(N'2020-05-06T00:00:00.000' AS DateTime), N'MV2')
INSERT [dbo].[CTPHIM] ([ID], [TAP], [LINK], [NGAY], [MAPHIM]) VALUES (18, 5, N'https://www.youtube.com/embed/6MnhcYKA3Ps', CAST(N'2020-05-20T00:00:00.000' AS DateTime), N'MV2')
INSERT [dbo].[CTPHIM] ([ID], [TAP], [LINK], [NGAY], [MAPHIM]) VALUES (19, 1, N'https://www.youtube.com/embed/U8Oo_h4MVG8', CAST(N'2020-05-07T00:00:00.000' AS DateTime), N'MV3')
INSERT [dbo].[CTPHIM] ([ID], [TAP], [LINK], [NGAY], [MAPHIM]) VALUES (20, 2, N'https://www.youtube.com/embed/LHfP6w5v-9Y', CAST(N'2020-05-07T00:00:00.000' AS DateTime), N'MV3')
INSERT [dbo].[CTPHIM] ([ID], [TAP], [LINK], [NGAY], [MAPHIM]) VALUES (21, 3, N'https://www.youtube.com/embed/dJX8Qvs_8vQ', CAST(N'2020-05-07T00:00:00.000' AS DateTime), N'MV3')
INSERT [dbo].[CTPHIM] ([ID], [TAP], [LINK], [NGAY], [MAPHIM]) VALUES (22, 4, N'https://www.youtube.com/embed/7xOzpB-drmg', CAST(N'2020-05-07T00:00:00.000' AS DateTime), N'MV3')
INSERT [dbo].[CTPHIM] ([ID], [TAP], [LINK], [NGAY], [MAPHIM]) VALUES (24, 5, N'https://www.youtube.com/embed/f2sBGAGWX_I', CAST(N'2020-05-20T00:00:00.000' AS DateTime), N'MV3')
INSERT [dbo].[CTPHIM] ([ID], [TAP], [LINK], [NGAY], [MAPHIM]) VALUES (25, 1, N'https://www.youtube.com/embed/s6fB3dr-XoI', CAST(N'2020-05-08T00:00:00.000' AS DateTime), N'MV4')
INSERT [dbo].[CTPHIM] ([ID], [TAP], [LINK], [NGAY], [MAPHIM]) VALUES (26, 2, N'https://www.youtube.com/embed/zhI7n6Lx2qg', CAST(N'2020-05-08T00:00:00.000' AS DateTime), N'MV4')
INSERT [dbo].[CTPHIM] ([ID], [TAP], [LINK], [NGAY], [MAPHIM]) VALUES (27, 3, N'https://www.youtube.com/embed/ag_ZtZgFFtc', CAST(N'2020-05-08T00:00:00.000' AS DateTime), N'MV4')
INSERT [dbo].[CTPHIM] ([ID], [TAP], [LINK], [NGAY], [MAPHIM]) VALUES (28, 4, N'https://www.youtube.com/embed/W_CDyEAK1w4', CAST(N'2020-05-08T00:00:00.000' AS DateTime), N'MV4')
INSERT [dbo].[CTPHIM] ([ID], [TAP], [LINK], [NGAY], [MAPHIM]) VALUES (29, 5, N'https://www.youtube.com/embed/zNatrfxBpig', CAST(N'2020-05-20T00:00:00.000' AS DateTime), N'MV4')
INSERT [dbo].[CTPHIM] ([ID], [TAP], [LINK], [NGAY], [MAPHIM]) VALUES (30, 1, N'https://www.youtube.com/embed/mY5Wakex05I', CAST(N'2020-05-09T00:00:00.000' AS DateTime), N'MV5')
INSERT [dbo].[CTPHIM] ([ID], [TAP], [LINK], [NGAY], [MAPHIM]) VALUES (31, 2, N'https://www.youtube.com/embed/hD-4pYQHwJo', CAST(N'2020-05-09T00:00:00.000' AS DateTime), N'MV5')
INSERT [dbo].[CTPHIM] ([ID], [TAP], [LINK], [NGAY], [MAPHIM]) VALUES (32, 3, N'https://www.youtube.com/embed/Bf0Tp5Cg0hM', CAST(N'2020-05-09T00:00:00.000' AS DateTime), N'MV5')
INSERT [dbo].[CTPHIM] ([ID], [TAP], [LINK], [NGAY], [MAPHIM]) VALUES (33, 4, N'https://www.youtube.com/embed/egsf3e7z9nI', CAST(N'2020-05-09T00:00:00.000' AS DateTime), N'MV5')
INSERT [dbo].[CTPHIM] ([ID], [TAP], [LINK], [NGAY], [MAPHIM]) VALUES (34, 5, N'https://www.youtube.com/embed/d5GgXUIECfQ', CAST(N'2020-05-20T00:00:00.000' AS DateTime), N'MV5')
INSERT [dbo].[CTPHIM] ([ID], [TAP], [LINK], [NGAY], [MAPHIM]) VALUES (36, 1, N'https://www.youtube.com/embed/Ofsjikkbmkw', CAST(N'2020-05-04T00:00:00.000' AS DateTime), N'MV6')
INSERT [dbo].[CTPHIM] ([ID], [TAP], [LINK], [NGAY], [MAPHIM]) VALUES (37, 2, N'https://www.youtube.com/embed/sDhSDO3sgYU', CAST(N'2020-05-04T00:00:00.000' AS DateTime), N'MV6')
INSERT [dbo].[CTPHIM] ([ID], [TAP], [LINK], [NGAY], [MAPHIM]) VALUES (38, 3, N'https://www.youtube.com/embed/SVgkPOtrm8Q', CAST(N'2020-05-04T00:00:00.000' AS DateTime), N'MV6')
INSERT [dbo].[CTPHIM] ([ID], [TAP], [LINK], [NGAY], [MAPHIM]) VALUES (39, 4, N'https://www.youtube.com/embed/JKV2HAf_4LY', CAST(N'2020-05-04T00:00:00.000' AS DateTime), N'MV6')
INSERT [dbo].[CTPHIM] ([ID], [TAP], [LINK], [NGAY], [MAPHIM]) VALUES (40, 5, N'https://www.youtube.com/embed/_5XRfn8yigA', CAST(N'2020-05-20T00:00:00.000' AS DateTime), N'MV6')
INSERT [dbo].[CTPHIM] ([ID], [TAP], [LINK], [NGAY], [MAPHIM]) VALUES (41, 1, N'https://www.youtube.com/embed/WhaLKagDCmc', CAST(N'2020-05-05T00:00:00.000' AS DateTime), N'MV8')
INSERT [dbo].[CTPHIM] ([ID], [TAP], [LINK], [NGAY], [MAPHIM]) VALUES (43, 3, N'https://www.youtube.com/embed/1-n40OCi3Yk', CAST(N'2020-05-05T00:00:00.000' AS DateTime), N'MV8')
INSERT [dbo].[CTPHIM] ([ID], [TAP], [LINK], [NGAY], [MAPHIM]) VALUES (44, 4, N'https://www.youtube.com/embed/wXIzHNZzuRM', CAST(N'2020-05-05T00:00:00.000' AS DateTime), N'MV8')
INSERT [dbo].[CTPHIM] ([ID], [TAP], [LINK], [NGAY], [MAPHIM]) VALUES (45, 5, N'https://www.youtube.com/embed/j9M2YCHQ2nI', CAST(N'2020-05-21T00:00:00.000' AS DateTime), N'MV8')
INSERT [dbo].[CTPHIM] ([ID], [TAP], [LINK], [NGAY], [MAPHIM]) VALUES (46, 1, N'https://www.youtube.com/embed/5_9nELUo-KU', CAST(N'2020-06-15T00:00:00.000' AS DateTime), N'MV9')
INSERT [dbo].[CTPHIM] ([ID], [TAP], [LINK], [NGAY], [MAPHIM]) VALUES (47, 2, N'https://www.youtube.com/embed/g_tD4pja1nc', CAST(N'2020-06-15T00:00:00.000' AS DateTime), N'MV9')
SET IDENTITY_INSERT [dbo].[CTPHIM] OFF
GO
INSERT [dbo].[PHIM] ([MAPHIM], [TENPHIM], [NOIDUNG], [TRANGTHAI], [NAM], [HINH], [HINH2], [SOTAP], [NGAYTHEM]) VALUES (N'MV1', N'One Piece', N'Monkey D. Luffy, 1 cậu bé rất thích Đảo hải tặc có ước mơ tìm được kho báu One Piece và trở thành Vua hải tặc - Pirate King. Lúc nhỏ, Luffy tình cờ ăn phải trái quỉ (Devil Fruit) Gomu Gomu, nó cho cơ thể cậu khả năng co dãn đàn hồi như cao su nhưng đổi lại cậu sẽ không bao giờ biết bơi. Sau đó Luffy lại được Shank cứu thoát tuy nhiên ông ta bị mất 1 cánh tay. Sau đấy Shank chia tay Luffy và để lại cho cậu cái mũ rơm (Straw Hat) và nói rằng: Sau này bao giờ thành cướp biển hãy gặp ta và trả lại nó. Chính lời nói này đã thúc đầy Luffy trở thành 1 cướp biển thật sự.

Hãy cùng theo dõi xem liệu Luffy có thể trở thành đạt được kho báu One Piece và trở thành Vua Hải Tặc không nhé.', 1, 1999, N'one-piece-cover.jpg', N'one-piece-thumbnail.jpg', 5, CAST(N'2020-05-01' AS Date))
INSERT [dbo].[PHIM] ([MAPHIM], [TENPHIM], [NOIDUNG], [TRANGTHAI], [NAM], [HINH], [HINH2], [SOTAP], [NGAYTHEM]) VALUES (N'MV10', N'Huyền thoại đôi cánh', N'Công chúa của đất nước Clow, Sakura mang một sức mạnh huyền bí có thể đi xuyên qua không gian và thời gian. Biến cố xảy ra, đôi cánh ký ức của Sakura mang sức mạnh đó xuất hiện và bị xé rách thành nhiều sợi lông vũ phân tán ở nhiều thế giới khác nhau. Mất đi ký ức, cô cận kề cái chết, và Syaoran, người bạn thời thơ ấu của cô, quyết tâm tìm lại toàn bộ những sợi lông vũ ký ức của Sakura. Theo chỉ dẫn của phù thuỷ không gian Yuuko, Syaoran, Sakura cùng Kurogane , Fye và Mokona bắt đầu cuộc hành trình xuyên không gian...', 3, 2005, N'tsubasa-reservoir-chronicle-cover.jpg', N'tsubasa-reservoir-chronicle-thumbnail.jpg', 26, CAST(N'2020-05-02' AS Date))
INSERT [dbo].[PHIM] ([MAPHIM], [TENPHIM], [NOIDUNG], [TRANGTHAI], [NAM], [HINH], [HINH2], [SOTAP], [NGAYTHEM]) VALUES (N'MV11', N'abc ', N'bcd', 1, 2020, N'1c979645ff5c22419f6dadf885d2dfc78da7e5fb5ca28-g7Yxai_fw658.jpg', N'1cf776eb6116e06ba7e8ce6340121f6190a90ea1a1a5f-H3CnSD_fw658.jpg', 0, CAST(N'2020-06-16' AS Date))
INSERT [dbo].[PHIM] ([MAPHIM], [TENPHIM], [NOIDUNG], [TRANGTHAI], [NAM], [HINH], [HINH2], [SOTAP], [NGAYTHEM]) VALUES (N'MV12', N'abc sèt', N'bcd', 1, 2020, N'02b689323015acf75f28566b4e62714e39f7fd721ee78-CDfFSj_fw658.jpg', N'0aa1c79882045fd00f2ae5cb208b3be7.jpg', 0, CAST(N'2020-06-16' AS Date))
INSERT [dbo].[PHIM] ([MAPHIM], [TENPHIM], [NOIDUNG], [TRANGTHAI], [NAM], [HINH], [HINH2], [SOTAP], [NGAYTHEM]) VALUES (N'MV2', N'Thám Tử Lừng Danh Conan', N'Mở đầu câu truyện, cậu học sinh trung học 17 tuổi (trong truyện tranh là 16) Shinichi Kudo (Jimmy Kudo) bị biến thành cậu bé Conan Edogawa. Shinichi trong phần đầu của Thám tử lừng danh Conan được miêu tả là một thám tử học đường. Trong một lần đi chơi công viên "Miền Nhiệt đới" với cô bạn từ thuở nhỏ (cũng là bạn gái) Ran Mori (Rachel Moore), cậu bị dính vào vụ án một hành khách trên Chuyến tàu tốc hành trong công viên, Kishida (Kenneth), bị giết trong một vụ án cắt đầu rùng rợn. Cậu đã làm sáng tỏ vụ án và trên đường về nhà, chứng kiến một vụ làm ăn mờ ám của những người đàn ông mặc toàn đồ đen. Kudo bị phát hiện, bị đánh ngất sau đó những người đàn ông áo đen đã cho cậu uống một thứ thuốc độc chưa qua thử nghiệm là Apotoxin-4869 (APTX4869) với mục đích thủ tiêu cậu. Tuy nhiên chất độc đã không giết chết Kudo. Khi tỉnh lại, cậu bàng hoàng nhận thấy thân thể mình đã bị teo nhỏ trong hình dạng của một cậu học sinh tiểu học.', 1, 1996, N'tham-tu-lung-danh-conan-439-cover.jpg', N'tham-tu-lung-danh-conan-439-thumbnail.jpg', 5, CAST(N'2020-05-01' AS Date))
INSERT [dbo].[PHIM] ([MAPHIM], [TENPHIM], [NOIDUNG], [TRANGTHAI], [NAM], [HINH], [HINH2], [SOTAP], [NGAYTHEM]) VALUES (N'MV3', N'Dragon Ball', N'Dragon Ball Super (Tên gọi khác : Dragon Ball Chou, 7 viên ngọc rồng siêu cấp) là một anime truyền hình dài tập của Toei Animation bắt đầu phát sóng vào ngày 05 tháng 7 năm 2015. Đó là lần đầu tiên anime Dragon Ball được sản xuất sau 18 năm và bắt đầu sau sự thất bại của Majin Boo, hòa bình đến với Trái Đất một lần nữa. Nó được phát sóng vào ngày chủ nhật tại 9:00 trên Fuji TV.

Seri phim sẽ bắt đầu từ cuộc chiến của Majin Buu Saga, sau đó sẽ tiếp đến câu chuyện của Dragon Ball Z - Battle of Gods và Sự hồi sinh của Frieza như vòng lập câu chuyện mới. Các phần tiếp theo của Dragon Ball Super (7 viên ngọc rồng siêu cấp) này sẽ diễn ra trong vũ trụ 6 với các chiến binh Z sẽ phải Siêu Ngọc Rồng mới.', 1, 2015, N'dragon-ball-super-cover.jpg', N'dragon-ball-kai-481-thumbnail.jpg', 5, CAST(N'2020-05-01' AS Date))
INSERT [dbo].[PHIM] ([MAPHIM], [TENPHIM], [NOIDUNG], [TRANGTHAI], [NAM], [HINH], [HINH2], [SOTAP], [NGAYTHEM]) VALUES (N'MV4', N'Tower Of God', N'Câu truyện xoay quanh Bam, một cậu bé sống đơn độc dưới tòa tháp bí ẩn với người bạn thân duy nhất của mình là Rachel. Ngày nọ, Rachel quyết định bước vào tòa tháp để tìm kiếm lấy những vì sao, bỏ lại Bam một mình đơn độc. Quyết định muốn tìm lại Rachel, Bam dấn thân vào cuộc hành trình nguy hiểm vượt qua các thử thách gian khó để leo lên ngọn tháp thần.', 1, 2020, N'tower-of-god-cover.png', N'tower-of-god-thumbnail.jpg', 5, CAST(N'2020-05-01' AS Date))
INSERT [dbo].[PHIM] ([MAPHIM], [TENPHIM], [NOIDUNG], [TRANGTHAI], [NAM], [HINH], [HINH2], [SOTAP], [NGAYTHEM]) VALUES (N'MV5', N'Cardcaptor Sakura SS2', N'Sakura - Thủ Lĩnh Thẻ Bài Phần 2 là một loạt shōjo manga viết và minh họa bởi nhóm nghệ sĩ nổi tiếng Nhật Bản CLAMP. Câu chuyện xoay quanh Kinomoto Sakura, một học sinh tiểu học tình cờ phát hiện ra mình đang nắm giữ một sức mạnh kì diệu sau khi vô tình giải phóng một bộ thẻ bài ma thuật đã được niêm phong nhiều năm trong một quyển sách. Sau đó cô được giao nhiệm vụ phải thu phục lại tất cả các thẻ bài đã chạy thoát nhằm ngăn chặn chúng phá hủy thế giới. Trong phần phim mới, Sakura đã trở thành học sinh cấp hai. Đó cũng là lúc Syaoran, cậu bạn pháp sư mà Sakura phải lòng đã quay trở về từ Hong Kong. Học kỳ mới bắt đầu, những người bạn mới dần xuất hiện, Sakura những tưởng cô bé có thể bắt đầu một cuộc sống nữ sinh vui vẻ và bình thường. Tuy nhiên, những giấc mơ kỳ lạ lại ập đến và đem theo những điềm báo mới. Các lá bài Clow sau khi được chuyển hóa thành lá bài Sakura ở phần một bỗng nhiên bị vô hiệu hóa. Thị trấn Tomoeda liên tiếp xuất hiện những hiện tượng lạ... Credit : Olshiro...', 1, 2018, N'sakura-phan2.jpg', N'cardcaptor-sakura-clear-card-hen-thumbnail.jpg', 5, CAST(N'2020-05-01' AS Date))
INSERT [dbo].[PHIM] ([MAPHIM], [TENPHIM], [NOIDUNG], [TRANGTHAI], [NAM], [HINH], [HINH2], [SOTAP], [NGAYTHEM]) VALUES (N'MV6', N'Cardcaptor Sakura SS1', N'Câu chuyện xoay quanh về cuộc truy bắt các thẻ bài Clow của cô bé Kinomoto Sakura và những mối quan hệ giữa cô với gia đình, bạn bè, các thẻ bài và cả người tạo ra chúng là Clow Reed.', 1, 2018, N'sakura-phan2.jpg', N'sakura_ss1.jpg', 5, CAST(N'2020-05-01' AS Date))
INSERT [dbo].[PHIM] ([MAPHIM], [TENPHIM], [NOIDUNG], [TRANGTHAI], [NAM], [HINH], [HINH2], [SOTAP], [NGAYTHEM]) VALUES (N'MV7', N'InuYasha', N'Câu truyện bắt đầu tại Feudal Nhật Bản, khi một tên bán yêu Inuyasha trộm Ngọc tứ hồn – viên ngọc mang lại sức mạnh hoàn toàn cho quỷ dữ. Inuyasha không thể lấy được bởi vì Kikyo, một pháp sư của làng, đã bắn mũi tên phong ấn và phong ấn Inu trên Goshinboku, một thần mộc cạnh khu rừng. Sau đó cô bị thương, Kikyo nói với em gái mình, Kaede, hỏa thiêu viên ngọc cùng với thể xác cô để ngăn nó rơi vào tay quỹ dữ.


Trong thời hiện đại tại Tokyo, một học sinh trung học tên Kagome Higurashi đang trên đường đến trường. Cô dừng tại giếng cạn ở nhà cô và tìm con mèo, Buyo. Lúc ấy cô bị một con yêu quái rệp kéo xuống giếng và rơi vào thời Sengoku của Nhật Bản.', 1, 2000, N'inuyasha-cover.jpg', N'inuyasha-thumbnail.jpg', 5, CAST(N'2020-05-01' AS Date))
INSERT [dbo].[PHIM] ([MAPHIM], [TENPHIM], [NOIDUNG], [TRANGTHAI], [NAM], [HINH], [HINH2], [SOTAP], [NGAYTHEM]) VALUES (N'MV8', N'Plunderer', N'Câu truyện kể về một thế giới huyền ảo được chi phối bởi những con số. Mỗi một người khi chào đời sẽ có một con số in hằn trên cơ thể gọi là "Count" nhằm để đếm sự xứng đáng của họ đối với thế giới. Nếu như Count của một người bị giảm xuống còn 0, người đó sẽ bị kéo xuống Abyss, loại bỏ khỏi thế giới mà họ đang sống. Và mẹ của cô bé Hina là người đã bị kéo xuống Abyss khi cô còn rất nhỏ. Trước khi mất, bà đã giao cho cô nhiệm vụ tìm kiếm lấy Kích Trụy Vương (hay còn được gọi là Ace/Red Baron). Tuân theo di nguyện của mẹ, Hina đã lên đường đi tìm người anh hùng huyền thoại suốt 5 năm ròng...', 1, 2020, N'plunderer-cover.jpg', N'plunderer-thumbnail.jpg', 5, CAST(N'2020-05-01' AS Date))
INSERT [dbo].[PHIM] ([MAPHIM], [TENPHIM], [NOIDUNG], [TRANGTHAI], [NAM], [HINH], [HINH2], [SOTAP], [NGAYTHEM]) VALUES (N'MV9', N'Jibaku Shounen Hanako-kun', N'Câu chuyện xoay quanh con ma trong toilet nữ Hanako-kun và Yashiro, một nữ sinh cao trung và một cậu bé pháp sư Minamoto Kou trong ngôi trường đó

', 3, 2020, N'jibaku-shounen-hanako-kun-cover.png', N'jibaku-shounen-hanako-kun-thumbnail.jpg', 12, CAST(N'2020-05-01' AS Date))
GO
INSERT [dbo].[Users] ([EMAIL], [PASSWORD], [NAME], [VERIFY], [ISADMIN]) VALUES (N'judy.mylinh1999@gmail.com', N'1111', N'MLinh', 0, 0)
INSERT [dbo].[Users] ([EMAIL], [PASSWORD], [NAME], [VERIFY], [ISADMIN]) VALUES (N'n17dcat041@student.ptithcm.edu.vn', N'1234', N'Linh', 1, 1)
INSERT [dbo].[Users] ([EMAIL], [PASSWORD], [NAME], [VERIFY], [ISADMIN]) VALUES (N'thienmoc10@gmail.com', N'123456', N'Mỹ Linh', 0, 0)
GO
ALTER TABLE [dbo].[PHIM] ADD  CONSTRAINT [DF_PHIM_TRANGTHAI]  DEFAULT ((1)) FOR [TRANGTHAI]
GO
ALTER TABLE [dbo].[PHIM] ADD  CONSTRAINT [DF_PHIM_NAM]  DEFAULT ((0)) FOR [NAM]
GO
ALTER TABLE [dbo].[PHIM] ADD  CONSTRAINT [DF_PHIM_HINH2]  DEFAULT ((0)) FOR [HINH2]
GO
ALTER TABLE [dbo].[PHIM] ADD  CONSTRAINT [DF_PHIM_SOTAP]  DEFAULT ((0)) FOR [SOTAP]
GO
ALTER TABLE [dbo].[RECORD] ADD  CONSTRAINT [DF_RECORD_EMAIL]  DEFAULT (N'Người dùng đã xoá') FOR [EMAIL]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_VERIFY]  DEFAULT ((0)) FOR [VERIFY]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_ADMIN]  DEFAULT ((0)) FOR [ISADMIN]
GO
ALTER TABLE [dbo].[BINHLUAN]  WITH CHECK ADD  CONSTRAINT [FK_BINHLUAN_PHIM] FOREIGN KEY([MAPHIM])
REFERENCES [dbo].[PHIM] ([MAPHIM])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BINHLUAN] CHECK CONSTRAINT [FK_BINHLUAN_PHIM]
GO
ALTER TABLE [dbo].[BINHLUAN]  WITH CHECK ADD  CONSTRAINT [FK_BINHLUAN_Users] FOREIGN KEY([EMAIL])
REFERENCES [dbo].[Users] ([EMAIL])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BINHLUAN] CHECK CONSTRAINT [FK_BINHLUAN_Users]
GO
ALTER TABLE [dbo].[CategoryOfPhim]  WITH CHECK ADD  CONSTRAINT [FK_CatelogyOfPhim_CATELOGY] FOREIGN KEY([MALOAI])
REFERENCES [dbo].[CATEGORY] ([MALOAI])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CategoryOfPhim] CHECK CONSTRAINT [FK_CatelogyOfPhim_CATELOGY]
GO
ALTER TABLE [dbo].[CategoryOfPhim]  WITH CHECK ADD  CONSTRAINT [FK_CatelogyOfPhim_PHIM] FOREIGN KEY([MAPHIM])
REFERENCES [dbo].[PHIM] ([MAPHIM])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CategoryOfPhim] CHECK CONSTRAINT [FK_CatelogyOfPhim_PHIM]
GO
ALTER TABLE [dbo].[CTPHIM]  WITH CHECK ADD  CONSTRAINT [FK_CTPHIM_PHIM] FOREIGN KEY([MAPHIM])
REFERENCES [dbo].[PHIM] ([MAPHIM])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CTPHIM] CHECK CONSTRAINT [FK_CTPHIM_PHIM]
GO
ALTER TABLE [dbo].[RECORD]  WITH CHECK ADD  CONSTRAINT [FK_RECORD_Users] FOREIGN KEY([EMAIL])
REFERENCES [dbo].[Users] ([EMAIL])
ON UPDATE CASCADE
ON DELETE SET DEFAULT
GO
ALTER TABLE [dbo].[RECORD] CHECK CONSTRAINT [FK_RECORD_Users]
GO
ALTER TABLE [dbo].[SUBSCRIBE]  WITH CHECK ADD  CONSTRAINT [FK_SUBSCRIBE_PHIM] FOREIGN KEY([MAPHIM])
REFERENCES [dbo].[PHIM] ([MAPHIM])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SUBSCRIBE] CHECK CONSTRAINT [FK_SUBSCRIBE_PHIM]
GO
ALTER TABLE [dbo].[SUBSCRIBE]  WITH CHECK ADD  CONSTRAINT [FK_SUBSCRIBE_Users] FOREIGN KEY([EMAIL])
REFERENCES [dbo].[Users] ([EMAIL])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SUBSCRIBE] CHECK CONSTRAINT [FK_SUBSCRIBE_Users]
GO
USE [master]
GO
ALTER DATABASE [QLPHIM] SET  READ_WRITE 
GO
