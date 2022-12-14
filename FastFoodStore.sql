USE [master]
GO
/****** Object:  Database [FastFoodStore]    Script Date: 3/22/2022 1:53:44 PM ******/
CREATE DATABASE [FastFoodStore]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FastFoodStore', FILENAME = N'D:\SQL Server 2014\MSSQL12.SQLEXPRESS\MSSQL\DATA\FastFoodStore.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'FastFoodStore_log', FILENAME = N'D:\SQL Server 2014\MSSQL12.SQLEXPRESS\MSSQL\DATA\FastFoodStore_log.ldf' , SIZE = 816KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [FastFoodStore] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FastFoodStore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FastFoodStore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FastFoodStore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FastFoodStore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FastFoodStore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FastFoodStore] SET ARITHABORT OFF 
GO
ALTER DATABASE [FastFoodStore] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [FastFoodStore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FastFoodStore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FastFoodStore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FastFoodStore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FastFoodStore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FastFoodStore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FastFoodStore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FastFoodStore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FastFoodStore] SET  ENABLE_BROKER 
GO
ALTER DATABASE [FastFoodStore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FastFoodStore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FastFoodStore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FastFoodStore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FastFoodStore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FastFoodStore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FastFoodStore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FastFoodStore] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [FastFoodStore] SET  MULTI_USER 
GO
ALTER DATABASE [FastFoodStore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FastFoodStore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FastFoodStore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FastFoodStore] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [FastFoodStore] SET DELAYED_DURABILITY = DISABLED 
GO
USE [FastFoodStore]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 3/22/2022 1:53:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Account](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[address] [nvarchar](50) NULL,
	[phone] [nvarchar](12) NOT NULL,
	[email] [nvarchar](30) NOT NULL,
	[username] [nvarchar](100) NOT NULL,
	[password] [char](64) NOT NULL DEFAULT ('1'),
	[enabled] [bit] NOT NULL DEFAULT ((1)),
	[role] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Category]    Script Date: 3/22/2022 1:53:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[status] [bit] NOT NULL DEFAULT ((1)),
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Customer]    Script Date: 3/22/2022 1:53:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Customer](
	[id] [int] NOT NULL,
	[category] [varchar](50) NOT NULL,
	[shipToAddress] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 3/22/2022 1:53:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[orderId] [int] NOT NULL,
	[productId] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[price] [float] NOT NULL,
	[discount] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderHeader]    Script Date: 3/22/2022 1:53:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderHeader](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[date] [datetime] NOT NULL,
	[status] [nvarchar](30) NULL,
	[customerId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product]    Script Date: 3/22/2022 1:53:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[description] [nvarchar](50) NOT NULL,
	[price] [float] NOT NULL,
	[discount] [float] NOT NULL DEFAULT ((0)),
	[categoryId] [int] NOT NULL,
	[enabled] [bit] NOT NULL DEFAULT ((1)),
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([id], [name], [address], [phone], [email], [username], [password], [enabled], [role]) VALUES (1, N'Admin 1', N'9652 Los Angeles', N'0123456789', N'a@ffstore.com', N'admin1', N'1                                                               ', 1, N'admin')
INSERT [dbo].[Account] ([id], [name], [address], [phone], [email], [username], [password], [enabled], [role]) VALUES (2, N'Admin 2', N'5747 Shirley Drive', N'1234567890', N'e1@ffstore.com', N'admin2', N'1                                                               ', 1, N'admin')
INSERT [dbo].[Account] ([id], [name], [address], [phone], [email], [username], [password], [enabled], [role]) VALUES (3, N'Customer 1', N'3841 Silver Oaks Place', N'2345678901', N'e2@ffstore.com', N'c1', N'1                                                               ', 1, N'customer')
INSERT [dbo].[Account] ([id], [name], [address], [phone], [email], [username], [password], [enabled], [role]) VALUES (4, N'Customer2', N'1873 Lion Circle', N'5678901234', N'c1@gmail.com', N'c2', N'1                                                               ', 1, N'customer')
INSERT [dbo].[Account] ([id], [name], [address], [phone], [email], [username], [password], [enabled], [role]) VALUES (5, N'Customer3', N'5747 Shirley Drive', N'6789872314', N'c2@gmail.com', N'c3', N'1                                                               ', 1, N'customer')
INSERT [dbo].[Account] ([id], [name], [address], [phone], [email], [username], [password], [enabled], [role]) VALUES (7, N'Dat Le Thanh', NULL, N'0876543219', N'doixuihen@gmail.com', N'c4', N'1                                                               ', 1, N'customer')
INSERT [dbo].[Account] ([id], [name], [address], [phone], [email], [username], [password], [enabled], [role]) VALUES (8, N'Le Thanh Dat', N'Di An', N'+84868479485', N'datlt.mdc@Gmail.com', N'admin', N'1                                                               ', 1, N'admin')
INSERT [dbo].[Account] ([id], [name], [address], [phone], [email], [username], [password], [enabled], [role]) VALUES (10, N'Le Thanh Dat', N'Ho Chi Minh', N'0868479484', N'doixuihen@mail.com', N'c5', N'1                                                               ', 1, N'customer')
INSERT [dbo].[Account] ([id], [name], [address], [phone], [email], [username], [password], [enabled], [role]) VALUES (11, N'Le Dat', NULL, N'0868479483', N'doixuihen@email.com', N'c6', N'1                                                               ', 1, N'customer')
INSERT [dbo].[Account] ([id], [name], [address], [phone], [email], [username], [password], [enabled], [role]) VALUES (12, N'Le Dat', NULL, N'0868479482', N'doixuihe@email.com', N'c7', N'1                                                               ', 1, N'customer')
SET IDENTITY_INSERT [dbo].[Account] OFF
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([id], [name], [status]) VALUES (1, N'Mon chinh', 1)
INSERT [dbo].[Category] ([id], [name], [status]) VALUES (2, N'Mon vat', 1)
INSERT [dbo].[Category] ([id], [name], [status]) VALUES (3, N'Do ngot', 1)
INSERT [dbo].[Category] ([id], [name], [status]) VALUES (4, N'Nuoc uong', 1)
SET IDENTITY_INSERT [dbo].[Category] OFF
INSERT [dbo].[Customer] ([id], [category], [shipToAddress]) VALUES (3, N'Copper', N'vn')
INSERT [dbo].[Customer] ([id], [category], [shipToAddress]) VALUES (4, N'Copper', N'1873 Lion Circle')
INSERT [dbo].[Customer] ([id], [category], [shipToAddress]) VALUES (5, N'Copper', N'5747 Shirley Drive')
INSERT [dbo].[Customer] ([id], [category], [shipToAddress]) VALUES (8, N'Copper', N'123 vn')
SET IDENTITY_INSERT [dbo].[OrderDetail] ON 

INSERT [dbo].[OrderDetail] ([id], [orderId], [productId], [quantity], [price], [discount]) VALUES (1, 2, 1, 2, 1900, 0.1)
INSERT [dbo].[OrderDetail] ([id], [orderId], [productId], [quantity], [price], [discount]) VALUES (2, 2, 2, 3, 73.94, 0.05)
INSERT [dbo].[OrderDetail] ([id], [orderId], [productId], [quantity], [price], [discount]) VALUES (3, 4, 1, 1, 1900, 0.1)
INSERT [dbo].[OrderDetail] ([id], [orderId], [productId], [quantity], [price], [discount]) VALUES (4, 4, 2, 2, 73.94, 0.05)
INSERT [dbo].[OrderDetail] ([id], [orderId], [productId], [quantity], [price], [discount]) VALUES (7, 5, 1, 1, 1900, 0.1)
INSERT [dbo].[OrderDetail] ([id], [orderId], [productId], [quantity], [price], [discount]) VALUES (9, 5, 2, 2, 73.94, 0.05)
INSERT [dbo].[OrderDetail] ([id], [orderId], [productId], [quantity], [price], [discount]) VALUES (10, 5, 3, 1, 74.11, 0.05)
INSERT [dbo].[OrderDetail] ([id], [orderId], [productId], [quantity], [price], [discount]) VALUES (11, 13, 3, 2, 70.4045, 0.05)
INSERT [dbo].[OrderDetail] ([id], [orderId], [productId], [quantity], [price], [discount]) VALUES (12, 13, 4, 1, 52.73, 0)
SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
SET IDENTITY_INSERT [dbo].[OrderHeader] ON 

INSERT [dbo].[OrderHeader] ([id], [date], [status], [customerId]) VALUES (2, CAST(N'2022-03-21 00:00:00.000' AS DateTime), N'new', 4)
INSERT [dbo].[OrderHeader] ([id], [date], [status], [customerId]) VALUES (3, CAST(N'2022-03-22 00:00:00.000' AS DateTime), N'new', 4)
INSERT [dbo].[OrderHeader] ([id], [date], [status], [customerId]) VALUES (4, CAST(N'2022-03-23 01:00:00.000' AS DateTime), N'new', 5)
INSERT [dbo].[OrderHeader] ([id], [date], [status], [customerId]) VALUES (5, CAST(N'2022-03-23 02:00:00.000' AS DateTime), N'new', 4)
INSERT [dbo].[OrderHeader] ([id], [date], [status], [customerId]) VALUES (6, CAST(N'2022-03-22 00:00:00.000' AS DateTime), N'new', 4)
INSERT [dbo].[OrderHeader] ([id], [date], [status], [customerId]) VALUES (7, CAST(N'2022-03-22 00:00:00.000' AS DateTime), N'new', 3)
INSERT [dbo].[OrderHeader] ([id], [date], [status], [customerId]) VALUES (8, CAST(N'2022-03-22 00:00:00.000' AS DateTime), N'new', 3)
INSERT [dbo].[OrderHeader] ([id], [date], [status], [customerId]) VALUES (9, CAST(N'2022-03-22 00:00:00.000' AS DateTime), N'new', 3)
INSERT [dbo].[OrderHeader] ([id], [date], [status], [customerId]) VALUES (10, CAST(N'2022-03-22 00:00:00.000' AS DateTime), N'new', 3)
INSERT [dbo].[OrderHeader] ([id], [date], [status], [customerId]) VALUES (11, CAST(N'2022-03-22 00:00:00.000' AS DateTime), N'new', 3)
INSERT [dbo].[OrderHeader] ([id], [date], [status], [customerId]) VALUES (12, CAST(N'2022-03-22 00:00:00.000' AS DateTime), N'new', 3)
INSERT [dbo].[OrderHeader] ([id], [date], [status], [customerId]) VALUES (13, CAST(N'2022-03-22 00:00:00.000' AS DateTime), N'new', 3)
SET IDENTITY_INSERT [dbo].[OrderHeader] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([id], [description], [price], [discount], [categoryId], [enabled]) VALUES (1, N'Earl Grey', 1900, 0.1, 4, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [categoryId], [enabled]) VALUES (2, N'Matcha', 73.94, 0.05, 4, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [categoryId], [enabled]) VALUES (3, N'Matcha xoài', 74.11, 0.05, 3, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [categoryId], [enabled]) VALUES (4, N'Matcha dâu', 52.73, 0, 3, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [categoryId], [enabled]) VALUES (5, N'Earl grey caramel', 171.13, 0.15, 3, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [categoryId], [enabled]) VALUES (6, N'Caramel chuối kem cheese', 140.55, 0.1, 3, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [categoryId], [enabled]) VALUES (7, N'Chuối dừa bơ lạc ', 56.01, 0.1, 3, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [categoryId], [enabled]) VALUES (8, N'Chocolate chuối ', 48.17, 0.1, 3, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [categoryId], [enabled]) VALUES (9, N'Dark chocolate with Rum', 62.03, 0, 3, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [categoryId], [enabled]) VALUES (10, N'Double cheese', 88.19, 0.1, 3, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [categoryId], [enabled]) VALUES (11, N'Oreo', 20.31, 0.05, 3, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [categoryId], [enabled]) VALUES (12, N'Tiramisu', 96.47, 0.15, 3, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [categoryId], [enabled]) VALUES (13, N'Trà xoài kem cheese ', 155.58, 0.05, 3, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [categoryId], [enabled]) VALUES (14, N'Black Forest ', 204.26, 0.05, 3, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [categoryId], [enabled]) VALUES (15, N'Gà rán', 148.25, 0.1, 1, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [categoryId], [enabled]) VALUES (16, N'Cá viên', 209.9, 0.05, 2, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [categoryId], [enabled]) VALUES (17, N'Bò viên', 104.29, 0.1, 2, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [categoryId], [enabled]) VALUES (18, N'Khoai tây chiên', 146.36, 0, 2, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [categoryId], [enabled]) VALUES (19, N'Gà lắc phô mai', 154.76, 0.15, 2, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [categoryId], [enabled]) VALUES (20, N'Cơm gà rán', 135.82, 0.05, 1, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [categoryId], [enabled]) VALUES (21, N'Cơm bít tết', 158.46, 0.05, 1, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [categoryId], [enabled]) VALUES (22, N'Cơm gà - bít tết', 165.89, 0.05, 1, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [categoryId], [enabled]) VALUES (23, N'Bò bít tết', 95.7, 0.1, 1, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [categoryId], [enabled]) VALUES (24, N'Xúc xích chiên', 80.16, 0.05, 2, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [categoryId], [enabled]) VALUES (25, N'Cá cốm chiên', 19.25, 0.1, 2, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [categoryId], [enabled]) VALUES (26, N'Burger tôm', 171.36, 0.1, 1, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [categoryId], [enabled]) VALUES (27, N'Burger gà', 35.08, 0.05, 1, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [categoryId], [enabled]) VALUES (28, N'Burger bò', 57.92, 0.05, 1, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [categoryId], [enabled]) VALUES (29, N'Gà nướng xiên que', 157.81, 0, 2, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [categoryId], [enabled]) VALUES (30, N'Mì Ý', 151, 0.05, 1, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [categoryId], [enabled]) VALUES (31, N'Trà đào', 126.34, 0.05, 4, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [categoryId], [enabled]) VALUES (32, N'Pepsi', 170.23, 0.05, 4, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [categoryId], [enabled]) VALUES (33, N'Cocacola', 136.5, 0.05, 4, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [categoryId], [enabled]) VALUES (34, N'Nước suối', 24.68, 0.1, 4, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [categoryId], [enabled]) VALUES (35, N'Cà phê đen', 88.71, 0.05, 4, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [categoryId], [enabled]) VALUES (36, N'Cà phê sữa', 190.43, 0.05, 4, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [categoryId], [enabled]) VALUES (37, N'Nước cam', 14, 0.05, 4, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [categoryId], [enabled]) VALUES (38, N'Mì xá xíu', 206.57, 0.1, 1, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [categoryId], [enabled]) VALUES (39, N'Mì xào', 163.48, 0, 1, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [categoryId], [enabled]) VALUES (40, N'Mì xào giòn', 92.3, 0, 1, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [categoryId], [enabled]) VALUES (41, N'Trứng chiên Teyvat', 92.3, 0, 1, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [categoryId], [enabled]) VALUES (42, N'Canh rau củ', 92.3, 0, 1, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [categoryId], [enabled]) VALUES (43, N'Gà cay thơm mềm', 92.3, 0, 1, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [categoryId], [enabled]) VALUES (44, N'Gà nấu hoa ngọt', 92.3, 0, 1, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [categoryId], [enabled]) VALUES (45, N'Gà nấu đậu', 92.3, 0, 1, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [categoryId], [enabled]) VALUES (46, N'Sushi tôm', 92.3, 0, 1, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [categoryId], [enabled]) VALUES (47, N'Bánh Khoai tây ', 92.3, 0, 2, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [categoryId], [enabled]) VALUES (48, N'Nước dâu bạc hà', 92.3, 0, 4, 1)
SET IDENTITY_INSERT [dbo].[Product] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Account__F3DBC5727B1B1A68]    Script Date: 3/22/2022 1:53:44 PM ******/
ALTER TABLE [dbo].[Account] ADD UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Account__F3DBC572FEB4D257]    Script Date: 3/22/2022 1:53:44 PM ******/
ALTER TABLE [dbo].[Account] ADD UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD FOREIGN KEY([id])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([orderId])
REFERENCES [dbo].[OrderHeader] ([id])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([productId])
REFERENCES [dbo].[Product] ([id])
GO
ALTER TABLE [dbo].[OrderHeader]  WITH CHECK ADD FOREIGN KEY([customerId])
REFERENCES [dbo].[Customer] ([id])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([categoryId])
REFERENCES [dbo].[Category] ([id])
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD CHECK  (([category]='Copper' OR [category]='Silver' OR [category]='Gold'))
GO
ALTER TABLE [dbo].[OrderHeader]  WITH CHECK ADD CHECK  (([status]='canceled' OR [status]='paid' OR [status]='delivered' OR [status]='packaged' OR [status]='confirmed' OR [status]='new'))
GO
USE [master]
GO
ALTER DATABASE [FastFoodStore] SET  READ_WRITE 
GO
