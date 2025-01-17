USE [muamohinh]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 7/7/2024 9:36:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NOT NULL,
	[password] [nvarchar](255) NOT NULL,
	[email] [nvarchar](100) NOT NULL,
	[role] [nvarchar](50) NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
	[name] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 7/7/2024 9:36:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[cid] [int] IDENTITY(1,1) NOT NULL,
	[cname] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[cid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 7/7/2024 9:36:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](100) NOT NULL,
	[LastName] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Phone] [nvarchar](20) NULL,
	[Address] [nvarchar](200) NULL,
	[City] [nvarchar](100) NULL,
	[Country] [nvarchar](100) NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderItem]    Script Date: 7/7/2024 9:36:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItem](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[price] [decimal](10, 2) NOT NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 7/7/2024 9:36:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[order_date] [datetime] NULL,
	[total_price] [decimal](10, 2) NOT NULL,
	[status] [nvarchar](50) NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[payment_info]    Script Date: 7/7/2024 9:36:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[payment_info](
	[order_id] [int] NOT NULL,
	[name] [varchar](255) NOT NULL,
	[address] [varchar](255) NOT NULL,
	[phone] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 7/7/2024 9:36:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[cateID] [int] NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[brand] [nvarchar](100) NULL,
	[Scale] [nvarchar](10) NULL,
	[price] [decimal](10, 2) NOT NULL,
	[Stock] [int] NOT NULL,
	[description] [nvarchar](max) NULL,
	[image] [nvarchar](255) NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
	[title] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([id], [username], [password], [email], [role], [CreatedAt], [UpdatedAt], [name]) VALUES (1, N'a', N'1', N'nguyenvana@example.com', N'2', CAST(N'2024-06-20T23:26:55.473' AS DateTime), CAST(N'2024-06-20T23:26:55.473' AS DateTime), N'nguyenvana')
INSERT [dbo].[Account] ([id], [username], [password], [email], [role], [CreatedAt], [UpdatedAt], [name]) VALUES (2, N'b', N'u2', N'tranthib@example.com', N'2', CAST(N'2024-06-20T23:26:55.473' AS DateTime), CAST(N'2024-06-20T23:26:55.473' AS DateTime), N'tranthib')
INSERT [dbo].[Account] ([id], [username], [password], [email], [role], [CreatedAt], [UpdatedAt], [name]) VALUES (3, N'admin', N'1', N'admin@example.com', N'1', CAST(N'2024-06-20T23:26:55.473' AS DateTime), CAST(N'2024-06-20T23:26:55.473' AS DateTime), N'ADMIN')
INSERT [dbo].[Account] ([id], [username], [password], [email], [role], [CreatedAt], [UpdatedAt], [name]) VALUES (4, N'e', N'u3', N'hoangminhe@example.com', N'2', CAST(N'2024-06-22T16:32:49.133' AS DateTime), CAST(N'2024-06-22T16:32:49.133' AS DateTime), N'hoangminhe')
INSERT [dbo].[Account] ([id], [username], [password], [email], [role], [CreatedAt], [UpdatedAt], [name]) VALUES (5, N'f', N'u4', N'vuanhf@example.com', N'2', CAST(N'2024-06-22T16:32:49.133' AS DateTime), CAST(N'2024-06-22T16:32:49.133' AS DateTime), N'vuanhf')
INSERT [dbo].[Account] ([id], [username], [password], [email], [role], [CreatedAt], [UpdatedAt], [name]) VALUES (6, N'buikimg', N'u5', N'buikimg@example.com', N'2', CAST(N'2024-06-22T16:32:49.133' AS DateTime), CAST(N'2024-06-22T16:32:49.133' AS DateTime), N'g')
INSERT [dbo].[Account] ([id], [username], [password], [email], [role], [CreatedAt], [UpdatedAt], [name]) VALUES (7, N'dophuch', N'u6', N'dophuch@example.com', N'2', CAST(N'2024-06-22T16:32:49.133' AS DateTime), CAST(N'2024-06-22T16:32:49.133' AS DateTime), N'h')
INSERT [dbo].[Account] ([id], [username], [password], [email], [role], [CreatedAt], [UpdatedAt], [name]) VALUES (8, N'phanquoci', N'u7', N'phanquoci@example.com', N'2', CAST(N'2024-06-22T16:32:49.133' AS DateTime), CAST(N'2024-06-22T16:32:49.133' AS DateTime), N'i')
INSERT [dbo].[Account] ([id], [username], [password], [email], [role], [CreatedAt], [UpdatedAt], [name]) VALUES (9, N'hongocj', N'u8', N'hongocj@example.com', N'2', CAST(N'2024-06-22T16:32:49.133' AS DateTime), CAST(N'2024-06-22T16:32:49.133' AS DateTime), N'j')
INSERT [dbo].[Account] ([id], [username], [password], [email], [role], [CreatedAt], [UpdatedAt], [name]) VALUES (10, N'son', N'1', N'thaison02004@gmail.com', N'2', CAST(N'2024-07-02T14:49:43.063' AS DateTime), CAST(N'2024-07-02T14:49:43.063' AS DateTime), N'Son')
INSERT [dbo].[Account] ([id], [username], [password], [email], [role], [CreatedAt], [UpdatedAt], [name]) VALUES (11, N'thaison', N'1', N'sondthe180896@fpt.edu.vn', N'2', CAST(N'2024-07-05T16:54:34.967' AS DateTime), CAST(N'2024-07-05T16:54:34.967' AS DateTime), N'Thái Sơn')
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([cid], [cname], [Description], [CreatedAt], [UpdatedAt]) VALUES (1, N'Sedan', N'Mô hình xe Sedan các loại.', CAST(N'2024-06-20T23:26:55.443' AS DateTime), CAST(N'2024-06-20T23:26:55.443' AS DateTime))
INSERT [dbo].[Category] ([cid], [cname], [Description], [CreatedAt], [UpdatedAt]) VALUES (2, N'SUV', N'Mô hình xe SUV các loại.', CAST(N'2024-06-20T23:26:55.443' AS DateTime), CAST(N'2024-06-20T23:26:55.443' AS DateTime))
INSERT [dbo].[Category] ([cid], [cname], [Description], [CreatedAt], [UpdatedAt]) VALUES (3, N'Truck', N'Mô hình xe tải các loại.', CAST(N'2024-06-20T23:26:55.443' AS DateTime), CAST(N'2024-06-20T23:26:55.443' AS DateTime))
INSERT [dbo].[Category] ([cid], [cname], [Description], [CreatedAt], [UpdatedAt]) VALUES (4, N'Sports Car', N'Mô hình xe thể thao các loại.', CAST(N'2024-06-20T23:26:55.443' AS DateTime), CAST(N'2024-06-20T23:26:55.443' AS DateTime))
INSERT [dbo].[Category] ([cid], [cname], [Description], [CreatedAt], [UpdatedAt]) VALUES (5, N'Convertible', N'Mô hình xe mui trần.', CAST(N'2024-06-22T16:32:49.130' AS DateTime), CAST(N'2024-06-22T16:32:49.130' AS DateTime))
INSERT [dbo].[Category] ([cid], [cname], [Description], [CreatedAt], [UpdatedAt]) VALUES (6, N'Hatchback', N'Mô hình xe Hatchback.', CAST(N'2024-06-22T16:32:49.130' AS DateTime), CAST(N'2024-06-22T16:32:49.130' AS DateTime))
INSERT [dbo].[Category] ([cid], [cname], [Description], [CreatedAt], [UpdatedAt]) VALUES (7, N'Coupe', N'Mô hình xe Coupe.', CAST(N'2024-06-22T16:32:49.130' AS DateTime), CAST(N'2024-06-22T16:32:49.130' AS DateTime))
INSERT [dbo].[Category] ([cid], [cname], [Description], [CreatedAt], [UpdatedAt]) VALUES (8, N'Minivan', N'Mô hình xe Minivan.', CAST(N'2024-06-22T16:32:49.130' AS DateTime), CAST(N'2024-06-22T16:32:49.130' AS DateTime))
INSERT [dbo].[Category] ([cid], [cname], [Description], [CreatedAt], [UpdatedAt]) VALUES (9, N'Hybrid', N'Mô hình xe Hybrid.', CAST(N'2024-06-22T16:32:49.130' AS DateTime), CAST(N'2024-06-22T16:32:49.130' AS DateTime))
INSERT [dbo].[Category] ([cid], [cname], [Description], [CreatedAt], [UpdatedAt]) VALUES (10, N'Luxury', N'Mô hình xe sang trọng.', CAST(N'2024-06-22T16:32:49.130' AS DateTime), CAST(N'2024-06-22T16:32:49.130' AS DateTime))
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([CustomerID], [FirstName], [LastName], [Email], [Phone], [Address], [City], [Country], [CreatedAt], [UpdatedAt]) VALUES (1, N'Nguyễn', N'Văn A', N'nguyenvana@example.com', N'0912345678', N'123 Đường A', N'Hà Nội', N'Việt Nam', CAST(N'2024-06-20T23:26:55.457' AS DateTime), CAST(N'2024-06-20T23:26:55.457' AS DateTime))
INSERT [dbo].[Customers] ([CustomerID], [FirstName], [LastName], [Email], [Phone], [Address], [City], [Country], [CreatedAt], [UpdatedAt]) VALUES (2, N'Trần', N'Thị B', N'tranthib@example.com', N'0987654321', N'456 Đường B', N'Hồ Chí Minh', N'Việt Nam', CAST(N'2024-06-20T23:26:55.457' AS DateTime), CAST(N'2024-06-20T23:26:55.457' AS DateTime))
INSERT [dbo].[Customers] ([CustomerID], [FirstName], [LastName], [Email], [Phone], [Address], [City], [Country], [CreatedAt], [UpdatedAt]) VALUES (3, N'Lê', N'Văn C', N'levanc@example.com', N'0909123456', N'789 Đường C', N'Đà Nẵng', N'Việt Nam', CAST(N'2024-06-20T23:26:55.457' AS DateTime), CAST(N'2024-06-20T23:26:55.457' AS DateTime))
INSERT [dbo].[Customers] ([CustomerID], [FirstName], [LastName], [Email], [Phone], [Address], [City], [Country], [CreatedAt], [UpdatedAt]) VALUES (4, N'Phạm', N'Thị D', N'phamthid@example.com', N'0934567890', N'101 Đường D', N'Cần Thơ', N'Việt Nam', CAST(N'2024-06-20T23:26:55.457' AS DateTime), CAST(N'2024-06-20T23:26:55.457' AS DateTime))
INSERT [dbo].[Customers] ([CustomerID], [FirstName], [LastName], [Email], [Phone], [Address], [City], [Country], [CreatedAt], [UpdatedAt]) VALUES (5, N'Hoàng', N'Minh E', N'hoangminhe@example.com', N'0923456789', N'102 Đường E', N'Hải Phòng', N'Việt Nam', CAST(N'2024-06-22T16:32:49.130' AS DateTime), CAST(N'2024-06-22T16:32:49.130' AS DateTime))
INSERT [dbo].[Customers] ([CustomerID], [FirstName], [LastName], [Email], [Phone], [Address], [City], [Country], [CreatedAt], [UpdatedAt]) VALUES (6, N'Vũ', N'Anh F', N'vuanhf@example.com', N'0911122233', N'103 Đường F', N'Bắc Ninh', N'Việt Nam', CAST(N'2024-06-22T16:32:49.130' AS DateTime), CAST(N'2024-06-22T16:32:49.130' AS DateTime))
INSERT [dbo].[Customers] ([CustomerID], [FirstName], [LastName], [Email], [Phone], [Address], [City], [Country], [CreatedAt], [UpdatedAt]) VALUES (7, N'Bùi', N'Kim G', N'buikimg@example.com', N'0988991122', N'104 Đường G', N'Nha Trang', N'Việt Nam', CAST(N'2024-06-22T16:32:49.130' AS DateTime), CAST(N'2024-06-22T16:32:49.130' AS DateTime))
INSERT [dbo].[Customers] ([CustomerID], [FirstName], [LastName], [Email], [Phone], [Address], [City], [Country], [CreatedAt], [UpdatedAt]) VALUES (8, N'Đỗ', N'Phúc H', N'dophuch@example.com', N'0966677889', N'105 Đường H', N'Biên Hòa', N'Việt Nam', CAST(N'2024-06-22T16:32:49.130' AS DateTime), CAST(N'2024-06-22T16:32:49.130' AS DateTime))
INSERT [dbo].[Customers] ([CustomerID], [FirstName], [LastName], [Email], [Phone], [Address], [City], [Country], [CreatedAt], [UpdatedAt]) VALUES (9, N'Phan', N'Quốc I', N'phanquoci@example.com', N'0944556677', N'106 Đường I', N'Vũng Tàu', N'Việt Nam', CAST(N'2024-06-22T16:32:49.130' AS DateTime), CAST(N'2024-06-22T16:32:49.130' AS DateTime))
INSERT [dbo].[Customers] ([CustomerID], [FirstName], [LastName], [Email], [Phone], [Address], [City], [Country], [CreatedAt], [UpdatedAt]) VALUES (10, N'Hồ', N'Ngọc J', N'hongocj@example.com', N'0933344455', N'107 Đường J', N'Quy Nhơn', N'Việt Nam', CAST(N'2024-06-22T16:32:49.130' AS DateTime), CAST(N'2024-06-22T16:32:49.130' AS DateTime))
SET IDENTITY_INSERT [dbo].[Customers] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderItem] ON 

INSERT [dbo].[OrderItem] ([id], [order_id], [product_id], [quantity], [price], [CreatedAt], [UpdatedAt]) VALUES (2, 2, 2, 2, CAST(3000000.00 AS Decimal(10, 2)), CAST(N'2024-06-20T23:26:55.470' AS DateTime), CAST(N'2024-06-20T23:26:55.470' AS DateTime))
INSERT [dbo].[OrderItem] ([id], [order_id], [product_id], [quantity], [price], [CreatedAt], [UpdatedAt]) VALUES (3, 3, 3, 1, CAST(3500000.00 AS Decimal(10, 2)), CAST(N'2024-06-20T23:26:55.470' AS DateTime), CAST(N'2024-06-20T23:26:55.470' AS DateTime))
INSERT [dbo].[OrderItem] ([id], [order_id], [product_id], [quantity], [price], [CreatedAt], [UpdatedAt]) VALUES (4, 4, 4, 1, CAST(4500000.00 AS Decimal(10, 2)), CAST(N'2024-06-20T23:26:55.470' AS DateTime), CAST(N'2024-06-20T23:26:55.470' AS DateTime))
INSERT [dbo].[OrderItem] ([id], [order_id], [product_id], [quantity], [price], [CreatedAt], [UpdatedAt]) VALUES (5, 5, 5, 1, CAST(3200000.00 AS Decimal(10, 2)), CAST(N'2024-06-22T16:32:49.133' AS DateTime), CAST(N'2024-06-22T16:32:49.133' AS DateTime))
INSERT [dbo].[OrderItem] ([id], [order_id], [product_id], [quantity], [price], [CreatedAt], [UpdatedAt]) VALUES (6, 6, 6, 1, CAST(2800000.00 AS Decimal(10, 2)), CAST(N'2024-06-22T16:32:49.133' AS DateTime), CAST(N'2024-06-22T16:32:49.133' AS DateTime))
INSERT [dbo].[OrderItem] ([id], [order_id], [product_id], [quantity], [price], [CreatedAt], [UpdatedAt]) VALUES (7, 7, 7, 1, CAST(5000000.00 AS Decimal(10, 2)), CAST(N'2024-06-22T16:32:49.133' AS DateTime), CAST(N'2024-06-22T16:32:49.133' AS DateTime))
INSERT [dbo].[OrderItem] ([id], [order_id], [product_id], [quantity], [price], [CreatedAt], [UpdatedAt]) VALUES (8, 8, 8, 1, CAST(4000000.00 AS Decimal(10, 2)), CAST(N'2024-06-22T16:32:49.133' AS DateTime), CAST(N'2024-06-22T16:32:49.133' AS DateTime))
INSERT [dbo].[OrderItem] ([id], [order_id], [product_id], [quantity], [price], [CreatedAt], [UpdatedAt]) VALUES (9, 9, 9, 1, CAST(4500000.00 AS Decimal(10, 2)), CAST(N'2024-06-22T16:32:49.133' AS DateTime), CAST(N'2024-06-22T16:32:49.133' AS DateTime))
INSERT [dbo].[OrderItem] ([id], [order_id], [product_id], [quantity], [price], [CreatedAt], [UpdatedAt]) VALUES (10, 10, 10, 1, CAST(3800000.00 AS Decimal(10, 2)), CAST(N'2024-06-22T16:32:49.133' AS DateTime), CAST(N'2024-06-22T16:32:49.133' AS DateTime))
INSERT [dbo].[OrderItem] ([id], [order_id], [product_id], [quantity], [price], [CreatedAt], [UpdatedAt]) VALUES (15, 22, 1, 1, CAST(2500000.00 AS Decimal(10, 2)), CAST(N'2024-07-07T17:32:34.043' AS DateTime), CAST(N'2024-07-07T17:32:34.043' AS DateTime))
INSERT [dbo].[OrderItem] ([id], [order_id], [product_id], [quantity], [price], [CreatedAt], [UpdatedAt]) VALUES (16, 22, 8, 1, CAST(4000000.00 AS Decimal(10, 2)), CAST(N'2024-07-07T17:32:34.047' AS DateTime), CAST(N'2024-07-07T17:32:34.047' AS DateTime))
SET IDENTITY_INSERT [dbo].[OrderItem] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([id], [user_id], [order_date], [total_price], [status], [CreatedAt], [UpdatedAt]) VALUES (2, 2, CAST(N'2024-06-02T11:30:00.000' AS DateTime), CAST(6000000.00 AS Decimal(10, 2)), N'Shipped', CAST(N'2024-06-20T23:26:55.463' AS DateTime), CAST(N'2024-06-20T23:26:55.463' AS DateTime))
INSERT [dbo].[Orders] ([id], [user_id], [order_date], [total_price], [status], [CreatedAt], [UpdatedAt]) VALUES (3, 3, CAST(N'2024-06-03T14:45:00.000' AS DateTime), CAST(3500000.00 AS Decimal(10, 2)), N'Delivered', CAST(N'2024-06-20T23:26:55.463' AS DateTime), CAST(N'2024-06-20T23:26:55.463' AS DateTime))
INSERT [dbo].[Orders] ([id], [user_id], [order_date], [total_price], [status], [CreatedAt], [UpdatedAt]) VALUES (4, 4, CAST(N'2024-06-04T16:00:00.000' AS DateTime), CAST(4500000.00 AS Decimal(10, 2)), N'Cancelled', CAST(N'2024-06-20T23:26:55.463' AS DateTime), CAST(N'2024-06-20T23:26:55.463' AS DateTime))
INSERT [dbo].[Orders] ([id], [user_id], [order_date], [total_price], [status], [CreatedAt], [UpdatedAt]) VALUES (5, 5, CAST(N'2024-06-05T09:00:00.000' AS DateTime), CAST(3200000.00 AS Decimal(10, 2)), N'Pending', CAST(N'2024-06-22T16:32:49.133' AS DateTime), CAST(N'2024-06-22T16:32:49.133' AS DateTime))
INSERT [dbo].[Orders] ([id], [user_id], [order_date], [total_price], [status], [CreatedAt], [UpdatedAt]) VALUES (6, 6, CAST(N'2024-06-06T10:15:00.000' AS DateTime), CAST(2800000.00 AS Decimal(10, 2)), N'Shipped', CAST(N'2024-06-22T16:32:49.133' AS DateTime), CAST(N'2024-06-22T16:32:49.133' AS DateTime))
INSERT [dbo].[Orders] ([id], [user_id], [order_date], [total_price], [status], [CreatedAt], [UpdatedAt]) VALUES (7, 7, CAST(N'2024-06-07T11:45:00.000' AS DateTime), CAST(5000000.00 AS Decimal(10, 2)), N'Delivered', CAST(N'2024-06-22T16:32:49.133' AS DateTime), CAST(N'2024-06-22T16:32:49.133' AS DateTime))
INSERT [dbo].[Orders] ([id], [user_id], [order_date], [total_price], [status], [CreatedAt], [UpdatedAt]) VALUES (8, 8, CAST(N'2024-06-08T13:30:00.000' AS DateTime), CAST(4000000.00 AS Decimal(10, 2)), N'Cancelled', CAST(N'2024-06-22T16:32:49.133' AS DateTime), CAST(N'2024-06-22T16:32:49.133' AS DateTime))
INSERT [dbo].[Orders] ([id], [user_id], [order_date], [total_price], [status], [CreatedAt], [UpdatedAt]) VALUES (9, 9, CAST(N'2024-06-09T15:00:00.000' AS DateTime), CAST(4500000.00 AS Decimal(10, 2)), N'Paid', CAST(N'2024-06-22T16:32:49.133' AS DateTime), CAST(N'2024-06-22T16:32:49.133' AS DateTime))
INSERT [dbo].[Orders] ([id], [user_id], [order_date], [total_price], [status], [CreatedAt], [UpdatedAt]) VALUES (10, 10, CAST(N'2024-06-10T16:30:00.000' AS DateTime), CAST(3800000.00 AS Decimal(10, 2)), N'Shipped', CAST(N'2024-06-22T16:32:49.133' AS DateTime), CAST(N'2024-06-22T16:32:49.133' AS DateTime))
INSERT [dbo].[Orders] ([id], [user_id], [order_date], [total_price], [status], [CreatedAt], [UpdatedAt]) VALUES (11, 5, CAST(N'2024-06-05T09:00:00.000' AS DateTime), CAST(3200000.00 AS Decimal(10, 2)), N'Pending', CAST(N'2024-06-22T16:32:49.133' AS DateTime), CAST(N'2024-06-22T16:32:49.133' AS DateTime))
INSERT [dbo].[Orders] ([id], [user_id], [order_date], [total_price], [status], [CreatedAt], [UpdatedAt]) VALUES (12, 6, CAST(N'2024-06-06T10:15:00.000' AS DateTime), CAST(2800000.00 AS Decimal(10, 2)), N'Shipped', CAST(N'2024-06-22T16:32:49.133' AS DateTime), CAST(N'2024-06-22T16:32:49.133' AS DateTime))
INSERT [dbo].[Orders] ([id], [user_id], [order_date], [total_price], [status], [CreatedAt], [UpdatedAt]) VALUES (13, 7, CAST(N'2024-06-07T11:45:00.000' AS DateTime), CAST(5000000.00 AS Decimal(10, 2)), N'Delivered', CAST(N'2024-06-22T16:32:49.133' AS DateTime), CAST(N'2024-06-22T16:32:49.133' AS DateTime))
INSERT [dbo].[Orders] ([id], [user_id], [order_date], [total_price], [status], [CreatedAt], [UpdatedAt]) VALUES (14, 8, CAST(N'2024-06-08T13:30:00.000' AS DateTime), CAST(4000000.00 AS Decimal(10, 2)), N'Cancelled', CAST(N'2024-06-22T16:32:49.133' AS DateTime), CAST(N'2024-06-22T16:32:49.133' AS DateTime))
INSERT [dbo].[Orders] ([id], [user_id], [order_date], [total_price], [status], [CreatedAt], [UpdatedAt]) VALUES (15, 9, CAST(N'2024-06-09T15:00:00.000' AS DateTime), CAST(4500000.00 AS Decimal(10, 2)), N'Pending', CAST(N'2024-06-22T16:32:49.133' AS DateTime), CAST(N'2024-06-22T16:32:49.133' AS DateTime))
INSERT [dbo].[Orders] ([id], [user_id], [order_date], [total_price], [status], [CreatedAt], [UpdatedAt]) VALUES (16, 10, CAST(N'2024-06-10T16:30:00.000' AS DateTime), CAST(3800000.00 AS Decimal(10, 2)), N'Shipped', CAST(N'2024-06-22T16:32:49.133' AS DateTime), CAST(N'2024-06-22T16:32:49.133' AS DateTime))
INSERT [dbo].[Orders] ([id], [user_id], [order_date], [total_price], [status], [CreatedAt], [UpdatedAt]) VALUES (20, 1, CAST(N'2024-07-07T16:23:55.293' AS DateTime), CAST(5500000.00 AS Decimal(10, 2)), N'Paid', CAST(N'2024-07-07T16:23:55.293' AS DateTime), CAST(N'2024-07-07T16:23:55.293' AS DateTime))
INSERT [dbo].[Orders] ([id], [user_id], [order_date], [total_price], [status], [CreatedAt], [UpdatedAt]) VALUES (22, 1, CAST(N'2024-07-07T17:32:34.040' AS DateTime), CAST(6500000.00 AS Decimal(10, 2)), N'Pending', CAST(N'2024-07-07T17:32:34.040' AS DateTime), CAST(N'2024-07-07T17:32:34.040' AS DateTime))
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
INSERT [dbo].[payment_info] ([order_id], [name], [address], [phone]) VALUES (2, N'Customer_2', N'Address_2', N'09891615888')
INSERT [dbo].[payment_info] ([order_id], [name], [address], [phone]) VALUES (3, N'Customer_3', N'Address_3', N'09652635461')
INSERT [dbo].[payment_info] ([order_id], [name], [address], [phone]) VALUES (4, N'Customer_4', N'Address_4', N'09585980154')
INSERT [dbo].[payment_info] ([order_id], [name], [address], [phone]) VALUES (5, N'Customer_5', N'Address_5', N'09344113583')
INSERT [dbo].[payment_info] ([order_id], [name], [address], [phone]) VALUES (6, N'Customer_6', N'Address_6', N'09436696441')
INSERT [dbo].[payment_info] ([order_id], [name], [address], [phone]) VALUES (7, N'Customer_7', N'Address_7', N'09832230614')
INSERT [dbo].[payment_info] ([order_id], [name], [address], [phone]) VALUES (8, N'Customer_8', N'Address_8', N'09903169541')
INSERT [dbo].[payment_info] ([order_id], [name], [address], [phone]) VALUES (9, N'Customer_9', N'Address_9', N'09104743059')
INSERT [dbo].[payment_info] ([order_id], [name], [address], [phone]) VALUES (10, N'Customer_10', N'Address_10', N'09211952173')
INSERT [dbo].[payment_info] ([order_id], [name], [address], [phone]) VALUES (11, N'Customer_5', N'Address_11', N'09127043008')
INSERT [dbo].[payment_info] ([order_id], [name], [address], [phone]) VALUES (12, N'Customer_6', N'Address_12', N'09140398341')
INSERT [dbo].[payment_info] ([order_id], [name], [address], [phone]) VALUES (13, N'Customer_7', N'Address_13', N'09512373228')
INSERT [dbo].[payment_info] ([order_id], [name], [address], [phone]) VALUES (14, N'Customer_8', N'Address_14', N'0989644339')
INSERT [dbo].[payment_info] ([order_id], [name], [address], [phone]) VALUES (15, N'Customer_9', N'Address_15', N'09285294866')
INSERT [dbo].[payment_info] ([order_id], [name], [address], [phone]) VALUES (16, N'Customer_10', N'Address_16', N'0952101272')
INSERT [dbo].[payment_info] ([order_id], [name], [address], [phone]) VALUES (20, N'Dang Thai Son', N'S? 43, ph? Quán Chè', N'0886920143')
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([id], [cateID], [name], [brand], [Scale], [price], [Stock], [description], [image], [CreatedAt], [UpdatedAt], [title]) VALUES (1, 1, N'Toyota Camry', N'Toyota', N'1:18', CAST(2500000.00 AS Decimal(10, 2)), 1, N'Mô hình xe Toyota Camry tỉ lệ 1:18', N'https://product.hstatic.net/1000328919/product/mo-hinh-xe-toyota-camry-2021-118-paudi-black_5339fa9d8ba04cd88721baab63544747_grande.jpg', CAST(N'2024-06-20T23:26:55.450' AS DateTime), CAST(N'2024-06-20T23:26:55.450' AS DateTime), N'Toyota Camry')
INSERT [dbo].[Product] ([id], [cateID], [name], [brand], [Scale], [price], [Stock], [description], [image], [CreatedAt], [UpdatedAt], [title]) VALUES (2, 2, N'Ford Explorer', N'Ford', N'1:18', CAST(3000000.00 AS Decimal(10, 2)), 5, N'Mô hình xe Ford Explorer tỉ lệ 1:18', N'https://product.hstatic.net/1000328919/product/mo-hinh-xe-ford-explorer-118-dealer-2023-grey_196804120d6f46ad8d2103eebb6f8b77.jpg', CAST(N'2024-06-20T23:26:55.450' AS DateTime), CAST(N'2024-06-20T23:26:55.450' AS DateTime), N'Ford Explorer')
INSERT [dbo].[Product] ([id], [cateID], [name], [brand], [Scale], [price], [Stock], [description], [image], [CreatedAt], [UpdatedAt], [title]) VALUES (3, 3, N'Chevrolet Silverado', N'Chevrolet', N'1:24', CAST(3500000.00 AS Decimal(10, 2)), 8, N'Mô hình xe tải Chevrolet Silverado tỉ lệ 1:24', N'https://m.media-amazon.com/images/I/61r8f5CLFIL._AC_UF894,1000_QL80_.jpg', CAST(N'2024-06-20T23:26:55.450' AS DateTime), CAST(N'2024-06-20T23:26:55.450' AS DateTime), N'Chevrolet Silverado')
INSERT [dbo].[Product] ([id], [cateID], [name], [brand], [Scale], [price], [Stock], [description], [image], [CreatedAt], [UpdatedAt], [title]) VALUES (4, 4, N'Ferrari 488', N'Ferrari', N'1:18', CAST(4500000.00 AS Decimal(10, 2)), 3, N'Mô hình xe Ferrari 488 tỉ lệ 1:18', N'https://product.hstatic.net/1000328919/product/mo-hinh-xe-ferrari-488-gtb-1-18-bburago-signature-red__1__3307bb963e624dd89adfd43dab42a38e_grande.jpg', CAST(N'2024-06-20T23:26:55.450' AS DateTime), CAST(N'2024-06-20T23:26:55.450' AS DateTime), N'Ferrari 488')
INSERT [dbo].[Product] ([id], [cateID], [name], [brand], [Scale], [price], [Stock], [description], [image], [CreatedAt], [UpdatedAt], [title]) VALUES (5, 5, N'BMW Z4', N'BMW', N'1:18', CAST(3200000.00 AS Decimal(10, 2)), 7, N'Mô hình xe BMW Z4 tỉ lệ 1:18', N'https://xemohinhcaocap.com/wp-content/uploads/2021/08/BMW-Z4-2019-NOREV-1-18-2-1.jpg', CAST(N'2024-06-22T16:32:49.130' AS DateTime), CAST(N'2024-06-22T16:32:49.130' AS DateTime), N'BMW Z4')
INSERT [dbo].[Product] ([id], [cateID], [name], [brand], [Scale], [price], [Stock], [description], [image], [CreatedAt], [UpdatedAt], [title]) VALUES (6, 6, N'Audi A4', N'Audi', N'1:24', CAST(2800000.00 AS Decimal(10, 2)), 6, N'Mô hình xe Audi A4 tỉ lệ 1:24', N'https://jola.vn/cdn/720/Product/lApVGU0yg/mo-hinh-xe-audi-a4-all-new-2017-118-2.jpg', CAST(N'2024-06-22T16:32:49.130' AS DateTime), CAST(N'2024-06-22T16:32:49.130' AS DateTime), N'Audi A4')
INSERT [dbo].[Product] ([id], [cateID], [name], [brand], [Scale], [price], [Stock], [description], [image], [CreatedAt], [UpdatedAt], [title]) VALUES (7, 7, N'Lamborghini Huracan', N'Lamborghini', N'1:18', CAST(5000000.00 AS Decimal(10, 2)), 4, N'Mô hình xe Lamborghini Huracan tỉ lệ 1:18', N'https://live.staticflickr.com/65535/51975337342_9d3f2a4e78_z.jpg', CAST(N'2024-06-22T16:32:49.130' AS DateTime), CAST(N'2024-06-22T16:32:49.130' AS DateTime), N'Lamborghini Huracan')
INSERT [dbo].[Product] ([id], [cateID], [name], [brand], [Scale], [price], [Stock], [description], [image], [CreatedAt], [UpdatedAt], [title]) VALUES (8, 8, N'Mercedes G-Class', N'Mercedes-Benz', N'1:18', CAST(4000000.00 AS Decimal(10, 2)), 9, N'Mô hình xe Mercedes G-Class tỉ lệ 1:18', N'https://product.hstatic.net/1000288177/product/8e786fa9-6dad-4edc-a353-856d46002231_b493d19e06ed41e5a897d5f28d5b220b_master.jpg', CAST(N'2024-06-22T16:32:49.130' AS DateTime), CAST(N'2024-06-22T16:32:49.130' AS DateTime), N'Mercedes G-Class')
INSERT [dbo].[Product] ([id], [cateID], [name], [brand], [Scale], [price], [Stock], [description], [image], [CreatedAt], [UpdatedAt], [title]) VALUES (9, 9, N'Porsche 911', N'Porsche', N'1:18', CAST(4500000.00 AS Decimal(10, 2)), 2, N'Mô hình xe Porsche 911 tỉ lệ 1:18', N'https://product.hstatic.net/1000288177/product/z4418345464222_d3b7da94cab6a43b0e034761ca446d4a_a9fae407c48746918f4ae7eb68d2eafd_master.jpg', CAST(N'2024-06-22T16:32:49.130' AS DateTime), CAST(N'2024-06-22T16:32:49.130' AS DateTime), N'Porsche 911')
INSERT [dbo].[Product] ([id], [cateID], [name], [brand], [Scale], [price], [Stock], [description], [image], [CreatedAt], [UpdatedAt], [title]) VALUES (10, 10, N'Tesla Model S', N'Tesla', N'1:18', CAST(3800000.00 AS Decimal(10, 2)), 5, N'Mô hình xe Tesla Model S tỉ lệ 1:18', N'https://image.made-in-china.com/202f0j00ACoheGmswbpc/Original-Factory-Authentic-1-18-Tesla-Model-S-P100d-Diecast-Car-Model-for-Collection.webp', CAST(N'2024-06-22T16:32:49.130' AS DateTime), CAST(N'2024-06-22T16:32:49.130' AS DateTime), N'Tesla Model S')
INSERT [dbo].[Product] ([id], [cateID], [name], [brand], [Scale], [price], [Stock], [description], [image], [CreatedAt], [UpdatedAt], [title]) VALUES (11, 1, N'Honda Accord', N'Honda', N'1:18', CAST(2700000.00 AS Decimal(10, 2)), 15, N'Mô hình xe Honda Accord tỉ lệ 1:18', N'https://product.hstatic.net/1000328919/product/o-honda-accord-2018-dealer__1__f1142d56bedd4bc7bd3e90679091f6c0_grande_19ada73ccc2f4714afe35ae2a5350ae5_grande.jpg', CAST(N'2024-06-22T16:39:03.053' AS DateTime), CAST(N'2024-06-22T16:39:03.053' AS DateTime), N'Honda Accord')
INSERT [dbo].[Product] ([id], [cateID], [name], [brand], [Scale], [price], [Stock], [description], [image], [CreatedAt], [UpdatedAt], [title]) VALUES (12, 1, N'Nissan Altima', N'Nissan', N'1:18', CAST(2600000.00 AS Decimal(10, 2)), 12, N'Mô hình xe Nissan Altima tỉ lệ 1:18', N'https://i.ebayimg.com/images/g/lQ8AAOSwDpBjcK4b/s-l400.jpg', CAST(N'2024-06-22T16:39:03.053' AS DateTime), CAST(N'2024-06-22T16:39:03.053' AS DateTime), N'Nissan Altima')
INSERT [dbo].[Product] ([id], [cateID], [name], [brand], [Scale], [price], [Stock], [description], [image], [CreatedAt], [UpdatedAt], [title]) VALUES (13, 1, N'Hyundai Sonata', N'Hyundai', N'1:24', CAST(2500000.00 AS Decimal(10, 2)), 14, N'Mô hình xe Hyundai Sonata tỉ lệ 1:24', N'https://cf.shopee.vn/file/47fc14def8d18fc4e05d18599349b05e', CAST(N'2024-06-22T16:39:03.053' AS DateTime), CAST(N'2024-06-22T16:39:03.053' AS DateTime), N'Hyundai Sonata')
INSERT [dbo].[Product] ([id], [cateID], [name], [brand], [Scale], [price], [Stock], [description], [image], [CreatedAt], [UpdatedAt], [title]) VALUES (14, 1, N'Kia Optima', N'Kia', N'1:18', CAST(2400000.00 AS Decimal(10, 2)), 18, N'Mô hình xe Kia Optima tỉ lệ 1:18', N'https://preview.free3d.com/img/2014/10/2397170246109628128/1p4n0nag-900.jpg', CAST(N'2024-06-22T16:39:03.053' AS DateTime), CAST(N'2024-06-22T16:39:03.053' AS DateTime), N'Kia Optima')
INSERT [dbo].[Product] ([id], [cateID], [name], [brand], [Scale], [price], [Stock], [description], [image], [CreatedAt], [UpdatedAt], [title]) VALUES (15, 1, N'Chevrolet Malibu', N'Chevrolet', N'1:24', CAST(2300000.00 AS Decimal(10, 2)), 16, N'Mô hình xe Chevrolet Malibu tỉ lệ 1:24', N'https://i.ebayimg.com/images/g/OD4AAOSw3yZj70ge/s-l1200.webp', CAST(N'2024-06-22T16:39:03.053' AS DateTime), CAST(N'2024-06-22T16:39:03.053' AS DateTime), N'Chevrolet Malibu')
INSERT [dbo].[Product] ([id], [cateID], [name], [brand], [Scale], [price], [Stock], [description], [image], [CreatedAt], [UpdatedAt], [title]) VALUES (16, 2, N'Toyota RAV4', N'Toyota', N'1:18', CAST(2800000.00 AS Decimal(10, 2)), 10, N'Mô hình xe Toyota RAV4 tỉ lệ 1:18', N'https://product.hstatic.net/1000328919/product/mo-hinh-xe-toyota-rav4-2019-white-1-18-dealer__13__5360182f921949bab425dc4bd9053b4a.jpg', CAST(N'2024-06-22T16:39:03.057' AS DateTime), CAST(N'2024-06-22T16:39:03.057' AS DateTime), N'Toyota RAV4')
INSERT [dbo].[Product] ([id], [cateID], [name], [brand], [Scale], [price], [Stock], [description], [image], [CreatedAt], [UpdatedAt], [title]) VALUES (17, 2, N'Jeep Grand Cherokee', N'Jeep', N'1:24', CAST(2900000.00 AS Decimal(10, 2)), 8, N'Mô hình xe Jeep Grand Cherokee tỉ lệ 1:24', N'https://trummohinh.com/wp-content/uploads/2020/09/10386763301_1954656025.jpg', CAST(N'2024-06-22T16:39:03.057' AS DateTime), CAST(N'2024-06-22T16:39:03.057' AS DateTime), N'Jeep Grand Cherokee')
INSERT [dbo].[Product] ([id], [cateID], [name], [brand], [Scale], [price], [Stock], [description], [image], [CreatedAt], [UpdatedAt], [title]) VALUES (18, 2, N'Mazda CX-5', N'Mazda', N'1:18', CAST(2700000.00 AS Decimal(10, 2)), 12, N'Mô hình xe Mazda CX-5 tỉ lệ 1:18', N'https://product.hstatic.net/200000726533/product/mo-hinh-xe-mazda-cx-5-1-18-paudi-2020__1__5a094f737387474dab2eda3bfa80b45f_grande.jpg', CAST(N'2024-06-22T16:39:03.057' AS DateTime), CAST(N'2024-06-22T16:39:03.057' AS DateTime), N'Mazda CX-5')
INSERT [dbo].[Product] ([id], [cateID], [name], [brand], [Scale], [price], [Stock], [description], [image], [CreatedAt], [UpdatedAt], [title]) VALUES (19, 2, N'Subaru Forester', N'Subaru', N'1:24', CAST(2600000.00 AS Decimal(10, 2)), 14, N'Mô hình xe Subaru Forester tỉ lệ 1:24', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJ6UPNeNRZebRVxRwNS3AxVkzDRMHoKjTc8g&s', CAST(N'2024-06-22T16:39:03.057' AS DateTime), CAST(N'2024-06-22T16:39:03.057' AS DateTime), N'Subaru Forester')
INSERT [dbo].[Product] ([id], [cateID], [name], [brand], [Scale], [price], [Stock], [description], [image], [CreatedAt], [UpdatedAt], [title]) VALUES (20, 2, N'BMW X5', N'BMW', N'1:18', CAST(3100000.00 AS Decimal(10, 2)), 6, N'Mô hình xe BMW X5 tỉ lệ 1:18', N'https://xemohinhcaocap.com/wp-content/uploads/2021/03/BMW-X5-118-Norev-1.jpg', CAST(N'2024-06-22T16:39:03.057' AS DateTime), CAST(N'2024-06-22T16:39:03.057' AS DateTime), N'BMW X5')
INSERT [dbo].[Product] ([id], [cateID], [name], [brand], [Scale], [price], [Stock], [description], [image], [CreatedAt], [UpdatedAt], [title]) VALUES (21, 3, N'Ford F-150', N'Ford', N'1:18', CAST(3600000.00 AS Decimal(10, 2)), 8, N'Mô hình xe Ford F-150 tỉ lệ 1:18', N'https://canary.contestimg.wish.com/api/webimage/5e3a6dbaee14e73b73d9d4ff-contest.jpg?cache_buster=537bfa5163f34f27f035ec72936a89e2', CAST(N'2024-06-22T16:39:03.057' AS DateTime), CAST(N'2024-06-22T16:39:03.057' AS DateTime), N'Ford F-150')
INSERT [dbo].[Product] ([id], [cateID], [name], [brand], [Scale], [price], [Stock], [description], [image], [CreatedAt], [UpdatedAt], [title]) VALUES (22, 3, N'Toyota Tundra', N'Toyota', N'1:24', CAST(3700000.00 AS Decimal(10, 2)), 7, N'Mô hình xe Toyota Tundra tỉ lệ 1:24', N'https://product.hstatic.net/1000328919/product/mo-hinh-xe-toyota-tundra-2022-132-hongsen-model-white_ec689d74924543a48fb75d4ae9d3ff36.jpg', CAST(N'2024-06-22T16:39:03.057' AS DateTime), CAST(N'2024-06-22T16:39:03.057' AS DateTime), N'Toyota Tundra')
INSERT [dbo].[Product] ([id], [cateID], [name], [brand], [Scale], [price], [Stock], [description], [image], [CreatedAt], [UpdatedAt], [title]) VALUES (23, 3, N'RAM 1500', N'RAM', N'1:18', CAST(3800000.00 AS Decimal(10, 2)), 6, N'Mô hình xe RAM 1500 tỉ lệ 1:18', N'https://otomohinhtinh.com/files/sanpham/1650/3/jpg/mo-hinh-xe-ban-tai-dodge-ram-1500-132.jpg', CAST(N'2024-06-22T16:39:03.057' AS DateTime), CAST(N'2024-06-22T16:39:03.057' AS DateTime), N'RAM 1500')
INSERT [dbo].[Product] ([id], [cateID], [name], [brand], [Scale], [price], [Stock], [description], [image], [CreatedAt], [UpdatedAt], [title]) VALUES (24, 3, N'GMC Sierra', N'GMC', N'1:24', CAST(3900000.00 AS Decimal(10, 2)), 5, N'Mô hình xe GMC Sierra tỉ lệ 1:24', N'https://images-na.ssl-images-amazon.com/images/I/61fPcz2UUGL.SS400.jpg', CAST(N'2024-06-22T16:39:03.057' AS DateTime), CAST(N'2024-06-22T16:39:03.057' AS DateTime), N'GMC Sierra')
INSERT [dbo].[Product] ([id], [cateID], [name], [brand], [Scale], [price], [Stock], [description], [image], [CreatedAt], [UpdatedAt], [title]) VALUES (25, 3, N'Nissan Titan', N'Nissan', N'1:18', CAST(4000000.00 AS Decimal(10, 2)), 4, N'Mô hình xe Nissan Titan tỉ lệ 1:18', N'https://ae01.alicdn.com/kf/S65a0c649e70d456c954cfaf54cc352c4v.jpg', CAST(N'2024-06-22T16:39:03.057' AS DateTime), CAST(N'2024-06-22T16:39:03.057' AS DateTime), N'Nissan Titan')
INSERT [dbo].[Product] ([id], [cateID], [name], [brand], [Scale], [price], [Stock], [description], [image], [CreatedAt], [UpdatedAt], [title]) VALUES (26, 4, N'McLaren 720S', N'McLaren', N'1:18', CAST(4700000.00 AS Decimal(10, 2)), 3, N'Mô hình xe McLaren 720S tỉ lệ 1:18', N'https://trummohinh.com/wp-content/uploads/2022/07/Layer-0-2.png', CAST(N'2024-06-22T16:39:03.057' AS DateTime), CAST(N'2024-06-22T16:39:03.057' AS DateTime), N'McLaren 720S')
INSERT [dbo].[Product] ([id], [cateID], [name], [brand], [Scale], [price], [Stock], [description], [image], [CreatedAt], [UpdatedAt], [title]) VALUES (27, 4, N'Aston Martin DB11', N'Aston Martin', N'1:24', CAST(4600000.00 AS Decimal(10, 2)), 2, N'Mô hình xe Aston Martin DB11 tỉ lệ 1:24', N'https://diecastsociety.com//wp-content/uploads/2017/09/db11_astonmartin22.jpg', CAST(N'2024-06-22T16:39:03.057' AS DateTime), CAST(N'2024-06-22T16:39:03.057' AS DateTime), N'Aston Martin DB11')
INSERT [dbo].[Product] ([id], [cateID], [name], [brand], [Scale], [price], [Stock], [description], [image], [CreatedAt], [UpdatedAt], [title]) VALUES (28, 4, N'Bugatti Chiron', N'Bugatti', N'1:18', CAST(4800000.00 AS Decimal(10, 2)), 1, N'Mô hình xe Bugatti Chiron tỉ lệ 1:18', N'https://jola.vn/cdn/720/Product/251xh3EDa/xe-mo-hinh-bugatti-chiron-welly-fx-jola-4.jpg', CAST(N'2024-06-22T16:39:03.057' AS DateTime), CAST(N'2024-06-22T16:39:03.057' AS DateTime), N'Bugatti Chiron')
INSERT [dbo].[Product] ([id], [cateID], [name], [brand], [Scale], [price], [Stock], [description], [image], [CreatedAt], [UpdatedAt], [title]) VALUES (29, 4, N'Porsche 918', N'Porsche', N'1:18', CAST(4900000.00 AS Decimal(10, 2)), 2, N'Mô hình xe Porsche 918 tỉ lệ 1:18', N'https://trummohinh.com/wp-content/uploads/2020/07/918-spyder-grey-124-welly__2__286de91875b74dc7aa978c8d148130f9_grande_7b057ff1709148f29134c480e2d6a856_1024x1024.jpg', CAST(N'2024-06-22T16:39:03.057' AS DateTime), CAST(N'2024-06-22T16:39:03.057' AS DateTime), N'Porsche 918')
INSERT [dbo].[Product] ([id], [cateID], [name], [brand], [Scale], [price], [Stock], [description], [image], [CreatedAt], [UpdatedAt], [title]) VALUES (30, 4, N'Ferrari LaFerrari', N'Ferrari', N'1:24', CAST(5000000.00 AS Decimal(10, 2)), 3, N'Mô hình xe Ferrari LaFerrari tỉ lệ 1:24', N'https://product.hstatic.net/1000328919/product/mo-hinh-xe-ferrari-laferrari-1-18-bburago-signature-red__1__bc3673443263478891052b05e922af83_grande.jpg', CAST(N'2024-06-22T16:39:03.057' AS DateTime), CAST(N'2024-06-22T16:39:03.057' AS DateTime), N'Ferrari LaFerrari')
INSERT [dbo].[Product] ([id], [cateID], [name], [brand], [Scale], [price], [Stock], [description], [image], [CreatedAt], [UpdatedAt], [title]) VALUES (31, 5, N'Mazda MX-5 Miata', N'Mazda', N'1:18', CAST(3100000.00 AS Decimal(10, 2)), 6, N'Mô hình xe Mazda MX-5 Miata tỉ lệ 1:18', N'https://down-br.img.susercontent.com/file/br-11134201-23020-wr4ou1yl5pnv97', CAST(N'2024-06-22T16:39:03.060' AS DateTime), CAST(N'2024-06-22T16:39:03.060' AS DateTime), N'Mazda MX-5 Miata')
INSERT [dbo].[Product] ([id], [cateID], [name], [brand], [Scale], [price], [Stock], [description], [image], [CreatedAt], [UpdatedAt], [title]) VALUES (32, 5, N'Chevrolet Corvette', N'Chevrolet', N'1:24', CAST(3200000.00 AS Decimal(10, 2)), 7, N'Mô hình xe Chevrolet Corvette tỉ lệ 1:24', N'https://jola.vn/cdn/720/Product/RbK95g8XN/mo-hinh-xe-chevrolet-corvette-z06-2017-124-2.jpg', CAST(N'2024-06-22T16:39:03.060' AS DateTime), CAST(N'2024-06-22T16:39:03.060' AS DateTime), N'Chevrolet Corvette')
INSERT [dbo].[Product] ([id], [cateID], [name], [brand], [Scale], [price], [Stock], [description], [image], [CreatedAt], [UpdatedAt], [title]) VALUES (34, 5, N'Audi TT', N'Audi', N'1:24', CAST(3400000.00 AS Decimal(10, 2)), 8, N'Mô hình xe Audi TT tỉ lệ 1:24', N'https://product.hstatic.net/1000288177/product/20221009_161815_82204217834845e9bdc3f587823addc4_master.jpg', CAST(N'2024-06-22T16:39:03.060' AS DateTime), CAST(N'2024-06-22T16:39:03.060' AS DateTime), N'Audi TT')
INSERT [dbo].[Product] ([id], [cateID], [name], [brand], [Scale], [price], [Stock], [description], [image], [CreatedAt], [UpdatedAt], [title]) VALUES (35, 5, N'Mercedes-Benz SL', N'Mercedes-Benz', N'1:18', CAST(3500000.00 AS Decimal(10, 2)), 9, N'Mô hình xe Mercedes-Benz SL tỉ lệ 1:18', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSY2FdeP0IZsDg0Y-amjgf5f1tQmEUUibpI8Q&s', CAST(N'2024-06-22T16:39:03.060' AS DateTime), CAST(N'2024-06-22T16:39:03.060' AS DateTime), N'Mercedes-Benz SL')
INSERT [dbo].[Product] ([id], [cateID], [name], [brand], [Scale], [price], [Stock], [description], [image], [CreatedAt], [UpdatedAt], [title]) VALUES (36, 6, N'Volkswagen Golf', N'Volkswagen', N'1:18', CAST(2600000.00 AS Decimal(10, 2)), 11, N'Mô hình xe Volkswagen Golf tỉ lệ 1:18', N'https://districtm.vn/wp-content/uploads/2023/10/Greenlight-Gulf-Oil-Special-Edition-Series-1-1974-Volkswagen-Golf-GTI-Widebody-78-Solid-Pack.jpg', CAST(N'2024-06-22T16:39:03.060' AS DateTime), CAST(N'2024-06-22T16:39:03.060' AS DateTime), N'Volkswagen Golf')
INSERT [dbo].[Product] ([id], [cateID], [name], [brand], [Scale], [price], [Stock], [description], [image], [CreatedAt], [UpdatedAt], [title]) VALUES (37, 6, N'Ford Focus', N'Ford', N'1:24', CAST(2700000.00 AS Decimal(10, 2)), 13, N'Mô hình xe Ford Focus tỉ lệ 1:24', N'https://product.hstatic.net/1000328919/product/ford-focus-rs-1-18-1_08d40640f8e24133a1dd26830e850133.jpg', CAST(N'2024-06-22T16:39:03.060' AS DateTime), CAST(N'2024-06-22T16:39:03.060' AS DateTime), N'Ford Focus')
INSERT [dbo].[Product] ([id], [cateID], [name], [brand], [Scale], [price], [Stock], [description], [image], [CreatedAt], [UpdatedAt], [title]) VALUES (38, 6, N'Honda Civic', N'Honda', N'1:18', CAST(2800000.00 AS Decimal(10, 2)), 12, N'Mô hình xe Honda Civic tỉ lệ 1:18', N'https://product.hstatic.net/1000328919/product/mo-hinh-xe-honda-civic-2022-1-18-dealer-white__1__ccda03a6744a4fb9a4a1b8bd405fc403_grande.png', CAST(N'2024-06-22T16:39:03.060' AS DateTime), CAST(N'2024-06-22T16:39:03.060' AS DateTime), N'Honda Civic')
INSERT [dbo].[Product] ([id], [cateID], [name], [brand], [Scale], [price], [Stock], [description], [image], [CreatedAt], [UpdatedAt], [title]) VALUES (39, 6, N'Toyota Yaris', N'Toyota', N'1:24', CAST(2900000.00 AS Decimal(10, 2)), 10, N'Mô hình xe Toyota Yaris tỉ lệ 1:24', N'https://ae01.alicdn.com/kf/Sea9c1034e1984656b0431edd1b9aae25h/Modelo-de-coche-de-aleaci-n-Original-Toyota-Yaris-Gac-1-18-Toyota-Yaris.jpg', CAST(N'2024-06-22T16:39:03.060' AS DateTime), CAST(N'2024-06-22T16:39:03.060' AS DateTime), N'Toyota Yaris')
INSERT [dbo].[Product] ([id], [cateID], [name], [brand], [Scale], [price], [Stock], [description], [image], [CreatedAt], [UpdatedAt], [title]) VALUES (40, 6, N'Hyundai i30', N'Hyundai', N'1:18', CAST(3000000.00 AS Decimal(10, 2)), 8, N'Mô hình xe Hyundai i30 tỉ lệ 1:18', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYC1jyIChiPekBDEw3d4sNbOtwdub0FpLlWg&s', CAST(N'2024-06-22T16:39:03.060' AS DateTime), CAST(N'2024-06-22T16:39:03.060' AS DateTime), N'Hyundai i30')
INSERT [dbo].[Product] ([id], [cateID], [name], [brand], [Scale], [price], [Stock], [description], [image], [CreatedAt], [UpdatedAt], [title]) VALUES (41, 7, N'Chevrolet Camaro', N'Chevrolet', N'1:18', CAST(3700000.00 AS Decimal(10, 2)), 7, N'Mô hình xe Chevrolet Camaro tỉ lệ 1:18', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT4xedk8fqV89Tvn6ImxDBtfTcWBiL70AYgn8nswmrZJw2yeA05FxkxrKhekEHfTng5Log&usqp=CAU', CAST(N'2024-06-22T16:39:03.060' AS DateTime), CAST(N'2024-06-22T16:39:03.060' AS DateTime), N'Chevrolet Camaro')
INSERT [dbo].[Product] ([id], [cateID], [name], [brand], [Scale], [price], [Stock], [description], [image], [CreatedAt], [UpdatedAt], [title]) VALUES (42, 7, N'Dodge Challenger', N'Dodge', N'1:24', CAST(3800000.00 AS Decimal(10, 2)), 6, N'Mô hình xe Dodge Challenger tỉ lệ 1:24', N'https://rc-volt.ca/cdn/shop/products/MZP451BL_1024x1024.jpg?v=1680881994', CAST(N'2024-06-22T16:39:03.060' AS DateTime), CAST(N'2024-06-22T16:39:03.060' AS DateTime), N'Dodge Challenger')
INSERT [dbo].[Product] ([id], [cateID], [name], [brand], [Scale], [price], [Stock], [description], [image], [CreatedAt], [UpdatedAt], [title]) VALUES (43, 7, N'Ford Mustang', N'Ford', N'1:18', CAST(3900000.00 AS Decimal(10, 2)), 5, N'Mô hình xe Ford Mustang tỉ lệ 1:18', N'https://mohinhxe.net/files/product/2598/18-09-2019/703657916932461978186487568637707413356544n_zygI90Kq.jpg', CAST(N'2024-06-22T16:39:03.060' AS DateTime), CAST(N'2024-06-22T16:39:03.060' AS DateTime), N'Ford Mustang')
INSERT [dbo].[Product] ([id], [cateID], [name], [brand], [Scale], [price], [Stock], [description], [image], [CreatedAt], [UpdatedAt], [title]) VALUES (44, 7, N'Audi A5', N'Audi', N'1:24', CAST(4000000.00 AS Decimal(10, 2)), 4, N'Mô hình xe Audi A5 tỉ lệ 1:24', N'https://profimodel.cz/1457591-thickbox_default/bburago-audi-a5-1-32-modra-metaliza.jpg', CAST(N'2024-06-22T16:39:03.060' AS DateTime), CAST(N'2024-06-22T16:39:03.060' AS DateTime), N'Audi A5')
INSERT [dbo].[Product] ([id], [cateID], [name], [brand], [Scale], [price], [Stock], [description], [image], [CreatedAt], [UpdatedAt], [title]) VALUES (45, 7, N'BMW 4 Series', N'BMW', N'1:18', CAST(4100000.00 AS Decimal(10, 2)), 3, N'Mô hình xe BMW 4 Series tỉ lệ 1:18', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-loni8phq33o02e', CAST(N'2024-06-22T16:39:03.060' AS DateTime), CAST(N'2024-06-22T16:39:03.060' AS DateTime), N'BMW 4 Series')
INSERT [dbo].[Product] ([id], [cateID], [name], [brand], [Scale], [price], [Stock], [description], [image], [CreatedAt], [UpdatedAt], [title]) VALUES (46, 8, N'Toyota Sienna', N'Toyota', N'1:18', CAST(3200000.00 AS Decimal(10, 2)), 9, N'Mô hình xe Toyota Sienna tỉ lệ 1:18', N'https://product.hstatic.net/1000328919/product/mo-hinh-xe-toyota-sienna-2022-118-dealer-white__2__751abca57e084f1abc56ecd811d97524_grande.jpg', CAST(N'2024-06-22T16:39:03.060' AS DateTime), CAST(N'2024-06-22T16:39:03.060' AS DateTime), N'Toyota Sienna')
INSERT [dbo].[Product] ([id], [cateID], [name], [brand], [Scale], [price], [Stock], [description], [image], [CreatedAt], [UpdatedAt], [title]) VALUES (47, 8, N'Honda Odyssey', N'Honda', N'1:24', CAST(3300000.00 AS Decimal(10, 2)), 8, N'Mô hình xe Honda Odyssey tỉ lệ 1:24', N'https://product.hstatic.net/200000726533/product/sey-sport-hybrid-118-paudi-white-2022_8e0e91ee41754fd59e21fa7cf40a1d3e_b829f26c79b64c21b3d6289bf631cb7a.jpg', CAST(N'2024-06-22T16:39:03.060' AS DateTime), CAST(N'2024-06-22T16:39:03.060' AS DateTime), N'Honda Odyssey')
INSERT [dbo].[Product] ([id], [cateID], [name], [brand], [Scale], [price], [Stock], [description], [image], [CreatedAt], [UpdatedAt], [title]) VALUES (48, 8, N'Chrysler Pacifica', N'Chrysler', N'1:18', CAST(3400000.00 AS Decimal(10, 2)), 7, N'Mô hình xe Chrysler Pacifica tỉ lệ 1:18', N'https://m.media-amazon.com/images/I/61z+7werI0L.jpg', CAST(N'2024-06-22T16:39:03.060' AS DateTime), CAST(N'2024-06-22T16:39:03.060' AS DateTime), N'Chrysler Pacifica')
INSERT [dbo].[Product] ([id], [cateID], [name], [brand], [Scale], [price], [Stock], [description], [image], [CreatedAt], [UpdatedAt], [title]) VALUES (49, 8, N'Kia Sedona', N'Kia', N'1:24', CAST(3500000.00 AS Decimal(10, 2)), 6, N'Mô hình xe Kia Sedona tỉ lệ 1:24', N'https://cf.shopee.vn/file/sg-11134201-22110-vmi0vdbt24jv71', CAST(N'2024-06-22T16:39:03.060' AS DateTime), CAST(N'2024-06-22T16:39:03.060' AS DateTime), N'Kia Sedona')
INSERT [dbo].[Product] ([id], [cateID], [name], [brand], [Scale], [price], [Stock], [description], [image], [CreatedAt], [UpdatedAt], [title]) VALUES (50, 8, N'Mercedes-Benz V-Class', N'Mercedes-Benz', N'1:18', CAST(3600000.00 AS Decimal(10, 2)), 5, N'Mô hình xe Mercedes-Benz V-Class tỉ lệ 1:18', N'https://xemohinhcaocap.com/wp-content/uploads/2021/11/Mercedes-Benz-V-Class-1-18-Norev-1.jpg', CAST(N'2024-06-22T16:39:03.060' AS DateTime), CAST(N'2024-06-22T16:39:03.060' AS DateTime), N'Mercedes-Benz V-Class')
INSERT [dbo].[Product] ([id], [cateID], [name], [brand], [Scale], [price], [Stock], [description], [image], [CreatedAt], [UpdatedAt], [title]) VALUES (52, 9, N'Nissan Leaf', N'Nissan', N'1:24', CAST(4200000.00 AS Decimal(10, 2)), 3, N'Mô hình xe Nissan Leaf tỉ lệ 1:24', N'https://cdn11.bigcommerce.com/s-yrkef1j7/images/stencil/1280x1280/products/2852/29468/QQ20190318184018__75573.1652720729.png?c=2', CAST(N'2024-06-22T16:39:03.060' AS DateTime), CAST(N'2024-06-22T16:39:03.060' AS DateTime), N'Nissan Leaf')
INSERT [dbo].[Product] ([id], [cateID], [name], [brand], [Scale], [price], [Stock], [description], [image], [CreatedAt], [UpdatedAt], [title]) VALUES (53, 9, N'Chevrolet Bolt', N'Chevrolet', N'1:18', CAST(4300000.00 AS Decimal(10, 2)), 2, N'Mô hình xe Chevrolet Bolt tỉ lệ 1:18', N'https://image.plo.vn/w1000/Uploaded/2024/lcemdurlq/2023_06_07/nhung-mau-xe-dien-hop-tui-tien-de-lai-hang-ngay-chevrolet-bolt-ev-2023-7430.jpg.webp', CAST(N'2024-06-22T16:39:03.060' AS DateTime), CAST(N'2024-06-22T16:39:03.060' AS DateTime), N'Chevrolet Bolt')
INSERT [dbo].[Product] ([id], [cateID], [name], [brand], [Scale], [price], [Stock], [description], [image], [CreatedAt], [UpdatedAt], [title]) VALUES (54, 9, N'BMW i3', N'BMW', N'1:24', CAST(4400000.00 AS Decimal(10, 2)), 1, N'Mô hình xe BMW i3 tỉ lệ 1:24', N'https://www.1999.co.jp/itbig51/10519962.jpg', CAST(N'2024-06-22T16:39:03.060' AS DateTime), CAST(N'2024-06-22T16:39:03.060' AS DateTime), N'BMW i3')
INSERT [dbo].[Product] ([id], [cateID], [name], [brand], [Scale], [price], [Stock], [description], [image], [CreatedAt], [UpdatedAt], [title]) VALUES (55, 9, N'Jaguar I-PACE', N'Jaguar', N'1:18', CAST(4500000.00 AS Decimal(10, 2)), 3, N'Mô hình xe Jaguar I-PACE tỉ lệ 1:18', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQOQu4gpkEtiBbgvHuFj6TCYRNbOkrR3dWtP4graiN_KCHGo-U7QjNqew5SrqF5qn3396c&usqp=CAU', CAST(N'2024-06-22T16:39:03.060' AS DateTime), CAST(N'2024-06-22T16:39:03.060' AS DateTime), N'Jaguar I-PACE')
INSERT [dbo].[Product] ([id], [cateID], [name], [brand], [Scale], [price], [Stock], [description], [image], [CreatedAt], [UpdatedAt], [title]) VALUES (56, 10, N'Toyota Prius', N'Toyota', N'1:18', CAST(3100000.00 AS Decimal(10, 2)), 6, N'Mô hình xe Toyota Prius tỉ lệ 1:18', N'https://sanhangre.net/image/cache/data/dochoichobe/Tomica/toyota/tomica-76-toyota-prius/Tomica-No-76-Toyota-Prius-PHV-GR-SPORT-800x800.jpg', CAST(N'2024-06-22T16:39:03.060' AS DateTime), CAST(N'2024-06-22T16:39:03.060' AS DateTime), N'Toyota Prius')
INSERT [dbo].[Product] ([id], [cateID], [name], [brand], [Scale], [price], [Stock], [description], [image], [CreatedAt], [UpdatedAt], [title]) VALUES (57, 10, N'Honda Insight', N'Honda', N'1:24', CAST(3200000.00 AS Decimal(10, 2)), 7, N'Mô hình xe Honda Insight tỉ lệ 1:24', N'https://http2.mlstatic.com/D_NQ_NP_828501-MLM48984919919_012022-O.webp', CAST(N'2024-06-22T16:39:03.060' AS DateTime), CAST(N'2024-06-22T16:39:03.060' AS DateTime), N'Honda Insight')
INSERT [dbo].[Product] ([id], [cateID], [name], [brand], [Scale], [price], [Stock], [description], [image], [CreatedAt], [UpdatedAt], [title]) VALUES (60, 10, N'Kia Niro', N'Kia', N'1:18', CAST(3500000.00 AS Decimal(10, 2)), 9, N'Mô hình xe Kia Niro tỉ lệ 1:18', N'https://www.hdcarwallpapers.com/walls/2022_kia_niro_ev_4k-HD.jpg', CAST(N'2024-06-22T16:39:03.060' AS DateTime), CAST(N'2024-06-22T16:39:03.060' AS DateTime), N'Kia Niro')
INSERT [dbo].[Product] ([id], [cateID], [name], [brand], [Scale], [price], [Stock], [description], [image], [CreatedAt], [UpdatedAt], [title]) VALUES (61, 1, N'Toyota Crown', N'Toyota', N'1:18', CAST(4400000.00 AS Decimal(10, 2)), 12, N'Xe mô hình Toyota Crown tỉ lệ 1:18', N'https://product.hstatic.net/1000288177/product/fb23d690d81a07445e0b_1343e51f206242269853514d2b8e4a95_grande.jpg', CAST(N'2024-07-06T00:28:08.657' AS DateTime), CAST(N'2024-07-06T00:28:08.657' AS DateTime), N'Toyota Crown 1:18')
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__536C85E4E7F4A7BB]    Script Date: 7/7/2024 9:36:56 PM ******/
ALTER TABLE [dbo].[Account] ADD UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__A9D1053412129BB4]    Script Date: 7/7/2024 9:36:56 PM ******/
ALTER TABLE [dbo].[Account] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Categori__8517B2E014E2C9F2]    Script Date: 7/7/2024 9:36:56 PM ******/
ALTER TABLE [dbo].[Category] ADD UNIQUE NONCLUSTERED 
(
	[cname] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Customer__A9D10534D6B29236]    Script Date: 7/7/2024 9:36:56 PM ******/
ALTER TABLE [dbo].[Customers] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Account] ADD  DEFAULT ('Customer') FOR [role]
GO
ALTER TABLE [dbo].[Account] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Account] ADD  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [dbo].[Category] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Category] ADD  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [dbo].[Customers] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Customers] ADD  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [dbo].[OrderItem] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[OrderItem] ADD  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT (getdate()) FOR [order_date]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT ('Pending') FOR [status]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [dbo].[OrderItem]  WITH CHECK ADD FOREIGN KEY([order_id])
REFERENCES [dbo].[Orders] ([id])
GO
ALTER TABLE [dbo].[OrderItem]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([id])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[payment_info]  WITH CHECK ADD FOREIGN KEY([order_id])
REFERENCES [dbo].[Orders] ([id])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([cateID])
REFERENCES [dbo].[Category] ([cid])
GO
