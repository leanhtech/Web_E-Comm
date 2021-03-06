USE [master]
GO
/****** Object:  Database [WEBSITE_DT]    Script Date: 5/30/2022 2:36:32 PM ******/
CREATE DATABASE [WEBSITE_DT]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WEBSITE_DT', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\WEBSITE_DT.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'WEBSITE_DT_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\WEBSITE_DT_log.ldf' , SIZE = 1072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [WEBSITE_DT] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WEBSITE_DT].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WEBSITE_DT] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WEBSITE_DT] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WEBSITE_DT] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WEBSITE_DT] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WEBSITE_DT] SET ARITHABORT OFF 
GO
ALTER DATABASE [WEBSITE_DT] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [WEBSITE_DT] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WEBSITE_DT] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WEBSITE_DT] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WEBSITE_DT] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WEBSITE_DT] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WEBSITE_DT] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WEBSITE_DT] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WEBSITE_DT] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WEBSITE_DT] SET  ENABLE_BROKER 
GO
ALTER DATABASE [WEBSITE_DT] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WEBSITE_DT] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WEBSITE_DT] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WEBSITE_DT] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WEBSITE_DT] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WEBSITE_DT] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WEBSITE_DT] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WEBSITE_DT] SET RECOVERY FULL 
GO
ALTER DATABASE [WEBSITE_DT] SET  MULTI_USER 
GO
ALTER DATABASE [WEBSITE_DT] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WEBSITE_DT] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WEBSITE_DT] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WEBSITE_DT] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [WEBSITE_DT] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'WEBSITE_DT', N'ON'
GO
USE [WEBSITE_DT]
GO
/****** Object:  Table [dbo].[address]    Script Date: 5/30/2022 2:36:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[address](
	[address_id] [int] IDENTITY(1,1) NOT NULL,
	[ward_id] [int] NOT NULL,
	[specific_address] [nvarchar](100) NULL,
 CONSTRAINT [PK_address] PRIMARY KEY CLUSTERED 
(
	[address_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cart]    Script Date: 5/30/2022 2:36:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cart](
	[product_id] [int] NOT NULL,
	[user_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
 CONSTRAINT [PK_cart] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC,
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[category]    Script Date: 5/30/2022 2:36:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category](
	[category_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[image] [nvarchar](300) NULL,
	[note] [nvarchar](300) NULL,
 CONSTRAINT [PK_category] PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[district]    Script Date: 5/30/2022 2:36:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[district](
	[district_id] [int] NOT NULL,
	[district_name] [nvarchar](100) NULL,
	[district_prefix] [nvarchar](100) NULL,
	[province_id] [int] NULL,
 CONSTRAINT [PK_district] PRIMARY KEY CLUSTERED 
(
	[district_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[feedback]    Script Date: 5/30/2022 2:36:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[feedback](
	[user_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[date] [date] NOT NULL,
	[comment] [nvarchar](2000) NULL,
	[vote] [int] NULL,
 CONSTRAINT [PK_feedback] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC,
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order]    Script Date: 5/30/2022 2:36:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[date] [date] NOT NULL,
	[total_price] [numeric](18, 2) NOT NULL,
	[status_id] [int] NOT NULL,
	[user_id] [int] NOT NULL,
 CONSTRAINT [PK_order] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_detail]    Script Date: 5/30/2022 2:36:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_detail](
	[order_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[item_price] [numeric](18, 2) NOT NULL,
 CONSTRAINT [PK_order_detail] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC,
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_status]    Script Date: 5/30/2022 2:36:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_status](
	[status_id] [int] IDENTITY(1,1) NOT NULL,
	[description] [nvarchar](50) NULL,
 CONSTRAINT [PK_status] PRIMARY KEY CLUSTERED 
(
	[status_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[permission]    Script Date: 5/30/2022 2:36:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[permission](
	[permission_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_permission] PRIMARY KEY CLUSTERED 
(
	[permission_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[poster]    Script Date: 5/30/2022 2:36:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[poster](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](300) NULL,
	[type] [int] NULL,
	[isActive] [bit] NULL,
 CONSTRAINT [PK_poster] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product]    Script Date: 5/30/2022 2:36:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[product_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](200) NOT NULL,
	[description] [nvarchar](1000) NULL,
	[image] [nvarchar](300) NULL,
	[price] [int] NULL,
	[specification] [nvarchar](300) NULL,
	[calculation_unit] [nvarchar](100) NULL,
	[discount] [int] NULL,
	[sold_quantity] [int] NULL,
	[quantity] [int] NOT NULL,
	[category_id] [int] NOT NULL,
	[display] [nvarchar](30) NULL,
	[resolution] [nvarchar](30) NULL,
	[system] [nvarchar](50) NULL,
	[CPU] [nvarchar](50) NULL,
	[RAM] [nvarchar](50) NULL,
	[SIM] [nvarchar](100) NULL,
	[battery] [nvarchar](100) NULL,
	[status] [bit] NOT NULL,
 CONSTRAINT [PK_product] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[province]    Script Date: 5/30/2022 2:36:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[province](
	[province_id] [int] NOT NULL,
	[province_name] [nvarchar](100) NULL,
	[province_code] [nvarchar](20) NULL,
 CONSTRAINT [PK_province] PRIMARY KEY CLUSTERED 
(
	[province_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 5/30/2022 2:36:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NOT NULL,
	[password] [nvarchar](100) NULL,
	[first_name] [nvarchar](50) NULL,
	[last_name] [nvarchar](100) NULL,
	[image] [nvarchar](300) NULL,
	[address_id] [int] NULL,
	[email] [nvarchar](100) NOT NULL,
	[phone] [nvarchar](20) NULL,
	[created_at] [date] NOT NULL,
	[permission_id] [int] NOT NULL,
	[status] [bit] NOT NULL,
 CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ward]    Script Date: 5/30/2022 2:36:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ward](
	[ward_id] [int] NOT NULL,
	[ward_name] [nvarchar](50) NOT NULL,
	[ward_prefix] [nvarchar](20) NULL,
	[district_id] [int] NULL,
 CONSTRAINT [PK_ward] PRIMARY KEY CLUSTERED 
(
	[ward_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[address] ON 

INSERT [dbo].[address] ([address_id], [ward_id], [specific_address]) VALUES (1, 173, N'1/15C kp3 tổ 38')
INSERT [dbo].[address] ([address_id], [ward_id], [specific_address]) VALUES (2, 173, N'1/10D')
INSERT [dbo].[address] ([address_id], [ward_id], [specific_address]) VALUES (3, 191, N'1/15CF')
INSERT [dbo].[address] ([address_id], [ward_id], [specific_address]) VALUES (4, 94, N'123')
INSERT [dbo].[address] ([address_id], [ward_id], [specific_address]) VALUES (5, 1, N'123')
INSERT [dbo].[address] ([address_id], [ward_id], [specific_address]) VALUES (6, 1, NULL)
INSERT [dbo].[address] ([address_id], [ward_id], [specific_address]) VALUES (7, 1, NULL)
INSERT [dbo].[address] ([address_id], [ward_id], [specific_address]) VALUES (8, 94, N'1/1D')
INSERT [dbo].[address] ([address_id], [ward_id], [specific_address]) VALUES (9, 143, N'2/3C')
INSERT [dbo].[address] ([address_id], [ward_id], [specific_address]) VALUES (10, 1, N'')
INSERT [dbo].[address] ([address_id], [ward_id], [specific_address]) VALUES (11, 1, N'')
INSERT [dbo].[address] ([address_id], [ward_id], [specific_address]) VALUES (12, 1, N'')
INSERT [dbo].[address] ([address_id], [ward_id], [specific_address]) VALUES (13, 66, N'')
INSERT [dbo].[address] ([address_id], [ward_id], [specific_address]) VALUES (14, 84, N'12')
INSERT [dbo].[address] ([address_id], [ward_id], [specific_address]) VALUES (15, 98, N'')
INSERT [dbo].[address] ([address_id], [ward_id], [specific_address]) VALUES (16, 1, N'7/6H')
INSERT [dbo].[address] ([address_id], [ward_id], [specific_address]) VALUES (17, 1, N'2/3C')
INSERT [dbo].[address] ([address_id], [ward_id], [specific_address]) VALUES (18, 1, N'')
INSERT [dbo].[address] ([address_id], [ward_id], [specific_address]) VALUES (19, 1, N'')
INSERT [dbo].[address] ([address_id], [ward_id], [specific_address]) VALUES (20, 1, NULL)
INSERT [dbo].[address] ([address_id], [ward_id], [specific_address]) VALUES (21, 191, N'1/1YH')
INSERT [dbo].[address] ([address_id], [ward_id], [specific_address]) VALUES (22, 195, N'45F')
INSERT [dbo].[address] ([address_id], [ward_id], [specific_address]) VALUES (23, 173, NULL)
INSERT [dbo].[address] ([address_id], [ward_id], [specific_address]) VALUES (24, 173, NULL)
INSERT [dbo].[address] ([address_id], [ward_id], [specific_address]) VALUES (25, 173, NULL)
INSERT [dbo].[address] ([address_id], [ward_id], [specific_address]) VALUES (26, 173, NULL)
INSERT [dbo].[address] ([address_id], [ward_id], [specific_address]) VALUES (27, 173, NULL)
INSERT [dbo].[address] ([address_id], [ward_id], [specific_address]) VALUES (28, 173, NULL)
INSERT [dbo].[address] ([address_id], [ward_id], [specific_address]) VALUES (29, 173, NULL)
INSERT [dbo].[address] ([address_id], [ward_id], [specific_address]) VALUES (30, 173, NULL)
INSERT [dbo].[address] ([address_id], [ward_id], [specific_address]) VALUES (31, 173, NULL)
INSERT [dbo].[address] ([address_id], [ward_id], [specific_address]) VALUES (32, 173, NULL)
INSERT [dbo].[address] ([address_id], [ward_id], [specific_address]) VALUES (33, 173, NULL)
INSERT [dbo].[address] ([address_id], [ward_id], [specific_address]) VALUES (34, 173, NULL)
INSERT [dbo].[address] ([address_id], [ward_id], [specific_address]) VALUES (35, 173, NULL)
INSERT [dbo].[address] ([address_id], [ward_id], [specific_address]) VALUES (36, 173, NULL)
INSERT [dbo].[address] ([address_id], [ward_id], [specific_address]) VALUES (37, 173, NULL)
INSERT [dbo].[address] ([address_id], [ward_id], [specific_address]) VALUES (38, 173, NULL)
INSERT [dbo].[address] ([address_id], [ward_id], [specific_address]) VALUES (39, 173, NULL)
INSERT [dbo].[address] ([address_id], [ward_id], [specific_address]) VALUES (40, 173, NULL)
INSERT [dbo].[address] ([address_id], [ward_id], [specific_address]) VALUES (41, 173, NULL)
INSERT [dbo].[address] ([address_id], [ward_id], [specific_address]) VALUES (42, 173, NULL)
INSERT [dbo].[address] ([address_id], [ward_id], [specific_address]) VALUES (43, 173, NULL)
INSERT [dbo].[address] ([address_id], [ward_id], [specific_address]) VALUES (44, 173, NULL)
INSERT [dbo].[address] ([address_id], [ward_id], [specific_address]) VALUES (45, 173, NULL)
INSERT [dbo].[address] ([address_id], [ward_id], [specific_address]) VALUES (46, 16, N'277 Bưng Ông Thoàn')
INSERT [dbo].[address] ([address_id], [ward_id], [specific_address]) VALUES (47, 1, N'277 bưng ông thoàn')
INSERT [dbo].[address] ([address_id], [ward_id], [specific_address]) VALUES (48, 173, NULL)
SET IDENTITY_INSERT [dbo].[address] OFF
GO
SET IDENTITY_INSERT [dbo].[category] ON 

INSERT [dbo].[category] ([category_id], [name], [image], [note]) VALUES (1, N'Iphone', N'iPhone.jpg', NULL)
INSERT [dbo].[category] ([category_id], [name], [image], [note]) VALUES (2, N'Samsung', N'samsung.jpg', NULL)
INSERT [dbo].[category] ([category_id], [name], [image], [note]) VALUES (3, N'Xiaomi', N'xiaomi.png', NULL)
INSERT [dbo].[category] ([category_id], [name], [image], [note]) VALUES (4, N'OPPO', N'oppo.png', NULL)
INSERT [dbo].[category] ([category_id], [name], [image], [note]) VALUES (5, N'Nokia', N'nokia.png', NULL)
INSERT [dbo].[category] ([category_id], [name], [image], [note]) VALUES (6, N'Realmi', N'realme.png', NULL)
INSERT [dbo].[category] ([category_id], [name], [image], [note]) VALUES (7, N'Vivo', N'220525221532vivo.png', N'')
INSERT [dbo].[category] ([category_id], [name], [image], [note]) VALUES (8, N'Vsmart', N'220525221722logo-vsmart.png', N'')
INSERT [dbo].[category] ([category_id], [name], [image], [note]) VALUES (9, N'Asus', N'220525221626asus.png', N'')
INSERT [dbo].[category] ([category_id], [name], [image], [note]) VALUES (10, N'OnePlus', N'220525221639oneplus.png', N'')
INSERT [dbo].[category] ([category_id], [name], [image], [note]) VALUES (11, N'Nubia', N'220525221651nubia.png', N'')
INSERT [dbo].[category] ([category_id], [name], [image], [note]) VALUES (12, N'Tecno', N'220525221708tecno.png', N'')
SET IDENTITY_INSERT [dbo].[category] OFF
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (1, N'Bình Chánh', N'Huyện', 1)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (2, N'Bình Tân', N'Quận', 1)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (3, N'Bình Thạnh', N'Quận', 1)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (4, N'Cần Giờ', N'Huyện', 1)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (5, N'Củ Chi', N'Huyện', 1)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (6, N'Gò Vấp', N'Quận', 1)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (7, N'Hóc Môn', N'Huyện', 1)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (8, N'Nhà Bè', N'Huyện', 1)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (9, N'Phú Nhuận', N'Quận', 1)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (10, N'Quận 1', N'', 1)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (11, N'Quận 10', N'', 1)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (12, N'Quận 11', N'', 1)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (13, N'Quận 12', N'', 1)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (14, N'Quận 2', N'', 1)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (15, N'Quận 3', N'', 1)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (16, N'Quận 4', N'', 1)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (17, N'Quận 5', N'', 1)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (18, N'Quận 6', N'', 1)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (19, N'Quận 7', N'', 1)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (20, N'Quận 8', N'', 1)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (21, N'Quận 9', N'', 1)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (22, N'Tân Bình', N'Quận', 1)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (23, N'Tân Phú', N'Quận', 1)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (24, N'Thủ Đức', N'Quận', 1)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (25, N'Ba Đình', N'Quận', 2)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (26, N'Ba Vì', N'Huyện', 2)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (27, N'Bắc Từ Liêm', N'Quận', 2)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (28, N'Cầu Giấy', N'Quận', 2)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (29, N'Chương Mỹ', N'Huyện', 2)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (30, N'Đan Phượng', N'Huyện', 2)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (31, N'Đông Anh', N'Huyện', 2)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (32, N'Đống Đa', N'Quận', 2)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (33, N'Gia Lâm', N'Huyện', 2)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (34, N'Hà Đông', N'Quận', 2)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (35, N'Hai Bà Trưng', N'Quận', 2)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (36, N'Hoài Đức', N'Huyện', 2)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (37, N'Hoàn Kiếm', N'Quận', 2)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (38, N'Hoàng Mai', N'Quận', 2)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (39, N'Long Biên', N'Quận', 2)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (40, N'Mê Linh', N'Huyện', 2)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (41, N'Mỹ Đức', N'Huyện', 2)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (42, N'Nam Từ Liêm', N'Quận', 2)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (43, N'Phú Xuyên', N'Huyện', 2)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (44, N'Phúc Thọ', N'Huyện', 2)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (45, N'Quốc Oai', N'Huyện', 2)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (46, N'Sóc Sơn', N'Huyện', 2)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (47, N'Sơn Tây', N'Thị xã', 2)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (48, N'Tây Hồ', N'Quận', 2)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (49, N'Thạch Thất', N'Huyện', 2)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (50, N'Thanh Oai', N'Huyện', 2)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (51, N'Thanh Trì', N'Huyện', 2)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (52, N'Thanh Xuân', N'Quận', 2)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (53, N'Thường Tín', N'Huyện', 2)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (54, N'Ứng Hòa', N'Huyện', 2)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (55, N'Cẩm Lệ', N'Quận', 3)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (56, N'Hải Châu', N'Quận', 3)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (57, N'Hòa Vang', N'Huyện', 3)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (58, N'Hoàng Sa', N'Huyện', 3)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (59, N'Liên Chiểu', N'Quận', 3)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (60, N'Ngũ Hành Sơn', N'Quận', 3)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (61, N'Sơn Trà', N'Quận', 3)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (62, N'Thanh Khê', N'Quận', 3)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (63, N'Bàu Bàng', N'Huyện', 4)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (64, N'Bến Cát', N'Thị xã', 4)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (65, N'Dầu Tiếng', N'Huyện', 4)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (66, N'Dĩ An', N'Thị xã', 4)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (67, N'Phú Giáo', N'Huyện', 4)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (68, N'Tân Uyên', N'Huyện', 4)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (69, N'Thủ Dầu Một', N'Thị xã', 4)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (70, N'Thuận An', N'Huyện', 4)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (71, N'Biên Hòa', N'Thành phố', 5)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (72, N'Cẩm Mỹ', N'Huyện', 5)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (73, N'Định Quán', N'Huyện', 5)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (74, N'Long Khánh', N'Thị xã', 5)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (75, N'Long Thành', N'Huyện', 5)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (76, N'Nhơn Trạch', N'Huyện', 5)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (77, N'Tân Phú', N'Quận', 5)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (78, N'Thống Nhất', N'Huyện', 5)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (79, N'Trảng Bom', N'Huyện', 5)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (80, N'Vĩnh Cửu', N'Huyện', 5)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (81, N'Xuân Lộc', N'Huyện', 5)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (82, N'Cam Lâm', N'Huyện', 6)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (83, N'Cam Ranh', N'Thành phố', 6)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (84, N'Diên Khánh', N'Huyện', 6)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (85, N'Khánh Sơn', N'Huyện', 6)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (86, N'Khánh Vĩnh', N'Huyện', 6)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (87, N'Nha Trang', N'Thành phố', 6)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (88, N'Ninh Hòa', N'Thị xã', 6)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (89, N'Trường Sa', N'Huyện', 6)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (90, N'Vạn Ninh', N'Huyện', 6)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (91, N'An Dương', N'Huyện', 7)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (92, N'An Lão', N'Huyện', 7)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (93, N'Bạch Long Vĩ', N'Huyện', 7)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (94, N'Cát Hải', N'Huyện', 7)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (95, N'Đồ Sơn', N'Quận', 7)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (96, N'Dương Kinh', N'Quận', 7)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (97, N'Hải An', N'Quận', 7)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (98, N'Hồng Bàng', N'Quận', 7)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (99, N'Kiến An', N'Quận', 7)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (100, N'Kiến Thụy', N'Huyện', 7)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (101, N'Lê Chân', N'Quận', 7)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (102, N'Ngô Quyền', N'Quận', 7)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (103, N'Thủy Nguyên', N'Huyện', 7)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (104, N'Tiên Lãng', N'Huyện', 7)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (105, N'Vĩnh Bảo', N'Huyện', 7)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (106, N'Bến Lức', N'Huyện', 8)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (107, N'Cần Đước', N'Huyện', 8)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (108, N'Cần Giuộc', N'Huyện', 8)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (109, N'Châu Thành', N'Huyện', 8)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (110, N'Đức Hòa', N'Huyện', 8)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (111, N'Đức Huệ', N'Huyện', 8)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (112, N'Kiến Tường', N'Thị xã', 8)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (113, N'Mộc Hóa', N'Huyện', 8)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (114, N'Tân An', N'Thành phố', 8)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (115, N'Tân Hưng', N'Huyện', 8)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (116, N'Tân Thạnh', N'Huyện', 8)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (117, N'Tân Trụ', N'Huyện', 8)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (118, N'Thạnh Hóa', N'Huyện', 8)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (119, N'Thủ Thừa', N'Huyện', 8)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (120, N'Vĩnh Hưng', N'Huyện', 8)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (121, N'Bắc Trà My', N'Huyện', 9)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (122, N'Đại Lộc', N'Huyện', 9)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (123, N'Điện Bàn', N'Huyện', 9)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (124, N'Đông Giang', N'Huyện', 9)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (125, N'Duy Xuyên', N'Huyện', 9)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (126, N'Hiệp Đức', N'Huyện', 9)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (127, N'Hội An', N'Thành phố', 9)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (128, N'Nam Giang', N'Huyện', 9)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (129, N'Nam Trà My', N'Huyện', 9)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (130, N'Nông Sơn', N'Huyện', 9)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (131, N'Núi Thành', N'Huyện', 9)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (132, N'Phú Ninh', N'Huyện', 9)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (133, N'Phước Sơn', N'Huyện', 9)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (134, N'Quế Sơn', N'Huyện', 9)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (135, N'Tam Kỳ', N'Thành phố', 9)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (136, N'Tây Giang', N'Huyện', 9)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (137, N'Thăng Bình', N'Huyện', 9)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (138, N'Tiên Phước', N'Huyện', 9)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (139, N'Bà Rịa', N'Thị xã', 10)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (140, N'Châu Đức', N'Huyện', 10)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (141, N'Côn Đảo', N'Huyện', 10)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (142, N'Đất Đỏ', N'Huyện', 10)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (143, N'Long Điền', N'Huyện', 10)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (144, N'Tân Thành', N'Huyện', 10)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (145, N'Vũng Tàu', N'Thành phố', 10)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (146, N'Xuyên Mộc', N'Huyện', 10)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (147, N'Buôn Đôn', N'Huyện', 11)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (148, N'Buôn Hồ', N'Thị xã', 11)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (149, N'Buôn Ma Thuột', N'Thành phố', 11)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (150, N'Cư Kuin', N'Huyện', 11)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (151, N'Cư M''gar', N'Huyện', 11)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (152, N'Ea H''Leo', N'Huyện', 11)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (153, N'Ea Kar', N'Huyện', 11)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (154, N'Ea Súp', N'Huyện', 11)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (155, N'Krông Ana', N'Huyện', 11)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (156, N'Krông Bông', N'Huyện', 11)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (157, N'Krông Buk', N'Huyện', 11)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (158, N'Krông Năng', N'Huyện', 11)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (159, N'Krông Pắc', N'Huyện', 11)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (160, N'Lăk', N'Huyện', 11)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (161, N'M''Đrăk', N'Huyện', 11)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (162, N' Thới Lai', N'Huyện', 12)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (163, N'Bình Thủy', N'Quận', 12)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (164, N'Cái Răng', N'Quận', 12)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (165, N'Cờ Đỏ', N'Huyện', 12)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (166, N'Ninh Kiều', N'Quận', 12)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (167, N'Ô Môn', N'Quận', 12)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (168, N'Phong Điền', N'Huyện', 12)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (169, N'Thốt Nốt', N'Quận', 12)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (170, N'Vĩnh Thạnh', N'Huyện', 12)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (171, N'Bắc Bình', N'Huyện', 13)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (172, N'Đảo Phú Quý', N'Huyện', 13)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (173, N'Đức Linh', N'Huyện', 13)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (174, N'Hàm Tân', N'Huyện', 13)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (175, N'Hàm Thuận Bắc', N'Huyện', 13)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (176, N'Hàm Thuận Nam', N'Huyện', 13)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (177, N'La Gi', N'Thị xã', 13)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (178, N'Phan Thiết', N'Thành phố', 13)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (179, N'Tánh Linh', N'Huyện', 13)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (180, N'Tuy Phong', N'Huyện', 13)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (181, N'Bảo Lâm', N'Huyện', 14)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (182, N'Bảo Lộc', N'Thành phố', 14)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (183, N'Cát Tiên', N'Huyện', 14)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (184, N'Đạ Huoai', N'Huyện', 14)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (185, N'Đà Lạt', N'Thành phố', 14)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (186, N'Đạ Tẻh', N'Huyện', 14)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (187, N'Đam Rông', N'Huyện', 14)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (188, N'Di Linh', N'Huyện', 14)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (189, N'Đơn Dương', N'Huyện', 14)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (190, N'Đức Trọng', N'Huyện', 14)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (191, N'Lạc Dương', N'Huyện', 14)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (192, N'Lâm Hà', N'Huyện', 14)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (193, N'A Lưới', N'Huyện', 15)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (194, N'Huế', N'Thành phố', 15)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (195, N'Hương Thủy', N'Thị xã', 15)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (196, N'Hương Trà', N'Huyện', 15)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (197, N'Nam Đông', N'Huyện', 15)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (198, N'Phong Điền', N'Huyện', 15)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (199, N'Phú Lộc', N'Huyện', 15)
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (200, N'Phú Vang', N'Huyện', 15)
GO
INSERT [dbo].[feedback] ([user_id], [product_id], [date], [comment], [vote]) VALUES (21, 42, CAST(N'2022-05-25' AS Date), N'hay', NULL)
INSERT [dbo].[feedback] ([user_id], [product_id], [date], [comment], [vote]) VALUES (21, 63, CAST(N'2022-05-28' AS Date), N'dep', NULL)
INSERT [dbo].[feedback] ([user_id], [product_id], [date], [comment], [vote]) VALUES (44, 42, CAST(N'2022-05-28' AS Date), N'dep', NULL)
INSERT [dbo].[feedback] ([user_id], [product_id], [date], [comment], [vote]) VALUES (45, 40, CAST(N'2022-05-29' AS Date), N'sản phẩm tốt, đúng với hình, đánh giá shop 5 ⭐', NULL)
GO
SET IDENTITY_INSERT [dbo].[order] ON 

INSERT [dbo].[order] ([order_id], [date], [total_price], [status_id], [user_id]) VALUES (35, CAST(N'2022-05-28' AS Date), CAST(9000000.00 AS Numeric(18, 2)), 4, 44)
INSERT [dbo].[order] ([order_id], [date], [total_price], [status_id], [user_id]) VALUES (36, CAST(N'2022-05-28' AS Date), CAST(18900000.00 AS Numeric(18, 2)), 4, 21)
INSERT [dbo].[order] ([order_id], [date], [total_price], [status_id], [user_id]) VALUES (37, CAST(N'2022-05-29' AS Date), CAST(93998000.00 AS Numeric(18, 2)), 4, 45)
INSERT [dbo].[order] ([order_id], [date], [total_price], [status_id], [user_id]) VALUES (38, CAST(N'2022-05-29' AS Date), CAST(9000000.00 AS Numeric(18, 2)), 3, 45)
INSERT [dbo].[order] ([order_id], [date], [total_price], [status_id], [user_id]) VALUES (39, CAST(N'2022-05-29' AS Date), CAST(11979000.00 AS Numeric(18, 2)), 2, 45)
INSERT [dbo].[order] ([order_id], [date], [total_price], [status_id], [user_id]) VALUES (40, CAST(N'2022-05-30' AS Date), CAST(9000000.00 AS Numeric(18, 2)), 1, 45)
INSERT [dbo].[order] ([order_id], [date], [total_price], [status_id], [user_id]) VALUES (41, CAST(N'2022-05-30' AS Date), CAST(1999000.00 AS Numeric(18, 2)), 1, 45)
INSERT [dbo].[order] ([order_id], [date], [total_price], [status_id], [user_id]) VALUES (42, CAST(N'2022-05-30' AS Date), CAST(4998000.00 AS Numeric(18, 2)), 1, 45)
SET IDENTITY_INSERT [dbo].[order] OFF
GO
INSERT [dbo].[order_detail] ([order_id], [product_id], [quantity], [item_price]) VALUES (35, 42, 1, CAST(9000000.00 AS Numeric(18, 2)))
INSERT [dbo].[order_detail] ([order_id], [product_id], [quantity], [item_price]) VALUES (36, 63, 10, CAST(1890000.00 AS Numeric(18, 2)))
INSERT [dbo].[order_detail] ([order_id], [product_id], [quantity], [item_price]) VALUES (37, 40, 1, CAST(90000000.00 AS Numeric(18, 2)))
INSERT [dbo].[order_detail] ([order_id], [product_id], [quantity], [item_price]) VALUES (37, 51, 2, CAST(1999000.00 AS Numeric(18, 2)))
INSERT [dbo].[order_detail] ([order_id], [product_id], [quantity], [item_price]) VALUES (38, 42, 1, CAST(9000000.00 AS Numeric(18, 2)))
INSERT [dbo].[order_detail] ([order_id], [product_id], [quantity], [item_price]) VALUES (39, 42, 1, CAST(9000000.00 AS Numeric(18, 2)))
INSERT [dbo].[order_detail] ([order_id], [product_id], [quantity], [item_price]) VALUES (39, 48, 1, CAST(980000.00 AS Numeric(18, 2)))
INSERT [dbo].[order_detail] ([order_id], [product_id], [quantity], [item_price]) VALUES (39, 51, 1, CAST(1999000.00 AS Numeric(18, 2)))
INSERT [dbo].[order_detail] ([order_id], [product_id], [quantity], [item_price]) VALUES (40, 42, 1, CAST(9000000.00 AS Numeric(18, 2)))
INSERT [dbo].[order_detail] ([order_id], [product_id], [quantity], [item_price]) VALUES (41, 53, 1, CAST(1999000.00 AS Numeric(18, 2)))
INSERT [dbo].[order_detail] ([order_id], [product_id], [quantity], [item_price]) VALUES (42, 51, 1, CAST(1999000.00 AS Numeric(18, 2)))
INSERT [dbo].[order_detail] ([order_id], [product_id], [quantity], [item_price]) VALUES (42, 60, 1, CAST(2999000.00 AS Numeric(18, 2)))
GO
SET IDENTITY_INSERT [dbo].[order_status] ON 

INSERT [dbo].[order_status] ([status_id], [description]) VALUES (1, N'Chờ xử lý')
INSERT [dbo].[order_status] ([status_id], [description]) VALUES (2, N'Yêu cầu hủy')
INSERT [dbo].[order_status] ([status_id], [description]) VALUES (3, N'Đang giao')
INSERT [dbo].[order_status] ([status_id], [description]) VALUES (4, N'Đã giao')
INSERT [dbo].[order_status] ([status_id], [description]) VALUES (5, N'Đã hủy')
SET IDENTITY_INSERT [dbo].[order_status] OFF
GO
SET IDENTITY_INSERT [dbo].[permission] ON 

INSERT [dbo].[permission] ([permission_id], [name]) VALUES (1, N'Khách hàng')
INSERT [dbo].[permission] ([permission_id], [name]) VALUES (2, N'Admin')
SET IDENTITY_INSERT [dbo].[permission] OFF
GO
SET IDENTITY_INSERT [dbo].[poster] ON 

INSERT [dbo].[poster] ([id], [name], [type], [isActive]) VALUES (1, N'pt1.jpg', 1, 0)
INSERT [dbo].[poster] ([id], [name], [type], [isActive]) VALUES (2, N'pt2.jpg', 1, 0)
INSERT [dbo].[poster] ([id], [name], [type], [isActive]) VALUES (3, N'poster15.jpg', 1, 0)
INSERT [dbo].[poster] ([id], [name], [type], [isActive]) VALUES (4, N'poster14.jpg', 2, 0)
INSERT [dbo].[poster] ([id], [name], [type], [isActive]) VALUES (5, N'220521203258pt2.jpg', 1, 0)
INSERT [dbo].[poster] ([id], [name], [type], [isActive]) VALUES (6, N'220522001014flip_3.png', 1, 0)
INSERT [dbo].[poster] ([id], [name], [type], [isActive]) VALUES (7, N'220522001049red_magic_7.png', 2, 0)
INSERT [dbo].[poster] ([id], [name], [type], [isActive]) VALUES (1007, N'220525222448flip_3.png', 1, 1)
INSERT [dbo].[poster] ([id], [name], [type], [isActive]) VALUES (1008, N'220525222453red_magic_7.png', 1, 1)
INSERT [dbo].[poster] ([id], [name], [type], [isActive]) VALUES (1009, N'220525222538Screenshot 2022-05-25 222517.jpg', 1, 1)
INSERT [dbo].[poster] ([id], [name], [type], [isActive]) VALUES (1010, N'220525222622cc.jpg', 2, 0)
INSERT [dbo].[poster] ([id], [name], [type], [isActive]) VALUES (1011, N'220528002242143391094_147232800544163_2716395109084390202_n.jpg', 2, 0)
INSERT [dbo].[poster] ([id], [name], [type], [isActive]) VALUES (1012, N'220528021043like.png', 2, 0)
INSERT [dbo].[poster] ([id], [name], [type], [isActive]) VALUES (1013, N'220528021048like.png', 2, 0)
INSERT [dbo].[poster] ([id], [name], [type], [isActive]) VALUES (1014, N'220528021102157708007_3273594402742225_57306351650152804_n.jpg', 2, 0)
INSERT [dbo].[poster] ([id], [name], [type], [isActive]) VALUES (1015, N'220528021243123105689_361739455036063_1994067877348046676_n.jpg', 2, 0)
INSERT [dbo].[poster] ([id], [name], [type], [isActive]) VALUES (1016, N'220528021401Screenshot 2022-05-28 021346.jpg', 2, 0)
INSERT [dbo].[poster] ([id], [name], [type], [isActive]) VALUES (1017, N'220529231044220528021401Screenshot 2022-05-28 021346.jpg', 2, 1)
SET IDENTITY_INSERT [dbo].[poster] OFF
GO
SET IDENTITY_INSERT [dbo].[product] ON 

INSERT [dbo].[product] ([product_id], [name], [description], [image], [price], [specification], [calculation_unit], [discount], [sold_quantity], [quantity], [category_id], [display], [resolution], [system], [CPU], [RAM], [SIM], [battery], [status]) VALUES (40, N'Vivo Y21s', N'Thiết kế mỏng thời thượng, 3 camera sau siêu nét độ phân giải lên tới 50MP, mạnh mẽ với công nghệ RAM mở rộng cùng dung lượng pin cực khủng, vivo Y21s sẵn sàng cùng bạn cháy hết mình trong mọi cuộc vui.', N'220525215632xiaomi-12pro.png', 5600000, N'64GB', N'aaaTai phone sony', 10, 1, 131, 7, N'6 in', N'550 x 600', N'Android 8                     ', N'Apple A13 Bionic              ', N'20GB      ', N'2 sim 2 sóng', N'1000mA', 1)
INSERT [dbo].[product] ([product_id], [name], [description], [image], [price], [specification], [calculation_unit], [discount], [sold_quantity], [quantity], [category_id], [display], [resolution], [system], [CPU], [RAM], [SIM], [battery], [status]) VALUES (42, N'Asus ROG Phone 3', N'AI Camera

Chống rung điện tử kỹ thuật số (EIS)

Góc rộng (Wide)

Góc siêu rộng (Ultrawide)

Lấy nét theo pha (PDAF)

Siêu cận (Macro)

Tự động lấy nét (AF)

Chạm lấy nét

HDR

Toàn cảnh (Panorama)', N'220525220933a73-xanh.jpg', 10000000, N'64GB', N'Không', 10, 2, 30, 9, N'7 in', N'550 x 600', N'Android 8                     ', N'Apple A13 Bionic              ', N'10GB      ', N'1 sim', N'1000mA', 1)
INSERT [dbo].[product] ([product_id], [name], [description], [image], [price], [specification], [calculation_unit], [discount], [sold_quantity], [quantity], [category_id], [display], [resolution], [system], [CPU], [RAM], [SIM], [battery], [status]) VALUES (48, N'Asus ROG Phone 5', N' ASUS ROG Phone 5 chạy chip Snapdragon 888 và đi kèm cổng cắm tai nghe 3.5 mm với tính năng ESS DAC. DxOMark cũng cho hay, ROG Phone 5 mang lại chất lượng âm thanh tốt nhất trong tất cả các điện thoại của hãng từ trước tới nay', N'220525221041asus-rog-phone-5_.jpg', 1000000, N'64GB', N'Không', 2, 0, 30, 9, N'5.5 in', N'550 x 600', N'Android 8                     ', N'Apple A13 Bionic              ', N'10GB      ', N'1 sim', N'4500 mAh33 W', 1)
INSERT [dbo].[product] ([product_id], [name], [description], [image], [price], [specification], [calculation_unit], [discount], [sold_quantity], [quantity], [category_id], [display], [resolution], [system], [CPU], [RAM], [SIM], [battery], [status]) VALUES (49, N'Asus Zenfone 2 ZE550ML 16GB 2GB RAM - Hàng Chính Hãng', N'Asus Zenfone 2 ZE550ML 16 GB 2 GB RAM được xem là quân bài chủ lực của Asus trong dịp đầu năm 2015, với những nâng cấp mang tính đột phá so với người tiền nhiệm là Zenfone 5 và có nhiều phiên bản khác nhau cho người dùng chọn lựa. Trong đó, phiên bản ZE550ML có mức giá rẻ nhất so với các phiên bản còn lại do chỉ sử dụng chip Z3560 1.8 GHz, RAM 2GB và có bộ nhớ trong 16GB, các thông số khác vẫn tương tự như màn hình 5.5 inch HD, vi xử lý lõi tứ chạy trên nền Android 5.0 Lollipop đi cùng viên pin 3000 mAh và hỗ trợ 2 SIM 2 sóng tiện dụng,', N'220525221056ASUS-ZENFONE-2-ZE550ML-16GB-.jpg', 20000000, N'64GB', N'Không', 10, 0, 20, 9, N'6.39 inches', N'1080 x 1620 pixels (FullHD+)', N'Android 10, VOS 3.0           ', N'Apple A13 Bionic              ', N'8 GB      ', N'2 SIM (Nano-SIM)', N'4500 mAh33 W', 1)
INSERT [dbo].[product] ([product_id], [name], [description], [image], [price], [specification], [calculation_unit], [discount], [sold_quantity], [quantity], [category_id], [display], [resolution], [system], [CPU], [RAM], [SIM], [battery], [status]) VALUES (50, N'Asus Zenfone Max Pro (M2) ZB631KL ', N'Hệ điều hành: Android 8.1 Oreo
Màn hình: 6.26 inch, độ phân giải 1080 x 2280 pixels, tấm nền IPS
Bộ xử lý: Qualcomm MSM8916 Snapdragon 410, 4 nhân tốc độ 1.2 GHz Cortex-A53
RAM: 6GB
Bộ nhớ trong: 64GB.', N'220525221137asus rog 3.jpg', 999000, N'64GB', N'Không', 0, 0, 100, 9, N'6.39 inches', N'550 x 600', N'IOS 10                        ', N'Đang cập nhật                 ', N'10GB      ', N'1 sim', N'4500 mAh33 W', 1)
INSERT [dbo].[product] ([product_id], [name], [description], [image], [price], [specification], [calculation_unit], [discount], [sold_quantity], [quantity], [category_id], [display], [resolution], [system], [CPU], [RAM], [SIM], [battery], [status]) VALUES (51, N'Vsmart Live 4 ', N'Vsmart Live 4 6GB mẫu smartphone gây ấn tượng với cụm 4 camera sau đa chức năng, dung lượng pin khủng và hiệu năng mạnh mẽ cùng nhiều tính năng hấp dẫn khác sẽ mang đến trải nghiệm tốt nhất đến người dùng.
Ngoại hình sang trọng tinh tế', N'220525221201vsmart-joy-4.jpg', 1999000, N'64GB', N'Không', 0, 2, 20, 8, N'6.39 inches', N'550 x 600', N'IOS 10                        ', N'Đang cập nhật                 ', N'10GB      ', N'1 sim', N'4500 mAh33 W', 1)
INSERT [dbo].[product] ([product_id], [name], [description], [image], [price], [specification], [calculation_unit], [discount], [sold_quantity], [quantity], [category_id], [display], [resolution], [system], [CPU], [RAM], [SIM], [battery], [status]) VALUES (53, N'ZTE Nubia Z20', N'ZTE Nubia Z20: Thiết kế độc đáo với 2 màn hình, chip Snapdragon 855+ siêu mạnh
ZTE Nubia Z20 cuối cùng cũng chính thức ra mắt với nhiều ưu điểm và tính năng nổi bật sau rất nhiều tin đồn rò rỉ trước đó. Cụ thể ZTE Nubia Z20 gây ấn tượng với thiết kế cao cấp, hai màn hình độc đáo với các cạnh viền siêu mỏng, bên trong Nubia Z20 là vi xử lý Snapdragon 855 Plus mạnh mẽ.', N'220525221223zte-nubia-red-7.jpg', 1999000, N'64GB', N'Không', 0, 0, 20, 11, N'6.39 inches', N'550 x 600', N'IOS 10                        ', N'Đang cập nhật                 ', N'10GB      ', N'1 sim', N'4500 mAh33 W', 1)
INSERT [dbo].[product] ([product_id], [name], [description], [image], [price], [specification], [calculation_unit], [discount], [sold_quantity], [quantity], [category_id], [display], [resolution], [system], [CPU], [RAM], [SIM], [battery], [status]) VALUES (54, N'OnePlus 6', N'OnePlus 6 màu đỏ Amber Red - Thiết kế lôi cuốn, màn hình lớn, cấu hình mạnh
 
OnePlus 6 màu đỏ cuốn hút với vẻ bề ngoài sexy, bóng bẩy, mượt mà nhưng bên trong cũng ẩn chứa một sức mạnh tuyệt vời.', N'220525221251oneplus-6-.jpg', 1499000, N'64GB', N'Không', 0, 0, 20, 10, N'6.39 inches', N'550 x 600', N'IOS 10                        ', N'Đang cập nhật                 ', N'8 GB      ', N'1 sim', N'1000mA', 1)
INSERT [dbo].[product] ([product_id], [name], [description], [image], [price], [specification], [calculation_unit], [discount], [sold_quantity], [quantity], [category_id], [display], [resolution], [system], [CPU], [RAM], [SIM], [battery], [status]) VALUES (55, N'OnePlus 7 Pro', N'Máy mới 100% xách tay chính hãng. Máy là flagship đầu tiên sở hữu bộ nhớ trong UFS 3.0 cùng với cấu hình cao cấp Snapdragon 855, 6GB RAM và có bản tới 12GB RAM, Rom 256GB cùng với giao diện cực kì nhẹ mượt m', N'220525221323oneplus-7-pro-1.jpg', 1499000, N'64GB', N'Không', 0, 0, 200, 10, N'6.39 inches', N'550 x 600', N'Android 8                     ', N'Apple A13 Bionic              ', N'10GB      ', N'1 sim', N'4500 mAh33 W', 1)
INSERT [dbo].[product] ([product_id], [name], [description], [image], [price], [specification], [calculation_unit], [discount], [sold_quantity], [quantity], [category_id], [display], [resolution], [system], [CPU], [RAM], [SIM], [battery], [status]) VALUES (57, N'Tecno Pova 2 ', N'Máy mới 100% chính hãng, bảo hành 12 tháng toàn quốc. Tecno Pova 2 sở hữu thiết kế đẹp mắt, màn hình lớn 6.9 inch, chip Helio G85, RAM 6GB chạy mượt mà mọi tác vụ, pin khủng 7000 mAh.', N'220525221405tecno-spark-6-go-2_.jpg', 1699000, N'64GB', N'Không', 0, 0, 30, 12, N'6.39 inches', N'550 x 600', N'Android 8                     ', N'Apple A13 Bionic              ', N'8 GB      ', N'1 sim', N'1000mA', 1)
INSERT [dbo].[product] ([product_id], [name], [description], [image], [price], [specification], [calculation_unit], [discount], [sold_quantity], [quantity], [category_id], [display], [resolution], [system], [CPU], [RAM], [SIM], [battery], [status]) VALUES (59, N'Vivo V23e ', N'Với vivo V23e, mọi khuôn hình selfie của bạn sẽ đẹp lung linh nhờ sự trợ giúp của camera selfie 50MP kết hợp cùng công nghệ Eye Autofocus. Ngoài ra, vivo đã thành công trong việc đưa hàng loạt tính năng đỉnh cao của hãng vào bộ khung vỏ mỏng nhẹ, thời trang, đầy phong cách.', N'220528013415154299555_3698888780179826_1657072332698903061_n.jpg', 2699000, N'64GB', N'Không', 0, 0, 30, 7, N'6.39 inches', N'550 x 600', N'Android 8                     ', N'Apple A13 Bionic              ', N'8 GB      ', N'1 sim', N'4500 mAh33 W', 1)
INSERT [dbo].[product] ([product_id], [name], [description], [image], [price], [specification], [calculation_unit], [discount], [sold_quantity], [quantity], [category_id], [display], [resolution], [system], [CPU], [RAM], [SIM], [battery], [status]) VALUES (60, N'Điện thoại Vsmart Live ', N'Vsmart Live (6GB/64GB) là chiếc smartphone thế hệ thứ 2 của Vsmart vừa ra mắt với nhiều ưu điểm rất hấp dẫn hứa hẹn sẽ mang lại sự thành công cho hãng smartphone Việt này.
Màn hình kích thước lớn, không khuyết điểm', N'220530014253vsmartlive.jpg', 2999000, N'64GB', N'Không', 0, 0, 30, 8, N'6.39 inches', N'550 x 600', N'Android 8                     ', N'Apple A13 Bionic              ', N'8 GB      ', N'1 sim', N'5000ma', 1)
INSERT [dbo].[product] ([product_id], [name], [description], [image], [price], [specification], [calculation_unit], [discount], [sold_quantity], [quantity], [category_id], [display], [resolution], [system], [CPU], [RAM], [SIM], [battery], [status]) VALUES (61, N'ZTE Nubia Red Magic 6 ', N'  Công ty gọi thiết kế của RedMagic 6 là Mecha Sci-Fi. Nó có họa tiết sợi carbon ở mặt sau và cũng có hệ thống đèn led để phù hợp với chủ đề gaming. Ngoài ra mặt lưng cũng có logo RedMagic và Tencent phát sáng. Người dùng có 2 lựa chọn màu sắc là Carbon Fiber Black và Cyber Neon.', N'220528021526xiaomi-12pro.png', 2100000, N'64GB', N'Không', 0, 0, 30, 11, N'6.39 inches', N'550 x 600', N'Android 8                     ', N'Apple A13 Bionic              ', N'8 GB      ', N'1 sim', N'5000ma', 1)
INSERT [dbo].[product] ([product_id], [name], [description], [image], [price], [specification], [calculation_unit], [discount], [sold_quantity], [quantity], [category_id], [display], [resolution], [system], [CPU], [RAM], [SIM], [battery], [status]) VALUES (62, N'TECNO SPARK 7T', N'Thiết kế thời thượng cùng màn hình 6.5 inch tràn viền
Tecno Spark 7T sở hữu thiết kế thời thượng với cụm camera được thiết kế tinh tế giúp tạo điểm nhấn cho mặt lưng. Đặc biệt hơn, ở mặt lưng của máy nổi bật lên logo SPARK độc đáo được bao quanh bởi những đường vân chéo vừa tạo nét đẹp thời thượng, vừa mang đến cảm giác cầm nắm chắc chắn cho người dùng khi sử dụng. ', N'220528021611Realme 6.png', 2100000, N'64GB', N'Tai phone sony', 10, 0, 30, 12, N'6.39 inches', N'550 x 600', N'Android 10, VOS 3.0           ', N'Đang cập nhật                 ', N'8 GB      ', N'1 sim', N'5000ma', 1)
INSERT [dbo].[product] ([product_id], [name], [description], [image], [price], [specification], [calculation_unit], [discount], [sold_quantity], [quantity], [category_id], [display], [resolution], [system], [CPU], [RAM], [SIM], [battery], [status]) VALUES (63, N'Vivo Y21s', N'Thiết kế mỏng thời thượng, 3 camera sau siêu nét độ phân giải lên tới 50MP, mạnh mẽ với công nghệ RAM mở rộng cùng dung lượng pin cực khủng, vivo Y21s sẵn sàng cùng bạn cháy hết mình trong mọi cuộc vui.', N'220528021637xiaomi-12pro.png', 2100000, N'10gb', N'Không', 10, 10, 30, 7, N'6.39 inches', N'550 x 600', N'Android 10, VOS 3.0           ', N'Đang cập nhật                 ', N'8 GB      ', N'2 sim', N'5000ma', 1)
INSERT [dbo].[product] ([product_id], [name], [description], [image], [price], [specification], [calculation_unit], [discount], [sold_quantity], [quantity], [category_id], [display], [resolution], [system], [CPU], [RAM], [SIM], [battery], [status]) VALUES (65, N'xx', N'', N'zte-nubia-x-.jpg', 2100000, N'dd', N'Không', 10, 0, 10, 1, N'6.39 inches', N'550 x 600', N'Android 10, VOS 3.0           ', N'Đang cập nhật                 ', N'8 GB      ', N'2 sim', N'4500 mAh33 W', 0)
INSERT [dbo].[product] ([product_id], [name], [description], [image], [price], [specification], [calculation_unit], [discount], [sold_quantity], [quantity], [category_id], [display], [resolution], [system], [CPU], [RAM], [SIM], [battery], [status]) VALUES (67, N'sa', N'', N'220521224320157708007_3273594402742225_57306351650152804_n.jpg', 1000000, N'as', N'Không', 1, 0, 10, 1, N'6.39 inches', N'550 x 600', N'Android 10, VOS 3.0           ', N'Đang cập nhật                 ', N'8 GB      ', N'2 sim', N'4500 mAh33 W', 0)
INSERT [dbo].[product] ([product_id], [name], [description], [image], [price], [specification], [calculation_unit], [discount], [sold_quantity], [quantity], [category_id], [display], [resolution], [system], [CPU], [RAM], [SIM], [battery], [status]) VALUES (68, N'cc', N'', N'220521203346zte-nubia-red-magic-3-.jpg', 2100000, N'da', N'Không', 2, 0, 10, 2, N'6.39 inches', N'550 x 600', N'Android 10, VOS 3.0           ', N'Đang cập nhật                 ', N'8 GB      ', N'2 sim', N'4500 mAh33 W', 0)
INSERT [dbo].[product] ([product_id], [name], [description], [image], [price], [specification], [calculation_unit], [discount], [sold_quantity], [quantity], [category_id], [display], [resolution], [system], [CPU], [RAM], [SIM], [battery], [status]) VALUES (69, N'cca', N'', N'220521203420143391094_147232800544163_2716395109084390202_n.jpg', 2100000, N'da', N'Không', 2, 0, 10, 2, N'6.39 inches', N'550 x 600', N'Android 10, VOS 3.0           ', N'Đang cập nhật                 ', N'8 GB      ', N'2 sim', N'4500 mAh33 W', 0)
INSERT [dbo].[product] ([product_id], [name], [description], [image], [price], [specification], [calculation_unit], [discount], [sold_quantity], [quantity], [category_id], [display], [resolution], [system], [CPU], [RAM], [SIM], [battery], [status]) VALUES (70, N'neno', N'đẹp, mạnh', N'default.png', 15000000, N'64GB', N'sạc, tai nghe', 0, 0, 3, 4, N'', N'', N'                              ', N'                              ', N'          ', N'', N'', 0)
INSERT [dbo].[product] ([product_id], [name], [description], [image], [price], [specification], [calculation_unit], [discount], [sold_quantity], [quantity], [category_id], [display], [resolution], [system], [CPU], [RAM], [SIM], [battery], [status]) VALUES (71, N'phone 10', N'dep', N'default.png', 10000000, N'128GB', N'khong', 0, 0, 10, 1, N'', N'', N'', N'', N'', N'', N'', 1)
SET IDENTITY_INSERT [dbo].[product] OFF
GO
INSERT [dbo].[province] ([province_id], [province_name], [province_code]) VALUES (1, N'Hồ Chí Minh', N'SG')
INSERT [dbo].[province] ([province_id], [province_name], [province_code]) VALUES (2, N'Hà Nội', N'HN')
INSERT [dbo].[province] ([province_id], [province_name], [province_code]) VALUES (3, N'Đà Nẵng', N'DDN')
INSERT [dbo].[province] ([province_id], [province_name], [province_code]) VALUES (4, N'Bình Dương', N'BD')
INSERT [dbo].[province] ([province_id], [province_name], [province_code]) VALUES (5, N'Đồng Nai', N'DNA')
INSERT [dbo].[province] ([province_id], [province_name], [province_code]) VALUES (6, N'Khánh Hòa', N'KH')
INSERT [dbo].[province] ([province_id], [province_name], [province_code]) VALUES (7, N'Hải Phòng', N'HP')
INSERT [dbo].[province] ([province_id], [province_name], [province_code]) VALUES (8, N'Long An', N'LA')
INSERT [dbo].[province] ([province_id], [province_name], [province_code]) VALUES (9, N'Quảng Nam', N'QNA')
INSERT [dbo].[province] ([province_id], [province_name], [province_code]) VALUES (10, N'Bà Rịa Vũng Tàu', N'VT')
INSERT [dbo].[province] ([province_id], [province_name], [province_code]) VALUES (11, N'Đắk Lắk', N'DDL')
INSERT [dbo].[province] ([province_id], [province_name], [province_code]) VALUES (12, N'Cần Thơ', N'CT')
INSERT [dbo].[province] ([province_id], [province_name], [province_code]) VALUES (13, N'Bình Thuận  ', N'BTH')
INSERT [dbo].[province] ([province_id], [province_name], [province_code]) VALUES (14, N'Lâm Đồng', N'LDD')
INSERT [dbo].[province] ([province_id], [province_name], [province_code]) VALUES (15, N'Thừa Thiên Huế', N'TTH')
INSERT [dbo].[province] ([province_id], [province_name], [province_code]) VALUES (16, N'Kiên Giang', N'KG')
INSERT [dbo].[province] ([province_id], [province_name], [province_code]) VALUES (17, N'Bắc Ninh', N'BN')
INSERT [dbo].[province] ([province_id], [province_name], [province_code]) VALUES (18, N'Quảng Ninh', N'QNI')
INSERT [dbo].[province] ([province_id], [province_name], [province_code]) VALUES (19, N'Thanh Hóa', N'TH')
INSERT [dbo].[province] ([province_id], [province_name], [province_code]) VALUES (20, N'Nghệ An', N'NA')
INSERT [dbo].[province] ([province_id], [province_name], [province_code]) VALUES (21, N'Hải Dương', N'HD')
INSERT [dbo].[province] ([province_id], [province_name], [province_code]) VALUES (22, N'Gia Lai', N'GL')
INSERT [dbo].[province] ([province_id], [province_name], [province_code]) VALUES (23, N'Bình Phước', N'BP')
INSERT [dbo].[province] ([province_id], [province_name], [province_code]) VALUES (24, N'Hưng Yên', N'HY')
INSERT [dbo].[province] ([province_id], [province_name], [province_code]) VALUES (25, N'Bình Định', N'BDD')
INSERT [dbo].[province] ([province_id], [province_name], [province_code]) VALUES (26, N'Tiền Giang', N'TG')
INSERT [dbo].[province] ([province_id], [province_name], [province_code]) VALUES (27, N'Thái Bình', N'TB')
INSERT [dbo].[province] ([province_id], [province_name], [province_code]) VALUES (28, N'Bắc Giang', N'BG')
INSERT [dbo].[province] ([province_id], [province_name], [province_code]) VALUES (29, N'Hòa Bình', N'HB')
INSERT [dbo].[province] ([province_id], [province_name], [province_code]) VALUES (30, N'An Giang', N'AG')
INSERT [dbo].[province] ([province_id], [province_name], [province_code]) VALUES (31, N'Vĩnh Phúc', N'VP')
INSERT [dbo].[province] ([province_id], [province_name], [province_code]) VALUES (32, N'Tây Ninh', N'TNI')
INSERT [dbo].[province] ([province_id], [province_name], [province_code]) VALUES (33, N'Thái Nguyên', N'TN')
INSERT [dbo].[province] ([province_id], [province_name], [province_code]) VALUES (34, N'Lào Cai', N'LCA')
INSERT [dbo].[province] ([province_id], [province_name], [province_code]) VALUES (35, N'Nam Định', N'NDD')
INSERT [dbo].[province] ([province_id], [province_name], [province_code]) VALUES (36, N'Quảng Ngãi', N'QNG')
INSERT [dbo].[province] ([province_id], [province_name], [province_code]) VALUES (37, N'Bến Tre', N'BTR')
INSERT [dbo].[province] ([province_id], [province_name], [province_code]) VALUES (38, N'Đắk Nông', N'DNO')
INSERT [dbo].[province] ([province_id], [province_name], [province_code]) VALUES (39, N'Cà Mau', N'CM')
INSERT [dbo].[province] ([province_id], [province_name], [province_code]) VALUES (40, N'Vĩnh Long', N'VL')
INSERT [dbo].[province] ([province_id], [province_name], [province_code]) VALUES (41, N'Ninh Bình', N'NB')
INSERT [dbo].[province] ([province_id], [province_name], [province_code]) VALUES (42, N'Phú Thọ', N'PT')
INSERT [dbo].[province] ([province_id], [province_name], [province_code]) VALUES (43, N'Ninh Thuận', N'NT')
INSERT [dbo].[province] ([province_id], [province_name], [province_code]) VALUES (44, N'Phú Yên', N'PY')
INSERT [dbo].[province] ([province_id], [province_name], [province_code]) VALUES (45, N'Hà Nam', N'HNA')
INSERT [dbo].[province] ([province_id], [province_name], [province_code]) VALUES (46, N'Hà Tĩnh', N'HT')
INSERT [dbo].[province] ([province_id], [province_name], [province_code]) VALUES (47, N'Đồng Tháp', N'DDT')
INSERT [dbo].[province] ([province_id], [province_name], [province_code]) VALUES (48, N'Sóc Trăng', N'ST')
INSERT [dbo].[province] ([province_id], [province_name], [province_code]) VALUES (49, N'Kon Tum', N'KT')
INSERT [dbo].[province] ([province_id], [province_name], [province_code]) VALUES (50, N'Quảng Bình', N'QB')
INSERT [dbo].[province] ([province_id], [province_name], [province_code]) VALUES (51, N'Quảng Trị', N'QT')
INSERT [dbo].[province] ([province_id], [province_name], [province_code]) VALUES (52, N'Trà Vinh', N'TV')
INSERT [dbo].[province] ([province_id], [province_name], [province_code]) VALUES (53, N'Hậu Giang', N'HGI')
INSERT [dbo].[province] ([province_id], [province_name], [province_code]) VALUES (54, N'Sơn La', N'SL')
INSERT [dbo].[province] ([province_id], [province_name], [province_code]) VALUES (55, N'Bạc Liêu', N'BL')
INSERT [dbo].[province] ([province_id], [province_name], [province_code]) VALUES (56, N'Yên Bái', N'YB')
INSERT [dbo].[province] ([province_id], [province_name], [province_code]) VALUES (57, N'Tuyên Quang', N'TQ')
INSERT [dbo].[province] ([province_id], [province_name], [province_code]) VALUES (58, N'Điện Biên', N'DDB')
INSERT [dbo].[province] ([province_id], [province_name], [province_code]) VALUES (59, N'Lai Châu', N'LCH')
INSERT [dbo].[province] ([province_id], [province_name], [province_code]) VALUES (60, N'Lạng Sơn', N'LS')
INSERT [dbo].[province] ([province_id], [province_name], [province_code]) VALUES (61, N'Hà Giang', N'HG')
INSERT [dbo].[province] ([province_id], [province_name], [province_code]) VALUES (62, N'Bắc Kạn', N'BK')
INSERT [dbo].[province] ([province_id], [province_name], [province_code]) VALUES (63, N'Cao Bằng', N'CB')
GO
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([user_id], [username], [password], [first_name], [last_name], [image], [address_id], [email], [phone], [created_at], [permission_id], [status]) VALUES (11, N'hoangdo', N'$2a$12$YsC9TSFvaUt8SP3LFoZjR.A864HuGaUD45spdBx2eosfgeiJ.Aeaq', N'Hoàng', N'Đỗ Huy', N'resources/images/users/220529190503ptithcm-sv.png', 1, N'quangtuong102@gmail.com', N'0396311734', CAST(N'2021-10-02' AS Date), 2, 1)
INSERT [dbo].[users] ([user_id], [username], [password], [first_name], [last_name], [image], [address_id], [email], [phone], [created_at], [permission_id], [status]) VALUES (12, N'thanhdac', N'$2a$12$YsC9TSFvaUt8SP3LFoZjR.A864HuGaUD45spdBx2eosfgeiJ.Aeaq', N'Thành ', N'Nguyễn Đắc', N'resources/images/users/220525231815242344880_920677461874313_7592673138848484462_n.jpg', 2, N'thinh@gmail.com', N'0123456789', CAST(N'2021-10-02' AS Date), 2, 1)
INSERT [dbo].[users] ([user_id], [username], [password], [first_name], [last_name], [image], [address_id], [email], [phone], [created_at], [permission_id], [status]) VALUES (19, N'admin', N'$2a$12$YsC9TSFvaUt8SP3LFoZjR.A864HuGaUD45spdBx2eosfgeiJ.Aeaq', N'Thịnh', N'Nguyễn Phúc ', N'resources/images/users/userDefaul.png', 9, N'otakuvocaloid79@gmail.com', N'0000000000', CAST(N'2021-10-28' AS Date), 2, 1)
INSERT [dbo].[users] ([user_id], [username], [password], [first_name], [last_name], [image], [address_id], [email], [phone], [created_at], [permission_id], [status]) VALUES (21, N'test', N'$2a$12$YsC9TSFvaUt8SP3LFoZjR.A864HuGaUD45spdBx2eosfgeiJ.Aeaq', N'test', N'test', N'resources/images/users/220528083240157708007_3273594402742225_57306351650152804_n.jpg', 5, N'test@gmail.com', N'0112333546', CAST(N'2021-11-16' AS Date), 1, 1)
INSERT [dbo].[users] ([user_id], [username], [password], [first_name], [last_name], [image], [address_id], [email], [phone], [created_at], [permission_id], [status]) VALUES (44, N'thinhnguyen', N'$2a$12$YsC9TSFvaUt8SP3LFoZjR.A864HuGaUD45spdBx2eosfgeiJ.Aeaq', N'Thịnh', N'Nguyễn Phúc', N'resources/images/users/220528083119260284500_299005355455531_107881347275069798_n.jpg', 32, N'quangtuong100@gmail.com', N'1234506789', CAST(N'2022-05-28' AS Date), 1, 1)
INSERT [dbo].[users] ([user_id], [username], [password], [first_name], [last_name], [image], [address_id], [email], [phone], [created_at], [permission_id], [status]) VALUES (45, N'tuongvo', N'$2a$12$YsC9TSFvaUt8SP3LFoZjR.A864HuGaUD45spdBx2eosfgeiJ.Aeaq', N'Quang Tường', N'Võ', N'resources/images/users/2205291841362 (1).jpg', 33, N'quangtuong6687@gmail.com', N'0339518617', CAST(N'2022-05-29' AS Date), 1, 1)
INSERT [dbo].[users] ([user_id], [username], [password], [first_name], [last_name], [image], [address_id], [email], [phone], [created_at], [permission_id], [status]) VALUES (55, N'anhhoang', N'$2a$12$YsC9TSFvaUt8SP3LFoZjR.A864HuGaUD45spdBx2eosfgeiJ.Aeaq', N'Anh', N'Lê Hoàng', N'resources/images/users/userDefaul.png', 45, N'phucthinh030902@gmail.com', N'0147258333', CAST(N'2022-05-29' AS Date), 1, 1)
INSERT [dbo].[users] ([user_id], [username], [password], [first_name], [last_name], [image], [address_id], [email], [phone], [created_at], [permission_id], [status]) VALUES (58, N'thanh_test', N'$2a$12$bQlR.4d9VYVDrGVXPXuGp.e7ynKmeZPA9MGhQ0thlPtebFGDFe.8G', N'Thành', N'Nguyễn Đắc ', N'resources/images/users/userDefaul.png', 48, N'phucthinh030901@gmail.com', N'0147258369', CAST(N'2022-05-30' AS Date), 1, 1)
SET IDENTITY_INSERT [dbo].[users] OFF
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (1, N'An Phú Tây', N'Xã', 1)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (2, N'Bình Chánh', N'Xã', 1)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (3, N'Bình Hưng', N'Xã', 1)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (4, N'Bình Lợi', N'Xã', 1)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (5, N'Đa Phước', N'Xã', 1)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (6, N'Hưng Long', N'Xã', 1)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (7, N'Lê Minh Xuân', N'Xã', 1)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (8, N'Phạm Văn Hai', N'Xã', 1)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (9, N'Phong Phú', N'Xã', 1)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (10, N'Quy Đức', N'Xã', 1)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (11, N'Tân Kiên', N'Xã', 1)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (12, N'Tân Nhựt', N'Xã', 1)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (13, N'Tân Quý Tây', N'Xã', 1)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (14, N'Tân Túc', N'Thị trấn', 1)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (15, N'Vĩnh Lộc A', N'Xã', 1)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (16, N'Vĩnh Lộc B', N'Xã', 1)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (17, N'An Lạc', N'Phường', 2)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (18, N'An Lạc A', N'Phường', 2)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (19, N'Bình Hưng Hòa', N'Phường', 2)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (20, N'Bình Hưng Hòa A', N'Phường', 2)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (21, N'Bình Hưng Hòa B', N'Phường', 2)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (22, N'Bình Trị Đông', N'Phường', 2)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (23, N'Bình Trị Đông A', N'Phường', 2)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (24, N'Bình Trị Đông B', N'Phường', 2)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (25, N'Tân Tạo', N'Phường', 2)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (26, N'Tân Tạo A', N'Phường', 2)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (27, N'1', N'Phường', 3)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (28, N'11', N'Phường', 3)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (29, N'12', N'Phường', 3)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (30, N'13', N'Phường', 3)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (31, N'14', N'Phường', 3)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (32, N'15', N'Phường', 3)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (33, N'17', N'Phường', 3)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (34, N'19', N'Phường', 3)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (35, N'2', N'Phường', 3)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (36, N'21', N'Phường', 3)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (37, N'22', N'Phường', 3)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (38, N'24', N'Phường', 3)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (39, N'25', N'Phường', 3)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (40, N'26', N'Phường', 3)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (41, N'27', N'Phường', 3)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (42, N'28', N'Phường', 3)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (43, N'3', N'Phường', 3)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (44, N'5', N'Phường', 3)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (45, N'6', N'Phường', 3)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (46, N'7', N'Phường', 3)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (47, N'An Thới Đông', N'Xã', 4)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (48, N'Bình Khánh', N'Xã', 4)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (49, N'Cần Thạnh ', N'Phường', 4)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (50, N'Long Hòa', N'Xã', 4)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (51, N'Lý Nhơn', N'Xã', 4)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (52, N'Tam Thôn Hiệp', N'Xã', 4)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (53, N'Thạnh An', N'Xã', 4)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (54, N'An Nhơn Tây', N'Xã', 5)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (55, N'An Phú', N'Xã', 5)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (56, N'An Phú Trung', N'Xã', 5)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (57, N'Bình Mỹ', N'Xã', 5)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (58, N'Củ Chi', N'Thị trấn', 5)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (59, N'Hòa Phú', N'Xã', 5)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (60, N'Nhuận Đức', N'Xã', 5)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (61, N'Phạm Văn Cội', N'Xã', 5)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (62, N'Phú Hòa Đông', N'Xã', 5)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (63, N'Phú Mỹ Hưng', N'Xã', 5)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (64, N'Phước Hiệp', N'Xã', 5)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (65, N'Phước Thạnh', N'Xã', 5)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (66, N'Phước Vĩnh An', N'Xã', 5)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (67, N'Tân An Hội', N'Xã', 5)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (68, N'Tân Phú Trung', N'Xã', 5)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (69, N'Tân Thạnh Đông', N'Xã', 5)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (70, N'Tân Thạnh Tây', N'Xã', 5)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (71, N'Tân Thông Hội', N'Xã', 5)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (72, N'Thái Mỹ', N'Xã', 5)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (73, N'Trung An', N'Xã', 5)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (74, N'Trung Lập Hạ', N'Xã', 5)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (75, N'Trung Lập Hạ', N'Xã', 5)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (76, N'Trung Lập Thượng', N'Xã', 5)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (77, N'1', N'Phường', 6)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (78, N'10', N'Phường', 6)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (79, N'11', N'Phường', 6)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (80, N'12', N'Phường', 6)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (81, N'13', N'Phường', 6)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (82, N'14', N'Phường', 6)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (83, N'15', N'Phường', 6)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (84, N'16', N'Phường', 6)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (85, N'17', N'Phường', 6)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (86, N'3', N'Phường', 6)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (87, N'4', N'Phường', 6)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (88, N'5', N'Phường', 6)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (89, N'6', N'Phường', 6)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (90, N'7', N'Phường', 6)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (91, N'8', N'Phường', 6)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (92, N'9', N'Phường', 6)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (93, N' Đông Thạnh', N'Xã', 7)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (94, N' Hóc Môn', N'Phường', 7)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (95, N'Bà Điểm', N'Phường', 7)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (96, N'Nhị Bình', N'Xã', 7)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (97, N'Tân Hiệp', N'Xã', 7)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (98, N'Tân Thới Nhì', N'Xã', 7)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (99, N'Tân Xuân', N'Xã', 7)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (100, N'Thới Tam Thôn', N'Xã', 7)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (101, N'Trung Chánh', N'Xã', 7)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (102, N'Xuân Thới Đông', N'Xã', 7)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (103, N'Xuân Thới Sơn', N'Xã', 7)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (104, N'Xuân Thới Thượng', N'Xã', 7)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (105, N'Hiệp Phước', N'Phường', 8)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (106, N'Long Thới', N'Xã', 8)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (107, N'Nhà Bè', N'Thị trấn', 8)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (108, N'Nhơn Đức', N'Xã', 8)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (109, N'Phú Xuân', N'Xã', 8)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (110, N'Phước Kiển', N'Xã', 8)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (111, N'Phước Lộc', N'Xã', 8)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (112, N'1', N'Phường', 9)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (113, N'10', N'Phường', 9)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (114, N'11', N'Phường', 9)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (115, N'12', N'Phường', 9)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (116, N'13', N'Phường', 9)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (117, N'14', N'Phường', 9)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (118, N'15', N'Phường', 9)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (119, N'17', N'Phường', 9)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (120, N'2', N'Phường', 9)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (121, N'25', N'Phường', 9)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (122, N'3', N'Phường', 9)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (123, N'4', N'Phường', 9)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (124, N'5', N'Phường', 9)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (125, N'6', N'Phường', 9)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (126, N'7', N'Phường', 9)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (127, N'8', N'Phường', 9)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (128, N'9', N'Phường', 9)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (129, N'Bến Nghé', N'Phường', 10)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (130, N'Bến Thành', N'Phường', 10)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (131, N'Cầu Kho', N'Phường', 10)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (132, N'Cầu Ông Lãnh', N'Phường', 10)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (133, N'Cô Giang', N'Phường', 10)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (134, N'Đa Kao', N'Phường', 10)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (135, N'Nguyễn Cư Trinh', N'Phường', 10)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (136, N'Nguyễn Thái Bình', N'Phường', 10)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (137, N'Phạm Ngũ Lão', N'Phường', 10)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (138, N'Tân Định', N'Phường', 10)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (139, N'1', N'Phường', 11)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (140, N'10', N'Phường', 11)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (141, N'11', N'Phường', 11)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (142, N'12', N'Phường', 11)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (143, N'13', N'Phường', 11)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (144, N'14', N'Phường', 11)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (145, N'15', N'Phường', 11)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (146, N'2', N'Phường', 11)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (147, N'3', N'Phường', 11)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (148, N'4', N'Phường', 11)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (149, N'5', N'Phường', 11)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (150, N'6', N'Phường', 11)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (151, N'7', N'Phường', 11)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (152, N'8', N'Phường', 11)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (153, N'9', N'Phường', 11)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (154, N'1', N'Phường', 12)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (155, N'10', N'Phường', 12)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (156, N'11', N'Phường', 12)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (157, N'12', N'Phường', 12)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (158, N'13', N'Phường', 12)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (159, N'14', N'Phường', 12)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (160, N'15', N'Phường', 12)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (161, N'16', N'Phường', 12)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (162, N'2', N'Phường', 12)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (163, N'3', N'Phường', 12)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (164, N'4', N'Phường', 12)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (165, N'5', N'Phường', 12)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (166, N'6', N'Phường', 12)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (167, N'7', N'Phường', 12)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (168, N'8', N'Phường', 12)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (169, N'9', N'Phường', 12)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (170, N'An Phú Đông', N'Phường', 13)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (171, N'Đông Hưng Thuận', N'Phường', 13)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (172, N'Hiệp Thành', N'Phường', 13)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (173, N'Tân Chánh Hiệp', N'Phường', 13)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (174, N'Tân Hưng Thuận', N'Phường', 13)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (175, N'Tân Thới Hiệp', N'Phường', 13)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (176, N'Tân Thới Nhất', N'Phường', 13)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (177, N'Thạnh Lộc', N'Phường', 13)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (178, N'Thạnh Xuân', N'Phường', 13)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (179, N'Thới An', N'Phường', 13)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (180, N'Trung Mỹ Tây', N'Phường', 13)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (181, N' Thạnh Mỹ Lợi', N'Phường', 14)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (182, N'An Khánh', N'Phường', 14)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (183, N'An Lợi Đông', N'Phường', 14)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (184, N'An Phú', N'Phường', 14)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (185, N'Bình An', N'Phường', 14)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (186, N'Bình Khánh', N'Phường', 14)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (187, N'Bình Trưng Đông', N'Phường', 14)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (188, N'Bình Trưng Tây', N'Phường', 14)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (189, N'Cát Lái', N'Phường', 14)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (190, N'Thảo Điền', N'Phường', 14)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (191, N'Thủ Thiêm', N'Phường', 14)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (192, N'1', N'Phường', 15)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (193, N'10', N'Phường', 15)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (194, N'11', N'Phường', 15)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (195, N'12', N'Phường', 15)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (196, N'13', N'Phường', 15)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (197, N'14', N'Phường', 15)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (198, N'2', N'Phường', 15)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (199, N'3', N'Phường', 15)
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (200, N'4', N'Phường', 15)
GO
ALTER TABLE [dbo].[order] ADD  CONSTRAINT [DF_order_status_id]  DEFAULT ((0)) FOR [status_id]
GO
ALTER TABLE [dbo].[poster] ADD  CONSTRAINT [DF_poster_isActive]  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[product] ADD  CONSTRAINT [DF_product_sold_quantity]  DEFAULT ((0)) FOR [sold_quantity]
GO
ALTER TABLE [dbo].[product] ADD  CONSTRAINT [DF_product_status]  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [DF_user_status]  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[address]  WITH CHECK ADD  CONSTRAINT [FK_address_ward] FOREIGN KEY([ward_id])
REFERENCES [dbo].[ward] ([ward_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[address] CHECK CONSTRAINT [FK_address_ward]
GO
ALTER TABLE [dbo].[cart]  WITH CHECK ADD  CONSTRAINT [FK_cart_product] FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([product_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[cart] CHECK CONSTRAINT [FK_cart_product]
GO
ALTER TABLE [dbo].[cart]  WITH CHECK ADD  CONSTRAINT [FK_cart_user] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([user_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[cart] CHECK CONSTRAINT [FK_cart_user]
GO
ALTER TABLE [dbo].[district]  WITH CHECK ADD  CONSTRAINT [FK_district_province] FOREIGN KEY([province_id])
REFERENCES [dbo].[province] ([province_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[district] CHECK CONSTRAINT [FK_district_province]
GO
ALTER TABLE [dbo].[feedback]  WITH CHECK ADD  CONSTRAINT [FK_feedback_product] FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([product_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[feedback] CHECK CONSTRAINT [FK_feedback_product]
GO
ALTER TABLE [dbo].[feedback]  WITH CHECK ADD  CONSTRAINT [FK_feedback_users] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([user_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[feedback] CHECK CONSTRAINT [FK_feedback_users]
GO
ALTER TABLE [dbo].[order]  WITH CHECK ADD  CONSTRAINT [FK_order_status] FOREIGN KEY([status_id])
REFERENCES [dbo].[order_status] ([status_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[order] CHECK CONSTRAINT [FK_order_status]
GO
ALTER TABLE [dbo].[order]  WITH CHECK ADD  CONSTRAINT [FK_order_user] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([user_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[order] CHECK CONSTRAINT [FK_order_user]
GO
ALTER TABLE [dbo].[order_detail]  WITH CHECK ADD  CONSTRAINT [FK_order_detail_order] FOREIGN KEY([order_id])
REFERENCES [dbo].[order] ([order_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[order_detail] CHECK CONSTRAINT [FK_order_detail_order]
GO
ALTER TABLE [dbo].[order_detail]  WITH CHECK ADD  CONSTRAINT [FK_order_detail_product] FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([product_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[order_detail] CHECK CONSTRAINT [FK_order_detail_product]
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD  CONSTRAINT [FK_product_category] FOREIGN KEY([category_id])
REFERENCES [dbo].[category] ([category_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[product] CHECK CONSTRAINT [FK_product_category]
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD  CONSTRAINT [FK_user_permission] FOREIGN KEY([permission_id])
REFERENCES [dbo].[permission] ([permission_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[users] CHECK CONSTRAINT [FK_user_permission]
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD  CONSTRAINT [FK_users_address] FOREIGN KEY([address_id])
REFERENCES [dbo].[address] ([address_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[users] CHECK CONSTRAINT [FK_users_address]
GO
ALTER TABLE [dbo].[ward]  WITH CHECK ADD  CONSTRAINT [FK_ward_district] FOREIGN KEY([district_id])
REFERENCES [dbo].[district] ([district_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[ward] CHECK CONSTRAINT [FK_ward_district]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Phường' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ward', @level2type=N'COLUMN',@level2name=N'ward_id'
GO
USE [master]
GO
ALTER DATABASE [WEBSITE_DT] SET  READ_WRITE 
GO
