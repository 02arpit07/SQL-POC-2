USE [master]
GO
/****** Object:  Database [eCommercePocArpitV]    Script Date: 06-03-2021 14:52:26 ******/
CREATE DATABASE [eCommercePocArpitV]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'eCommercePocArpitV', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\eCommercePocArpitV.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'eCommercePocArpitV_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\eCommercePocArpitV_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [eCommercePocArpitV] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [eCommercePocArpitV].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [eCommercePocArpitV] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [eCommercePocArpitV] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [eCommercePocArpitV] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [eCommercePocArpitV] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [eCommercePocArpitV] SET ARITHABORT OFF 
GO
ALTER DATABASE [eCommercePocArpitV] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [eCommercePocArpitV] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [eCommercePocArpitV] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [eCommercePocArpitV] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [eCommercePocArpitV] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [eCommercePocArpitV] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [eCommercePocArpitV] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [eCommercePocArpitV] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [eCommercePocArpitV] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [eCommercePocArpitV] SET  ENABLE_BROKER 
GO
ALTER DATABASE [eCommercePocArpitV] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [eCommercePocArpitV] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [eCommercePocArpitV] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [eCommercePocArpitV] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [eCommercePocArpitV] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [eCommercePocArpitV] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [eCommercePocArpitV] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [eCommercePocArpitV] SET RECOVERY FULL 
GO
ALTER DATABASE [eCommercePocArpitV] SET  MULTI_USER 
GO
ALTER DATABASE [eCommercePocArpitV] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [eCommercePocArpitV] SET DB_CHAINING OFF 
GO
ALTER DATABASE [eCommercePocArpitV] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [eCommercePocArpitV] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [eCommercePocArpitV] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [eCommercePocArpitV] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'eCommercePocArpitV', N'ON'
GO
ALTER DATABASE [eCommercePocArpitV] SET QUERY_STORE = OFF
GO
USE [eCommercePocArpitV]
GO
/****** Object:  Table [dbo].[Adress]    Script Date: 06-03-2021 14:52:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Adress](
	[adressId] [int] NOT NULL,
	[userId] [int] NOT NULL,
	[adress] [nvarchar](max) NOT NULL,
	[city] [nvarchar](60) NOT NULL,
	[states] [nvarchar](60) NOT NULL,
	[country] [nvarchar](60) NOT NULL,
	[postalCode] [nvarchar](60) NOT NULL,
	[adressType] [nvarchar](60) NOT NULL,
	[primaryAdress] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[adressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 06-03-2021 14:52:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[cartId] [int] NOT NULL,
	[userId] [int] NOT NULL,
	[datePlaced] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[cartId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CartDetails]    Script Date: 06-03-2021 14:52:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartDetails](
	[cartDetailId] [int] NOT NULL,
	[cartId] [int] NOT NULL,
	[productId] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[dateAdded] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[cartDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Email]    Script Date: 06-03-2021 14:52:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Email](
	[emailId] [int] NOT NULL,
	[userId] [int] NOT NULL,
	[email] [nvarchar](200) NOT NULL,
	[emailType] [nvarchar](40) NOT NULL,
	[primaryEmail] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[emailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 06-03-2021 14:52:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[orderId] [int] NOT NULL,
	[cartId] [int] NOT NULL,
	[paymentMode] [nvarchar](30) NOT NULL,
	[orderDate] [date] NOT NULL,
	[dateOfDelivery] [date] NOT NULL,
	[returnDate] [date] NOT NULL,
	[dateAdded] [date] NOT NULL,
	[isDelivered] [bit] NOT NULL,
	[returnRequest] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[orderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Phone]    Script Date: 06-03-2021 14:52:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Phone](
	[phoneId] [int] NOT NULL,
	[userId] [int] NOT NULL,
	[countryCode] [nvarchar](5) NOT NULL,
	[phoneNumber] [nvarchar](10) NOT NULL,
	[primaryPhone] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[phoneId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 06-03-2021 14:52:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[productId] [int] NOT NULL,
	[productName] [nvarchar](200) NOT NULL,
	[manufacturerName] [nvarchar](100) NOT NULL,
	[pricePerUnit] [int] NOT NULL,
	[categoryId] [int] NOT NULL,
	[productImage] [nvarchar](max) NULL,
	[shortDescription] [nvarchar](max) NOT NULL,
	[longDescription] [nvarchar](max) NOT NULL,
	[isActive] [bit] NOT NULL,
	[isDeleted] [bit] NOT NULL,
	[isFeatured] [bit] NOT NULL,
	[createdOn] [date] NULL,
	[updatedOn] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[productId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCategory]    Script Date: 06-03-2021 14:52:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategory](
	[categoryId] [int] NOT NULL,
	[categoryName] [nvarchar](100) NOT NULL,
	[categoryImage] [nvarchar](max) NULL,
	[categoryDescription] [nvarchar](max) NOT NULL,
	[createdOn] [date] NULL,
	[updatedOn] [date] NULL,
	[parentId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[categoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserTable]    Script Date: 06-03-2021 14:52:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserTable](
	[userId] [int] NOT NULL,
	[firstName] [nvarchar](50) NOT NULL,
	[lastName] [nvarchar](50) NOT NULL,
	[dob] [date] NOT NULL,
	[gender] [nvarchar](1) NOT NULL,
	[userAddress] [int] NULL,
	[userPhoneNo] [int] NULL,
	[userEmail] [int] NULL,
	[createdOn] [date] NULL,
	[updatedOn] [date] NULL,
	[isDeleted] [bit] NULL,
	[userRole] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ix_Product_productName]    Script Date: 06-03-2021 14:52:26 ******/
CREATE NONCLUSTERED INDEX [ix_Product_productName] ON [dbo].[Product]
(
	[productName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ix_ProductCategory_categoryName]    Script Date: 06-03-2021 14:52:26 ******/
CREATE NONCLUSTERED INDEX [ix_ProductCategory_categoryName] ON [dbo].[ProductCategory]
(
	[categoryName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Adress] ADD  DEFAULT ((0)) FOR [primaryAdress]
GO
ALTER TABLE [dbo].[Email] ADD  DEFAULT ((0)) FOR [primaryEmail]
GO
ALTER TABLE [dbo].[OrderDetails] ADD  DEFAULT ((0)) FOR [isDelivered]
GO
ALTER TABLE [dbo].[OrderDetails] ADD  DEFAULT ((0)) FOR [returnRequest]
GO
ALTER TABLE [dbo].[Phone] ADD  DEFAULT ((0)) FOR [primaryPhone]
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT ((0)) FOR [isDeleted]
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT ((0)) FOR [isFeatured]
GO
ALTER TABLE [dbo].[Adress]  WITH CHECK ADD FOREIGN KEY([userId])
REFERENCES [dbo].[UserTable] ([userId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD FOREIGN KEY([userId])
REFERENCES [dbo].[UserTable] ([userId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CartDetails]  WITH CHECK ADD FOREIGN KEY([cartId])
REFERENCES [dbo].[Cart] ([cartId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CartDetails]  WITH CHECK ADD FOREIGN KEY([productId])
REFERENCES [dbo].[Product] ([productId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Email]  WITH CHECK ADD FOREIGN KEY([userId])
REFERENCES [dbo].[UserTable] ([userId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([cartId])
REFERENCES [dbo].[Cart] ([cartId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Phone]  WITH CHECK ADD FOREIGN KEY([userId])
REFERENCES [dbo].[UserTable] ([userId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([categoryId])
REFERENCES [dbo].[ProductCategory] ([categoryId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserTable]  WITH CHECK ADD FOREIGN KEY([userAddress])
REFERENCES [dbo].[Adress] ([adressId])
GO
ALTER TABLE [dbo].[UserTable]  WITH CHECK ADD FOREIGN KEY([userEmail])
REFERENCES [dbo].[Email] ([emailId])
GO
ALTER TABLE [dbo].[UserTable]  WITH CHECK ADD FOREIGN KEY([userPhoneNo])
REFERENCES [dbo].[Phone] ([phoneId])
GO
USE [master]
GO
ALTER DATABASE [eCommercePocArpitV] SET  READ_WRITE 
GO
