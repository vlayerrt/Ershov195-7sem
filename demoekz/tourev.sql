USE [master]
GO
/****** Object:  Database [TourAgencyEV]    Script Date: 12/1/2022 5:18:44 PM ******/
CREATE DATABASE [TourAgencyEV]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TourAgencyEV', FILENAME = N'D:\SQL\MSSQL15.MSSQLSERVER\MSSQL\DATA\TourAgencyEV.mdf' , SIZE = 139264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TourAgencyEV_log', FILENAME = N'D:\SQL\MSSQL15.MSSQLSERVER\MSSQL\DATA\TourAgencyEV_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [TourAgencyEV] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TourAgencyEV].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TourAgencyEV] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TourAgencyEV] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TourAgencyEV] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TourAgencyEV] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TourAgencyEV] SET ARITHABORT OFF 
GO
ALTER DATABASE [TourAgencyEV] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TourAgencyEV] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TourAgencyEV] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TourAgencyEV] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TourAgencyEV] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TourAgencyEV] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TourAgencyEV] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TourAgencyEV] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TourAgencyEV] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TourAgencyEV] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TourAgencyEV] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TourAgencyEV] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TourAgencyEV] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TourAgencyEV] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TourAgencyEV] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TourAgencyEV] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TourAgencyEV] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TourAgencyEV] SET RECOVERY FULL 
GO
ALTER DATABASE [TourAgencyEV] SET  MULTI_USER 
GO
ALTER DATABASE [TourAgencyEV] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TourAgencyEV] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TourAgencyEV] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TourAgencyEV] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TourAgencyEV] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TourAgencyEV] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'TourAgencyEV', N'ON'
GO
ALTER DATABASE [TourAgencyEV] SET QUERY_STORE = OFF
GO
USE [TourAgencyEV]
GO
/****** Object:  Table [dbo].[Countries]    Script Date: 12/1/2022 5:18:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Countries](
	[CountryName] [nvarchar](255) NULL,
	[CountryCode] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Countries] PRIMARY KEY CLUSTERED 
(
	[CountryCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hotels]    Script Date: 12/1/2022 5:18:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hotels](
	[HotelID] [int] IDENTITY(1,1) NOT NULL,
	[HotelName] [nvarchar](255) NULL,
	[Stars] [int] NULL,
	[CountryName] [nvarchar](255) NULL,
	[CountryCode] [nchar](10) NULL,
 CONSTRAINT [PK_Hotels] PRIMARY KEY CLUSTERED 
(
	[HotelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 12/1/2022 5:18:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staff]    Script Date: 12/1/2022 5:18:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staff](
	[UserID] [int] NOT NULL,
	[Photo] [nvarchar](max) NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Surname] [nvarchar](50) NOT NULL,
	[Patronymic] [nvarchar](50) NOT NULL,
	[RoleID] [int] NULL,
 CONSTRAINT [PK_Staff] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tour]    Script Date: 12/1/2022 5:18:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tour](
	[TourID] [int] NOT NULL,
	[TourName] [nvarchar](50) NULL,
	[CountryCode] [nchar](10) NULL,
	[TicketsCount] [int] NULL,
	[Cost] [money] NULL,
	[IsActual] [int] NULL,
	[TourTypeID] [int] NULL,
 CONSTRAINT [PK_Tour] PRIMARY KEY CLUSTERED 
(
	[TourID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TourType]    Script Date: 12/1/2022 5:18:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TourType](
	[TourTypeID] [int] IDENTITY(1,1) NOT NULL,
	[TourType] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TourType] PRIMARY KEY CLUSTERED 
(
	[TourTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 12/1/2022 5:18:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] NOT NULL,
	[login] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[RoleID] [int] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[login] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Andorra', N'AD        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'United Arab Emirates', N'AE        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Afghanistan', N'AF        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Antigua and Barbuda', N'AG        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Anguilla', N'AI        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Albania', N'AL        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Armenia', N'AM        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Netherlands Antilles', N'AN        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Angola', N'AO        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Asia/Pacific Region', N'AP        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Antarctica', N'AQ        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Argentina', N'AR        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'American Samoa', N'AS        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Austria', N'AT        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Australia', N'AU        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Aruba', N'AW        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Azerbaijan', N'AZ        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Bosnia and Herzegovina', N'BA        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Barbados', N'BB        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Bangladesh', N'BD        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Belgium', N'BE        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Burkina Faso', N'BF        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Bulgaria', N'BG        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Bahrain', N'BH        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Burundi', N'BI        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Benin', N'BJ        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Bermuda', N'BM        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Brunei Darussalam', N'BN        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Bolivia', N'BO        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Brazil', N'BR        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Bahamas', N'BS        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Bhutan', N'BT        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Bouvet Island', N'BV        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Botswana', N'BW        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Belarus', N'BY        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Belize', N'BZ        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Canada', N'CA        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Cocos (Keeling) Islands', N'CC        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Congo, The Democratic Republic of the', N'CD        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Central African Republic', N'CF        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Congo', N'CG        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Switzerland', N'CH        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Cote D''Ivoire', N'CI        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Cook Islands', N'CK        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Chile', N'CL        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Cameroon', N'CM        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'China', N'CN        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Colombia', N'CO        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Costa Rica', N'CR        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Serbia and Montenegro', N'CS        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Cuba', N'CU        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Cape Verde', N'CV        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Christmas Island', N'CX        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Cyprus', N'CY        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Czech Republic', N'CZ        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Germany', N'DE        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Djibouti', N'DJ        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Denmark', N'DK        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Dominica', N'DM        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Dominican Republic', N'DO        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Algeria', N'DZ        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Ecuador', N'EC        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Estonia', N'EE        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Egypt', N'EG        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Western Sahara', N'EH        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Eritrea', N'ER        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Spain', N'ES        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Ethiopia', N'ET        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Europe', N'EU        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Finland', N'FI        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Fiji', N'FJ        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Falkland Islands (Malvinas)', N'FK        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Micronesia, Federated States of', N'FM        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Faroe Islands', N'FO        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'France', N'FR        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'France, Metropolitan', N'FX        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Gabon', N'GA        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'United Kingdom', N'GB        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Grenada', N'GD        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Georgia', N'GE        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'French Guiana', N'GF        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Ghana', N'GH        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Gibraltar', N'GI        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Greenland', N'GL        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Gambia', N'GM        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Guinea', N'GN        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Guadeloupe', N'GP        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Equatorial Guinea', N'GQ        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Greece', N'GR        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'South Georgia and the South Sandwich Islands', N'GS        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Guatemala', N'GT        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Guam', N'GU        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Guinea-Bissau', N'GW        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Guyana', N'GY        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Hong Kong', N'HK        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Heard Island and McDonald Islands', N'HM        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Honduras', N'HN        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Croatia', N'HR        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Haiti', N'HT        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Hungary', N'HU        ')
GO
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Indonesia', N'ID        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Ireland', N'IE        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Israel', N'IL        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'India', N'IN        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'British Indian Ocean Territory', N'IO        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Iraq', N'IQ        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Iran, Islamic Republic of', N'IR        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Iceland', N'IS        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Italy', N'IT        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Jamaica', N'JM        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Jordan', N'JO        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Japan', N'JP        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Kenya', N'KE        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Kyrgyzstan', N'KG        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Cambodia', N'KH        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Kiribati', N'KI        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Comoros', N'KM        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Saint Kitts and Nevis', N'KN        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Korea, Democratic People''s Republic of', N'KP        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Korea, Republic of', N'KR        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Kuwait', N'KW        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Cayman Islands', N'KY        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Kazakhstan', N'KZ        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Lao People''s Democratic Republic', N'LA        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Lebanon', N'LB        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Saint Lucia', N'LC        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Liechtenstein', N'LI        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Sri Lanka', N'LK        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Liberia', N'LR        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Lesotho', N'LS        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Lithuania', N'LT        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Luxembourg', N'LU        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Latvia', N'LV        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Libyan Arab Jamahiriya', N'LY        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Morocco', N'MA        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Monaco', N'MC        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Moldova, Republic of', N'MD        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Madagascar', N'MG        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Marshall Islands', N'MH        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Macedonia', N'MK        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Mali', N'ML        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Myanmar', N'MM        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Mongolia', N'MN        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Macau', N'MO        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Northern Mariana Islands', N'MP        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Martinique', N'MQ        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Mauritania', N'MR        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Montserrat', N'MS        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Malta', N'MT        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Mauritius', N'MU        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Maldives', N'MV        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Malawi', N'MW        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Mexico', N'MX        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Malaysia', N'MY        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Mozambique', N'MZ        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Namibia', N'NA        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'New Caledonia', N'NC        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Niger', N'NE        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Norfolk Island', N'NF        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Nigeria', N'NG        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Nicaragua', N'NI        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Netherlands', N'NL        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Norway', N'NO        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Nepal', N'NP        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Nauru', N'NR        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Niue', N'NU        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'New Zealand', N'NZ        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Oman', N'OM        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Panama', N'PA        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Peru', N'PE        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'French Polynesia', N'PF        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Papua New Guinea', N'PG        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Philippines', N'PH        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Pakistan', N'PK        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Poland', N'PL        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Saint Pierre and Miquelon', N'PM        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Pitcairn Islands', N'PN        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Puerto Rico', N'PR        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Palestinian Territory', N'PS        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Portugal', N'PT        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Palau', N'PW        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Paraguay', N'PY        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Qatar', N'QA        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Reunion', N'RE        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Romania', N'RO        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Russia', N'RU        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Rwanda', N'RW        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Saudi Arabia', N'SA        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Solomon Islands', N'SB        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Seychelles', N'SC        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Sudan', N'SD        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Sweden', N'SE        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Singapore', N'SG        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Saint Helena', N'SH        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Slovenia', N'SI        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Svalbard and Jan Mayen', N'SJ        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Slovakia', N'SK        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Sierra Leone', N'SL        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'San Marino', N'SM        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Senegal', N'SN        ')
GO
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Somalia', N'SO        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Suriname', N'SR        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Sao Tome and Principe', N'ST        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'El Salvador', N'SV        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Syrian Arab Republic', N'SY        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Swaziland', N'SZ        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Turks and Caicos Islands', N'TC        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Chad', N'TD        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'French Southern Territories', N'TF        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Togo', N'TG        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Thailand', N'TH        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Tajikistan', N'TJ        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Tokelau', N'TK        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Turkmenistan', N'TM        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Tunisia', N'TN        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Tonga', N'TO        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'East Timor', N'TP        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Turkey', N'TR        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Trinidad and Tobago', N'TT        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Tuvalu', N'TV        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Taiwan', N'TW        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Tanzania, United Republic of', N'TZ        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Ukraine', N'UA        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Uganda', N'UG        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'United States Minor Outlying Islands', N'UM        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'United States', N'US        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Uruguay', N'UY        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Uzbekistan', N'UZ        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Holy See (Vatican City State)', N'VA        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Saint Vincent and the Grenadines', N'VC        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Venezuela', N'VE        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Virgin Islands, British', N'VG        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Virgin Islands, U.S.', N'VI        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Vietnam', N'VN        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Vanuatu', N'VU        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Wallis and Futuna', N'WF        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Samoa', N'WS        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Yemen', N'YE        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Mayotte', N'YT        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'South Africa', N'ZA        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Zambia', N'ZM        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Zaire', N'ZR        ')
INSERT [dbo].[Countries] ([CountryName], [CountryCode]) VALUES (N'Zimbabwe', N'ZW        ')
GO
SET IDENTITY_INSERT [dbo].[Hotels] ON 

INSERT [dbo].[Hotels] ([HotelID], [HotelName], [Stars], [CountryName], [CountryCode]) VALUES (1, N'Hotel Artemide', 5, N'Spain', N'ES        ')
INSERT [dbo].[Hotels] ([HotelID], [HotelName], [Stars], [CountryName], [CountryCode]) VALUES (2, N'H10 Madison', 4, N'Finland', N'FI        ')
INSERT [dbo].[Hotels] ([HotelID], [HotelName], [Stars], [CountryName], [CountryCode]) VALUES (3, N'A Room With A View', 3, N'Spain', N'ES        ')
INSERT [dbo].[Hotels] ([HotelID], [HotelName], [Stars], [CountryName], [CountryCode]) VALUES (4, N'Hotel Rec Barcelona', 5, N'Spain', N'ES        ')
INSERT [dbo].[Hotels] ([HotelID], [HotelName], [Stars], [CountryName], [CountryCode]) VALUES (5, N'Aydinli Cave Hotel', 2, N'Spain', N'ES        ')
INSERT [dbo].[Hotels] ([HotelID], [HotelName], [Stars], [CountryName], [CountryCode]) VALUES (6, N'Titanic Business Kartal', 3, N'Spain', N'ES        ')
INSERT [dbo].[Hotels] ([HotelID], [HotelName], [Stars], [CountryName], [CountryCode]) VALUES (7, N'Amber Design Residence', 3, N'Finland', N'FI        ')
INSERT [dbo].[Hotels] ([HotelID], [HotelName], [Stars], [CountryName], [CountryCode]) VALUES (8, N'Hotel Al Ponte Mocenigo', 5, N'Russia', N'RU        ')
INSERT [dbo].[Hotels] ([HotelID], [HotelName], [Stars], [CountryName], [CountryCode]) VALUES (9, N'La Cachette', 4, N'Russia', N'RU        ')
INSERT [dbo].[Hotels] ([HotelID], [HotelName], [Stars], [CountryName], [CountryCode]) VALUES (10, N'Celsus 8outique Hotel', 3, N'United Kingdom', N'GB        ')
INSERT [dbo].[Hotels] ([HotelID], [HotelName], [Stars], [CountryName], [CountryCode]) VALUES (11, N'Ashford Castle', 2, N'Russia', N'RU        ')
INSERT [dbo].[Hotels] ([HotelID], [HotelName], [Stars], [CountryName], [CountryCode]) VALUES (12, N'Agarta Cave Hotel', 5, N'United Kingdom', N'GB        ')
INSERT [dbo].[Hotels] ([HotelID], [HotelName], [Stars], [CountryName], [CountryCode]) VALUES (13, N'Sofitel Grand Sopot', 5, N'Finland', N'FI        ')
INSERT [dbo].[Hotels] ([HotelID], [HotelName], [Stars], [CountryName], [CountryCode]) VALUES (14, N'Grand Resort Bad Ragaz', 4, N'Russia', N'RU        ')
INSERT [dbo].[Hotels] ([HotelID], [HotelName], [Stars], [CountryName], [CountryCode]) VALUES (15, N'Kelebek Special Cave Hotel', 5, N'United Kingdom', N'GB        ')
INSERT [dbo].[Hotels] ([HotelID], [HotelName], [Stars], [CountryName], [CountryCode]) VALUES (16, N'A Room With A View', 3, N'United Kingdom', N'GB        ')
INSERT [dbo].[Hotels] ([HotelID], [HotelName], [Stars], [CountryName], [CountryCode]) VALUES (17, N'Aren Cave Hotel & Art Gallery', 5, N'Georgia', N'GE        ')
INSERT [dbo].[Hotels] ([HotelID], [HotelName], [Stars], [CountryName], [CountryCode]) VALUES (18, N'Castle Hotel Auf Schoenburg', 3, N'Georgia', N'GE        ')
INSERT [dbo].[Hotels] ([HotelID], [HotelName], [Stars], [CountryName], [CountryCode]) VALUES (19, N'Lawton & Lauriston Court Hotel', 5, N'United Kingdom', N'GB        ')
INSERT [dbo].[Hotels] ([HotelID], [HotelName], [Stars], [CountryName], [CountryCode]) VALUES (20, N'El if Hanim Hotel & Spa', 3, N'Russia', N'RU        ')
INSERT [dbo].[Hotels] ([HotelID], [HotelName], [Stars], [CountryName], [CountryCode]) VALUES (21, N'Boutique Hotel Sierra de Alicante', 3, N'Russia', N'RU        ')
INSERT [dbo].[Hotels] ([HotelID], [HotelName], [Stars], [CountryName], [CountryCode]) VALUES (22, N'Van der Valk Hotel Hoorn', 4, N'Russia', N'RU        ')
INSERT [dbo].[Hotels] ([HotelID], [HotelName], [Stars], [CountryName], [CountryCode]) VALUES (23, N'Up Hotel', 5, N'Russia', N'RU        ')
INSERT [dbo].[Hotels] ([HotelID], [HotelName], [Stars], [CountryName], [CountryCode]) VALUES (24, N'Dere Suites', 5, N'Finland', N'FI        ')
INSERT [dbo].[Hotels] ([HotelID], [HotelName], [Stars], [CountryName], [CountryCode]) VALUES (25, N'Park Dedeman Trabzon', 3, N'Russia', N'RU        ')
INSERT [dbo].[Hotels] ([HotelID], [HotelName], [Stars], [CountryName], [CountryCode]) VALUES (26, N'Duven Hotel', 5, N'Finland', N'FI        ')
INSERT [dbo].[Hotels] ([HotelID], [HotelName], [Stars], [CountryName], [CountryCode]) VALUES (27, N'Bandholm Hotel', 2, N'Georgia', N'GE        ')
INSERT [dbo].[Hotels] ([HotelID], [HotelName], [Stars], [CountryName], [CountryCode]) VALUES (28, N'Boutique Hotel El Cresol', 4, N'Croatia', N'HR        ')
INSERT [dbo].[Hotels] ([HotelID], [HotelName], [Stars], [CountryName], [CountryCode]) VALUES (29, N'Perimasali Cave Hotel - Cappadocia', 3, N'Croatia', N'HR        ')
INSERT [dbo].[Hotels] ([HotelID], [HotelName], [Stars], [CountryName], [CountryCode]) VALUES (30, N'Gul Konaklari -Sinasos Rose Mansio', 5, N'Croatia', N'HR        ')
SET IDENTITY_INSERT [dbo].[Hotels] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (1, N'Admin')
INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (2, N'Client')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
INSERT [dbo].[Staff] ([UserID], [Photo], [Name], [Surname], [Patronymic], [RoleID]) VALUES (1, N'/StaffPhoto/admin.jpg', N'Иван', N'Иванов', N'Иванович', 1)
INSERT [dbo].[Staff] ([UserID], [Photo], [Name], [Surname], [Patronymic], [RoleID]) VALUES (2, N'/StaffPhoto/user.jpg', N'Ирина', N'Глашина', N'Ивановна', 2)
GO
SET IDENTITY_INSERT [dbo].[TourType] ON 

INSERT [dbo].[TourType] ([TourTypeID], [TourType]) VALUES (1, N'Международный туризм 
')
INSERT [dbo].[TourType] ([TourTypeID], [TourType]) VALUES (2, N'Внутренний туризм 
')
INSERT [dbo].[TourType] ([TourTypeID], [TourType]) VALUES (3, N'Международный пуризм 
')
INSERT [dbo].[TourType] ([TourTypeID], [TourType]) VALUES (4, N'Лечебно-оздоровительные туры 
')
INSERT [dbo].[TourType] ([TourTypeID], [TourType]) VALUES (5, N'Пляжные туры 
')
INSERT [dbo].[TourType] ([TourTypeID], [TourType]) VALUES (6, N'Экскурсионные туры 
')
INSERT [dbo].[TourType] ([TourTypeID], [TourType]) VALUES (7, N'Специализированные детские туры 
')
INSERT [dbo].[TourType] ([TourTypeID], [TourType]) VALUES (8, N'Обслуживание корпоративных клиентов по заказу
')
INSERT [dbo].[TourType] ([TourTypeID], [TourType]) VALUES (9, N'Горнолыжные курорты
')
INSERT [dbo].[TourType] ([TourTypeID], [TourType]) VALUES (10, N'Культурно-исторические туры 
')
SET IDENTITY_INSERT [dbo].[TourType] OFF
GO
INSERT [dbo].[Users] ([UserID], [login], [password], [RoleID]) VALUES (1, N'admin', N'admin', 1)
INSERT [dbo].[Users] ([UserID], [login], [password], [RoleID]) VALUES (2, N'user', N'user', 2)
GO
ALTER TABLE [dbo].[Hotels]  WITH CHECK ADD  CONSTRAINT [FK_Hotels_Countries] FOREIGN KEY([CountryCode])
REFERENCES [dbo].[Countries] ([CountryCode])
GO
ALTER TABLE [dbo].[Hotels] CHECK CONSTRAINT [FK_Hotels_Countries]
GO
ALTER TABLE [dbo].[Staff]  WITH CHECK ADD  CONSTRAINT [FK_Staff_Roles] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([RoleID])
GO
ALTER TABLE [dbo].[Staff] CHECK CONSTRAINT [FK_Staff_Roles]
GO
ALTER TABLE [dbo].[Tour]  WITH CHECK ADD  CONSTRAINT [FK_Tour_Countries] FOREIGN KEY([CountryCode])
REFERENCES [dbo].[Countries] ([CountryCode])
GO
ALTER TABLE [dbo].[Tour] CHECK CONSTRAINT [FK_Tour_Countries]
GO
ALTER TABLE [dbo].[Tour]  WITH CHECK ADD  CONSTRAINT [FK_Tour_TourType] FOREIGN KEY([TourTypeID])
REFERENCES [dbo].[TourType] ([TourTypeID])
GO
ALTER TABLE [dbo].[Tour] CHECK CONSTRAINT [FK_Tour_TourType]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([RoleID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Staff] FOREIGN KEY([UserID])
REFERENCES [dbo].[Staff] ([UserID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Staff]
GO
USE [master]
GO
ALTER DATABASE [TourAgencyEV] SET  READ_WRITE 
GO
