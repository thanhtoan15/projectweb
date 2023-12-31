USE [master]
GO
/****** Object:  Database [asmjava4]    Script Date: 4/13/2023 2:40:32 PM ******/
CREATE DATABASE [asmjava4]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'asmjava4', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\asmjava4.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'asmjava4_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\asmjava4_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [asmjava4] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [asmjava4].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [asmjava4] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [asmjava4] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [asmjava4] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [asmjava4] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [asmjava4] SET ARITHABORT OFF 
GO
ALTER DATABASE [asmjava4] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [asmjava4] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [asmjava4] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [asmjava4] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [asmjava4] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [asmjava4] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [asmjava4] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [asmjava4] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [asmjava4] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [asmjava4] SET  ENABLE_BROKER 
GO
ALTER DATABASE [asmjava4] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [asmjava4] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [asmjava4] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [asmjava4] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [asmjava4] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [asmjava4] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [asmjava4] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [asmjava4] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [asmjava4] SET  MULTI_USER 
GO
ALTER DATABASE [asmjava4] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [asmjava4] SET DB_CHAINING OFF 
GO
ALTER DATABASE [asmjava4] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [asmjava4] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [asmjava4] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [asmjava4] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [asmjava4] SET QUERY_STORE = OFF
GO
USE [asmjava4]
GO
/****** Object:  Table [dbo].[history]    Script Date: 4/13/2023 2:40:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[history](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userID] [int] NULL,
	[videoID] [int] NULL,
	[viewedDate] [datetime] NOT NULL,
	[isLiked] [bit] NOT NULL,
	[likeDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user]    Script Date: 4/13/2023 2:40:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](20) NOT NULL,
	[password] [varchar](20) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[isAdmin] [bit] NOT NULL,
	[isActive] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[video]    Script Date: 4/13/2023 2:40:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[video](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](255) NOT NULL,
	[href] [nvarchar](50) NOT NULL,
	[poster] [varchar](255) NULL,
	[views] [int] NOT NULL,
	[shares] [int] NOT NULL,
	[description] [nvarchar](255) NOT NULL,
	[isActive] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[history] ON 

INSERT [dbo].[history] ([id], [userID], [videoID], [viewedDate], [isLiked], [likeDate]) VALUES (1, 2, 1, CAST(N'2023-04-05T14:36:03.607' AS DateTime), 1, CAST(N'2023-04-07T15:51:22.013' AS DateTime))
INSERT [dbo].[history] ([id], [userID], [videoID], [viewedDate], [isLiked], [likeDate]) VALUES (2, 2, 3, CAST(N'2023-04-05T14:36:03.607' AS DateTime), 1, CAST(N'2023-04-07T13:32:09.767' AS DateTime))
INSERT [dbo].[history] ([id], [userID], [videoID], [viewedDate], [isLiked], [likeDate]) VALUES (4, 2, 2, CAST(N'2023-04-07T13:51:55.997' AS DateTime), 0, NULL)
INSERT [dbo].[history] ([id], [userID], [videoID], [viewedDate], [isLiked], [likeDate]) VALUES (5, 1, 2, CAST(N'2023-04-07T15:57:16.433' AS DateTime), 0, NULL)
INSERT [dbo].[history] ([id], [userID], [videoID], [viewedDate], [isLiked], [likeDate]) VALUES (6, 1, 1, CAST(N'2023-04-07T16:05:35.650' AS DateTime), 1, CAST(N'2023-04-10T08:10:30.763' AS DateTime))
INSERT [dbo].[history] ([id], [userID], [videoID], [viewedDate], [isLiked], [likeDate]) VALUES (7, 1, 8, CAST(N'2023-04-07T17:05:34.593' AS DateTime), 0, NULL)
INSERT [dbo].[history] ([id], [userID], [videoID], [viewedDate], [isLiked], [likeDate]) VALUES (8, 1, 3, CAST(N'2023-04-08T17:21:07.650' AS DateTime), 0, NULL)
SET IDENTITY_INSERT [dbo].[history] OFF
GO
SET IDENTITY_INSERT [dbo].[user] ON 

INSERT [dbo].[user] ([id], [username], [password], [email], [isAdmin], [isActive]) VALUES (1, N'toantt', N'123', N'truongtoan15@gmail.com', 1, 1)
INSERT [dbo].[user] ([id], [username], [password], [email], [isAdmin], [isActive]) VALUES (2, N'linhvn', N'456', N'linhngoc29@gmail.com', 0, 1)
INSERT [dbo].[user] ([id], [username], [password], [email], [isAdmin], [isActive]) VALUES (3, N'quoc', N'789', N'phanquoc15@gmail.com', 0, 1)
INSERT [dbo].[user] ([id], [username], [password], [email], [isAdmin], [isActive]) VALUES (4, N'teolv', N'123', N'teolv@gmail.com', 0, 1)
SET IDENTITY_INSERT [dbo].[user] OFF
GO
SET IDENTITY_INSERT [dbo].[video] ON 

INSERT [dbo].[video] ([id], [title], [href], [poster], [views], [shares], [description], [isActive]) VALUES (1, N'1 Giờ Nghe Nhạc Lofi Thư Giãn Đọc Sách', N'XWby1Kv5xE8', N'nhac.webp', 0, 0, N'Nghe Nh?c', 1)
INSERT [dbo].[video] ([id], [title], [href], [poster], [views], [shares], [description], [isActive]) VALUES (2, N'Nhạc Baroque Giúp Bạn Tập Trung Học Tập Và Làm Việc', N'VfvZfUqA8C0', N'nhac1.webp', 0, 0, N'Nh?c Baroque', 1)
INSERT [dbo].[video] ([id], [title], [href], [poster], [views], [shares], [description], [isActive]) VALUES (3, N'Những Bản Nhạc Baroque Giúp Tập Trung Học Tập', N'ijA9ff8tPEM', N'nhac2.webp', 0, 0, N'Nh?c Chill H?c Bài', 1)
INSERT [dbo].[video] ([id], [title], [href], [poster], [views], [shares], [description], [isActive]) VALUES (8, N'Nhạc Baroque Giúp Bạn Tập Trung Học Tập Và Làm Việc', N'dqIjMqwGk4A', N'nhac4.webp', 0, 0, N'Nh?c Lofi', 1)
SET IDENTITY_INSERT [dbo].[video] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__user__AB6E6164BA203932]    Script Date: 4/13/2023 2:40:33 PM ******/
ALTER TABLE [dbo].[user] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__user__F3DBC57228ACF593]    Script Date: 4/13/2023 2:40:33 PM ******/
ALTER TABLE [dbo].[user] ADD UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__video__7FF10F05BF03B6D4]    Script Date: 4/13/2023 2:40:33 PM ******/
ALTER TABLE [dbo].[video] ADD UNIQUE NONCLUSTERED 
(
	[href] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[history] ADD  DEFAULT (getdate()) FOR [viewedDate]
GO
ALTER TABLE [dbo].[history] ADD  DEFAULT ((0)) FOR [isLiked]
GO
ALTER TABLE [dbo].[user] ADD  DEFAULT ((0)) FOR [isAdmin]
GO
ALTER TABLE [dbo].[user] ADD  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[video] ADD  DEFAULT ((0)) FOR [views]
GO
ALTER TABLE [dbo].[video] ADD  DEFAULT ((0)) FOR [shares]
GO
ALTER TABLE [dbo].[video] ADD  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[history]  WITH CHECK ADD FOREIGN KEY([userID])
REFERENCES [dbo].[user] ([id])
GO
ALTER TABLE [dbo].[history]  WITH CHECK ADD FOREIGN KEY([videoID])
REFERENCES [dbo].[video] ([id])
GO
USE [master]
GO
ALTER DATABASE [asmjava4] SET  READ_WRITE 
GO
