USE [master]
GO
/****** Object:  Database [195ev]    Script Date: 13.09.2022 11:39:42 ******/
CREATE DATABASE [195ev]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'195ev', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\195ev.mdf' , SIZE = 12032KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
 LOG ON 
( NAME = N'195ev_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\195ev_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [195ev] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [195ev].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [195ev] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [195ev] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [195ev] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [195ev] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [195ev] SET ARITHABORT OFF 
GO
ALTER DATABASE [195ev] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [195ev] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [195ev] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [195ev] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [195ev] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [195ev] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [195ev] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [195ev] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [195ev] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [195ev] SET  DISABLE_BROKER 
GO
ALTER DATABASE [195ev] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [195ev] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [195ev] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [195ev] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [195ev] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [195ev] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [195ev] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [195ev] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [195ev] SET  MULTI_USER 
GO
ALTER DATABASE [195ev] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [195ev] SET DB_CHAINING OFF 
GO
ALTER DATABASE [195ev] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [195ev] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [195ev] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [195ev] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [195ev] SET QUERY_STORE = OFF
GO
USE [195ev]
GO
/****** Object:  Table [dbo].[Src]    Script Date: 13.09.2022 11:39:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Src](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[types_users_id] [int] NULL,
	[Src] [text] NULL,
 CONSTRAINT [PK_Src_1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypesUsers]    Script Date: 13.09.2022 11:39:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypesUsers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
 CONSTRAINT [PK_TypesUsers_1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 13.09.2022 11:39:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[login] [varchar](50) NOT NULL,
	[pass] [varbinary](max) NOT NULL,
	[email] [varbinary](50) NOT NULL,
	[types_users_id] [int] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_all]    Script Date: 13.09.2022 11:39:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_all]
AS
SELECT        dbo.Src.types_users_id AS Expr1, dbo.Src.Src AS Expr2, dbo.Src.id AS Expr3, dbo.Users.id, dbo.Users.login, dbo.Users.pass, dbo.Users.email, dbo.Users.types_users_id, dbo.TypesUsers.id AS Expr4, 
                         dbo.TypesUsers.Name
FROM            dbo.Src INNER JOIN
                         dbo.Users ON dbo.Src.id = dbo.Users.id INNER JOIN
                         dbo.TypesUsers ON dbo.Src.types_users_id = dbo.TypesUsers.id
GO
/****** Object:  Table [dbo].[AutoModels]    Script Date: 13.09.2022 11:39:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AutoModels](
	[ID] [int] NOT NULL,
	[Model] [varchar](50) NULL,
	[VenderID] [int] NOT NULL,
	[StartDate] [int] NULL,
	[EndDate] [int] NULL,
 CONSTRAINT [PK_AutoModels$] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clients]    Script Date: 13.09.2022 11:39:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clients](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[LastName] [varchar](50) NULL,
	[Name] [varchar](50) NULL,
	[MiddleName] [varchar](50) NULL,
	[Phone] [varchar](50) NULL,
 CONSTRAINT [PK_Clients] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientsAuto]    Script Date: 13.09.2022 11:39:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientsAuto](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[LastName] [varchar](50) NULL,
	[Name] [varchar](50) NULL,
	[MiddleName] [varchar](50) NULL,
	[VIN] [varchar](50) NULL,
	[GosNumber] [varchar](50) NULL,
	[AutoModelID] [int] NULL,
 CONSTRAINT [PK_ClientsAuto] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DealsInfo]    Script Date: 13.09.2022 11:39:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DealsInfo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MainInfoID] [int] NULL,
	[ServiceID] [int] NOT NULL,
	[Price] [int] NULL,
 CONSTRAINT [PK_DealsInfo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MainInfo]    Script Date: 13.09.2022 11:39:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MainInfo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProviderID] [int] NULL,
	[ClientID] [int] NULL,
	[ClientsAutoID] [int] NULL,
	[Date] [datetime] NULL,
	[StatusID] [int] NULL,
 CONSTRAINT [PK_MainInfo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PriceList]    Script Date: 13.09.2022 11:39:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PriceList](
	[ID] [int] NOT NULL,
	[Name] [varchar](250) NULL,
	[Price] [int] NULL,
	[PriceType] [int] NULL,
	[Service] [varchar](250) NULL,
	[ServiceID] [int] NULL,
 CONSTRAINT [PK_PriceList] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Provider]    Script Date: 13.09.2022 11:39:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Provider](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[LastName] [varchar](50) NULL,
	[Name] [varchar](50) NULL,
	[MiddleName] [varchar](50) NULL,
	[Login] [varchar](50) NULL,
	[Password] [nvarchar](255) NULL,
	[Phone] [varchar](50) NULL,
 CONSTRAINT [PK_Provider] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Services]    Script Date: 13.09.2022 11:39:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Services](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](150) NULL,
 CONSTRAINT [PK_Services] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 13.09.2022 11:39:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Status] [varchar](50) NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[table]    Script Date: 13.09.2022 11:39:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[table](
	[id] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Venders]    Script Date: 13.09.2022 11:39:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Venders](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
 CONSTRAINT [PK_Venders_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (1, N'CL', 1, 1998, 2003)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (2, N'EL', 1, 1997, 2005)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (3, N'ILX', 1, 2012, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (4, N'Integra', 1, 1998, 2006)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (5, N'MDX', 1, 2001, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (6, N'NSX', 1, 2001, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (7, N'RDX', 1, 2006, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (8, N'RL', 1, 1995, 2012)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (9, N'RLX', 1, 2013, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (10, N'RSX', 1, 2002, 2006)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (11, N'TL', 1, 1999, 2014)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (12, N'TLX', 1, 2014, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (13, N'TSX', 1, 2003, 2014)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (14, N'ZDX', 1, 2010, 2013)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (15, N'146', 2, 1994, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (16, N'147', 2, 1998, 2010)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (17, N'147 GTA', 2, 2002, 2010)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (18, N'156', 2, 1997, 2007)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (19, N'156 GTA', 2, 2002, 2007)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (20, N'159', 2, 2005, 2011)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (21, N'166', 2, 1998, 2007)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (22, N'4C', 2, 2013, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (23, N'8C Competizione', 2, 2008, 2010)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (24, N'Brera', 2, 2005, 2010)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (25, N'Giulia', 2, 2016, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (26, N'Giulietta', 2, 2010, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (27, N'GT', 2, 2003, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (28, N'GTV', 2, 1995, 2006)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (29, N'MiTo', 2, 2008, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (30, N'Spider', 2, 1998, 2010)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (31, N'Stelvio', 2, 2017, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (32, N'Cygnet', 3, 2011, 2013)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (33, N'DB11', 3, 2016, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (34, N'DB9', 3, 2004, 2016)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (35, N'DBS', 3, 2003, 2012)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (36, N'DBS Violante', 3, 2007, 2012)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (37, N'DBX', 3, 2020, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (38, N'Rapide', 3, 2010, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (39, N'V12 Vantage', 3, 2010, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (40, N'V8 Vantage', 3, 2001, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (41, N'Valkyrie', 3, 2019, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (42, N'Vanquish', 3, 2001, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (43, N'Virage', 3, 2011, 2012)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (44, N'Zagato Coupe', 3, 2016, 2016)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (45, N'A1', 4, 2010, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (46, N'A2', 4, 2000, 2006)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (47, N'A3', 4, 1996, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (48, N'A4', 4, 1995, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (49, N'A4 Allroad Quattro', 4, 2009, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (50, N'A5', 4, 2007, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (51, N'A6', 4, 1998, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (52, N'A7', 4, 2010, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (53, N'A8', 4, 1994, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (54, N'Allroad', 4, 2000, 2011)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (55, N'ETron', 4, 2019, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (56, N'Q2', 4, 2016, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (57, N'Q3', 4, 2011, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (58, N'Q5', 4, 2008, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (59, N'Q7', 4, 2006, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (60, N'Q8', 4, 2018, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (61, N'R8', 4, 2006, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (62, N'RS Q3', 4, 2012, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (63, N'RS3', 4, 2011, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (64, N'RS4', 4, 2005, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (65, N'RS5', 4, 2010, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (66, N'RS6', 4, 2002, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (67, N'RS7', 4, 2013, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (68, N'S3', 4, 2006, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (69, N'S4', 4, 1998, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (70, N'S5', 4, 2007, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (71, N'S6', 4, 1999, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (72, N'S7', 4, 2012, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (73, N'S8', 4, 1996, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (74, N'SQ2', 4, 2019, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (75, N'SQ5', 4, 2012, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (76, N'SQ7', 4, 2016, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (77, N'SQ8', 4, 2019, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (78, N'TT', 4, 1998, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (79, N'TT RS', 4, 2008, 2014)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (80, N'TTS', 4, 2008, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (81, N'Arnage', 5, 1999, 2007)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (82, N'Azure', 5, 1999, 2009)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (83, N'Bentayga', 5, 2015, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (84, N'Brooklands', 5, 2008, 2011)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (85, N'Continental', 5, 2003, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (86, N'Continental Flying Spur', 5, 2005, 2013)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (87, N'Continental GT', 5, 2018, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (88, N'Flying Spur', 5, 2013, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (89, N'Mulsanne', 5, 2010, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (90, N'1 series', 6, 2004, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (91, N'2 series', 6, 2013, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (92, N'3 series', 6, 1982, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (93, N'4 series', 6, 2013, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (94, N'5 series', 6, 1988, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (95, N'6 series', 6, 2004, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (96, N'7 series', 6, 1995, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (97, N'8 series', 6, 1990, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (98, N'i3', 6, 2013, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (99, N'i8', 6, 2014, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (100, N'M2', 6, 2015, NULL)
GO
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (101, N'M3', 6, 1992, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (102, N'M4', 6, 2012, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (103, N'M5', 6, 1998, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (104, N'M6', 6, 2005, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (105, N'X1', 6, 2009, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (106, N'X2', 6, 2017, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (107, N'X3', 6, 2004, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (108, N'X3 M', 6, 2019, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (109, N'X4', 6, 2014, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (110, N'X4 M', 6, 2019, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (111, N'X5', 6, 2000, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (112, N'X5 M', 6, 2009, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (113, N'X6', 6, 2008, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (114, N'X6 M', 6, 2009, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (115, N'X7', 6, 2018, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (116, N'Z3', 6, 1996, 2003)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (117, N'Z4', 6, 2002, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (118, N'Z8', 6, 2000, 2006)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (119, N'H230', 7, 2012, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (120, N'V3', 7, 2014, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (121, N'V5', 7, 2011, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (122, N'Veyron', 8, 2005, 2015)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (123, N'Century', 9, 1997, 2005)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (124, N'Enclave', 9, 2007, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (125, N'Envision', 9, 2014, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (126, N'La Crosse', 9, 2004, 2016)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (127, N'Le Sabre', 9, 1999, 2005)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (128, N'Lucerne', 9, 2005, 2011)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (129, N'Park Avenue', 9, 1996, 2012)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (130, N'Rainier', 9, 2003, 2007)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (131, N'Regal', 9, 2009, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (132, N'Rendezvouz', 9, 2001, 2007)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (133, N'Terraza', 9, 2005, 2007)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (134, N'Verano', 9, 2012, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (135, N'Qin', 10, 2014, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (136, N'ATS', 11, 2012, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (137, N'ATSV', 11, 2016, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (138, N'BLS', 11, 2006, 2010)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (139, N'CT6', 11, 2016, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (140, N'CTS', 11, 2002, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (141, N'De Ville', 11, 2000, 2005)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (142, N'DTS', 11, 2006, 2011)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (143, N'Eldorado', 11, 1992, 2002)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (144, N'ELR', 11, 2013, 2016)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (145, N'Escalade', 11, 2002, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (146, N'Seville', 11, 1998, 2004)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (147, N'SRX', 11, 2004, 2016)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (148, N'STS', 11, 2004, 2012)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (149, N'XLR', 11, 2003, 2009)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (150, N'XT4', 11, 2018, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (151, N'XT5', 11, 2016, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (152, N'XT6', 11, 2019, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (153, N'XTS', 11, 2012, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (154, N'CS35', 12, 2012, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (155, N'CS35 Plus', 12, 2018, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (156, N'CS55', 12, 2017, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (157, N'CS75', 12, 2013, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (158, N'CS95', 12, 2017, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (159, N'Eado', 12, 2012, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (160, N'Raeton', 12, 2013, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (161, N'Amulet', 13, 2003, 2010)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (162, N'Arrizo 7', 13, 2013, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (163, N'Bonus', 13, 2011, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (164, N'Bonus 3', 13, 2013, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (165, N'CrossEastar', 13, 2006, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (166, N'Eastar', 13, 2003, 2015)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (167, N'Fora', 13, 2006, 2010)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (168, N'IndiS', 13, 2011, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (169, N'Kimo', 13, 2008, 2014)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (170, N'M11', 13, 2008, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (171, N'QQ', 13, 2003, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (172, N'QQ6', 13, 2006, 2010)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (173, N'Tiggo', 13, 2006, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (174, N'Tiggo 3', 13, 2014, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (175, N'Tiggo 4', 13, 2017, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (176, N'Tiggo 5', 13, 2014, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (177, N'Tiggo 7', 13, 2016, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (178, N'Tiggo 8', 13, 2018, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (179, N'Very', 13, 2011, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (180, N'Astro', 14, 1995, 2005)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (181, N'Avalanche', 14, 2002, 2013)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (182, N'Aveo', 14, 2004, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (183, N'Blazer', 14, 1994, 2005)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (184, N'Camaro', 14, 1998, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (185, N'Captiva', 14, 2006, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (186, N'Cavalier', 14, 1995, 2005)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (187, N'Cobalt', 14, 2005, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (188, N'Colorado', 14, 2004, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (189, N'Corvette', 14, 2005, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (190, N'Cruze', 14, 2009, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (191, N'Epica', 14, 2006, 2012)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (192, N'Equinox', 14, 2005, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (193, N'Express', 14, 2003, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (194, N'HHR', 14, 2006, 2011)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (195, N'Impala', 14, 2006, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (196, N'Lacetti', 14, 2002, 2012)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (197, N'Lanos', 14, 1997, 2012)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (198, N'Malibu', 14, 2004, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (199, N'Monte Carlo', 14, 2005, 2007)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (200, N'Niva', 14, 2002, NULL)
GO
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (201, N'Orlando', 14, 2011, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (202, N'Rezzo', 14, 2000, 2012)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (203, N'Silverado', 14, 1999, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (204, N'Silverado 2500 HD', 14, 2001, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (205, N'Spark', 14, 2005, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (206, N'SSR', 14, 2003, 2006)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (207, N'Suburban', 14, 2001, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (208, N'Tahoe', 14, 2000, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (209, N'TrailBlazer', 14, 2002, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (210, N'Traverse', 14, 2009, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (211, N'Trax', 14, 2013, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (212, N'Uplander', 14, 2005, 2009)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (213, N'Venture', 14, 1996, 2005)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (214, N'200', 15, 2010, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (215, N'300', 15, 2004, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (216, N'300M', 15, 1998, 2004)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (217, N'Aspen', 15, 2006, 2009)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (218, N'Concorde', 15, 1998, 2004)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (219, N'Crossfire', 15, 2003, 2007)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (220, N'Grand Voyager', 15, 2008, 2015)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (221, N'Pacifica', 15, 2004, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (222, N'PT Cruiser', 15, 2000, 2010)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (223, N'Sebring', 15, 2000, 2010)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (224, N'Town & Country', 15, 2008, 2016)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (225, N'Voyager', 15, 1995, 2016)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (226, N'Berlingo', 16, 1996, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (227, N'CCrosser', 16, 2007, 2012)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (228, N'CElysee', 16, 2012, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (229, N'C1', 16, 2005, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (230, N'C2', 16, 2003, 2009)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (231, N'C3', 16, 2002, 2016)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (232, N'C3 Aircross', 16, 2017, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (233, N'C3 Picasso', 16, 2009, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (234, N'C3 Pluriel', 16, 2003, 2010)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (235, N'C4', 16, 2004, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (236, N'C4 Aircross', 16, 2012, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (237, N'C4 Cactus', 16, 2014, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (238, N'C4 Picasso', 16, 2006, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (239, N'C5', 16, 2001, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (240, N'C6', 16, 2004, 2012)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (241, N'C8', 16, 2002, 2014)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (242, N'DS 7 Crossback', 16, 2018, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (243, N'DS3', 16, 2009, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (244, N'DS4', 16, 2010, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (245, N'DS5', 16, 2011, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (246, N'Grand C4 Picasso', 16, 2006, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (247, N'Jumpy', 16, 2007, 2016)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (248, N'Nemo', 16, 2008, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (249, N'Saxo', 16, 1996, 2004)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (250, N'Spacetourer', 16, 2016, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (251, N'Xsara', 16, 1997, 2006)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (252, N'Xsara Picasso', 16, 1999, 2012)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (253, N'Evanda', 17, 2002, 2007)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (254, N'Kalos', 17, 2002, 2007)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (255, N'Leganza', 17, 1997, 2002)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (256, N'Magnus', 17, 2000, 2006)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (257, N'Matiz', 17, 2000, 2015)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (258, N'Nexia', 17, 1995, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (259, N'Nubira', 17, 1997, 2008)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (260, N'Applause', 18, 1997, 2000)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (261, N'Cast', 18, 2015, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (262, N'Copen', 18, 2002, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (263, N'Cuore', 18, 2003, 2011)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (264, N'Gran Move', 18, 1996, 2002)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (265, N'Luxio', 18, 2009, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (266, N'Materia', 18, 2006, 2012)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (267, N'Mebius', 18, 2013, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (268, N'Move', 18, 2014, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (269, N'Rocky', 18, 2019, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (270, N'Sirion', 18, 1998, 2004)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (271, N'Terios', 18, 1997, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (272, N'Trevis', 18, 2006, 2011)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (273, N'YRV', 18, 2000, 2005)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (274, N'miDO', 19, 2014, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (275, N'onDO', 19, 2014, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (276, N'Avenger', 20, 1994, 2014)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (277, N'Caliber', 20, 2006, 2012)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (278, N'Caliber SRT4', 20, 2007, 2010)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (279, N'Caravan', 20, 1995, 2016)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (280, N'Challenger', 20, 2008, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (281, N'Charger', 20, 2006, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (282, N'Dakota', 20, 2005, 2011)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (283, N'Dart', 20, 2012, 2017)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (284, N'Durango', 20, 1998, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (285, N'Intrepid', 20, 1998, 2004)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (286, N'Journey', 20, 2008, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (287, N'Magnum', 20, 2004, 2008)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (288, N'Neon', 20, 2000, 2005)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (289, N'Nitro', 20, 2007, 2012)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (290, N'Ram 1500', 20, 2001, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (291, N'Ram 2500', 20, 2002, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (292, N'Ram 3500', 20, 2002, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (293, N'Ram SRT10', 20, 2004, 2007)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (294, N'Stratus', 20, 2001, 2006)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (295, N'Viper', 20, 1996, 2017)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (296, N'580', 21, 2016, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (297, N'A30', 21, 2014, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (298, N'AX7', 21, 2014, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (299, N'H30 Cross', 21, 2013, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (300, N'Besturn B30', 22, 2016, NULL)
GO
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (301, N'Besturn B50', 22, 2009, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (302, N'Besturn X40', 22, 2017, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (303, N'Besturn X80', 22, 2014, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (304, N'Oley', 22, 2012, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (305, N'Vita', 22, 2006, 2012)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (306, N'348', 23, 1993, 1995)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (307, N'360', 23, 1999, 2005)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (308, N'456', 23, 1992, 2003)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (309, N'458', 23, 2009, 2016)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (310, N'488', 23, 2015, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (311, N'512', 23, 1991, 2004)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (312, N'550', 23, 1996, 2002)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (313, N'575 M', 23, 2002, 2006)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (314, N'599 GTB Fiorano', 23, 2006, 2012)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (315, N'599 GTO', 23, 2010, 2012)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (316, N'612', 23, 2004, 2011)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (317, N'812', 23, 2017, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (318, N'California', 23, 2008, 2014)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (319, N'California T', 23, 2014, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (320, N'Challenge Stradale', 23, 2003, 2003)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (321, N'Enzo', 23, 2002, 2004)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (322, N'F12', 23, 2012, 2017)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (323, N'F355', 23, 1994, 1999)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (324, N'F430', 23, 2004, 2010)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (325, N'F50', 23, 1995, 1997)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (326, N'F512 M', 23, 1994, 1996)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (327, N'FF', 23, 2011, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (328, N'GTC4 Lusso', 23, 2016, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (329, N'LaFerrari', 23, 2013, 2015)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (330, N'124 Spider', 24, 2015, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (331, N'500', 24, 2007, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (332, N'500L', 24, 2012, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (333, N'500X', 24, 2014, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (334, N'Albea', 24, 2002, 2012)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (335, N'Brava', 24, 1995, 2003)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (336, N'Bravo', 24, 1995, 2016)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (337, N'Coupe', 24, 1993, 2009)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (338, N'Croma', 24, 2005, 2011)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (339, N'Doblo', 24, 2001, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (340, N'Ducato', 24, 2006, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (341, N'Freemont', 24, 2011, 2016)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (342, N'Grande Punto', 24, 2005, 2009)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (343, N'Idea', 24, 2004, 2016)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (344, N'Linea', 24, 2007, 2015)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (345, N'Marea', 24, 1996, 2006)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (346, N'Multipla', 24, 1998, 2010)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (347, N'Palio', 24, 1996, 2017)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (348, N'Panda', 24, 2003, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (349, N'Panda 4x4', 24, 2003, 2012)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (350, N'Punto', 24, 1999, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (351, N'Qubo', 24, 2008, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (352, N'Sedici', 24, 2005, 2014)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (353, N'Siena', 24, 2014, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (354, N'Stilo', 24, 2001, 2010)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (355, N'Strada', 24, 2014, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (356, N'Tipo', 24, 2015, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (357, N'Ulysse', 24, 2002, 2010)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (358, N'Karma', 25, 2011, 2012)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (359, N'BMax', 26, 2012, 2017)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (360, N'CMax', 26, 2003, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (361, N'Cougar', 26, 1998, 2004)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (362, N'Crown Victoria', 26, 1999, 2011)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (363, N'EcoSport', 26, 2003, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (364, N'Edge', 26, 2007, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (365, N'Escape', 26, 2001, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (366, N'Excursion', 26, 1999, 2005)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (367, N'Expedition', 26, 1998, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (368, N'Explorer', 26, 1995, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (369, N'Explorer Sport Trac', 26, 2007, 2010)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (370, N'F150', 26, 1997, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (371, N'F250', 26, 2011, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (372, N'F350', 26, 2017, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (373, N'Falcon', 26, 2005, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (374, N'Fiesta', 26, 2002, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (375, N'Five Hundred', 26, 2005, 2007)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (376, N'Flex', 26, 2008, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (377, N'Focus', 26, 1998, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (378, N'Focus Active', 26, 2018, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (379, N'Freestar', 26, 2003, 2009)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (380, N'Freestyle', 26, 2004, 2007)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (381, N'Fusion', 26, 2002, 2012)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (382, N'Galaxy', 26, 1995, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (383, N'Ka', 26, 2003, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (384, N'Kuga', 26, 2008, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (385, N'Maverick', 26, 1992, 2009)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (386, N'Mondeo', 26, 2000, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (387, N'Mustang', 26, 1995, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (388, N'Mustang Shelby GT350', 26, 2016, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (389, N'Mustang Shelby GT500', 26, 2020, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (390, N'Puma', 26, 1997, 2004)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (391, N'Ranger', 26, 2006, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (392, N'SMax', 26, 2006, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (393, N'Taurus', 26, 2000, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (394, N'Taurus X', 26, 2007, 2009)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (395, N'Thunderbird', 26, 2000, 2006)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (396, N'Tourneo Connect', 26, 2002, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (397, N'Transit', 26, 2001, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (398, N'Transit Connect', 26, 2002, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (399, N'3102', 27, 1997, 2009)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (400, N'31105', 27, 1997, 2009)
GO
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (401, N'Siber', 27, 2008, 2010)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (402, N'Sobol', 27, 2002, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (403, N'Atlas', 28, 2018, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (404, N'Coolray', 28, 2019, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (405, N'Emgrand 7', 28, 2016, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (406, N'Emgrand EC7', 28, 2009, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (407, N'Emgrand GS', 28, 2016, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (408, N'Emgrand X7', 28, 2011, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (409, N'GC9', 28, 2015, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (410, N'GРЎ6', 28, 2014, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (411, N'MK', 28, 2008, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (412, N'Otaka', 28, 2006, 2009)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (413, N'Vision', 28, 2006, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (414, N'G70', 29, 2018, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (415, N'G80', 29, 2017, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (416, N'G90', 29, 2016, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (417, N'Acadia', 30, 2007, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (418, N'Canyon', 30, 2004, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (419, N'Envoy', 30, 2001, 2009)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (420, N'Sierra 1500', 30, 1999, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (421, N'Sierra 2500', 30, 1999, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (422, N'Terrain', 30, 2010, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (423, N'Yukon', 30, 2000, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (424, N'Cowry', 31, 2007, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (425, N'Deer', 31, 2003, 2013)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (426, N'Hover', 31, 2005, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (427, N'Hover M2', 31, 2010, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (428, N'Pegasus', 31, 2005, 2007)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (429, N'Peri', 31, 2007, 2015)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (430, N'Safe', 31, 2002, 2010)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (431, N'Sailor', 31, 2004, 2012)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (432, N'Sing', 31, 2004, 2012)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (433, N'Socool', 31, 2004, 2012)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (434, N'Wingle', 31, 2008, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (435, N'F7', 32, 2018, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (436, N'H4', 32, 2018, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (437, N'H6', 32, 2017, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (438, N'H9', 32, 2015, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (439, N'Commodore', 33, 2004, 2017)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (440, N'Accord', 34, 1998, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (441, N'Amaze', 34, 2011, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (442, N'City', 34, 2014, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (443, N'Civic', 34, 2001, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (444, N'CRV', 34, 1995, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (445, N'CRZ', 34, 2010, 2016)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (446, N'Crosstour', 34, 2010, 2015)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (447, N'Element', 34, 2003, 2011)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (448, N'Fit', 34, 2001, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (449, N'FRV', 34, 2004, 2009)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (450, N'HRV', 34, 1998, 2006)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (451, N'HRV II (GJ)', 34, 2014, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (452, N'Insight', 34, 1999, 2014)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (453, N'Jade', 34, 2013, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (454, N'Jazz', 34, 2001, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (455, N'Legend', 34, 2006, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (456, N'Odyssey', 34, 1999, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (457, N'Pilot', 34, 2002, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (458, N'Prelude', 34, 1996, 2001)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (459, N'Ridgeline', 34, 2005, 2014)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (460, N'S2000', 34, 1999, 2009)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (461, N'Shuttle', 34, 1994, 2002)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (462, N'Stream', 34, 2001, 2015)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (463, N'Vezel', 34, 2013, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (464, N'H1', 35, 1992, 2006)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (465, N'H2', 35, 2003, 2010)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (466, N'H3', 35, 2005, 2010)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (467, N'Accent', 36, 2000, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (468, N'Atos Prime', 36, 1999, 2014)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (469, N'Azera', 36, 2006, 2011)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (470, N'Centennial', 36, 1999, 2008)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (471, N'Creta', 36, 2015, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (472, N'Elantra', 36, 2000, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (473, N'Entourage', 36, 2007, 2007)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (474, N'Eon', 36, 2011, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (475, N'Equus', 36, 2009, 2016)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (476, N'Galloper', 36, 1998, 2003)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (477, N'Genesis', 36, 2008, 2016)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (478, N'Genesis Coupe', 36, 2008, 2016)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (479, N'Getz', 36, 2002, 2011)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (480, N'Grandeur', 36, 2005, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (481, N'H1', 36, 1998, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (482, N'i10', 36, 2008, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (483, N'i20', 36, 2008, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (484, N'i30', 36, 2007, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (485, N'i30 N', 36, 2017, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (486, N'i40', 36, 2011, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (487, N'Ioniq', 36, 2016, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (488, N'ix20', 36, 2010, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (489, N'ix35', 36, 2010, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (490, N'Kona', 36, 2017, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (491, N'Matrix', 36, 2001, 2014)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (492, N'Palisade', 36, 2018, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (493, N'Porter', 36, 1996, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (494, N'Santa Fe', 36, 2001, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (495, N'Solaris', 36, 2010, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (496, N'Sonata', 36, 1998, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (497, N'Terracan', 36, 2001, 2007)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (498, N'Trajet', 36, 2000, 2008)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (499, N'Tucson', 36, 2004, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (500, N'Veloster', 36, 2011, NULL)
GO
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (501, N'Veracruz', 36, 2007, 2015)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (502, N'Verna', 36, 2005, 2011)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (503, N'Xcent', 36, 2014, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (504, N'XG', 36, 1998, 2005)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (505, N'EX', 37, 2008, 2014)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (506, N'FX', 37, 2003, 2013)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (507, N'G', 37, 2003, 2014)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (508, N'I35', 37, 2002, 2004)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (509, N'JX', 37, 2012, 2013)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (510, N'M', 37, 2001, 2013)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (511, N'Q30', 37, 2016, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (512, N'Q40', 37, 2014, 2015)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (513, N'Q45', 37, 2002, 2007)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (514, N'Q50', 37, 2013, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (515, N'Q60', 37, 2013, 2016)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (516, N'Q70', 37, 2013, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (517, N'QX30', 37, 2016, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (518, N'QX4', 37, 1997, 2003)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (519, N'QX50', 37, 2013, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (520, N'QX56', 37, 2004, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (521, N'QX60', 37, 2013, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (522, N'QX70', 37, 2013, 2016)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (523, N'QX80', 37, 2013, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (524, N'Ascender', 38, 2002, 2008)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (525, N'Axiom', 38, 2002, 2004)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (526, N'DMax', 38, 2011, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (527, N'DMax Rodeo', 38, 2007, 2007)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (528, N'I280', 38, 2005, 2006)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (529, N'I290', 38, 2007, 2007)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (530, N'I350', 38, 2005, 2006)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (531, N'I370', 38, 2007, 2007)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (532, N'Rodeo', 38, 1998, 2004)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (533, N'Trooper', 38, 1992, 2002)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (534, N'VehiCross', 38, 1997, 2001)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (535, N'Daily', 39, 2006, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (536, N'EPace', 40, 2017, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (537, N'FPace', 40, 2015, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (538, N'FType', 40, 2013, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (539, N'IPace', 40, 2018, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (540, N'SType', 40, 1998, 2008)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (541, N'XType', 40, 2001, 2009)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (542, N'XE', 40, 2015, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (543, N'XF', 40, 2007, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (544, N'XJ', 40, 1997, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (545, N'XK/XKR', 40, 2002, 2014)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (546, N'Cherokee', 41, 2002, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (547, N'Commander', 41, 2006, 2010)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (548, N'Compass', 41, 2007, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (549, N'Gladiator', 41, 2019, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (550, N'Grand Cherokee', 41, 1999, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (551, N'Liberty', 41, 2006, 2013)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (552, N'Patriot', 41, 2006, 2016)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (553, N'Renegade', 41, 2014, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (554, N'Wrangler', 41, 1998, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (555, N'Carens', 42, 2002, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (556, N'Carnival', 42, 1999, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (557, N'Ceed', 42, 2006, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (558, N'Cerato', 42, 2004, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (559, N'Clarus', 42, 1998, 2001)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (560, N'Forte', 42, 2008, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (561, N'K900', 42, 2019, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (562, N'Magentis', 42, 2001, 2010)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (563, N'Mohave', 42, 2008, 2011)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (564, N'Niro', 42, 2016, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (565, N'Opirus', 42, 2003, 2010)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (566, N'Optima', 42, 2010, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (567, N'Picanto', 42, 2004, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (568, N'ProCeed', 42, 2019, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (569, N'Quoris', 42, 2012, 2018)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (570, N'Ray', 42, 2011, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (571, N'Rio', 42, 2000, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (572, N'Rio XLine', 42, 2017, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (573, N'Seltos', 42, 2019, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (574, N'Shuma', 42, 1997, 2005)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (575, N'Sorento', 42, 2002, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (576, N'Sorento Prime', 42, 2015, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (577, N'Soul', 42, 2009, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (578, N'Spectra', 42, 2005, 2009)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (579, N'Sportage', 42, 1993, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (580, N'Stinger', 42, 2017, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (581, N'Stonic', 42, 2017, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (582, N'Telluride', 42, 2019, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (583, N'Venga', 42, 2011, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (584, N'Aventador', 43, 2011, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (585, N'Centenario', 43, 2016, 2017)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (586, N'Diablo', 43, 1991, 2001)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (587, N'Gallardo', 43, 2003, 2014)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (588, N'Huracan', 43, 2014, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (589, N'Murcielago', 43, 2003, 2010)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (590, N'Reventon', 43, 2008, 2008)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (591, N'Urus', 43, 2018, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (592, N'Delta', 44, 2008, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (593, N'Lybra', 44, 1999, 2007)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (594, N'Musa', 44, 2004, 2012)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (595, N'Phedra', 44, 2002, 2010)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (596, N'Thema', 44, 2011, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (597, N'Thesis', 44, 2001, 2009)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (598, N'Ypsilon', 44, 2003, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (599, N'Defender', 45, 2007, 2016)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (600, N'Discovery', 45, 1998, NULL)
GO
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (601, N'Discovery Sport', 45, 2014, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (602, N'Evoque', 45, 2011, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (603, N'Freelander', 45, 1998, 2014)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (604, N'Range Rover', 45, 1994, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (605, N'Range Rover Sport', 45, 2004, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (606, N'Range Rover Velar', 45, 2017, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (607, N'CT', 46, 2010, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (608, N'ES', 46, 2001, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (609, N'GS', 46, 1997, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (610, N'GX', 46, 2002, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (611, N'HS', 46, 2009, 2014)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (612, N'IS', 46, 1998, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (613, N'LC', 46, 2017, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (614, N'LFA', 46, 2010, 2012)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (615, N'LS', 46, 1995, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (616, N'LX', 46, 1998, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (617, N'NX', 46, 2014, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (618, N'RC', 46, 2014, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (619, N'RX', 46, 1997, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (620, N'SC', 46, 1999, 2010)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (621, N'UX', 46, 2018, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (622, N'Breez', 47, 2007, 2012)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (623, N'Cebrium', 47, 2013, 2017)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (624, N'Celliya', 47, 2013, 2016)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (625, N'Smily', 47, 2008, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (626, N'Solano', 47, 2008, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (627, N'X50', 47, 2014, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (628, N'X60', 47, 2011, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (629, N'Aviator', 48, 2003, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (630, N'Corsair', 48, 2019, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (631, N'Mark LT', 48, 2006, 2007)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (632, N'MKC', 48, 2014, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (633, N'MKS', 48, 2008, 2016)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (634, N'MKT', 48, 2009, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (635, N'MKX', 48, 2006, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (636, N'MKZ', 48, 2006, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (637, N'Navigator', 48, 1997, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (638, N'Town Car', 48, 1998, 2011)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (639, N'Zephyr', 48, 2006, 2006)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (640, N'Elise', 49, 2001, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (641, N'Europa S', 49, 2005, 2010)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (642, N'Evora', 49, 2009, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (643, N'Exige', 49, 2001, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (644, N'B1', 50, 2008, 2014)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (645, N'B2', 50, 2010, 2014)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (646, N'3200 GT', 51, 1998, 2002)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (647, N'Ghibli', 51, 2013, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (648, N'Gran Cabrio', 51, 2010, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (649, N'Gran Turismo ', 51, 2007, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (650, N'Gran Turismo S', 51, 2008, 2012)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (651, N'Levante', 51, 2016, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (652, N'Quattroporte', 51, 2003, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (653, N'Quattroporte S', 51, 2007, 2012)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (654, N'57', 52, 2002, 2012)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (655, N'57 S', 52, 2007, 2012)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (656, N'62', 52, 2002, 2012)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (657, N'62 S', 52, 2007, 2012)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (658, N'Landaulet', 52, 2003, 2012)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (659, N'2', 53, 2003, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (660, N'3', 53, 2003, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (661, N'323', 53, 1998, 2003)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (662, N'5', 53, 2005, 2015)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (663, N'6', 53, 2002, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (664, N'626', 53, 1997, 2001)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (665, N'BSeries', 53, 1999, 2006)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (666, N'BT50', 53, 2011, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (667, N'CX3', 53, 2015, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (668, N'CX5', 53, 2012, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (669, N'CX7', 53, 2006, 2012)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (670, N'CX9', 53, 2007, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (671, N'MPV', 53, 1999, 2016)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (672, N'MX5', 53, 1998, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (673, N'Premacy', 53, 1999, 2006)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (674, N'RX7', 53, 1992, 2002)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (675, N'RX8', 53, 2003, 2012)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (676, N'Tribute', 53, 2000, 2007)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (677, N'540C', 54, 2015, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (678, N'570S', 54, 2015, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (679, N'600LT', 54, 2018, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (680, N'650S', 54, 2014, 2017)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (681, N'675LT', 54, 2015, 2017)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (682, N'720S', 54, 2017, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (683, N'MP412C', 54, 2011, 2014)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (684, N'P1', 54, 2013, 2016)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (685, N'Aclass', 55, 1997, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (686, N'AMG GT', 55, 2014, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (687, N'AMG GT 4Door', 55, 2018, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (688, N'Bclass', 55, 2005, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (689, N'Cclass', 55, 1997, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (690, N'Cclass Sport Coupe', 55, 2001, 2007)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (691, N'CLclass', 55, 1992, 2014)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (692, N'CLAclass', 55, 2013, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (693, N'CLCclass ', 55, 2008, 2011)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (694, N'CLKclass', 55, 1997, 2010)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (695, N'CLSclass', 55, 2004, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (696, N'Eclass', 55, 1995, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (697, N'Eclass Coupe', 55, 2017, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (698, N'EQC', 55, 2019, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (699, N'Gclass', 55, 1996, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (700, N'GLclass', 55, 2006, NULL)
GO
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (701, N'GLAclass', 55, 2013, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (702, N'GLBclass', 55, 2019, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (703, N'GLCclass', 55, 2015, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (704, N'GLCclass Coupe', 55, 2016, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (705, N'GLEclass', 55, 2015, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (706, N'GLEclass Coupe', 55, 2015, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (707, N'GLKclass', 55, 2008, 2015)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (708, N'GLSclass', 55, 2015, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (709, N'Mclass', 55, 1997, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (710, N'Rclass', 55, 2005, 2012)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (711, N'Sclass', 55, 1990, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (712, N'Sclass Cabrio', 55, 2015, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (713, N'Sclass Coupe', 55, 2015, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (714, N'SLclass', 55, 2001, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (715, N'SLKclass', 55, 1996, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (716, N'SLRclass', 55, 2003, 2010)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (717, N'SLS AMG', 55, 2010, 2014)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (718, N'Sprinter', 55, 2000, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (719, N'Vaneo', 55, 2001, 2006)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (720, N'Viano', 55, 2003, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (721, N'Vito', 55, 1999, 2003)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (722, N'Xclass', 55, 2018, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (723, N'Grand Marquis', 56, 2003, 2011)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (724, N'Mariner', 56, 2005, 2007)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (725, N'Milan', 56, 2006, 2011)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (726, N'Montego', 56, 2004, 2007)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (727, N'Monterey', 56, 1991, 2007)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (728, N'Mountaineer', 56, 2003, 2010)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (729, N'Sable', 56, 1995, 2005)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (730, N'TF', 57, 2002, 2011)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (731, N'XPower SV', 57, 2003, 2008)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (732, N'ZR', 57, 2001, 2005)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (733, N'ZS', 57, 2001, 2005)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (734, N'ZT', 57, 2001, 2005)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (735, N'ZTT', 57, 2001, 2005)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (736, N'Clubman', 58, 2007, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (737, N'Clubman S', 58, 2007, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (738, N'Clubvan', 58, 2012, 2014)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (739, N'Cooper', 58, 2001, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (740, N'Cooper Cabrio', 58, 2001, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (741, N'Cooper S', 58, 2001, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (742, N'Cooper S Cabrio', 58, 2001, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (743, N'Cooper S Countryman All4', 58, 2010, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (744, N'Countryman', 58, 2010, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (745, N'One', 58, 2001, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (746, N'3000 GT', 59, 1992, 2001)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (747, N'ASX', 59, 2010, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (748, N'Carisma', 59, 1995, 2004)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (749, N'Colt', 59, 1995, 2012)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (750, N'Dignity', 59, 2012, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (751, N'Eclipse', 59, 1995, 2007)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (752, N'Eclipse Cross', 59, 2017, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (753, N'Endeavor', 59, 2004, 2011)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (754, N'Galant', 59, 1996, 2012)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (755, N'Grandis', 59, 2003, 2011)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (756, N'iMiEV', 59, 2009, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (757, N'L200', 59, 1996, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (758, N'Lancer', 59, 1996, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (759, N'Lancer Evo', 59, 2001, 2016)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (760, N'Mirage', 59, 2012, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (761, N'Outlander', 59, 2003, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (762, N'Outlander XL', 59, 2006, 2012)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (763, N'Pajero', 59, 1990, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (764, N'Pajero Pinin', 59, 1999, 2007)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (765, N'Pajero Sport', 59, 1998, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (766, N'Raider', 59, 2006, 2007)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (767, N'Space Gear', 59, 1995, 2007)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (768, N'Space Runner', 59, 1999, 2004)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (769, N'Space Star', 59, 1998, 2004)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (770, N'350Z', 60, 2002, 2009)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (771, N'370Z', 60, 2009, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (772, N'Almera', 60, 2000, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (773, N'Almera Classic', 60, 2005, 2012)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (774, N'Almera Tino', 60, 2000, 2005)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (775, N'Altima', 60, 2002, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (776, N'Armada', 60, 2003, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (777, N'Bluebird Sylphy', 60, 2000, 2012)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (778, N'GTR', 60, 2007, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (779, N'Juke', 60, 2011, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (780, N'Leaf', 60, 2010, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (781, N'Maxima', 60, 2000, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (782, N'Micra', 60, 2003, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (783, N'Murano', 60, 2002, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (784, N'Navara', 60, 2005, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (785, N'Note', 60, 2005, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (786, N'NP300', 60, 2008, 2013)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (787, N'Pathfinder', 60, 1997, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (788, N'Patrol', 60, 1997, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (789, N'Primera', 60, 1996, 2008)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (790, N'Qashqai', 60, 2007, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (791, N'Qashqai+2', 60, 2008, 2013)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (792, N'Quest', 60, 2003, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (793, N'Rogue', 60, 2008, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (794, N'Sentra', 60, 1999, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (795, N'Skyline', 60, 2001, 2005)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (796, N'Sylphy', 60, 2012, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (797, N'Teana', 60, 2005, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (798, N'Terrano', 60, 1993, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (799, N'Tiida', 60, 2007, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (800, N'Titan', 60, 2003, NULL)
GO
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (801, N'Titan XD', 60, 2016, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (802, N'XTrail', 60, 2001, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (803, N'XTerra', 60, 2001, 2015)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (804, N'Z', 60, 2003, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (805, N'M600', 61, 2010, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (806, N'Adam', 62, 2013, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (807, N'Agila', 62, 2000, 2014)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (808, N'Antara', 62, 2006, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (809, N'Astra', 62, 1998, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (810, N'Astra GTS', 62, 2011, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (811, N'Cascada', 62, 2013, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (812, N'Combo', 62, 2001, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (813, N'Corsa', 62, 2000, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (814, N'Corsa OPC', 62, 2007, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (815, N'Crossland X', 62, 2017, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (816, N'Frontera', 62, 1998, 2004)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (817, N'Grandland X', 62, 2017, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (818, N'Insignia', 62, 2008, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (819, N'Insignia OPC', 62, 2009, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (820, N'Karl', 62, 2015, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (821, N'Meriva', 62, 2003, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (822, N'Mokka', 62, 2012, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (823, N'Omega', 62, 1994, 2004)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (824, N'Signum', 62, 2003, 2008)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (825, N'Speedster', 62, 2000, 2007)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (826, N'Tigra', 62, 1994, 2009)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (827, N'Vectra', 62, 1995, 2008)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (828, N'Vivaro', 62, 2014, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (829, N'Zafira', 62, 1999, 2014)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (830, N'Zafira Tourer', 62, 2012, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (831, N'1007', 63, 2004, 2009)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (832, N'107', 63, 2005, 2014)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (833, N'108', 63, 2014, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (834, N'2008', 63, 2013, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (835, N'206', 63, 1998, 2012)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (836, N'207', 63, 2006, 2014)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (837, N'208', 63, 2012, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (838, N'3008', 63, 2009, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (839, N'301', 63, 2012, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (840, N'307', 63, 2000, 2011)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (841, N'308', 63, 2007, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (842, N'4007', 63, 2007, 2012)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (843, N'4008', 63, 2012, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (844, N'406', 63, 1995, 2004)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (845, N'407', 63, 2004, 2010)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (846, N'408', 63, 2010, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (847, N'5008', 63, 2009, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (848, N'508', 63, 2011, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (849, N'607', 63, 2000, 2010)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (850, N'807', 63, 2002, 2014)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (851, N'Boxer', 63, 2008, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (852, N'Partner', 63, 1996, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (853, N'RCZ Sport', 63, 2010, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (854, N'Road Runner', 64, 1968, 1970)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (855, N'Aztec', 65, 2001, 2005)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (856, N'Bonneville', 65, 1999, 2005)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (857, N'Firebird', 65, 1993, 2002)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (858, N'G5 Pursuit', 65, 2004, 2010)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (859, N'G6', 65, 2004, 2010)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (860, N'G8', 65, 2008, 2009)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (861, N'Grand AM', 65, 1998, 2005)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (862, N'Grand Prix', 65, 1996, 2008)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (863, N'GTO', 65, 2004, 2006)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (864, N'Montana', 65, 1997, 2009)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (865, N'Solstice', 65, 2005, 2010)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (866, N'Sunfire', 65, 1995, 2005)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (867, N'Torrent', 65, 2005, 2009)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (868, N'Vibe', 65, 2002, 2009)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (869, N'718 Boxster', 66, 2016, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (870, N'718 Cayman', 66, 2016, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (871, N'911', 66, 1997, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (872, N'Boxster', 66, 1996, 2016)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (873, N'Cayenne', 66, 2002, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (874, N'Cayman', 66, 2005, 2016)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (875, N'Macan', 66, 2014, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (876, N'Panamera', 66, 2009, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (877, N'Taycan', 66, 2020, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (878, N'Gentra', 67, 2015, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (879, N'Arkana', 68, 2019, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (880, N'Avantime', 68, 2001, 2004)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (881, N'Captur', 68, 2013, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (882, N'Clio', 68, 1998, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (883, N'Duster', 68, 2010, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (884, N'Duster Oroch', 68, 2015, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (885, N'Espace', 68, 1996, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (886, N'Fluence', 68, 2010, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (887, N'Grand Scenic', 68, 2009, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (888, N'Kadjar', 68, 2015, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (889, N'Kangoo', 68, 1998, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (890, N'Kaptur', 68, 2016, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (891, N'Koleos', 68, 2008, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (892, N'Laguna', 68, 1993, 2015)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (893, N'Latitude', 68, 2010, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (894, N'Logan', 68, 2004, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (895, N'Master', 68, 2011, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (896, N'Megane', 68, 1996, 2016)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (897, N'Modus', 68, 2004, 2012)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (898, N'Sandero', 68, 2007, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (899, N'Sandero Stepway', 68, 2008, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (900, N'Scenic', 68, 1996, NULL)
GO
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (901, N'Symbol', 68, 2002, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (902, N'Talisman', 68, 2015, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (903, N'Trafic', 68, 2001, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (904, N'Twingo', 68, 1993, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (905, N'Twizy', 68, 2012, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (906, N'Vel Satis', 68, 2002, 2009)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (907, N'Wind', 68, 2010, 2013)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (908, N'Zoe', 68, 2012, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (909, N'Cullinan', 69, 2018, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (910, N'Dawn', 69, 2015, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (911, N'Ghost', 69, 2009, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (912, N'Phantom', 69, 2003, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (913, N'Wraith', 69, 2013, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (914, N'25', 70, 1999, 2008)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (915, N'400', 70, 1996, 2000)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (916, N'45', 70, 2000, 2008)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (917, N'600', 70, 1999, 2004)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (918, N'75', 70, 1999, 2005)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (919, N'Streetwise', 70, 2003, 2005)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (920, N'92x', 71, 2004, 2007)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (921, N'44264', 71, 2003, 2014)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (922, N'94x', 71, 2011, 2012)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (923, N'44325', 71, 1997, 2012)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (924, N'97x', 71, 2005, 2009)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (925, N'Aura', 72, 2007, 2007)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (926, N'Ion', 72, 2003, 2007)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (927, N'LW', 72, 1998, 2004)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (928, N'Outlook', 72, 2006, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (929, N'Sky', 72, 2007, 2007)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (930, N'Vue', 72, 2002, 2007)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (931, N'FRS', 73, 2012, 2016)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (932, N'tC', 73, 2004, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (933, N'xA', 73, 2003, 2007)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (934, N'xB', 73, 2003, 2015)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (935, N'xD', 73, 2007, 2014)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (936, N'Alhambra', 74, 1998, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (937, N'Altea', 74, 2004, 2015)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (938, N'Altea Freetrack', 74, 2007, 2015)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (939, N'Altea XL', 74, 2007, 2015)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (940, N'Arosa', 74, 1997, 2006)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (941, N'Ateca', 74, 2016, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (942, N'Cordoba', 74, 1999, 2009)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (943, N'Exeo', 74, 2008, 2013)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (944, N'Ibiza', 74, 2002, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (945, N'Leon', 74, 1999, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (946, N'Mii', 74, 2012, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (947, N'Toledo', 74, 2004, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (948, N'Citigo', 75, 2011, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (949, N'Fabia', 75, 1999, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (950, N'Felicia', 75, 1995, 2000)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (951, N'Kamiq', 75, 2019, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (952, N'Karoq', 75, 2017, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (953, N'Kodiaq', 75, 2016, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (954, N'Octavia', 75, 1995, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (955, N'Octavia Scout', 75, 2007, 2013)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (956, N'Octavia Tour', 75, 2006, 2013)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (957, N'Praktik', 75, 2007, 2015)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (958, N'Rapid', 75, 2012, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (959, N'Rapid Spaceback (NH1)', 75, 2013, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (960, N'Roomster', 75, 2006, 2015)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (961, N'Superb', 75, 2002, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (962, N'Yeti', 75, 2010, 2018)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (963, N'Forfour', 76, 2004, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (964, N'Fortwo', 76, 1997, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (965, N'Roadster', 76, 2003, 2012)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (966, N'Actyon', 77, 2005, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (967, N'Actyon Sports', 77, 2006, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (968, N'Chairman', 77, 1997, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (969, N'Korando', 77, 2002, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (970, N'Kyron', 77, 2005, 2016)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (971, N'Musso', 77, 1993, 2007)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (972, N'Musso Sport', 77, 2004, 2007)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (973, N'Rexton', 77, 2001, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (974, N'Rodius', 77, 2004, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (975, N'Stavic', 77, 2013, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (976, N'Tivoli', 77, 2015, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (977, N'XLV', 77, 2016, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (978, N'Ascent', 78, 2018, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (979, N'Baja', 78, 2002, 2007)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (980, N'Crosstrack', 78, 2018, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (981, N'Exiga', 78, 2008, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (982, N'Forester', 78, 1997, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (983, N'Impreza', 78, 1992, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (984, N'Justy', 78, 1995, 2006)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (985, N'Legacy', 78, 1994, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (986, N'Levorg', 78, 2014, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (987, N'Outback', 78, 1997, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (988, N'Traviq', 78, 2001, 2006)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (989, N'Tribeca', 78, 2005, 2014)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (990, N'WRX', 78, 2014, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (991, N'XV', 78, 2012, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (992, N'Alto', 79, 2002, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (993, N'Baleno', 79, 1995, 2003)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (994, N'Celerio', 79, 2014, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (995, N'Ciaz', 79, 2014, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (996, N'Grand Vitara', 79, 1998, 2014)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (997, N'Grand Vitara XL7', 79, 1998, 2014)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (998, N'Ignis', 79, 2000, 2008)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (999, N'Jimny', 79, 1998, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (1000, N'Kizashi', 79, 2009, 2015)
GO
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (1001, N'Liana', 79, 2002, 2007)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (1002, N'Splash', 79, 2008, 2016)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (1003, N'Swift', 79, 2005, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (1004, N'SX4', 79, 2006, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (1005, N'Vitara', 79, 2015, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (1006, N'Wagon R', 79, 2012, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (1007, N'Wagon R+', 79, 2000, 2006)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (1008, N'Model 3', 80, 2017, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (1009, N'Model S', 80, 2012, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (1010, N'Model X', 80, 2015, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (1011, N'Model Y', 80, 2019, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (1012, N'4Runner', 81, 1995, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (1013, N'Alphard', 81, 2002, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (1014, N'Auris', 81, 2007, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (1015, N'Avalon', 81, 2000, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (1016, N'Avensis', 81, 1997, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (1017, N'Avensis Verso', 81, 2001, 2010)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (1018, N'Aygo', 81, 2005, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (1019, N'CHR', 81, 2016, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (1020, N'Caldina', 81, 2002, 2007)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (1021, N'Camry', 81, 1996, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (1022, N'Celica', 81, 1999, 2006)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (1023, N'Corolla', 81, 1995, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (1024, N'Corolla Verso', 81, 2002, 2009)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (1025, N'FJ Cruiser', 81, 2007, 2016)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (1026, N'Fortuner', 81, 2004, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (1027, N'GT 86', 81, 2012, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (1028, N'Hiace', 81, 2006, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (1029, N'Highlander', 81, 2000, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (1030, N'Hilux', 81, 2005, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (1031, N'iQ', 81, 2008, 2016)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (1032, N'ist', 81, 2002, 2016)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (1033, N'Land Cruiser', 81, 1990, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (1034, N'Land Cruiser Prado', 81, 2002, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (1035, N'Mark II', 81, 2000, 2004)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (1036, N'Mirai', 81, 2014, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (1037, N'MR2', 81, 1999, 2007)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (1038, N'Picnic', 81, 1995, 2001)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (1039, N'Previa', 81, 2000, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (1040, N'Prius', 81, 2003, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (1041, N'RAV4', 81, 1994, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (1042, N'Sequoia', 81, 2001, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (1043, N'Sienna', 81, 2002, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (1044, N'Supra', 81, 2019, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (1045, N'Tacoma', 81, 2005, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (1046, N'Tundra', 81, 1999, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (1047, N'Venza', 81, 2008, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (1048, N'Verso', 81, 2009, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (1049, N'Vitz', 81, 2005, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (1050, N'Yaris', 81, 1999, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (1051, N'Yaris Verso', 81, 1999, 2005)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (1052, N'Pickup', 82, 2008, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (1053, N'РџР°С‚СЂРёРѕС‚', 82, 2005, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (1054, N'РҐР°РЅС‚РµСЂ', 82, 2003, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (1055, N'21012107', 83, 1976, 2012)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (1056, N'2108,2109, 21099', 83, 1984, 2004)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (1057, N'2110,2111, 2112', 83, 1996, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (1058, N'2113,2114, 2115', 83, 1997, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (1059, N'4x4 Urban', 83, 2014, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (1060, N'Granta', 83, 2011, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (1061, N'Largus', 83, 2012, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (1062, N'Largus Cross', 83, 2015, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (1063, N'Vesta Cross', 83, 2018, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (1064, N'Vesta Sport', 83, 2018, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (1065, N'Vesta SW', 83, 2017, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (1066, N'XRay', 83, 2016, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (1067, N'XRay Cross', 83, 2018, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (1068, N'Р’РµСЃС‚Р°', 83, 2015, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (1069, N'РљР°Р»РёРЅР°', 83, 2004, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (1070, N'РќРёРІР° 4X4', 83, 1977, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (1071, N'РћРєР°', 83, 1988, 2008)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (1072, N'РџСЂРёРѕСЂР°', 83, 2007, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (1073, N'Amarok', 84, 1990, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (1074, N'Arteon', 84, 2017, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (1075, N'Beetle', 84, 2011, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (1076, N'Bora', 84, 1998, 2005)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (1077, N'Caddy', 84, 2004, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (1078, N'CC', 84, 2012, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (1079, N'Crafter', 84, 2008, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (1080, N'CrossGolf', 84, 2007, 2009)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (1081, N'CrossPolo', 84, 2006, 2009)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (1082, N'CrossTouran', 84, 2007, 2015)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (1083, N'Eos', 84, 2006, 2015)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (1084, N'Fox', 84, 2005, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (1085, N'Golf', 84, 1997, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (1086, N'Jetta', 84, 2005, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (1087, N'Lupo', 84, 1998, 2005)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (1088, N'Multivan', 84, 2003, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (1089, N'New Beetle', 84, 1998, 2007)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (1090, N'Passat', 84, 2000, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (1091, N'Passat CC', 84, 2008, 2012)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (1092, N'Phaeton', 84, 2002, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (1093, N'Pointer', 84, 1993, 1997)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (1094, N'Polo', 84, 2001, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (1095, N'Routan', 84, 2008, 2014)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (1096, N'Scirocco', 84, 2008, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (1097, N'Sharan', 84, 1995, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (1098, N'TRoc', 84, 2017, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (1099, N'Teramont', 84, 2017, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (1100, N'Tiguan', 84, 2007, NULL)
GO
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (1101, N'Touareg', 84, 2002, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (1102, N'Touran', 84, 2003, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (1103, N'Transporter', 84, 1990, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (1104, N'Up', 84, 2011, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (1105, N'C30', 85, 2007, 2013)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (1106, N'C70', 85, 2006, 2013)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (1107, N'C70 Convertible', 85, 1997, 2006)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (1108, N'C70 Coupe', 85, 1996, 2007)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (1109, N'S40', 85, 1995, 2012)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (1110, N'S60', 85, 2000, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (1111, N'S70', 85, 1996, 2000)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (1112, N'S80', 85, 1998, 2016)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (1113, N'S90', 85, 1997, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (1114, N'V40', 85, 1995, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (1115, N'V50', 85, 2004, 2012)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (1116, N'V60', 85, 2011, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (1117, N'V70', 85, 1996, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (1118, N'V90', 85, 1997, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (1119, N'XC40', 85, 2017, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (1120, N'XC60', 85, 2008, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (1121, N'XC70', 85, 2001, NULL)
INSERT [dbo].[AutoModels] ([ID], [Model], [VenderID], [StartDate], [EndDate]) VALUES (1122, N'XC90', 85, 2002, NULL)
GO
SET IDENTITY_INSERT [dbo].[Clients] ON 

INSERT [dbo].[Clients] ([ID], [LastName], [Name], [MiddleName], [Phone]) VALUES (1, N'Соловьев', N'Дмитрий', N'Денисович', N'7(495)510-2431')
INSERT [dbo].[Clients] ([ID], [LastName], [Name], [MiddleName], [Phone]) VALUES (2, N'Герасимова', N'Екатерина', N'Кирилловна', N'7(495)326-1140')
INSERT [dbo].[Clients] ([ID], [LastName], [Name], [MiddleName], [Phone]) VALUES (3, N'Трошина', N'Валерия', N'Дмитриевна', N'7(495)145-3447')
INSERT [dbo].[Clients] ([ID], [LastName], [Name], [MiddleName], [Phone]) VALUES (4, N'Шмелева', N'Полина', N'Егоровна', N'7(495)294-3095')
INSERT [dbo].[Clients] ([ID], [LastName], [Name], [MiddleName], [Phone]) VALUES (5, N'Кузнецов', N'Александр', N'Романович', N'7(495)168-5990')
INSERT [dbo].[Clients] ([ID], [LastName], [Name], [MiddleName], [Phone]) VALUES (6, N'Ефремов', N'Лев', N'Александрович', N'7(495)264-4049')
INSERT [dbo].[Clients] ([ID], [LastName], [Name], [MiddleName], [Phone]) VALUES (7, N'Чернышева', N'Мирослава', N'Андреевна', N'7(495)855-3935')
INSERT [dbo].[Clients] ([ID], [LastName], [Name], [MiddleName], [Phone]) VALUES (8, N'Черный', N'Артём', N'Михайлович', N'7(495)205-2908')
INSERT [dbo].[Clients] ([ID], [LastName], [Name], [MiddleName], [Phone]) VALUES (9, N'Иванов', N'Ярослав', N'Ярославович', N'7(495)775-6669')
INSERT [dbo].[Clients] ([ID], [LastName], [Name], [MiddleName], [Phone]) VALUES (10, N'Селезнев', N'Тихон', N'Михайлович', N'7(495)234-3845')
INSERT [dbo].[Clients] ([ID], [LastName], [Name], [MiddleName], [Phone]) VALUES (11, N'Комарова', N'Елизавета', N'Саввична', N'7(495)910-9461')
INSERT [dbo].[Clients] ([ID], [LastName], [Name], [MiddleName], [Phone]) VALUES (12, N'Смирнова', N'София', N'Денисовна', N'7(495)670-5886')
INSERT [dbo].[Clients] ([ID], [LastName], [Name], [MiddleName], [Phone]) VALUES (13, N'Гаврилов', N'Максим', N'Романович', N'7(495)521-2802')
INSERT [dbo].[Clients] ([ID], [LastName], [Name], [MiddleName], [Phone]) VALUES (14, N'Антипов', N'Родион', N'Владимирович', N'7(495)464-2090')
INSERT [dbo].[Clients] ([ID], [LastName], [Name], [MiddleName], [Phone]) VALUES (15, N'Попов', N'Максим', N'Альбертович', N'7(495)010-5722')
INSERT [dbo].[Clients] ([ID], [LastName], [Name], [MiddleName], [Phone]) VALUES (16, N'Ушакова', N'Анастасия', N'Демьяновна', N'7(495)929-7063')
INSERT [dbo].[Clients] ([ID], [LastName], [Name], [MiddleName], [Phone]) VALUES (17, N'Родионова', N'Наталья', N'Кирилловна', N'7(495)858-6517')
INSERT [dbo].[Clients] ([ID], [LastName], [Name], [MiddleName], [Phone]) VALUES (18, N'Павловская', N'Алёна', N'Адамовна', N'7(495)713-8039')
INSERT [dbo].[Clients] ([ID], [LastName], [Name], [MiddleName], [Phone]) VALUES (19, N'Баранова', N'Анна', N'Марковна', N'7(495)496-2186')
INSERT [dbo].[Clients] ([ID], [LastName], [Name], [MiddleName], [Phone]) VALUES (20, N'Леонова', N'Ева', N'Макаровна', N'7(495)059-1128')
INSERT [dbo].[Clients] ([ID], [LastName], [Name], [MiddleName], [Phone]) VALUES (21, N'Мещерякова', N'Мия', N'Максимовна', N'7(495)776-3833')
INSERT [dbo].[Clients] ([ID], [LastName], [Name], [MiddleName], [Phone]) VALUES (22, N'Ильин', N'Никита', N'Олегович', N'7(495)574-5137')
INSERT [dbo].[Clients] ([ID], [LastName], [Name], [MiddleName], [Phone]) VALUES (23, N'Моисеев', N'Гордей', N'Маркович', N'7(495)338-4146')
INSERT [dbo].[Clients] ([ID], [LastName], [Name], [MiddleName], [Phone]) VALUES (24, N'Павлова', N'Алина', N'Ивановна', N'7(495)054-1721')
INSERT [dbo].[Clients] ([ID], [LastName], [Name], [MiddleName], [Phone]) VALUES (25, N'Калашникова', N'Полина', N'Макаровна', N'7(495)988-8224')
INSERT [dbo].[Clients] ([ID], [LastName], [Name], [MiddleName], [Phone]) VALUES (26, N'Фомичев', N'Василий', N'Миронович', N'7(495)983-0206')
INSERT [dbo].[Clients] ([ID], [LastName], [Name], [MiddleName], [Phone]) VALUES (27, N'Чернов', N'Григорий', N'Максимович', N'7(495)359-5968')
INSERT [dbo].[Clients] ([ID], [LastName], [Name], [MiddleName], [Phone]) VALUES (28, N'Антонов', N'Павел', N'Анатольевич', N'7(495)121-8533')
INSERT [dbo].[Clients] ([ID], [LastName], [Name], [MiddleName], [Phone]) VALUES (29, N'Харитонов', N'Кирилл', N'Давидович', N'7(495)113-4472')
INSERT [dbo].[Clients] ([ID], [LastName], [Name], [MiddleName], [Phone]) VALUES (30, N'Фадеева', N'Татьяна', N'Кирилловна', N'7(495)554-8613')
INSERT [dbo].[Clients] ([ID], [LastName], [Name], [MiddleName], [Phone]) VALUES (31, N'Блохин', N'Ярослав', N'Алексеевич', N'7(495)636-6945')
INSERT [dbo].[Clients] ([ID], [LastName], [Name], [MiddleName], [Phone]) VALUES (32, N'Иванов', N'Егор', N'Макарович', N'7(495)679-2027')
INSERT [dbo].[Clients] ([ID], [LastName], [Name], [MiddleName], [Phone]) VALUES (33, N'Потапова', N'Александра', N'Матвеевна', N'7(495)407-9792')
INSERT [dbo].[Clients] ([ID], [LastName], [Name], [MiddleName], [Phone]) VALUES (34, N'Борисова', N'Полина', N'Данииловна', N'7(495)471-1851')
INSERT [dbo].[Clients] ([ID], [LastName], [Name], [MiddleName], [Phone]) VALUES (35, N'Шевцов', N'Алексей', N'Иванович', N'7(495)871-7278')
INSERT [dbo].[Clients] ([ID], [LastName], [Name], [MiddleName], [Phone]) VALUES (36, N'Жуков', N'Ярослав', N'Саввич', N'7(495)470-5077')
INSERT [dbo].[Clients] ([ID], [LastName], [Name], [MiddleName], [Phone]) VALUES (37, N'Емельянова', N'Арина', N'Никитична', N'7(495)854-5478')
INSERT [dbo].[Clients] ([ID], [LastName], [Name], [MiddleName], [Phone]) VALUES (38, N'Кузнецова', N'София', N'Максимовна', N'7(495)400-3518')
INSERT [dbo].[Clients] ([ID], [LastName], [Name], [MiddleName], [Phone]) VALUES (39, N'Бабушкина', N'Екатерина', N'Петровна', N'7(495)901-1700')
INSERT [dbo].[Clients] ([ID], [LastName], [Name], [MiddleName], [Phone]) VALUES (40, N'Кузнецов', N'Алексей', N'Максимович', N'7(495)817-8954')
INSERT [dbo].[Clients] ([ID], [LastName], [Name], [MiddleName], [Phone]) VALUES (41, N'Семенов', N'Дмитрий', N'Васильевич', N'7(495)092-4613')
INSERT [dbo].[Clients] ([ID], [LastName], [Name], [MiddleName], [Phone]) VALUES (42, N'Новикова', N'Елизавета', N'Павловна', N'7(495)135-7541')
INSERT [dbo].[Clients] ([ID], [LastName], [Name], [MiddleName], [Phone]) VALUES (43, N'Смирнова', N'Кристина', N'Фёдоровна', N'7(495)426-1373')
INSERT [dbo].[Clients] ([ID], [LastName], [Name], [MiddleName], [Phone]) VALUES (44, N'Миронов', N'Мирон', N'Алексеевич', N'7(495)810-8655')
INSERT [dbo].[Clients] ([ID], [LastName], [Name], [MiddleName], [Phone]) VALUES (45, N'Зверева', N'Полина', N'Егоровна', N'7(495)481-0042')
INSERT [dbo].[Clients] ([ID], [LastName], [Name], [MiddleName], [Phone]) VALUES (46, N'Романова', N'Софья', N'Фёдоровна', N'7(495)879-3108')
INSERT [dbo].[Clients] ([ID], [LastName], [Name], [MiddleName], [Phone]) VALUES (47, N'Киселева', N'Василиса', N'Константиновна', N'7(495)347-7218')
INSERT [dbo].[Clients] ([ID], [LastName], [Name], [MiddleName], [Phone]) VALUES (48, N'Сидорова', N'Ярослава', N'Владиславовна', N'7(495)298-9445')
INSERT [dbo].[Clients] ([ID], [LastName], [Name], [MiddleName], [Phone]) VALUES (49, N'Попова', N'Вероника', N'Фёдоровна', N'7(495)379-4126')
INSERT [dbo].[Clients] ([ID], [LastName], [Name], [MiddleName], [Phone]) VALUES (50, N'Мещерякова', N'Мария', N'Александровна', N'7(495)963-1717')
INSERT [dbo].[Clients] ([ID], [LastName], [Name], [MiddleName], [Phone]) VALUES (51, N'Новикова', N'Мария', N'Эминовна', N'7(495)658-8679')
INSERT [dbo].[Clients] ([ID], [LastName], [Name], [MiddleName], [Phone]) VALUES (52, N'Смирнова', N'Арина', N'Егоровна', N'7(495)688-1340')
INSERT [dbo].[Clients] ([ID], [LastName], [Name], [MiddleName], [Phone]) VALUES (53, N'Константинов', N'Тимур', N'Сергеевич', N'7(495)190-3273')
INSERT [dbo].[Clients] ([ID], [LastName], [Name], [MiddleName], [Phone]) VALUES (54, N'Майорова', N'Аврора', N'Марковна', N'7(495)463-1802')
INSERT [dbo].[Clients] ([ID], [LastName], [Name], [MiddleName], [Phone]) VALUES (55, N'Морозов', N'Иван', N'Иванович', N'7(495)513-2831')
INSERT [dbo].[Clients] ([ID], [LastName], [Name], [MiddleName], [Phone]) VALUES (56, N'Емельянов', N'Рустам', N'Артёмович', N'7(495)107-4471')
INSERT [dbo].[Clients] ([ID], [LastName], [Name], [MiddleName], [Phone]) VALUES (57, N'Герасимова', N'Яна', N'Филипповна', N'7(495)729-9021')
INSERT [dbo].[Clients] ([ID], [LastName], [Name], [MiddleName], [Phone]) VALUES (58, N'Назарова', N'Арина', N'Антоновна', N'7(495)946-7592')
INSERT [dbo].[Clients] ([ID], [LastName], [Name], [MiddleName], [Phone]) VALUES (59, N'Ларионова', N'Кристина', N'Алиевна', N'7(495)064-9955')
SET IDENTITY_INSERT [dbo].[Clients] OFF
GO
SET IDENTITY_INSERT [dbo].[ClientsAuto] ON 

INSERT [dbo].[ClientsAuto] ([ID], [LastName], [Name], [MiddleName], [VIN], [GosNumber], [AutoModelID]) VALUES (1, N'Соловьев', N'Дмитрий', N'Денисович', N'3KPA24AD0ME', N'М197ХС98', 26)
INSERT [dbo].[ClientsAuto] ([ID], [LastName], [Name], [MiddleName], [VIN], [GosNumber], [AutoModelID]) VALUES (2, N'Герасимова', N'Екатерина', N'Кирилловна', N'3KPA24AD1ME', N'В243ХС98', 26)
INSERT [dbo].[ClientsAuto] ([ID], [LastName], [Name], [MiddleName], [VIN], [GosNumber], [AutoModelID]) VALUES (3, N'Трошина', N'Валерия', N'Дмитриевна', N'3KPA24AD2ME', N'Х211НК78', 85)
INSERT [dbo].[ClientsAuto] ([ID], [LastName], [Name], [MiddleName], [VIN], [GosNumber], [AutoModelID]) VALUES (4, N'Шмелева', N'Полина', N'Егоровна', N'3KPA24AD3ME', N'Н236ЕЕ178', 85)
INSERT [dbo].[ClientsAuto] ([ID], [LastName], [Name], [MiddleName], [VIN], [GosNumber], [AutoModelID]) VALUES (5, N'Кузнецов', N'Александр', N'Романович', N'3KPA24AD4ME', N'С504УК198', 85)
INSERT [dbo].[ClientsAuto] ([ID], [LastName], [Name], [MiddleName], [VIN], [GosNumber], [AutoModelID]) VALUES (6, N'Ефремов', N'Лев', N'Александрович', N'3KPA24AD5ME', N'Н888ЕС198', 85)
INSERT [dbo].[ClientsAuto] ([ID], [LastName], [Name], [MiddleName], [VIN], [GosNumber], [AutoModelID]) VALUES (7, N'Чернышева', N'Мирослава', N'Андреевна', N'3KPA24AD6ME', N'Х939ТС198', 85)
INSERT [dbo].[ClientsAuto] ([ID], [LastName], [Name], [MiddleName], [VIN], [GosNumber], [AutoModelID]) VALUES (8, N'Черный', N'Артём', N'Михайлович', N'3KPA24AD7ME', N'О650АЕ98', 85)
INSERT [dbo].[ClientsAuto] ([ID], [LastName], [Name], [MiddleName], [VIN], [GosNumber], [AutoModelID]) VALUES (9, N'Иванов', N'Ярослав', N'Ярославович', N'3KPA24AD8ME', N'Х678НН198', 85)
INSERT [dbo].[ClientsAuto] ([ID], [LastName], [Name], [MiddleName], [VIN], [GosNumber], [AutoModelID]) VALUES (10, N'Селезнев', N'Тихон', N'Михайлович', N'3KPA24AD9ME', N'В269УВ78', 84)
INSERT [dbo].[ClientsAuto] ([ID], [LastName], [Name], [MiddleName], [VIN], [GosNumber], [AutoModelID]) VALUES (11, N'Комарова', N'Елизавета', N'Саввична', N'3KPA24ADXME', N'Р445ЕР198', 84)
INSERT [dbo].[ClientsAuto] ([ID], [LastName], [Name], [MiddleName], [VIN], [GosNumber], [AutoModelID]) VALUES (12, N'Смирнова', N'София', N'Денисовна', N'3KPA25AD0ME', N'Х337РУ78', 84)
INSERT [dbo].[ClientsAuto] ([ID], [LastName], [Name], [MiddleName], [VIN], [GosNumber], [AutoModelID]) VALUES (13, N'Гаврилов', N'Максим', N'Романович', N'3KPA25AD1ME', N'Е955ЕУ98', 84)
INSERT [dbo].[ClientsAuto] ([ID], [LastName], [Name], [MiddleName], [VIN], [GosNumber], [AutoModelID]) VALUES (14, N'Антипов', N'Родион', N'Владимирович', N'3KPA25AD2ME', N'Х421СМ178', 84)
INSERT [dbo].[ClientsAuto] ([ID], [LastName], [Name], [MiddleName], [VIN], [GosNumber], [AutoModelID]) VALUES (15, N'Попов', N'Максим', N'Альбертович', N'3KPA25AD3ME', N'У170ХУ198', 84)
INSERT [dbo].[ClientsAuto] ([ID], [LastName], [Name], [MiddleName], [VIN], [GosNumber], [AutoModelID]) VALUES (16, N'Ушакова', N'Анастасия', N'Демьяновна', N'3KPA25AD4ME', N'А966МК178', 84)
INSERT [dbo].[ClientsAuto] ([ID], [LastName], [Name], [MiddleName], [VIN], [GosNumber], [AutoModelID]) VALUES (17, N'Родионова', N'Наталья', N'Кирилловна', N'3KPA25AD5ME', N'Е100АР78', 83)
INSERT [dbo].[ClientsAuto] ([ID], [LastName], [Name], [MiddleName], [VIN], [GosNumber], [AutoModelID]) VALUES (18, N'Павловская', N'Алёна', N'Адамовна', N'3KPA25AD6ME', N'Р785ВУ78', 83)
INSERT [dbo].[ClientsAuto] ([ID], [LastName], [Name], [MiddleName], [VIN], [GosNumber], [AutoModelID]) VALUES (19, N'Баранова', N'Анна', N'Марковна', N'3KPA25AD7ME', N'К972ЕЕ78', 83)
INSERT [dbo].[ClientsAuto] ([ID], [LastName], [Name], [MiddleName], [VIN], [GosNumber], [AutoModelID]) VALUES (20, N'Леонова', N'Ева', N'Макаровна', N'3KPA25AD8ME', N'Х502РА198', 83)
INSERT [dbo].[ClientsAuto] ([ID], [LastName], [Name], [MiddleName], [VIN], [GosNumber], [AutoModelID]) VALUES (21, N'Мещерякова', N'Мия', N'Максимовна', N'3KPA25AD9ME', N'С510ОР98', 83)
INSERT [dbo].[ClientsAuto] ([ID], [LastName], [Name], [MiddleName], [VIN], [GosNumber], [AutoModelID]) VALUES (22, N'Ильин', N'Никита', N'Олегович', N'3KPA25ADXME', N'О497КУ198', 83)
INSERT [dbo].[ClientsAuto] ([ID], [LastName], [Name], [MiddleName], [VIN], [GosNumber], [AutoModelID]) VALUES (23, N'Моисеев', N'Гордей', N'Маркович', N'JH2SC7716KK', N'Х887КВ198', 81)
INSERT [dbo].[ClientsAuto] ([ID], [LastName], [Name], [MiddleName], [VIN], [GosNumber], [AutoModelID]) VALUES (24, N'Павлова', N'Алина', N'Ивановна', N'JH2SC771XKK', N'Е917ОС198', 81)
INSERT [dbo].[ClientsAuto] ([ID], [LastName], [Name], [MiddleName], [VIN], [GosNumber], [AutoModelID]) VALUES (25, N'Калашникова', N'Полина', N'Макаровна', N'JH2SC7754KK', N'Е321УК98', 81)
INSERT [dbo].[ClientsAuto] ([ID], [LastName], [Name], [MiddleName], [VIN], [GosNumber], [AutoModelID]) VALUES (26, N'Фомичев', N'Василий', N'Миронович', N'WBAVD33506K', N'У856ТТ198', 81)
INSERT [dbo].[ClientsAuto] ([ID], [LastName], [Name], [MiddleName], [VIN], [GosNumber], [AutoModelID]) VALUES (27, N'Чернов', N'Григорий', N'Максимович', N'WBAVD33516K', N'Р420ММ78', 81)
INSERT [dbo].[ClientsAuto] ([ID], [LastName], [Name], [MiddleName], [VIN], [GosNumber], [AutoModelID]) VALUES (28, N'Антонов', N'Павел', N'Анатольевич', N'WBAVD33526K', N'Т525НМ178', 81)
INSERT [dbo].[ClientsAuto] ([ID], [LastName], [Name], [MiddleName], [VIN], [GosNumber], [AutoModelID]) VALUES (29, N'Харитонов', N'Кирилл', N'Давидович', N'WBAVD33536K', N'В515ЕВ78', 81)
INSERT [dbo].[ClientsAuto] ([ID], [LastName], [Name], [MiddleName], [VIN], [GosNumber], [AutoModelID]) VALUES (30, N'Фадеева', N'Татьяна', N'Кирилловна', N'WBAVD33546K', N'М687ВМ198', 78)
INSERT [dbo].[ClientsAuto] ([ID], [LastName], [Name], [MiddleName], [VIN], [GosNumber], [AutoModelID]) VALUES (31, N'Блохин', N'Ярослав', N'Алексеевич', N'WBAVD33556K', N'А887УЕ178', 78)
INSERT [dbo].[ClientsAuto] ([ID], [LastName], [Name], [MiddleName], [VIN], [GosNumber], [AutoModelID]) VALUES (32, N'Иванов', N'Егор', N'Макарович', N'WBAVD33566K', N'Н656ЕМ98', 78)
INSERT [dbo].[ClientsAuto] ([ID], [LastName], [Name], [MiddleName], [VIN], [GosNumber], [AutoModelID]) VALUES (33, N'Потапова', N'Александра', N'Матвеевна', N'WBAVD33576K', N'С705ОА78', 78)
INSERT [dbo].[ClientsAuto] ([ID], [LastName], [Name], [MiddleName], [VIN], [GosNumber], [AutoModelID]) VALUES (34, N'Борисова', N'Полина', N'Данииловна', N'WBAVD33586K', N'Р578ХА78', 78)
INSERT [dbo].[ClientsAuto] ([ID], [LastName], [Name], [MiddleName], [VIN], [GosNumber], [AutoModelID]) VALUES (35, N'Шевцов', N'Алексей', N'Иванович', N'WBAVD33596K', N'Т533ЕА178', 78)
INSERT [dbo].[ClientsAuto] ([ID], [LastName], [Name], [MiddleName], [VIN], [GosNumber], [AutoModelID]) VALUES (36, N'Жуков', N'Ярослав', N'Саввич', N'WBAVD335X6K', N'Т111СК198', 78)
INSERT [dbo].[ClientsAuto] ([ID], [LastName], [Name], [MiddleName], [VIN], [GosNumber], [AutoModelID]) VALUES (37, N'Емельянова', N'Арина', N'Никитична', N'WDBAB23A0DB', N'Е727МУ198', 79)
INSERT [dbo].[ClientsAuto] ([ID], [LastName], [Name], [MiddleName], [VIN], [GosNumber], [AutoModelID]) VALUES (38, N'Кузнецова', N'София', N'Максимовна', N'WDBAB23A1DB', N'С503ВР178', 79)
INSERT [dbo].[ClientsAuto] ([ID], [LastName], [Name], [MiddleName], [VIN], [GosNumber], [AutoModelID]) VALUES (39, N'Бабушкина', N'Екатерина', N'Петровна', N'WDBAB23A2DB', N'В342АА198', 79)
INSERT [dbo].[ClientsAuto] ([ID], [LastName], [Name], [MiddleName], [VIN], [GosNumber], [AutoModelID]) VALUES (40, N'Кузнецов', N'Алексей', N'Максимович', N'WDBAB23A3DB', N'Н922ВХ98', 79)
INSERT [dbo].[ClientsAuto] ([ID], [LastName], [Name], [MiddleName], [VIN], [GosNumber], [AutoModelID]) VALUES (41, N'Семенов', N'Дмитрий', N'Васильевич', N'WDBAB23A4DB', N'У722АК78', 79)
INSERT [dbo].[ClientsAuto] ([ID], [LastName], [Name], [MiddleName], [VIN], [GosNumber], [AutoModelID]) VALUES (42, N'Новикова', N'Елизавета', N'Павловна', N'WDBAB23A5DB', N'О701УО198', 79)
INSERT [dbo].[ClientsAuto] ([ID], [LastName], [Name], [MiddleName], [VIN], [GosNumber], [AutoModelID]) VALUES (43, N'Смирнова', N'Кристина', N'Фёдоровна', N'WDBAB23A6DB', N'Н918ХН78', 79)
INSERT [dbo].[ClientsAuto] ([ID], [LastName], [Name], [MiddleName], [VIN], [GosNumber], [AutoModelID]) VALUES (44, N'Миронов', N'Мирон', N'Алексеевич', N'WDBAB23A7DB', N'А333СК98', 75)
INSERT [dbo].[ClientsAuto] ([ID], [LastName], [Name], [MiddleName], [VIN], [GosNumber], [AutoModelID]) VALUES (45, N'Зверева', N'Полина', N'Егоровна', N'WDBAB23A8DB', N'В473МО198', 75)
INSERT [dbo].[ClientsAuto] ([ID], [LastName], [Name], [MiddleName], [VIN], [GosNumber], [AutoModelID]) VALUES (46, N'Романова', N'Софья', N'Фёдоровна', N'WDBAB23A9DB', N'Н458ЕВ78', 75)
INSERT [dbo].[ClientsAuto] ([ID], [LastName], [Name], [MiddleName], [VIN], [GosNumber], [AutoModelID]) VALUES (47, N'Киселева', N'Василиса', N'Константиновна', N'WDBAB23AXDB', N'У861ТТ198', 75)
INSERT [dbo].[ClientsAuto] ([ID], [LastName], [Name], [MiddleName], [VIN], [GosNumber], [AutoModelID]) VALUES (48, N'Сидорова', N'Ярослава', N'Владиславовна', N'5YJ3E1EA0HF', N'О665ВТ78', 75)
INSERT [dbo].[ClientsAuto] ([ID], [LastName], [Name], [MiddleName], [VIN], [GosNumber], [AutoModelID]) VALUES (49, N'Попова', N'Вероника', N'Фёдоровна', N'5YJ3E1EA1HF', N'А647ОР78', 75)
INSERT [dbo].[ClientsAuto] ([ID], [LastName], [Name], [MiddleName], [VIN], [GosNumber], [AutoModelID]) VALUES (50, N'Мещерякова', N'Мария', N'Александровна', N'5YJ3E1EA2HF', N'К403РУ198', 75)
INSERT [dbo].[ClientsAuto] ([ID], [LastName], [Name], [MiddleName], [VIN], [GosNumber], [AutoModelID]) VALUES (51, N'Новикова', N'Мария', N'Эминовна', N'5YJ3E1EA3HF', N'Е318УН98', 75)
INSERT [dbo].[ClientsAuto] ([ID], [LastName], [Name], [MiddleName], [VIN], [GosNumber], [AutoModelID]) VALUES (52, N'Смирнова', N'Арина', N'Егоровна', N'5YJ3E1EA4HF', N'Н409ОН178', 75)
INSERT [dbo].[ClientsAuto] ([ID], [LastName], [Name], [MiddleName], [VIN], [GosNumber], [AutoModelID]) VALUES (53, N'Константинов', N'Тимур', N'Сергеевич', N'5YJ3E1EA5HF', N'Е517СМ78', 75)
INSERT [dbo].[ClientsAuto] ([ID], [LastName], [Name], [MiddleName], [VIN], [GosNumber], [AutoModelID]) VALUES (54, N'Майорова', N'Аврора', N'Марковна', N'5YJ3E1EA6HF', N'Р235ВН178', 75)
INSERT [dbo].[ClientsAuto] ([ID], [LastName], [Name], [MiddleName], [VIN], [GosNumber], [AutoModelID]) VALUES (55, N'Морозов', N'Иван', N'Иванович', N'5YJ3E1EA7HF', N'М246УВ98', 75)
INSERT [dbo].[ClientsAuto] ([ID], [LastName], [Name], [MiddleName], [VIN], [GosNumber], [AutoModelID]) VALUES (56, N'Емельянов', N'Рустам', N'Артёмович', N'5YJ3E1EA8HF', N'О881СН178', 76)
INSERT [dbo].[ClientsAuto] ([ID], [LastName], [Name], [MiddleName], [VIN], [GosNumber], [AutoModelID]) VALUES (57, N'Герасимова', N'Яна', N'Филипповна', N'5YJ3E1EA9HF', N'В815КЕ198', 76)
INSERT [dbo].[ClientsAuto] ([ID], [LastName], [Name], [MiddleName], [VIN], [GosNumber], [AutoModelID]) VALUES (58, N'Назарова', N'Арина', N'Антоновна', N'5YJ3E1EAXHF', N'Р997КО178', 76)
INSERT [dbo].[ClientsAuto] ([ID], [LastName], [Name], [MiddleName], [VIN], [GosNumber], [AutoModelID]) VALUES (59, N'Ларионова', N'Кристина', N'Алиевна', N'SCBLC47J09C', N'Е189РВ198', 77)
SET IDENTITY_INSERT [dbo].[ClientsAuto] OFF
GO
SET IDENTITY_INSERT [dbo].[DealsInfo] ON 

INSERT [dbo].[DealsInfo] ([ID], [MainInfoID], [ServiceID], [Price]) VALUES (1, 1, 14, 1300)
INSERT [dbo].[DealsInfo] ([ID], [MainInfoID], [ServiceID], [Price]) VALUES (2, 1, 15, 300)
INSERT [dbo].[DealsInfo] ([ID], [MainInfoID], [ServiceID], [Price]) VALUES (3, 1, 16, 600)
INSERT [dbo].[DealsInfo] ([ID], [MainInfoID], [ServiceID], [Price]) VALUES (4, 1, 17, 800)
INSERT [dbo].[DealsInfo] ([ID], [MainInfoID], [ServiceID], [Price]) VALUES (5, 1, 18, 200)
INSERT [dbo].[DealsInfo] ([ID], [MainInfoID], [ServiceID], [Price]) VALUES (6, 1, 19, 300)
INSERT [dbo].[DealsInfo] ([ID], [MainInfoID], [ServiceID], [Price]) VALUES (7, 1, 20, 300)
INSERT [dbo].[DealsInfo] ([ID], [MainInfoID], [ServiceID], [Price]) VALUES (8, 2, 1, 500)
INSERT [dbo].[DealsInfo] ([ID], [MainInfoID], [ServiceID], [Price]) VALUES (9, 3, 1, 500)
INSERT [dbo].[DealsInfo] ([ID], [MainInfoID], [ServiceID], [Price]) VALUES (10, 4, 21, 1000)
INSERT [dbo].[DealsInfo] ([ID], [MainInfoID], [ServiceID], [Price]) VALUES (11, 4, 22, 1200)
INSERT [dbo].[DealsInfo] ([ID], [MainInfoID], [ServiceID], [Price]) VALUES (12, 4, 23, 1500)
INSERT [dbo].[DealsInfo] ([ID], [MainInfoID], [ServiceID], [Price]) VALUES (13, 4, 24, 800)
INSERT [dbo].[DealsInfo] ([ID], [MainInfoID], [ServiceID], [Price]) VALUES (14, 5, 1, 500)
INSERT [dbo].[DealsInfo] ([ID], [MainInfoID], [ServiceID], [Price]) VALUES (15, 1, 1, 500)
INSERT [dbo].[DealsInfo] ([ID], [MainInfoID], [ServiceID], [Price]) VALUES (16, 2, 1, 500)
INSERT [dbo].[DealsInfo] ([ID], [MainInfoID], [ServiceID], [Price]) VALUES (17, 3, 1, 500)
INSERT [dbo].[DealsInfo] ([ID], [MainInfoID], [ServiceID], [Price]) VALUES (18, 4, 1, 500)
INSERT [dbo].[DealsInfo] ([ID], [MainInfoID], [ServiceID], [Price]) VALUES (19, 5, 1, 500)
INSERT [dbo].[DealsInfo] ([ID], [MainInfoID], [ServiceID], [Price]) VALUES (20, 1, 1, 500)
INSERT [dbo].[DealsInfo] ([ID], [MainInfoID], [ServiceID], [Price]) VALUES (21, 2, 1, 500)
INSERT [dbo].[DealsInfo] ([ID], [MainInfoID], [ServiceID], [Price]) VALUES (22, 3, 1, 500)
INSERT [dbo].[DealsInfo] ([ID], [MainInfoID], [ServiceID], [Price]) VALUES (23, 4, 1, 500)
INSERT [dbo].[DealsInfo] ([ID], [MainInfoID], [ServiceID], [Price]) VALUES (24, 5, 1, 500)
INSERT [dbo].[DealsInfo] ([ID], [MainInfoID], [ServiceID], [Price]) VALUES (25, 1, 1, 500)
INSERT [dbo].[DealsInfo] ([ID], [MainInfoID], [ServiceID], [Price]) VALUES (26, 2, 1, 500)
INSERT [dbo].[DealsInfo] ([ID], [MainInfoID], [ServiceID], [Price]) VALUES (27, 3, 1, 500)
INSERT [dbo].[DealsInfo] ([ID], [MainInfoID], [ServiceID], [Price]) VALUES (28, 4, 1, 500)
INSERT [dbo].[DealsInfo] ([ID], [MainInfoID], [ServiceID], [Price]) VALUES (29, 5, 1, 500)
INSERT [dbo].[DealsInfo] ([ID], [MainInfoID], [ServiceID], [Price]) VALUES (30, 1, 1, 500)
INSERT [dbo].[DealsInfo] ([ID], [MainInfoID], [ServiceID], [Price]) VALUES (31, 2, 1, 500)
INSERT [dbo].[DealsInfo] ([ID], [MainInfoID], [ServiceID], [Price]) VALUES (32, 3, 25, 1200)
INSERT [dbo].[DealsInfo] ([ID], [MainInfoID], [ServiceID], [Price]) VALUES (33, 3, 26, 1200)
INSERT [dbo].[DealsInfo] ([ID], [MainInfoID], [ServiceID], [Price]) VALUES (34, 4, 1, 500)
INSERT [dbo].[DealsInfo] ([ID], [MainInfoID], [ServiceID], [Price]) VALUES (35, 5, 1, 500)
INSERT [dbo].[DealsInfo] ([ID], [MainInfoID], [ServiceID], [Price]) VALUES (36, 1, 1, 500)
INSERT [dbo].[DealsInfo] ([ID], [MainInfoID], [ServiceID], [Price]) VALUES (37, 2, 1, 500)
INSERT [dbo].[DealsInfo] ([ID], [MainInfoID], [ServiceID], [Price]) VALUES (38, 3, 1, 500)
INSERT [dbo].[DealsInfo] ([ID], [MainInfoID], [ServiceID], [Price]) VALUES (39, 4, 1, 500)
INSERT [dbo].[DealsInfo] ([ID], [MainInfoID], [ServiceID], [Price]) VALUES (40, 5, 1, 500)
INSERT [dbo].[DealsInfo] ([ID], [MainInfoID], [ServiceID], [Price]) VALUES (41, 1, 1, 500)
INSERT [dbo].[DealsInfo] ([ID], [MainInfoID], [ServiceID], [Price]) VALUES (42, 2, 1, 500)
INSERT [dbo].[DealsInfo] ([ID], [MainInfoID], [ServiceID], [Price]) VALUES (43, 3, 1, 500)
INSERT [dbo].[DealsInfo] ([ID], [MainInfoID], [ServiceID], [Price]) VALUES (44, 4, 1, 500)
INSERT [dbo].[DealsInfo] ([ID], [MainInfoID], [ServiceID], [Price]) VALUES (45, 5, 66, 300)
INSERT [dbo].[DealsInfo] ([ID], [MainInfoID], [ServiceID], [Price]) VALUES (46, 5, 67, 100)
INSERT [dbo].[DealsInfo] ([ID], [MainInfoID], [ServiceID], [Price]) VALUES (47, 5, 68, 500)
INSERT [dbo].[DealsInfo] ([ID], [MainInfoID], [ServiceID], [Price]) VALUES (48, 5, 69, 300)
INSERT [dbo].[DealsInfo] ([ID], [MainInfoID], [ServiceID], [Price]) VALUES (49, 5, 70, 400)
INSERT [dbo].[DealsInfo] ([ID], [MainInfoID], [ServiceID], [Price]) VALUES (50, 5, 71, 600)
INSERT [dbo].[DealsInfo] ([ID], [MainInfoID], [ServiceID], [Price]) VALUES (51, 1, 1, 500)
INSERT [dbo].[DealsInfo] ([ID], [MainInfoID], [ServiceID], [Price]) VALUES (52, 2, 1, 500)
INSERT [dbo].[DealsInfo] ([ID], [MainInfoID], [ServiceID], [Price]) VALUES (53, 3, 1, 500)
INSERT [dbo].[DealsInfo] ([ID], [MainInfoID], [ServiceID], [Price]) VALUES (54, 4, 1, 500)
INSERT [dbo].[DealsInfo] ([ID], [MainInfoID], [ServiceID], [Price]) VALUES (55, 5, 1, 500)
INSERT [dbo].[DealsInfo] ([ID], [MainInfoID], [ServiceID], [Price]) VALUES (56, 1, 1, 500)
INSERT [dbo].[DealsInfo] ([ID], [MainInfoID], [ServiceID], [Price]) VALUES (57, 2, 1, 500)
INSERT [dbo].[DealsInfo] ([ID], [MainInfoID], [ServiceID], [Price]) VALUES (58, 3, 1, 500)
INSERT [dbo].[DealsInfo] ([ID], [MainInfoID], [ServiceID], [Price]) VALUES (59, 4, 1, 500)
INSERT [dbo].[DealsInfo] ([ID], [MainInfoID], [ServiceID], [Price]) VALUES (60, 5, 1, 500)
INSERT [dbo].[DealsInfo] ([ID], [MainInfoID], [ServiceID], [Price]) VALUES (61, 1, 6, 500)
INSERT [dbo].[DealsInfo] ([ID], [MainInfoID], [ServiceID], [Price]) VALUES (62, 1, 7, 600)
INSERT [dbo].[DealsInfo] ([ID], [MainInfoID], [ServiceID], [Price]) VALUES (63, 1, 8, 300)
INSERT [dbo].[DealsInfo] ([ID], [MainInfoID], [ServiceID], [Price]) VALUES (64, 2, 1, 500)
INSERT [dbo].[DealsInfo] ([ID], [MainInfoID], [ServiceID], [Price]) VALUES (65, 3, 1, 500)
INSERT [dbo].[DealsInfo] ([ID], [MainInfoID], [ServiceID], [Price]) VALUES (66, 4, 1, 500)
INSERT [dbo].[DealsInfo] ([ID], [MainInfoID], [ServiceID], [Price]) VALUES (67, 5, 1, 500)
INSERT [dbo].[DealsInfo] ([ID], [MainInfoID], [ServiceID], [Price]) VALUES (68, 1, 1, 500)
INSERT [dbo].[DealsInfo] ([ID], [MainInfoID], [ServiceID], [Price]) VALUES (69, 2, 1, 500)
INSERT [dbo].[DealsInfo] ([ID], [MainInfoID], [ServiceID], [Price]) VALUES (70, 3, 1, 500)
INSERT [dbo].[DealsInfo] ([ID], [MainInfoID], [ServiceID], [Price]) VALUES (71, 4, 1, 500)
INSERT [dbo].[DealsInfo] ([ID], [MainInfoID], [ServiceID], [Price]) VALUES (72, 5, 1, 500)
INSERT [dbo].[DealsInfo] ([ID], [MainInfoID], [ServiceID], [Price]) VALUES (73, 1, 1, 500)
INSERT [dbo].[DealsInfo] ([ID], [MainInfoID], [ServiceID], [Price]) VALUES (74, 2, 1, 500)
INSERT [dbo].[DealsInfo] ([ID], [MainInfoID], [ServiceID], [Price]) VALUES (75, 3, 1, 500)
INSERT [dbo].[DealsInfo] ([ID], [MainInfoID], [ServiceID], [Price]) VALUES (76, 4, 1, 500)
INSERT [dbo].[DealsInfo] ([ID], [MainInfoID], [ServiceID], [Price]) VALUES (77, 5, 6, 522)
SET IDENTITY_INSERT [dbo].[DealsInfo] OFF
GO
SET IDENTITY_INSERT [dbo].[MainInfo] ON 

INSERT [dbo].[MainInfo] ([ID], [ProviderID], [ClientID], [ClientsAutoID], [Date], [StatusID]) VALUES (1, 1, 1, 1, CAST(N'2021-04-11T12:00:00.000' AS DateTime), 1)
INSERT [dbo].[MainInfo] ([ID], [ProviderID], [ClientID], [ClientsAutoID], [Date], [StatusID]) VALUES (2, 2, 2, 2, CAST(N'2021-04-12T18:00:00.000' AS DateTime), 2)
INSERT [dbo].[MainInfo] ([ID], [ProviderID], [ClientID], [ClientsAutoID], [Date], [StatusID]) VALUES (3, 3, 3, 3, CAST(N'2021-04-12T14:00:00.000' AS DateTime), 3)
INSERT [dbo].[MainInfo] ([ID], [ProviderID], [ClientID], [ClientsAutoID], [Date], [StatusID]) VALUES (4, 4, 4, 4, CAST(N'2021-04-11T12:00:00.000' AS DateTime), 1)
INSERT [dbo].[MainInfo] ([ID], [ProviderID], [ClientID], [ClientsAutoID], [Date], [StatusID]) VALUES (5, 5, 5, 5, CAST(N'2021-04-12T18:00:00.000' AS DateTime), 2)
INSERT [dbo].[MainInfo] ([ID], [ProviderID], [ClientID], [ClientsAutoID], [Date], [StatusID]) VALUES (6, 1, 6, 6, CAST(N'2021-04-12T14:00:00.000' AS DateTime), 3)
INSERT [dbo].[MainInfo] ([ID], [ProviderID], [ClientID], [ClientsAutoID], [Date], [StatusID]) VALUES (7, 2, 7, 7, CAST(N'2021-04-12T18:00:00.000' AS DateTime), 2)
INSERT [dbo].[MainInfo] ([ID], [ProviderID], [ClientID], [ClientsAutoID], [Date], [StatusID]) VALUES (8, 3, 8, 8, CAST(N'2021-04-12T14:00:00.000' AS DateTime), 3)
INSERT [dbo].[MainInfo] ([ID], [ProviderID], [ClientID], [ClientsAutoID], [Date], [StatusID]) VALUES (9, 4, 9, 9, CAST(N'2021-04-12T18:00:00.000' AS DateTime), 2)
INSERT [dbo].[MainInfo] ([ID], [ProviderID], [ClientID], [ClientsAutoID], [Date], [StatusID]) VALUES (10, 5, 10, 10, CAST(N'2021-04-12T14:00:00.000' AS DateTime), 3)
INSERT [dbo].[MainInfo] ([ID], [ProviderID], [ClientID], [ClientsAutoID], [Date], [StatusID]) VALUES (11, 1, 11, 11, CAST(N'2021-04-13T18:03:00.000' AS DateTime), 2)
INSERT [dbo].[MainInfo] ([ID], [ProviderID], [ClientID], [ClientsAutoID], [Date], [StatusID]) VALUES (12, 2, 12, 12, CAST(N'2021-04-13T18:03:00.000' AS DateTime), 2)
INSERT [dbo].[MainInfo] ([ID], [ProviderID], [ClientID], [ClientsAutoID], [Date], [StatusID]) VALUES (13, 3, 13, 13, CAST(N'2021-04-13T18:03:00.000' AS DateTime), 2)
INSERT [dbo].[MainInfo] ([ID], [ProviderID], [ClientID], [ClientsAutoID], [Date], [StatusID]) VALUES (14, 4, 14, 14, CAST(N'2021-04-13T18:03:00.000' AS DateTime), 2)
INSERT [dbo].[MainInfo] ([ID], [ProviderID], [ClientID], [ClientsAutoID], [Date], [StatusID]) VALUES (15, 5, 15, 15, CAST(N'2021-04-13T18:03:00.000' AS DateTime), 2)
INSERT [dbo].[MainInfo] ([ID], [ProviderID], [ClientID], [ClientsAutoID], [Date], [StatusID]) VALUES (16, 1, 16, 16, CAST(N'2021-04-13T18:03:00.000' AS DateTime), 2)
INSERT [dbo].[MainInfo] ([ID], [ProviderID], [ClientID], [ClientsAutoID], [Date], [StatusID]) VALUES (17, 2, 17, 17, CAST(N'2021-04-13T18:03:00.000' AS DateTime), 2)
INSERT [dbo].[MainInfo] ([ID], [ProviderID], [ClientID], [ClientsAutoID], [Date], [StatusID]) VALUES (18, 3, 18, 18, CAST(N'2021-04-13T18:03:00.000' AS DateTime), 2)
INSERT [dbo].[MainInfo] ([ID], [ProviderID], [ClientID], [ClientsAutoID], [Date], [StatusID]) VALUES (19, 4, 19, 19, CAST(N'2021-04-13T18:03:00.000' AS DateTime), 2)
INSERT [dbo].[MainInfo] ([ID], [ProviderID], [ClientID], [ClientsAutoID], [Date], [StatusID]) VALUES (20, 5, 20, 20, CAST(N'2021-04-13T18:03:00.000' AS DateTime), 2)
INSERT [dbo].[MainInfo] ([ID], [ProviderID], [ClientID], [ClientsAutoID], [Date], [StatusID]) VALUES (21, 1, 21, 21, CAST(N'2021-04-13T18:03:00.000' AS DateTime), 2)
INSERT [dbo].[MainInfo] ([ID], [ProviderID], [ClientID], [ClientsAutoID], [Date], [StatusID]) VALUES (22, 2, 22, 22, CAST(N'2021-04-13T18:03:00.000' AS DateTime), 2)
INSERT [dbo].[MainInfo] ([ID], [ProviderID], [ClientID], [ClientsAutoID], [Date], [StatusID]) VALUES (23, 3, 23, 23, CAST(N'2021-04-11T16:00:00.000' AS DateTime), 1)
INSERT [dbo].[MainInfo] ([ID], [ProviderID], [ClientID], [ClientsAutoID], [Date], [StatusID]) VALUES (24, 4, 24, 24, CAST(N'2021-04-13T18:03:00.000' AS DateTime), 2)
INSERT [dbo].[MainInfo] ([ID], [ProviderID], [ClientID], [ClientsAutoID], [Date], [StatusID]) VALUES (25, 5, 25, 25, CAST(N'2021-04-13T18:03:00.000' AS DateTime), 2)
INSERT [dbo].[MainInfo] ([ID], [ProviderID], [ClientID], [ClientsAutoID], [Date], [StatusID]) VALUES (26, 1, 26, 26, CAST(N'2021-04-13T18:03:00.000' AS DateTime), 2)
INSERT [dbo].[MainInfo] ([ID], [ProviderID], [ClientID], [ClientsAutoID], [Date], [StatusID]) VALUES (27, 2, 27, 27, CAST(N'2021-04-13T18:03:00.000' AS DateTime), 2)
INSERT [dbo].[MainInfo] ([ID], [ProviderID], [ClientID], [ClientsAutoID], [Date], [StatusID]) VALUES (28, 3, 28, 28, CAST(N'2021-04-13T18:03:00.000' AS DateTime), 2)
INSERT [dbo].[MainInfo] ([ID], [ProviderID], [ClientID], [ClientsAutoID], [Date], [StatusID]) VALUES (29, 4, 29, 29, CAST(N'2021-04-13T18:03:00.000' AS DateTime), 2)
INSERT [dbo].[MainInfo] ([ID], [ProviderID], [ClientID], [ClientsAutoID], [Date], [StatusID]) VALUES (30, 5, 30, 30, CAST(N'2021-04-13T18:03:00.000' AS DateTime), 2)
INSERT [dbo].[MainInfo] ([ID], [ProviderID], [ClientID], [ClientsAutoID], [Date], [StatusID]) VALUES (31, 1, 31, 31, CAST(N'2021-04-13T18:03:00.000' AS DateTime), 2)
INSERT [dbo].[MainInfo] ([ID], [ProviderID], [ClientID], [ClientsAutoID], [Date], [StatusID]) VALUES (32, 2, 32, 32, CAST(N'2021-04-13T18:03:00.000' AS DateTime), 2)
INSERT [dbo].[MainInfo] ([ID], [ProviderID], [ClientID], [ClientsAutoID], [Date], [StatusID]) VALUES (33, 3, 33, 33, CAST(N'2021-04-13T18:03:00.000' AS DateTime), 2)
INSERT [dbo].[MainInfo] ([ID], [ProviderID], [ClientID], [ClientsAutoID], [Date], [StatusID]) VALUES (34, 4, 34, 34, CAST(N'2021-04-13T18:03:00.000' AS DateTime), 2)
INSERT [dbo].[MainInfo] ([ID], [ProviderID], [ClientID], [ClientsAutoID], [Date], [StatusID]) VALUES (35, 5, 35, 35, CAST(N'2021-04-11T16:00:00.000' AS DateTime), 1)
INSERT [dbo].[MainInfo] ([ID], [ProviderID], [ClientID], [ClientsAutoID], [Date], [StatusID]) VALUES (36, 1, 36, 36, CAST(N'2021-04-13T18:03:00.000' AS DateTime), 2)
INSERT [dbo].[MainInfo] ([ID], [ProviderID], [ClientID], [ClientsAutoID], [Date], [StatusID]) VALUES (37, 2, 37, 37, CAST(N'2021-04-13T18:03:00.000' AS DateTime), 2)
INSERT [dbo].[MainInfo] ([ID], [ProviderID], [ClientID], [ClientsAutoID], [Date], [StatusID]) VALUES (38, 3, 38, 38, CAST(N'2021-04-13T18:03:00.000' AS DateTime), 2)
INSERT [dbo].[MainInfo] ([ID], [ProviderID], [ClientID], [ClientsAutoID], [Date], [StatusID]) VALUES (39, 4, 39, 39, CAST(N'2021-04-13T18:03:00.000' AS DateTime), 2)
INSERT [dbo].[MainInfo] ([ID], [ProviderID], [ClientID], [ClientsAutoID], [Date], [StatusID]) VALUES (40, 5, 40, 40, CAST(N'2021-04-13T18:03:00.000' AS DateTime), 2)
INSERT [dbo].[MainInfo] ([ID], [ProviderID], [ClientID], [ClientsAutoID], [Date], [StatusID]) VALUES (41, 1, 41, 41, CAST(N'2021-04-13T18:03:00.000' AS DateTime), 2)
INSERT [dbo].[MainInfo] ([ID], [ProviderID], [ClientID], [ClientsAutoID], [Date], [StatusID]) VALUES (42, 2, 42, 42, CAST(N'2021-04-13T18:03:00.000' AS DateTime), 2)
INSERT [dbo].[MainInfo] ([ID], [ProviderID], [ClientID], [ClientsAutoID], [Date], [StatusID]) VALUES (43, 3, 43, 43, CAST(N'2021-04-13T18:03:00.000' AS DateTime), 2)
INSERT [dbo].[MainInfo] ([ID], [ProviderID], [ClientID], [ClientsAutoID], [Date], [StatusID]) VALUES (44, 4, 44, 44, CAST(N'2021-04-13T18:03:00.000' AS DateTime), 2)
INSERT [dbo].[MainInfo] ([ID], [ProviderID], [ClientID], [ClientsAutoID], [Date], [StatusID]) VALUES (45, 5, 45, 45, CAST(N'2021-04-13T18:03:00.000' AS DateTime), 2)
INSERT [dbo].[MainInfo] ([ID], [ProviderID], [ClientID], [ClientsAutoID], [Date], [StatusID]) VALUES (46, 1, 46, 46, CAST(N'2021-04-11T18:00:00.000' AS DateTime), 1)
INSERT [dbo].[MainInfo] ([ID], [ProviderID], [ClientID], [ClientsAutoID], [Date], [StatusID]) VALUES (47, 2, 47, 47, CAST(N'2021-04-13T18:03:00.000' AS DateTime), 2)
INSERT [dbo].[MainInfo] ([ID], [ProviderID], [ClientID], [ClientsAutoID], [Date], [StatusID]) VALUES (48, 3, 48, 48, CAST(N'2021-04-13T18:03:00.000' AS DateTime), 2)
INSERT [dbo].[MainInfo] ([ID], [ProviderID], [ClientID], [ClientsAutoID], [Date], [StatusID]) VALUES (49, 4, 49, 49, CAST(N'2021-04-13T18:03:00.000' AS DateTime), 2)
INSERT [dbo].[MainInfo] ([ID], [ProviderID], [ClientID], [ClientsAutoID], [Date], [StatusID]) VALUES (50, 5, 50, 50, CAST(N'2021-04-13T18:03:00.000' AS DateTime), 2)
INSERT [dbo].[MainInfo] ([ID], [ProviderID], [ClientID], [ClientsAutoID], [Date], [StatusID]) VALUES (51, 1, 51, 51, CAST(N'2021-04-13T18:03:00.000' AS DateTime), 2)
INSERT [dbo].[MainInfo] ([ID], [ProviderID], [ClientID], [ClientsAutoID], [Date], [StatusID]) VALUES (52, 2, 52, 52, CAST(N'2021-04-13T18:03:00.000' AS DateTime), 2)
INSERT [dbo].[MainInfo] ([ID], [ProviderID], [ClientID], [ClientsAutoID], [Date], [StatusID]) VALUES (53, 3, 53, 53, CAST(N'2021-04-13T18:03:00.000' AS DateTime), 2)
INSERT [dbo].[MainInfo] ([ID], [ProviderID], [ClientID], [ClientsAutoID], [Date], [StatusID]) VALUES (54, 4, 54, 54, CAST(N'2021-04-13T18:03:00.000' AS DateTime), 2)
INSERT [dbo].[MainInfo] ([ID], [ProviderID], [ClientID], [ClientsAutoID], [Date], [StatusID]) VALUES (55, 5, 55, 55, CAST(N'2021-04-13T18:03:00.000' AS DateTime), 2)
INSERT [dbo].[MainInfo] ([ID], [ProviderID], [ClientID], [ClientsAutoID], [Date], [StatusID]) VALUES (56, 1, 56, 56, CAST(N'2021-04-13T18:03:00.000' AS DateTime), 2)
INSERT [dbo].[MainInfo] ([ID], [ProviderID], [ClientID], [ClientsAutoID], [Date], [StatusID]) VALUES (57, 2, 57, 57, CAST(N'2021-04-13T18:03:00.000' AS DateTime), 2)
INSERT [dbo].[MainInfo] ([ID], [ProviderID], [ClientID], [ClientsAutoID], [Date], [StatusID]) VALUES (58, 3, 58, 58, CAST(N'2021-04-13T18:03:00.000' AS DateTime), 2)
INSERT [dbo].[MainInfo] ([ID], [ProviderID], [ClientID], [ClientsAutoID], [Date], [StatusID]) VALUES (59, 4, 59, 59, CAST(N'2021-04-13T18:03:00.000' AS DateTime), 2)
SET IDENTITY_INSERT [dbo].[MainInfo] OFF
GO
INSERT [dbo].[PriceList] ([ID], [Name], [Price], [PriceType], [Service], [ServiceID]) VALUES (1, N'Первичный осмотр', 500, 0, N'Подготовка', 1)
INSERT [dbo].[PriceList] ([ID], [Name], [Price], [PriceType], [Service], [ServiceID]) VALUES (2, N'Масло в АКПП частичная замена с фильтром', 1200, 0, N'Эксплуатационные жидкости, расходные части и ремни, регулировочные работы', 2)
INSERT [dbo].[PriceList] ([ID], [Name], [Price], [PriceType], [Service], [ServiceID]) VALUES (3, N'Масло в АКПП частичная замена без замены фильтра', 800, 0, N'Эксплуатационные жидкости, расходные части и ремни, регулировочные работы', 2)
INSERT [dbo].[PriceList] ([ID], [Name], [Price], [PriceType], [Service], [ServiceID]) VALUES (4, N'Масло в ГУР замена', 600, 0, N'Эксплуатационные жидкости, расходные части и ремни, регулировочные работы', 2)
INSERT [dbo].[PriceList] ([ID], [Name], [Price], [PriceType], [Service], [ServiceID]) VALUES (5, N'Масло в МКПП замена', 400, 0, N'Эксплуатационные жидкости, расходные части и ремни, регулировочные работы', 2)
INSERT [dbo].[PriceList] ([ID], [Name], [Price], [PriceType], [Service], [ServiceID]) VALUES (6, N'Масло ДВС замена', 500, 0, N'Эксплуатационные жидкости, расходные части и ремни, регулировочные работы', 2)
INSERT [dbo].[PriceList] ([ID], [Name], [Price], [PriceType], [Service], [ServiceID]) VALUES (7, N'Охлаждающая жидкость замена', 600, 0, N'Эксплуатационные жидкости, расходные части и ремни, регулировочные работы', 2)
INSERT [dbo].[PriceList] ([ID], [Name], [Price], [PriceType], [Service], [ServiceID]) VALUES (8, N'Приводной ремень замена', 300, 1, N'Эксплуатационные жидкости, расходные части и ремни, регулировочные работы', 2)
INSERT [dbo].[PriceList] ([ID], [Name], [Price], [PriceType], [Service], [ServiceID]) VALUES (9, N'Промывка инжектора с заменой свечей (без промывочной жидкости)', 1200, 0, N'Эксплуатационные жидкости, расходные части и ремни, регулировочные работы', 2)
INSERT [dbo].[PriceList] ([ID], [Name], [Price], [PriceType], [Service], [ServiceID]) VALUES (10, N'Проверка углов установки колес', 600, 0, N'Эксплуатационные жидкости, расходные части и ремни, регулировочные работы', 2)
INSERT [dbo].[PriceList] ([ID], [Name], [Price], [PriceType], [Service], [ServiceID]) VALUES (11, N'Регулировка углов установки колес 3D передняя ось', 1000, 0, N'Эксплуатационные жидкости, расходные части и ремни, регулировочные работы', 2)
INSERT [dbo].[PriceList] ([ID], [Name], [Price], [PriceType], [Service], [ServiceID]) VALUES (12, N'Регулировка углов установки колес 3D 2 оси', 1500, 0, N'Эксплуатационные жидкости, расходные части и ремни, регулировочные работы', 2)
INSERT [dbo].[PriceList] ([ID], [Name], [Price], [PriceType], [Service], [ServiceID]) VALUES (13, N'Регулировка клапанов ', 1000, 1, N'Эксплуатационные жидкости, расходные части и ремни, регулировочные работы', 2)
INSERT [dbo].[PriceList] ([ID], [Name], [Price], [PriceType], [Service], [ServiceID]) VALUES (14, N'Ремень ГРМ замена', 1300, 1, N'Эксплуатационные жидкости, расходные части и ремни, регулировочные работы', 2)
INSERT [dbo].[PriceList] ([ID], [Name], [Price], [PriceType], [Service], [ServiceID]) VALUES (15, N'Свечи зажигания замена', 300, 0, N'Эксплуатационные жидкости, расходные части и ремни, регулировочные работы', 2)
INSERT [dbo].[PriceList] ([ID], [Name], [Price], [PriceType], [Service], [ServiceID]) VALUES (16, N'Тормозная жидкость замена', 600, 0, N'Эксплуатационные жидкости, расходные части и ремни, регулировочные работы', 2)
INSERT [dbo].[PriceList] ([ID], [Name], [Price], [PriceType], [Service], [ServiceID]) VALUES (17, N'Фильт топливный погружной замена', 800, 0, N'Эксплуатационные жидкости, расходные части и ремни, регулировочные работы', 2)
INSERT [dbo].[PriceList] ([ID], [Name], [Price], [PriceType], [Service], [ServiceID]) VALUES (18, N'Фильтр воздушный замена', 200, 0, N'Эксплуатационные жидкости, расходные части и ремни, регулировочные работы', 2)
INSERT [dbo].[PriceList] ([ID], [Name], [Price], [PriceType], [Service], [ServiceID]) VALUES (19, N'Фильтр салона замена', 300, 0, N'Эксплуатационные жидкости, расходные части и ремни, регулировочные работы', 2)
INSERT [dbo].[PriceList] ([ID], [Name], [Price], [PriceType], [Service], [ServiceID]) VALUES (20, N'Фильтр топливный проточный замена', 300, 0, N'Эксплуатационные жидкости, расходные части и ремни, регулировочные работы', 2)
INSERT [dbo].[PriceList] ([ID], [Name], [Price], [PriceType], [Service], [ServiceID]) VALUES (21, N'Термостат замена', 1000, 1, N'Система охлаждения двигателя', 3)
INSERT [dbo].[PriceList] ([ID], [Name], [Price], [PriceType], [Service], [ServiceID]) VALUES (22, N'Водяной насос замена', 1200, 1, N'Система охлаждения двигателя', 3)
INSERT [dbo].[PriceList] ([ID], [Name], [Price], [PriceType], [Service], [ServiceID]) VALUES (23, N'Радиатор системы охлаждения чистка/мойка', 1500, 1, N'Система охлаждения двигателя', 3)
INSERT [dbo].[PriceList] ([ID], [Name], [Price], [PriceType], [Service], [ServiceID]) VALUES (24, N'Радиатор системы охлаждения замена', 800, 1, N'Система охлаждения двигателя', 3)
INSERT [dbo].[PriceList] ([ID], [Name], [Price], [PriceType], [Service], [ServiceID]) VALUES (25, N'Антибактериальная обработка системы кондиционирования', 1200, 0, N'Климатическая система', 4)
INSERT [dbo].[PriceList] ([ID], [Name], [Price], [PriceType], [Service], [ServiceID]) VALUES (26, N'Кондиционер заправка (без стоимости хладагента) + (100 гр фреона 100 руб)', 1200, 0, N'Климатическая система', 4)
INSERT [dbo].[PriceList] ([ID], [Name], [Price], [PriceType], [Service], [ServiceID]) VALUES (27, N'Обслуживание тормозных механизмов', 300, 0, N'Тормозная система', 5)
INSERT [dbo].[PriceList] ([ID], [Name], [Price], [PriceType], [Service], [ServiceID]) VALUES (28, N'Барабаны тормозные замена', 600, 0, N'Тормозная система', 5)
INSERT [dbo].[PriceList] ([ID], [Name], [Price], [PriceType], [Service], [ServiceID]) VALUES (29, N'Цилиндр тормозной задний (1 шт) замена', 600, 0, N'Тормозная система', 5)
INSERT [dbo].[PriceList] ([ID], [Name], [Price], [PriceType], [Service], [ServiceID]) VALUES (30, N'Цилиндр тормозной передний (1 шт) замена', 600, 0, N'Тормозная система', 5)
INSERT [dbo].[PriceList] ([ID], [Name], [Price], [PriceType], [Service], [ServiceID]) VALUES (31, N'Тормозные колодки дисковые передние замена', 700, 0, N'Тормозная система', 5)
INSERT [dbo].[PriceList] ([ID], [Name], [Price], [PriceType], [Service], [ServiceID]) VALUES (32, N'Тормозные колодки дисковые задние замена', 700, 0, N'Тормозная система', 5)
INSERT [dbo].[PriceList] ([ID], [Name], [Price], [PriceType], [Service], [ServiceID]) VALUES (33, N'Тормозные колодки барабанные замена', 1100, 0, N'Тормозная система', 5)
INSERT [dbo].[PriceList] ([ID], [Name], [Price], [PriceType], [Service], [ServiceID]) VALUES (34, N'Тормозные диски передние замена', 1200, 0, N'Тормозная система', 5)
INSERT [dbo].[PriceList] ([ID], [Name], [Price], [PriceType], [Service], [ServiceID]) VALUES (35, N'Тормозные диски задние замена', 1200, 0, N'Тормозная система', 5)
INSERT [dbo].[PriceList] ([ID], [Name], [Price], [PriceType], [Service], [ServiceID]) VALUES (36, N'Рулевая тяга (1 шт) замена', 400, 0, N'Рулевое управление', 6)
INSERT [dbo].[PriceList] ([ID], [Name], [Price], [PriceType], [Service], [ServiceID]) VALUES (37, N'Рулевой наконечник (1 шт) замена', 300, 0, N'Рулевое управление', 6)
INSERT [dbo].[PriceList] ([ID], [Name], [Price], [PriceType], [Service], [ServiceID]) VALUES (38, N'Рулевой механизм замена', 1500, 1, N'Рулевое управление', 6)
INSERT [dbo].[PriceList] ([ID], [Name], [Price], [PriceType], [Service], [ServiceID]) VALUES (39, N'Глушитель основной замена', 500, 0, N'Выхлопная система', 7)
INSERT [dbo].[PriceList] ([ID], [Name], [Price], [PriceType], [Service], [ServiceID]) VALUES (40, N'Гофра дополнительного глушителя замена ', 1800, 1, N'Выхлопная система', 7)
INSERT [dbo].[PriceList] ([ID], [Name], [Price], [PriceType], [Service], [ServiceID]) VALUES (41, N'Приемная труба/катколлектор', 800, 1, N'Выхлопная система', 7)
INSERT [dbo].[PriceList] ([ID], [Name], [Price], [PriceType], [Service], [ServiceID]) VALUES (42, N'Амортизатор задний замена', 500, 1, N'Подвеска автомобиля', 8)
INSERT [dbo].[PriceList] ([ID], [Name], [Price], [PriceType], [Service], [ServiceID]) VALUES (43, N'Амортизатор передний замена', 1000, 1, N'Подвеска автомобиля', 8)
INSERT [dbo].[PriceList] ([ID], [Name], [Price], [PriceType], [Service], [ServiceID]) VALUES (44, N'Верхний рычаг передней подвески замена', 1000, 1, N'Подвеска автомобиля', 8)
INSERT [dbo].[PriceList] ([ID], [Name], [Price], [PriceType], [Service], [ServiceID]) VALUES (45, N'Верхняя опора амортизатора', 1000, 1, N'Подвеска автомобиля', 8)
INSERT [dbo].[PriceList] ([ID], [Name], [Price], [PriceType], [Service], [ServiceID]) VALUES (46, N'Втулки стабилизатора (перед) замена', 400, 1, N'Подвеска автомобиля', 8)
INSERT [dbo].[PriceList] ([ID], [Name], [Price], [PriceType], [Service], [ServiceID]) VALUES (47, N'Нижний рычаг передней подвески ', 1000, 1, N'Подвеска автомобиля', 8)
INSERT [dbo].[PriceList] ([ID], [Name], [Price], [PriceType], [Service], [ServiceID]) VALUES (48, N'Стойка стабилизатора передняя (2 шт)', 600, 0, N'Подвеска автомобиля', 8)
INSERT [dbo].[PriceList] ([ID], [Name], [Price], [PriceType], [Service], [ServiceID]) VALUES (49, N'Шаровая опора замена', 300, 1, N'Подвеска автомобиля', 8)
INSERT [dbo].[PriceList] ([ID], [Name], [Price], [PriceType], [Service], [ServiceID]) VALUES (50, N'АКПП снятие/установка', 3000, 1, N'Трансмиссия', 9)
INSERT [dbo].[PriceList] ([ID], [Name], [Price], [PriceType], [Service], [ServiceID]) VALUES (51, N'Вал приводной в сборе замена', 800, 1, N'Трансмиссия', 9)
INSERT [dbo].[PriceList] ([ID], [Name], [Price], [PriceType], [Service], [ServiceID]) VALUES (52, N'Замена внтур./наружнего шруса/чехла приводного вала', 1000, 1, N'Трансмиссия', 9)
INSERT [dbo].[PriceList] ([ID], [Name], [Price], [PriceType], [Service], [ServiceID]) VALUES (53, N'МКПП снятие/установка', 2500, 1, N'Трансмиссия', 9)
INSERT [dbo].[PriceList] ([ID], [Name], [Price], [PriceType], [Service], [ServiceID]) VALUES (54, N'Подшипник задней ступицы замена', 800, 1, N'Трансмиссия', 9)
INSERT [dbo].[PriceList] ([ID], [Name], [Price], [PriceType], [Service], [ServiceID]) VALUES (55, N'Подшипник передней ступицы замена', 1000, 1, N'Трансмиссия', 9)
INSERT [dbo].[PriceList] ([ID], [Name], [Price], [PriceType], [Service], [ServiceID]) VALUES (56, N'Ремонт АКПП', 10000, 1, N'Трансмиссия', 9)
INSERT [dbo].[PriceList] ([ID], [Name], [Price], [PriceType], [Service], [ServiceID]) VALUES (57, N'Ремонт МКПП', 3000, 1, N'Трансмиссия', 9)
INSERT [dbo].[PriceList] ([ID], [Name], [Price], [PriceType], [Service], [ServiceID]) VALUES (58, N'Ступица колеса замена', 1000, 1, N'Трансмиссия', 9)
INSERT [dbo].[PriceList] ([ID], [Name], [Price], [PriceType], [Service], [ServiceID]) VALUES (59, N'Сцепление к-кт замена', 2900, 1, N'Трансмиссия', 9)
INSERT [dbo].[PriceList] ([ID], [Name], [Price], [PriceType], [Service], [ServiceID]) VALUES (60, N'Компьютерная диагностика двигателя, сброс ошибок', 600, 0, N'Электрооборудование/Диагностика', 10)
INSERT [dbo].[PriceList] ([ID], [Name], [Price], [PriceType], [Service], [ServiceID]) VALUES (61, N'Автомагнитола установка', 500, 0, N'Электрооборудование/Диагностика', 10)
INSERT [dbo].[PriceList] ([ID], [Name], [Price], [PriceType], [Service], [ServiceID]) VALUES (62, N'Аккустическая система перед. установка', 800, 0, N'Электрооборудование/Диагностика', 10)
INSERT [dbo].[PriceList] ([ID], [Name], [Price], [PriceType], [Service], [ServiceID]) VALUES (63, N'Аккустическая система перед/зад установка', 1400, 0, N'Электрооборудование/Диагностика', 10)
INSERT [dbo].[PriceList] ([ID], [Name], [Price], [PriceType], [Service], [ServiceID]) VALUES (64, N'Генератор замена', 600, 1, N'Электрооборудование/Диагностика', 10)
INSERT [dbo].[PriceList] ([ID], [Name], [Price], [PriceType], [Service], [ServiceID]) VALUES (65, N'Замена предохранителя', 100, 0, N'Электрооборудование/Диагностика', 10)
INSERT [dbo].[PriceList] ([ID], [Name], [Price], [PriceType], [Service], [ServiceID]) VALUES (66, N'Звуковой сигнал замена', 300, 1, N'Электрооборудование/Диагностика', 10)
INSERT [dbo].[PriceList] ([ID], [Name], [Price], [PriceType], [Service], [ServiceID]) VALUES (67, N'Лампа наружнего освещения', 100, 1, N'Электрооборудование/Диагностика', 10)
INSERT [dbo].[PriceList] ([ID], [Name], [Price], [PriceType], [Service], [ServiceID]) VALUES (68, N'Мотор отопителя замена', 500, 1, N'Электрооборудование/Диагностика', 10)
INSERT [dbo].[PriceList] ([ID], [Name], [Price], [PriceType], [Service], [ServiceID]) VALUES (69, N'Насос омывателя замена', 300, 1, N'Электрооборудование/Диагностика', 10)
INSERT [dbo].[PriceList] ([ID], [Name], [Price], [PriceType], [Service], [ServiceID]) VALUES (70, N'Поиск неисправности электрооборудования ', 400, 1, N'Электрооборудование/Диагностика', 10)
INSERT [dbo].[PriceList] ([ID], [Name], [Price], [PriceType], [Service], [ServiceID]) VALUES (71, N'Стартер замена', 600, 1, N'Электрооборудование/Диагностика', 10)
INSERT [dbo].[PriceList] ([ID], [Name], [Price], [PriceType], [Service], [ServiceID]) VALUES (72, N'Замена фары/зад фонаря', 400, 1, N'Кузов автомобиля', 11)
INSERT [dbo].[PriceList] ([ID], [Name], [Price], [PriceType], [Service], [ServiceID]) VALUES (73, N'Обивка двери снятие/установка', 300, 0, N'Кузов автомобиля', 11)
INSERT [dbo].[PriceList] ([ID], [Name], [Price], [PriceType], [Service], [ServiceID]) VALUES (74, N'Прицепное устройство установка', 3000, 0, N'Кузов автомобиля', 11)
INSERT [dbo].[PriceList] ([ID], [Name], [Price], [PriceType], [Service], [ServiceID]) VALUES (75, N'Стекло вклейка (без материалов)', 2500, 0, N'Кузов автомобиля', 11)
INSERT [dbo].[PriceList] ([ID], [Name], [Price], [PriceType], [Service], [ServiceID]) VALUES (76, N'Стекло с уплотнителем замена', 1000, 0, N'Кузов автомобиля', 11)
INSERT [dbo].[PriceList] ([ID], [Name], [Price], [PriceType], [Service], [ServiceID]) VALUES (77, N'Стекло фары замена', 1000, 1, N'Кузов автомобиля', 11)
INSERT [dbo].[PriceList] ([ID], [Name], [Price], [PriceType], [Service], [ServiceID]) VALUES (78, N'Балансировка (4 шт) со снятием/установкой', 500, 0, N'Шиномонтаж. Сезонное хранение', 12)
INSERT [dbo].[PriceList] ([ID], [Name], [Price], [PriceType], [Service], [ServiceID]) VALUES (79, N'Замена шин с балансировкой (4 шт) R 13,14', 1000, 0, N'Шиномонтаж. Сезонное хранение', 12)
INSERT [dbo].[PriceList] ([ID], [Name], [Price], [PriceType], [Service], [ServiceID]) VALUES (80, N'Замена шин с балансировкой (4 шт) R 15,16', 1300, 0, N'Шиномонтаж. Сезонное хранение', 12)
INSERT [dbo].[PriceList] ([ID], [Name], [Price], [PriceType], [Service], [ServiceID]) VALUES (81, N'Замена шин с балансировкой (4 шт) R 17,18', 1600, 0, N'Шиномонтаж. Сезонное хранение', 12)
INSERT [dbo].[PriceList] ([ID], [Name], [Price], [PriceType], [Service], [ServiceID]) VALUES (82, N'Замена шин с балансировкой (4 шт) R 19,20', 1900, 0, N'Шиномонтаж. Сезонное хранение', 12)
INSERT [dbo].[PriceList] ([ID], [Name], [Price], [PriceType], [Service], [ServiceID]) VALUES (83, N'Колесо снятие/установка', 50, 0, N'Шиномонтаж. Сезонное хранение', 12)
INSERT [dbo].[PriceList] ([ID], [Name], [Price], [PriceType], [Service], [ServiceID]) VALUES (84, N'Сезонное хранение к-кта шин', 700, 0, N'Шиномонтаж. Сезонное хранение', 12)
INSERT [dbo].[PriceList] ([ID], [Name], [Price], [PriceType], [Service], [ServiceID]) VALUES (85, N'Устранение 1 прокола в бескамерной шине', 150, 0, N'Шиномонтаж. Сезонное хранение', 12)
GO
SET IDENTITY_INSERT [dbo].[Provider] ON 

INSERT [dbo].[Provider] ([ID], [LastName], [Name], [MiddleName], [Login], [Password], [Phone]) VALUES (1, N'Щербаков', N'Артём', N'Георгиевич', N'Orinika', N'l[O-7MD3', N'7(495)429-6151')
INSERT [dbo].[Provider] ([ID], [LastName], [Name], [MiddleName], [Login], [Password], [Phone]) VALUES (2, N'Молчанова', N'Ясмина', N'Давидовна', N'Poran', N'Glw0V}\-', N'7(495)459-4003')
INSERT [dbo].[Provider] ([ID], [LastName], [Name], [MiddleName], [Login], [Password], [Phone]) VALUES (3, N'Кулагина', N'Полина', N'Константиновна', N'Ganylan', N'-lo7|pzI', N'7(495)145-5782')
INSERT [dbo].[Provider] ([ID], [LastName], [Name], [MiddleName], [Login], [Password], [Phone]) VALUES (4, N'Крюков', N'Максим', N'Егорович', N'Xandolo', N'Z-=0aqL{', N'7(495)946-9449')
INSERT [dbo].[Provider] ([ID], [LastName], [Name], [MiddleName], [Login], [Password], [Phone]) VALUES (5, N'Морозов', N'Тимофей', N'Дмитриевич', N'Onasiah', N'*>O1lNm_', N'7(495)795-8460')
SET IDENTITY_INSERT [dbo].[Provider] OFF
GO
SET IDENTITY_INSERT [dbo].[Services] ON 

INSERT [dbo].[Services] ([ID], [Name]) VALUES (1, N'Подготовка')
INSERT [dbo].[Services] ([ID], [Name]) VALUES (2, N'Эксплуатационные жидкости, расходные части и ремни, регулировочные работы')
INSERT [dbo].[Services] ([ID], [Name]) VALUES (3, N'Система охлаждения двигателя')
INSERT [dbo].[Services] ([ID], [Name]) VALUES (4, N'Климатическая система')
INSERT [dbo].[Services] ([ID], [Name]) VALUES (5, N'Тормозная система')
INSERT [dbo].[Services] ([ID], [Name]) VALUES (6, N'Рулевое управление')
INSERT [dbo].[Services] ([ID], [Name]) VALUES (7, N'Выхлопная система')
INSERT [dbo].[Services] ([ID], [Name]) VALUES (8, N'Подвеска автомобиля')
INSERT [dbo].[Services] ([ID], [Name]) VALUES (9, N'Трансмиссия')
INSERT [dbo].[Services] ([ID], [Name]) VALUES (10, N'Электрооборудование/Диагностика')
INSERT [dbo].[Services] ([ID], [Name]) VALUES (11, N'Кузов автомобиля')
INSERT [dbo].[Services] ([ID], [Name]) VALUES (12, N'Шиномонтаж. Сезонное хранение')
SET IDENTITY_INSERT [dbo].[Services] OFF
GO
SET IDENTITY_INSERT [dbo].[Status] ON 

INSERT [dbo].[Status] ([ID], [Status]) VALUES (1, N'Выполнено ')
INSERT [dbo].[Status] ([ID], [Status]) VALUES (2, N'Запланировано')
INSERT [dbo].[Status] ([ID], [Status]) VALUES (3, N'Принята к исполнению')
SET IDENTITY_INSERT [dbo].[Status] OFF
GO
SET IDENTITY_INSERT [dbo].[Venders] ON 

INSERT [dbo].[Venders] ([ID], [Name]) VALUES (1, N'Acura')
INSERT [dbo].[Venders] ([ID], [Name]) VALUES (2, N'Alfa Romeo')
INSERT [dbo].[Venders] ([ID], [Name]) VALUES (3, N'Aston Martin')
INSERT [dbo].[Venders] ([ID], [Name]) VALUES (4, N'Audi')
INSERT [dbo].[Venders] ([ID], [Name]) VALUES (5, N'Bentley')
INSERT [dbo].[Venders] ([ID], [Name]) VALUES (6, N'BMW')
INSERT [dbo].[Venders] ([ID], [Name]) VALUES (7, N'Brilliance')
INSERT [dbo].[Venders] ([ID], [Name]) VALUES (8, N'Bugatti')
INSERT [dbo].[Venders] ([ID], [Name]) VALUES (9, N'Buick')
INSERT [dbo].[Venders] ([ID], [Name]) VALUES (10, N'BYD')
INSERT [dbo].[Venders] ([ID], [Name]) VALUES (11, N'Cadillac')
INSERT [dbo].[Venders] ([ID], [Name]) VALUES (12, N'Changan')
INSERT [dbo].[Venders] ([ID], [Name]) VALUES (13, N'Chery')
INSERT [dbo].[Venders] ([ID], [Name]) VALUES (14, N'Chevrolet')
INSERT [dbo].[Venders] ([ID], [Name]) VALUES (15, N'Chrysler')
INSERT [dbo].[Venders] ([ID], [Name]) VALUES (16, N'Citroen')
INSERT [dbo].[Venders] ([ID], [Name]) VALUES (17, N'Daewoo')
INSERT [dbo].[Venders] ([ID], [Name]) VALUES (18, N'Daihatsu')
INSERT [dbo].[Venders] ([ID], [Name]) VALUES (19, N'Datsun')
INSERT [dbo].[Venders] ([ID], [Name]) VALUES (20, N'Dodge')
INSERT [dbo].[Venders] ([ID], [Name]) VALUES (21, N'Dongfeng')
INSERT [dbo].[Venders] ([ID], [Name]) VALUES (22, N'FAW')
INSERT [dbo].[Venders] ([ID], [Name]) VALUES (23, N'Ferrari')
INSERT [dbo].[Venders] ([ID], [Name]) VALUES (24, N'Fiat')
INSERT [dbo].[Venders] ([ID], [Name]) VALUES (25, N'Fisker')
INSERT [dbo].[Venders] ([ID], [Name]) VALUES (26, N'Ford')
INSERT [dbo].[Venders] ([ID], [Name]) VALUES (27, N'GAZ')
INSERT [dbo].[Venders] ([ID], [Name]) VALUES (28, N'Geely')
INSERT [dbo].[Venders] ([ID], [Name]) VALUES (29, N'Genesis')
INSERT [dbo].[Venders] ([ID], [Name]) VALUES (30, N'GMC')
INSERT [dbo].[Venders] ([ID], [Name]) VALUES (31, N'Great Wall')
INSERT [dbo].[Venders] ([ID], [Name]) VALUES (32, N'Haval')
INSERT [dbo].[Venders] ([ID], [Name]) VALUES (33, N'Holden')
INSERT [dbo].[Venders] ([ID], [Name]) VALUES (34, N'Honda')
INSERT [dbo].[Venders] ([ID], [Name]) VALUES (35, N'Hummer')
INSERT [dbo].[Venders] ([ID], [Name]) VALUES (36, N'Hyundai')
INSERT [dbo].[Venders] ([ID], [Name]) VALUES (37, N'Infiniti')
INSERT [dbo].[Venders] ([ID], [Name]) VALUES (38, N'Isuzu')
INSERT [dbo].[Venders] ([ID], [Name]) VALUES (39, N'Iveco')
INSERT [dbo].[Venders] ([ID], [Name]) VALUES (40, N'Jaguar')
INSERT [dbo].[Venders] ([ID], [Name]) VALUES (41, N'Jeep')
INSERT [dbo].[Venders] ([ID], [Name]) VALUES (42, N'Kia')
INSERT [dbo].[Venders] ([ID], [Name]) VALUES (43, N'Lamborghini')
INSERT [dbo].[Venders] ([ID], [Name]) VALUES (44, N'Lancia')
INSERT [dbo].[Venders] ([ID], [Name]) VALUES (45, N'Land Rover')
INSERT [dbo].[Venders] ([ID], [Name]) VALUES (46, N'Lexus')
INSERT [dbo].[Venders] ([ID], [Name]) VALUES (47, N'Lifan')
INSERT [dbo].[Venders] ([ID], [Name]) VALUES (48, N'Lincoln')
INSERT [dbo].[Venders] ([ID], [Name]) VALUES (49, N'Lotus')
INSERT [dbo].[Venders] ([ID], [Name]) VALUES (50, N'Marussia')
INSERT [dbo].[Venders] ([ID], [Name]) VALUES (51, N'Maserati')
INSERT [dbo].[Venders] ([ID], [Name]) VALUES (52, N'Maybach')
INSERT [dbo].[Venders] ([ID], [Name]) VALUES (53, N'Mazda')
INSERT [dbo].[Venders] ([ID], [Name]) VALUES (54, N'McLaren')
INSERT [dbo].[Venders] ([ID], [Name]) VALUES (55, N'Mercedes')
INSERT [dbo].[Venders] ([ID], [Name]) VALUES (56, N'Mercury')
INSERT [dbo].[Venders] ([ID], [Name]) VALUES (57, N'MG')
INSERT [dbo].[Venders] ([ID], [Name]) VALUES (58, N'Mini')
INSERT [dbo].[Venders] ([ID], [Name]) VALUES (59, N'Mitsubishi')
INSERT [dbo].[Venders] ([ID], [Name]) VALUES (60, N'Nissan')
INSERT [dbo].[Venders] ([ID], [Name]) VALUES (61, N'Noble')
INSERT [dbo].[Venders] ([ID], [Name]) VALUES (62, N'Opel')
INSERT [dbo].[Venders] ([ID], [Name]) VALUES (63, N'Peugeot')
INSERT [dbo].[Venders] ([ID], [Name]) VALUES (64, N'Plymouth')
INSERT [dbo].[Venders] ([ID], [Name]) VALUES (65, N'Pontiac')
INSERT [dbo].[Venders] ([ID], [Name]) VALUES (66, N'Porsche')
INSERT [dbo].[Venders] ([ID], [Name]) VALUES (67, N'Ravon')
INSERT [dbo].[Venders] ([ID], [Name]) VALUES (68, N'Renault')
INSERT [dbo].[Venders] ([ID], [Name]) VALUES (69, N'RollsRoyce')
INSERT [dbo].[Venders] ([ID], [Name]) VALUES (70, N'Rover')
INSERT [dbo].[Venders] ([ID], [Name]) VALUES (71, N'Saab')
INSERT [dbo].[Venders] ([ID], [Name]) VALUES (72, N'Saturn')
INSERT [dbo].[Venders] ([ID], [Name]) VALUES (73, N'Scion')
INSERT [dbo].[Venders] ([ID], [Name]) VALUES (74, N'Seat')
INSERT [dbo].[Venders] ([ID], [Name]) VALUES (75, N'Skoda')
INSERT [dbo].[Venders] ([ID], [Name]) VALUES (76, N'Smart')
INSERT [dbo].[Venders] ([ID], [Name]) VALUES (77, N'Ssang Yong')
INSERT [dbo].[Venders] ([ID], [Name]) VALUES (78, N'Subaru')
INSERT [dbo].[Venders] ([ID], [Name]) VALUES (79, N'Suzuki')
INSERT [dbo].[Venders] ([ID], [Name]) VALUES (80, N'Tesla')
INSERT [dbo].[Venders] ([ID], [Name]) VALUES (81, N'Toyota')
INSERT [dbo].[Venders] ([ID], [Name]) VALUES (82, N'UAZ')
INSERT [dbo].[Venders] ([ID], [Name]) VALUES (83, N'VAZ')
INSERT [dbo].[Venders] ([ID], [Name]) VALUES (84, N'Volkswagen')
INSERT [dbo].[Venders] ([ID], [Name]) VALUES (85, N'Volvo')
SET IDENTITY_INSERT [dbo].[Venders] OFF
GO
ALTER TABLE [dbo].[AutoModels]  WITH CHECK ADD  CONSTRAINT [FK_AutoModels_Venders] FOREIGN KEY([VenderID])
REFERENCES [dbo].[Venders] ([ID])
GO
ALTER TABLE [dbo].[AutoModels] CHECK CONSTRAINT [FK_AutoModels_Venders]
GO
ALTER TABLE [dbo].[ClientsAuto]  WITH CHECK ADD  CONSTRAINT [FK_ClientsAuto_AutoModels] FOREIGN KEY([AutoModelID])
REFERENCES [dbo].[AutoModels] ([ID])
GO
ALTER TABLE [dbo].[ClientsAuto] CHECK CONSTRAINT [FK_ClientsAuto_AutoModels]
GO
ALTER TABLE [dbo].[DealsInfo]  WITH CHECK ADD  CONSTRAINT [FK_DealsInfo_MainInfo] FOREIGN KEY([MainInfoID])
REFERENCES [dbo].[MainInfo] ([ID])
GO
ALTER TABLE [dbo].[DealsInfo] CHECK CONSTRAINT [FK_DealsInfo_MainInfo]
GO
ALTER TABLE [dbo].[DealsInfo]  WITH CHECK ADD  CONSTRAINT [FK_DealsInfo_PriceList] FOREIGN KEY([ServiceID])
REFERENCES [dbo].[PriceList] ([ID])
GO
ALTER TABLE [dbo].[DealsInfo] CHECK CONSTRAINT [FK_DealsInfo_PriceList]
GO
ALTER TABLE [dbo].[MainInfo]  WITH CHECK ADD  CONSTRAINT [FK_MainInfo_Clients] FOREIGN KEY([ClientID])
REFERENCES [dbo].[Clients] ([ID])
GO
ALTER TABLE [dbo].[MainInfo] CHECK CONSTRAINT [FK_MainInfo_Clients]
GO
ALTER TABLE [dbo].[MainInfo]  WITH CHECK ADD  CONSTRAINT [FK_MainInfo_ClientsAuto] FOREIGN KEY([ClientsAutoID])
REFERENCES [dbo].[ClientsAuto] ([ID])
GO
ALTER TABLE [dbo].[MainInfo] CHECK CONSTRAINT [FK_MainInfo_ClientsAuto]
GO
ALTER TABLE [dbo].[MainInfo]  WITH CHECK ADD  CONSTRAINT [FK_MainInfo_Provider] FOREIGN KEY([ProviderID])
REFERENCES [dbo].[Provider] ([ID])
GO
ALTER TABLE [dbo].[MainInfo] CHECK CONSTRAINT [FK_MainInfo_Provider]
GO
ALTER TABLE [dbo].[MainInfo]  WITH CHECK ADD  CONSTRAINT [FK_MainInfo_Status] FOREIGN KEY([StatusID])
REFERENCES [dbo].[Status] ([ID])
GO
ALTER TABLE [dbo].[MainInfo] CHECK CONSTRAINT [FK_MainInfo_Status]
GO
ALTER TABLE [dbo].[PriceList]  WITH CHECK ADD  CONSTRAINT [FK_PriceList_Services] FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Services] ([ID])
GO
ALTER TABLE [dbo].[PriceList] CHECK CONSTRAINT [FK_PriceList_Services]
GO
ALTER TABLE [dbo].[Src]  WITH CHECK ADD  CONSTRAINT [FK_Src_TypesUsers] FOREIGN KEY([types_users_id])
REFERENCES [dbo].[TypesUsers] ([id])
GO
ALTER TABLE [dbo].[Src] CHECK CONSTRAINT [FK_Src_TypesUsers]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_TypesUsers] FOREIGN KEY([types_users_id])
REFERENCES [dbo].[TypesUsers] ([id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_TypesUsers]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_TypesUsers1] FOREIGN KEY([types_users_id])
REFERENCES [dbo].[TypesUsers] ([id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_TypesUsers1]
GO
/****** Object:  StoredProcedure [dbo].[View_alls]    Script Date: 13.09.2022 11:39:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[View_alls]
AS 
BEGIN
	SET NOCOUNT ON;
	SELECT dbo.Src.id, dbo.Src.types_users_id, CONCAT('../Images/', dbo.Src.Src, '.jpg') as Src, dbo.TypesUsers.Name, dbo.Users.login, dbo.Users.pass, dbo.Users.email
FROM dbo.Src INNER JOIN
		dbo.TypesUsers on dbo.Src.types_users_id = dbo.TypesUsers.id INNER JOIN
		dbo.Users on dbo.TypesUsers.id = dbo.Users.types_users_id
end
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Src"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 119
               Right = 212
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Users"
            Begin Extent = 
               Top = 9
               Left = 269
               Bottom = 139
               Right = 443
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "TypesUsers"
            Begin Extent = 
               Top = 7
               Left = 479
               Bottom = 103
               Right = 653
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_all'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_all'
GO
USE [master]
GO
ALTER DATABASE [195ev] SET  READ_WRITE 
GO
