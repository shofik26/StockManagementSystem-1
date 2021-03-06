USE [master]
GO
/****** Object:  Database [StockManagement]    Script Date: 02-Aug-18 1:25:17 AM ******/
CREATE DATABASE [StockManagement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'StockManagement', FILENAME = N'g:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\StockManagement.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'StockManagement_log', FILENAME = N'g:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\StockManagement_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [StockManagement] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [StockManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [StockManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [StockManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [StockManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [StockManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [StockManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [StockManagement] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [StockManagement] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [StockManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [StockManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [StockManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [StockManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [StockManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [StockManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [StockManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [StockManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [StockManagement] SET  DISABLE_BROKER 
GO
ALTER DATABASE [StockManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [StockManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [StockManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [StockManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [StockManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [StockManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [StockManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [StockManagement] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [StockManagement] SET  MULTI_USER 
GO
ALTER DATABASE [StockManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [StockManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [StockManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [StockManagement] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [StockManagement]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 02-Aug-18 1:25:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Company]    Script Date: 02-Aug-18 1:25:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Company](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Inventory]    Script Date: 02-Aug-18 1:25:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventory](
	[ItemId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Reorder] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Items]    Script Date: 02-Aug-18 1:25:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Items](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[CompanyId] [int] NOT NULL,
 CONSTRAINT [PK_Items] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Login]    Script Date: 02-Aug-18 1:25:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Login](
	[Id] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Login] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Medium]    Script Date: 02-Aug-18 1:25:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Medium](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Medium] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StockIn]    Script Date: 02-Aug-18 1:25:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StockIn](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ItemId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Date] [date] NOT NULL,
 CONSTRAINT [PK_StockIn] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StockOut]    Script Date: 02-Aug-18 1:25:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StockOut](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ItemId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[MediumId] [int] NOT NULL,
	[Date] [date] NOT NULL,
 CONSTRAINT [PK_StockOut] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Id], [Name]) VALUES (34, N'Stationary')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (35, N'Cosmetics')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (36, N'Electronics')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (37, N'Kitchen Items')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (38, N'pen')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (1002, N'new cat')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Company] ON 

INSERT [dbo].[Company] ([Id], [Name]) VALUES (1, N'RFL')
INSERT [dbo].[Company] ([Id], [Name]) VALUES (2, N'Uniliver')
INSERT [dbo].[Company] ([Id], [Name]) VALUES (3, N'Walton')
INSERT [dbo].[Company] ([Id], [Name]) VALUES (4, N'SONY')
SET IDENTITY_INSERT [dbo].[Company] OFF
INSERT [dbo].[Inventory] ([ItemId], [Quantity], [Reorder]) VALUES (2, 1, 10)
INSERT [dbo].[Inventory] ([ItemId], [Quantity], [Reorder]) VALUES (3, 8, 5)
INSERT [dbo].[Inventory] ([ItemId], [Quantity], [Reorder]) VALUES (4, 0, 10)
INSERT [dbo].[Inventory] ([ItemId], [Quantity], [Reorder]) VALUES (1002, 4, 10)
INSERT [dbo].[Inventory] ([ItemId], [Quantity], [Reorder]) VALUES (1003, 10, 5)
INSERT [dbo].[Inventory] ([ItemId], [Quantity], [Reorder]) VALUES (1004, 0, 5)
INSERT [dbo].[Inventory] ([ItemId], [Quantity], [Reorder]) VALUES (1005, 16, 2)
INSERT [dbo].[Inventory] ([ItemId], [Quantity], [Reorder]) VALUES (2002, 0, 10)
INSERT [dbo].[Inventory] ([ItemId], [Quantity], [Reorder]) VALUES (2003, 0, 15)
INSERT [dbo].[Inventory] ([ItemId], [Quantity], [Reorder]) VALUES (3002, 0, 8)
INSERT [dbo].[Inventory] ([ItemId], [Quantity], [Reorder]) VALUES (3003, 0, 8)
INSERT [dbo].[Inventory] ([ItemId], [Quantity], [Reorder]) VALUES (3004, 0, 12)
INSERT [dbo].[Inventory] ([ItemId], [Quantity], [Reorder]) VALUES (3005, 0, 10)
INSERT [dbo].[Inventory] ([ItemId], [Quantity], [Reorder]) VALUES (3006, 0, 12)
INSERT [dbo].[Inventory] ([ItemId], [Quantity], [Reorder]) VALUES (3007, 0, 2)
INSERT [dbo].[Inventory] ([ItemId], [Quantity], [Reorder]) VALUES (3008, 0, 12)
INSERT [dbo].[Inventory] ([ItemId], [Quantity], [Reorder]) VALUES (3009, 0, 12)
INSERT [dbo].[Inventory] ([ItemId], [Quantity], [Reorder]) VALUES (3010, 0, 12)
INSERT [dbo].[Inventory] ([ItemId], [Quantity], [Reorder]) VALUES (3011, 0, 12)
INSERT [dbo].[Inventory] ([ItemId], [Quantity], [Reorder]) VALUES (3012, 0, 5)
INSERT [dbo].[Inventory] ([ItemId], [Quantity], [Reorder]) VALUES (3013, 0, 10)
INSERT [dbo].[Inventory] ([ItemId], [Quantity], [Reorder]) VALUES (3014, 0, 10)
INSERT [dbo].[Inventory] ([ItemId], [Quantity], [Reorder]) VALUES (3015, 0, 10)
INSERT [dbo].[Inventory] ([ItemId], [Quantity], [Reorder]) VALUES (3016, 0, 10)
INSERT [dbo].[Inventory] ([ItemId], [Quantity], [Reorder]) VALUES (3017, 0, 5)
INSERT [dbo].[Inventory] ([ItemId], [Quantity], [Reorder]) VALUES (3018, 0, 12)
INSERT [dbo].[Inventory] ([ItemId], [Quantity], [Reorder]) VALUES (3019, 0, 20)
SET IDENTITY_INSERT [dbo].[Items] ON 

INSERT [dbo].[Items] ([Id], [Name], [CategoryId], [CompanyId]) VALUES (2, N'Stove', 37, 1)
INSERT [dbo].[Items] ([Id], [Name], [CategoryId], [CompanyId]) VALUES (3, N'Book Self', 34, 1)
INSERT [dbo].[Items] ([Id], [Name], [CategoryId], [CompanyId]) VALUES (4, N'Shampoo', 35, 2)
INSERT [dbo].[Items] ([Id], [Name], [CategoryId], [CompanyId]) VALUES (1002, N'Chair', 34, 1)
INSERT [dbo].[Items] ([Id], [Name], [CategoryId], [CompanyId]) VALUES (1003, N'Table', 34, 1)
INSERT [dbo].[Items] ([Id], [Name], [CategoryId], [CompanyId]) VALUES (1004, N'Almira', 34, 1)
INSERT [dbo].[Items] ([Id], [Name], [CategoryId], [CompanyId]) VALUES (1005, N'Fridge', 36, 1)
INSERT [dbo].[Items] ([Id], [Name], [CategoryId], [CompanyId]) VALUES (2002, N'conditionar', 35, 2)
INSERT [dbo].[Items] ([Id], [Name], [CategoryId], [CompanyId]) VALUES (2003, N'Blender', 37, 1)
INSERT [dbo].[Items] ([Id], [Name], [CategoryId], [CompanyId]) VALUES (3002, N'RfL Shampoo', 35, 1)
INSERT [dbo].[Items] ([Id], [Name], [CategoryId], [CompanyId]) VALUES (3003, N'RFL Light', 36, 1)
INSERT [dbo].[Items] ([Id], [Name], [CategoryId], [CompanyId]) VALUES (3004, N'RFL Pen', 38, 1)
INSERT [dbo].[Items] ([Id], [Name], [CategoryId], [CompanyId]) VALUES (3005, N'Card', 34, 2)
INSERT [dbo].[Items] ([Id], [Name], [CategoryId], [CompanyId]) VALUES (3006, N'Hair clip', 35, 2)
INSERT [dbo].[Items] ([Id], [Name], [CategoryId], [CompanyId]) VALUES (3007, N'Universe Fan', 36, 2)
INSERT [dbo].[Items] ([Id], [Name], [CategoryId], [CompanyId]) VALUES (3008, N'Uni Handi', 37, 2)
INSERT [dbo].[Items] ([Id], [Name], [CategoryId], [CompanyId]) VALUES (3009, N'Uni Pen', 38, 2)
INSERT [dbo].[Items] ([Id], [Name], [CategoryId], [CompanyId]) VALUES (3010, N'Wal pen', 38, 3)
INSERT [dbo].[Items] ([Id], [Name], [CategoryId], [CompanyId]) VALUES (3011, N'Walton Handi', 37, 3)
INSERT [dbo].[Items] ([Id], [Name], [CategoryId], [CompanyId]) VALUES (3012, N'Bike', 36, 3)
INSERT [dbo].[Items] ([Id], [Name], [CategoryId], [CompanyId]) VALUES (3013, N'Waltop Shampoo', 35, 3)
INSERT [dbo].[Items] ([Id], [Name], [CategoryId], [CompanyId]) VALUES (3014, N'Walton Sta', 34, 3)
INSERT [dbo].[Items] ([Id], [Name], [CategoryId], [CompanyId]) VALUES (3015, N'sony sta', 34, 4)
INSERT [dbo].[Items] ([Id], [Name], [CategoryId], [CompanyId]) VALUES (3016, N'sony lotion', 35, 4)
INSERT [dbo].[Items] ([Id], [Name], [CategoryId], [CompanyId]) VALUES (3017, N'Sony TV', 36, 4)
INSERT [dbo].[Items] ([Id], [Name], [CategoryId], [CompanyId]) VALUES (3018, N'Sony Patil', 37, 4)
INSERT [dbo].[Items] ([Id], [Name], [CategoryId], [CompanyId]) VALUES (3019, N'Sony Pen', 38, 4)
SET IDENTITY_INSERT [dbo].[Items] OFF
INSERT [dbo].[Login] ([Id], [Name], [Password]) VALUES (1, N'Admin', N'123')
INSERT [dbo].[Login] ([Id], [Name], [Password]) VALUES (2, N'Nasir', N'123')
SET IDENTITY_INSERT [dbo].[Medium] ON 

INSERT [dbo].[Medium] ([Id], [Name]) VALUES (1, N'sell')
INSERT [dbo].[Medium] ([Id], [Name]) VALUES (2, N'damage')
INSERT [dbo].[Medium] ([Id], [Name]) VALUES (3, N'lost')
SET IDENTITY_INSERT [dbo].[Medium] OFF
SET IDENTITY_INSERT [dbo].[StockOut] ON 

INSERT [dbo].[StockOut] ([Id], [ItemId], [Quantity], [MediumId], [Date]) VALUES (1, 2, 5, 1, CAST(0x893E0B00 AS Date))
INSERT [dbo].[StockOut] ([Id], [ItemId], [Quantity], [MediumId], [Date]) VALUES (2, 3, 5, 1, CAST(0x893E0B00 AS Date))
INSERT [dbo].[StockOut] ([Id], [ItemId], [Quantity], [MediumId], [Date]) VALUES (3, 1005, 15, 1, CAST(0x8A3E0B00 AS Date))
INSERT [dbo].[StockOut] ([Id], [ItemId], [Quantity], [MediumId], [Date]) VALUES (4, 2, 8, 1, CAST(0x8A3E0B00 AS Date))
INSERT [dbo].[StockOut] ([Id], [ItemId], [Quantity], [MediumId], [Date]) VALUES (5, 3, 3, 1, CAST(0x8A3E0B00 AS Date))
INSERT [dbo].[StockOut] ([Id], [ItemId], [Quantity], [MediumId], [Date]) VALUES (6, 2, 2, 2, CAST(0x8A3E0B00 AS Date))
INSERT [dbo].[StockOut] ([Id], [ItemId], [Quantity], [MediumId], [Date]) VALUES (7, 2, 2, 1, CAST(0x8A3E0B00 AS Date))
INSERT [dbo].[StockOut] ([Id], [ItemId], [Quantity], [MediumId], [Date]) VALUES (8, 1005, 10, 1, CAST(0x8A3E0B00 AS Date))
INSERT [dbo].[StockOut] ([Id], [ItemId], [Quantity], [MediumId], [Date]) VALUES (9, 2, 2, 1, CAST(0x8A3E0B00 AS Date))
INSERT [dbo].[StockOut] ([Id], [ItemId], [Quantity], [MediumId], [Date]) VALUES (10, 1005, 2, 1, CAST(0x8A3E0B00 AS Date))
INSERT [dbo].[StockOut] ([Id], [ItemId], [Quantity], [MediumId], [Date]) VALUES (11, 1005, 2, 1, CAST(0x8A3E0B00 AS Date))
INSERT [dbo].[StockOut] ([Id], [ItemId], [Quantity], [MediumId], [Date]) VALUES (12, 2, 3, 1, CAST(0x8A3E0B00 AS Date))
INSERT [dbo].[StockOut] ([Id], [ItemId], [Quantity], [MediumId], [Date]) VALUES (13, 2, 2, 1, CAST(0x8A3E0B00 AS Date))
INSERT [dbo].[StockOut] ([Id], [ItemId], [Quantity], [MediumId], [Date]) VALUES (14, 3, 2, 1, CAST(0x8A3E0B00 AS Date))
INSERT [dbo].[StockOut] ([Id], [ItemId], [Quantity], [MediumId], [Date]) VALUES (15, 1005, 5, 1, CAST(0x8A3E0B00 AS Date))
INSERT [dbo].[StockOut] ([Id], [ItemId], [Quantity], [MediumId], [Date]) VALUES (16, 1002, 2, 1, CAST(0x8B3E0B00 AS Date))
INSERT [dbo].[StockOut] ([Id], [ItemId], [Quantity], [MediumId], [Date]) VALUES (17, 1002, 2, 1, CAST(0x8B3E0B00 AS Date))
INSERT [dbo].[StockOut] ([Id], [ItemId], [Quantity], [MediumId], [Date]) VALUES (18, 1002, 2, 1, CAST(0x8B3E0B00 AS Date))
INSERT [dbo].[StockOut] ([Id], [ItemId], [Quantity], [MediumId], [Date]) VALUES (19, 1005, 10, 1, CAST(0x8B3E0B00 AS Date))
INSERT [dbo].[StockOut] ([Id], [ItemId], [Quantity], [MediumId], [Date]) VALUES (20, 1005, 5, 2, CAST(0x8B3E0B00 AS Date))
SET IDENTITY_INSERT [dbo].[StockOut] OFF
ALTER TABLE [dbo].[Inventory]  WITH CHECK ADD  CONSTRAINT [FK_Inventory_Items] FOREIGN KEY([ItemId])
REFERENCES [dbo].[Items] ([Id])
GO
ALTER TABLE [dbo].[Inventory] CHECK CONSTRAINT [FK_Inventory_Items]
GO
ALTER TABLE [dbo].[Items]  WITH CHECK ADD  CONSTRAINT [FK_Items_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[Items] CHECK CONSTRAINT [FK_Items_Category]
GO
ALTER TABLE [dbo].[Items]  WITH CHECK ADD  CONSTRAINT [FK_Items_Company] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Company] ([Id])
GO
ALTER TABLE [dbo].[Items] CHECK CONSTRAINT [FK_Items_Company]
GO
ALTER TABLE [dbo].[StockIn]  WITH CHECK ADD  CONSTRAINT [FK_StockIn_Items] FOREIGN KEY([ItemId])
REFERENCES [dbo].[Items] ([Id])
GO
ALTER TABLE [dbo].[StockIn] CHECK CONSTRAINT [FK_StockIn_Items]
GO
ALTER TABLE [dbo].[StockOut]  WITH CHECK ADD  CONSTRAINT [FK_StockOut_Items] FOREIGN KEY([ItemId])
REFERENCES [dbo].[Items] ([Id])
GO
ALTER TABLE [dbo].[StockOut] CHECK CONSTRAINT [FK_StockOut_Items]
GO
ALTER TABLE [dbo].[StockOut]  WITH CHECK ADD  CONSTRAINT [FK_StockOut_Medium] FOREIGN KEY([MediumId])
REFERENCES [dbo].[Medium] ([Id])
GO
ALTER TABLE [dbo].[StockOut] CHECK CONSTRAINT [FK_StockOut_Medium]
GO
USE [master]
GO
ALTER DATABASE [StockManagement] SET  READ_WRITE 
GO
