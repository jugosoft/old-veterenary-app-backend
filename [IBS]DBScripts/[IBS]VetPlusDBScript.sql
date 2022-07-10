USE [master]
GO
/****** Object:  Database [[IBS]]VetPlusDB]    Script Date: 16.07.2016 16:07:28 ******/
CREATE DATABASE [[IBS]]VetPlusDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'[IBS]VetPlusDB', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.UMBRELLA\MSSQL\DATA\[IBS]VetPlusDB.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'[IBS]VetPlusDB_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.UMBRELLA\MSSQL\DATA\[IBS]VetPlusDB_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [[IBS]]VetPlusDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [[IBS]]VetPlusDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [[IBS]]VetPlusDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [[IBS]]VetPlusDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [[IBS]]VetPlusDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [[IBS]]VetPlusDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [[IBS]]VetPlusDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [[IBS]]VetPlusDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [[IBS]]VetPlusDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [[IBS]]VetPlusDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [[IBS]]VetPlusDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [[IBS]]VetPlusDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [[IBS]]VetPlusDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [[IBS]]VetPlusDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [[IBS]]VetPlusDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [[IBS]]VetPlusDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [[IBS]]VetPlusDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [[IBS]]VetPlusDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [[IBS]]VetPlusDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [[IBS]]VetPlusDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [[IBS]]VetPlusDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [[IBS]]VetPlusDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [[IBS]]VetPlusDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [[IBS]]VetPlusDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [[IBS]]VetPlusDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [[IBS]]VetPlusDB] SET  MULTI_USER 
GO
ALTER DATABASE [[IBS]]VetPlusDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [[IBS]]VetPlusDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [[IBS]]VetPlusDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [[IBS]]VetPlusDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [[IBS]]VetPlusDB] SET DELAYED_DURABILITY = DISABLED 
GO
USE [[IBS]]VetPlusDB]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 16.07.2016 16:07:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Accounts](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[ProfilePhoto] [varbinary](max) NOT NULL,
	[ProfilePhotoMimeType] [nvarchar](50) NOT NULL,
	[DateOfBirth] [datetime2](7) NOT NULL,
	[Age] [int] NOT NULL,
 CONSTRAINT [PK_Accounts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Items]    Script Date: 16.07.2016 16:07:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Items](
	[Id] [uniqueidentifier] NOT NULL,
	[Price] [int] NOT NULL,
	[ItemPhoto] [varbinary](max) NOT NULL,
	[ItemPhotoMimeType] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Items] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 16.07.2016 16:07:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [uniqueidentifier] NOT NULL,
	[BuyerId] [uniqueidentifier] NOT NULL,
	[ItemId] [uniqueidentifier] NOT NULL,
	[DateOfTransaction] [datetime2](7) NOT NULL,
	[Price] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Pets]    Script Date: 16.07.2016 16:07:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pets](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[DateOfBirth] [datetime2](7) NOT NULL,
	[Age] [int] NOT NULL,
	[IdOwner] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Pets] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Posts]    Script Date: 16.07.2016 16:07:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Posts](
	[Id] [uniqueidentifier] NOT NULL,
	[AuthorId] [uniqueidentifier] NOT NULL,
	[AuthorName] [nvarchar](200) NOT NULL,
	[PublishDate] [datetime2](7) NOT NULL,
	[PostPhoto] [varbinary](max) NOT NULL,
	[MimeType] [nvarchar](50) NOT NULL,
	[Text] [nvarchar](max) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 16.07.2016 16:07:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[IdUser] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Accounts] FOREIGN KEY([BuyerId])
REFERENCES [dbo].[Accounts] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Accounts]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Items] FOREIGN KEY([ItemId])
REFERENCES [dbo].[Items] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Items]
GO
ALTER TABLE [dbo].[Pets]  WITH CHECK ADD  CONSTRAINT [FK_Pets_Accounts] FOREIGN KEY([IdOwner])
REFERENCES [dbo].[Accounts] ([Id])
GO
ALTER TABLE [dbo].[Pets] CHECK CONSTRAINT [FK_Pets_Accounts]
GO
ALTER TABLE [dbo].[Roles]  WITH CHECK ADD  CONSTRAINT [FK_Roles_Accounts] FOREIGN KEY([IdUser])
REFERENCES [dbo].[Accounts] ([Id])
GO
ALTER TABLE [dbo].[Roles] CHECK CONSTRAINT [FK_Roles_Accounts]
GO
USE [master]
GO
ALTER DATABASE [[IBS]]VetPlusDB] SET  READ_WRITE 
GO
