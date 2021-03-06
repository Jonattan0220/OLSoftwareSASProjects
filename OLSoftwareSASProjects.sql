USE [master]
GO
/****** Object:  Database [OLSoftwareSASProjects]    Script Date: 17/06/2022 20:02:40 ******/
CREATE DATABASE [OLSoftwareSASProjects]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'OLSoftwareSASProjects', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\OLSoftwareSASProjects.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'OLSoftwareSASProjects_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\OLSoftwareSASProjects_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [OLSoftwareSASProjects] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OLSoftwareSASProjects].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [OLSoftwareSASProjects] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [OLSoftwareSASProjects] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [OLSoftwareSASProjects] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [OLSoftwareSASProjects] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [OLSoftwareSASProjects] SET ARITHABORT OFF 
GO
ALTER DATABASE [OLSoftwareSASProjects] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [OLSoftwareSASProjects] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [OLSoftwareSASProjects] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [OLSoftwareSASProjects] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [OLSoftwareSASProjects] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [OLSoftwareSASProjects] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [OLSoftwareSASProjects] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [OLSoftwareSASProjects] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [OLSoftwareSASProjects] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [OLSoftwareSASProjects] SET  DISABLE_BROKER 
GO
ALTER DATABASE [OLSoftwareSASProjects] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [OLSoftwareSASProjects] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [OLSoftwareSASProjects] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [OLSoftwareSASProjects] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [OLSoftwareSASProjects] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [OLSoftwareSASProjects] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [OLSoftwareSASProjects] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [OLSoftwareSASProjects] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [OLSoftwareSASProjects] SET  MULTI_USER 
GO
ALTER DATABASE [OLSoftwareSASProjects] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [OLSoftwareSASProjects] SET DB_CHAINING OFF 
GO
ALTER DATABASE [OLSoftwareSASProjects] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [OLSoftwareSASProjects] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [OLSoftwareSASProjects] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [OLSoftwareSASProjects] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [OLSoftwareSASProjects] SET QUERY_STORE = OFF
GO
USE [OLSoftwareSASProjects]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 17/06/2022 20:02:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 17/06/2022 20:02:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 17/06/2022 20:02:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 17/06/2022 20:02:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 17/06/2022 20:02:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 17/06/2022 20:02:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 17/06/2022 20:02:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 17/06/2022 20:02:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 17/06/2022 20:02:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[ClientId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[PhoneNumber] [varchar](50) NOT NULL,
	[Address] [varchar](50) NOT NULL,
	[IdentificationTypeId] [int] NOT NULL,
	[IdentificationNumber] [bigint] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[ModificationDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[ClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IdentificationType]    Script Date: 17/06/2022 20:02:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IdentificationType](
	[IdentificationTypeId] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nchar](10) NOT NULL,
 CONSTRAINT [PK_ClienteIdentificationType] PRIMARY KEY CLUSTERED 
(
	[IdentificationTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProgrammingLanguage]    Script Date: 17/06/2022 20:02:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProgrammingLanguage](
	[ProgrammingLanguageId] [int] IDENTITY(1,1) NOT NULL,
	[ProgrammingLanguage] [varchar](50) NOT NULL,
	[ProgrammingLanguageLevelId] [int] NOT NULL,
 CONSTRAINT [PK_ProgrammingLanguage] PRIMARY KEY CLUSTERED 
(
	[ProgrammingLanguageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProgrammingLanguageLevel]    Script Date: 17/06/2022 20:02:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProgrammingLanguageLevel](
	[ProgrammingLanguageLevelId] [int] IDENTITY(1,1) NOT NULL,
	[LevelDescription] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ProgrammingLanguageLevel] PRIMARY KEY CLUSTERED 
(
	[ProgrammingLanguageLevelId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Project]    Script Date: 17/06/2022 20:02:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Project](
	[ProjectId] [int] IDENTITY(1,1) NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
	[Price] [bigint] NOT NULL,
	[NumberOfHours] [int] NOT NULL,
	[ClientId] [int] NOT NULL,
	[ProjectStateId] [int] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[ModificationDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Project] PRIMARY KEY CLUSTERED 
(
	[ProjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProjectLanguage]    Script Date: 17/06/2022 20:02:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProjectLanguage](
	[ProjectLanguageId] [int] IDENTITY(1,1) NOT NULL,
	[ProjectId] [int] NOT NULL,
	[ProgrammingLanguageId] [int] NOT NULL,
 CONSTRAINT [PK_ProjectLanguage] PRIMARY KEY CLUSTERED 
(
	[ProjectLanguageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProjectState]    Script Date: 17/06/2022 20:02:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProjectState](
	[ProjectStateId] [int] IDENTITY(1,1) NOT NULL,
	[State] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ProjectState] PRIMARY KEY CLUSTERED 
(
	[ProjectStateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220617151401_InitApplicationUser', N'6.0.6')
GO
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'47e42ef1-e003-4b0b-86c7-31fb137e9834', N'maria@outlook.com', N'MARIA@OUTLOOK.COM', N'maria@outlook.com', N'MARIA@OUTLOOK.COM', 0, N'AQAAAAEAACcQAAAAEDQcI8IbWxLjvuRaFUsyVTr/kVdY1hMHQy0KCWTzql1MjUnW33xNO+52KIZnLWfRKA==', N'Y3F23FDMEERIANOJVR5GETNFMXX5XWHK', N'4be3a350-4c8f-482e-a109-5d747de3355b', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'dbd9ae43-1763-409a-9d01-03d2b8d89451', N'prueba@gmail.com', N'PRUEBA@GMAIL.COM', N'prueba@gmail.com', N'PRUEBA@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEJiJEJE8q9K834mD7UyDnzBCFrMeMwnwfc4Kj3S3h7f/ZJvxPcRyrLLTlfYtYep1xQ==', N'ACIYCTMKR5YYJEGQFNE6RLIJJNVIGSAS', N'30e66dde-3590-4b1d-9e3a-1d56d26a51be', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'f51a87fb-55ce-419d-a996-abafcf000cee', N'jonatttan.stivent.vargas@gmail.com', N'JONATTTAN.STIVENT.VARGAS@GMAIL.COM', N'jonatttan.stivent.vargas@gmail.com', N'JONATTTAN.STIVENT.VARGAS@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEOPGmUYqCEaYXgypCJqf0Ht+ZHD9V4wjbPRdfBfthkCKM78JAfoOwT9FBuCaPGgZPQ==', N'RWJBFELQ7PJN5NPTVRDCIFJVD4O3AGDE', N'92e9e1ee-bf2b-4cca-a3fa-3dd660732a03', NULL, 0, 0, NULL, 1, 0)
GO
SET IDENTITY_INSERT [dbo].[Client] ON 

INSERT [dbo].[Client] ([ClientId], [FirstName], [LastName], [PhoneNumber], [Address], [IdentificationTypeId], [IdentificationNumber], [CreationDate], [ModificationDate]) VALUES (1, N'Maria', N'Cristina', N'3102152635', N'Call 10 45-98', 1, 1095336210, CAST(N'2022-06-17T13:12:22.867' AS DateTime), CAST(N'2022-06-17T19:49:49.660' AS DateTime))
INSERT [dbo].[Client] ([ClientId], [FirstName], [LastName], [PhoneNumber], [Address], [IdentificationTypeId], [IdentificationNumber], [CreationDate], [ModificationDate]) VALUES (6, N'Juan', N'Nevez', N'31139290', N'Call 2 45-98', 1, 644564545, CAST(N'2022-06-17T15:46:34.853' AS DateTime), CAST(N'2022-06-17T15:47:05.150' AS DateTime))
INSERT [dbo].[Client] ([ClientId], [FirstName], [LastName], [PhoneNumber], [Address], [IdentificationTypeId], [IdentificationNumber], [CreationDate], [ModificationDate]) VALUES (7, N'Carolina', N'Nevez', N'3102152635', N'Call 12 45-79', 1, 5542424, CAST(N'2022-06-17T16:22:19.080' AS DateTime), CAST(N'2022-06-17T16:22:23.887' AS DateTime))
INSERT [dbo].[Client] ([ClientId], [FirstName], [LastName], [PhoneNumber], [Address], [IdentificationTypeId], [IdentificationNumber], [CreationDate], [ModificationDate]) VALUES (8, N'Julieta', N'Manrique', N'31139290', N'Call 12 45-79', 1, 165156151, CAST(N'2022-06-17T16:22:53.803' AS DateTime), CAST(N'2022-06-17T16:22:53.803' AS DateTime))
INSERT [dbo].[Client] ([ClientId], [FirstName], [LastName], [PhoneNumber], [Address], [IdentificationTypeId], [IdentificationNumber], [CreationDate], [ModificationDate]) VALUES (10, N'Juan', N'Carlos', N'31139290', N'Call 12 45-79', 1, 52425425425, CAST(N'2022-06-17T16:23:19.620' AS DateTime), CAST(N'2022-06-17T16:23:19.620' AS DateTime))
INSERT [dbo].[Client] ([ClientId], [FirstName], [LastName], [PhoneNumber], [Address], [IdentificationTypeId], [IdentificationNumber], [CreationDate], [ModificationDate]) VALUES (11, N'Pedro', N'Velez', N'3102152635', N'Call 10 45-98', 1, 754561364, CAST(N'2022-06-17T16:23:36.980' AS DateTime), CAST(N'2022-06-17T16:23:36.980' AS DateTime))
INSERT [dbo].[Client] ([ClientId], [FirstName], [LastName], [PhoneNumber], [Address], [IdentificationTypeId], [IdentificationNumber], [CreationDate], [ModificationDate]) VALUES (12, N'Veronica', N'Carillo', N'8524545', N'Call 12 45-79', 1, 587575287, CAST(N'2022-06-17T16:23:54.620' AS DateTime), CAST(N'2022-06-17T16:23:54.620' AS DateTime))
INSERT [dbo].[Client] ([ClientId], [FirstName], [LastName], [PhoneNumber], [Address], [IdentificationTypeId], [IdentificationNumber], [CreationDate], [ModificationDate]) VALUES (13, N'Julieta', N'Manrique', N'32039290', N'Call 10 45-98', 1, 452425452452, CAST(N'2022-06-17T16:24:11.450' AS DateTime), CAST(N'2022-06-17T16:24:11.450' AS DateTime))
INSERT [dbo].[Client] ([ClientId], [FirstName], [LastName], [PhoneNumber], [Address], [IdentificationTypeId], [IdentificationNumber], [CreationDate], [ModificationDate]) VALUES (14, N'Maria', N'Elizabeth', N'8524545', N'Call 2 45-98', 1, 13658877455, CAST(N'2022-06-17T16:24:35.570' AS DateTime), CAST(N'2022-06-17T16:24:35.570' AS DateTime))
INSERT [dbo].[Client] ([ClientId], [FirstName], [LastName], [PhoneNumber], [Address], [IdentificationTypeId], [IdentificationNumber], [CreationDate], [ModificationDate]) VALUES (15, N'Juana', N'Manrique', N'3202152635', N'Call 11 45-79', 2, 786786786575, CAST(N'2022-06-17T16:24:58.827' AS DateTime), CAST(N'2022-06-17T16:24:58.827' AS DateTime))
INSERT [dbo].[Client] ([ClientId], [FirstName], [LastName], [PhoneNumber], [Address], [IdentificationTypeId], [IdentificationNumber], [CreationDate], [ModificationDate]) VALUES (16, N'Ricardo', N'Diaz', N'3202152635', N'Call 3 45-98', 2, 5772758272, CAST(N'2022-06-17T16:25:13.633' AS DateTime), CAST(N'2022-06-17T16:25:17.917' AS DateTime))
SET IDENTITY_INSERT [dbo].[Client] OFF
GO
SET IDENTITY_INSERT [dbo].[IdentificationType] ON 

INSERT [dbo].[IdentificationType] ([IdentificationTypeId], [Type]) VALUES (1, N'CC        ')
INSERT [dbo].[IdentificationType] ([IdentificationTypeId], [Type]) VALUES (2, N'Pasaporte ')
SET IDENTITY_INSERT [dbo].[IdentificationType] OFF
GO
SET IDENTITY_INSERT [dbo].[ProgrammingLanguage] ON 

INSERT [dbo].[ProgrammingLanguage] ([ProgrammingLanguageId], [ProgrammingLanguage], [ProgrammingLanguageLevelId]) VALUES (1, N'C#', 1)
INSERT [dbo].[ProgrammingLanguage] ([ProgrammingLanguageId], [ProgrammingLanguage], [ProgrammingLanguageLevelId]) VALUES (2, N'C', 2)
INSERT [dbo].[ProgrammingLanguage] ([ProgrammingLanguageId], [ProgrammingLanguage], [ProgrammingLanguageLevelId]) VALUES (3, N'Código Binario', 3)
SET IDENTITY_INSERT [dbo].[ProgrammingLanguage] OFF
GO
SET IDENTITY_INSERT [dbo].[ProgrammingLanguageLevel] ON 

INSERT [dbo].[ProgrammingLanguageLevel] ([ProgrammingLanguageLevelId], [LevelDescription]) VALUES (1, N'Alto')
INSERT [dbo].[ProgrammingLanguageLevel] ([ProgrammingLanguageLevelId], [LevelDescription]) VALUES (2, N'Medio')
INSERT [dbo].[ProgrammingLanguageLevel] ([ProgrammingLanguageLevelId], [LevelDescription]) VALUES (3, N'Bajo')
SET IDENTITY_INSERT [dbo].[ProgrammingLanguageLevel] OFF
GO
SET IDENTITY_INSERT [dbo].[Project] ON 

INSERT [dbo].[Project] ([ProjectId], [StartDate], [EndDate], [Price], [NumberOfHours], [ClientId], [ProjectStateId], [CreationDate], [ModificationDate]) VALUES (2, CAST(N'2022-06-12' AS Date), CAST(N'2022-06-14' AS Date), 100000000, 50, 1, 2, CAST(N'2022-06-17T16:25:37.050' AS DateTime), CAST(N'2022-06-17T16:25:37.050' AS DateTime))
INSERT [dbo].[Project] ([ProjectId], [StartDate], [EndDate], [Price], [NumberOfHours], [ClientId], [ProjectStateId], [CreationDate], [ModificationDate]) VALUES (3, CAST(N'2022-06-01' AS Date), CAST(N'2022-06-02' AS Date), 400000000, 80, 12, 4, CAST(N'2022-06-17T16:26:25.733' AS DateTime), CAST(N'2022-06-17T16:26:25.733' AS DateTime))
INSERT [dbo].[Project] ([ProjectId], [StartDate], [EndDate], [Price], [NumberOfHours], [ClientId], [ProjectStateId], [CreationDate], [ModificationDate]) VALUES (4, CAST(N'2022-05-03' AS Date), CAST(N'2022-06-16' AS Date), 200000000, 40, 11, 1, CAST(N'2022-06-17T16:26:50.570' AS DateTime), CAST(N'2022-06-17T16:26:50.570' AS DateTime))
INSERT [dbo].[Project] ([ProjectId], [StartDate], [EndDate], [Price], [NumberOfHours], [ClientId], [ProjectStateId], [CreationDate], [ModificationDate]) VALUES (5, CAST(N'2022-05-07' AS Date), CAST(N'2022-06-26' AS Date), 400000000, 20, 14, 3, CAST(N'2022-06-17T16:27:13.920' AS DateTime), CAST(N'2022-06-17T16:27:13.920' AS DateTime))
INSERT [dbo].[Project] ([ProjectId], [StartDate], [EndDate], [Price], [NumberOfHours], [ClientId], [ProjectStateId], [CreationDate], [ModificationDate]) VALUES (6, CAST(N'2022-05-15' AS Date), CAST(N'2022-05-30' AS Date), 36000000, 20, 10, 4, CAST(N'2022-06-17T16:27:38.050' AS DateTime), CAST(N'2022-06-17T16:27:38.050' AS DateTime))
INSERT [dbo].[Project] ([ProjectId], [StartDate], [EndDate], [Price], [NumberOfHours], [ClientId], [ProjectStateId], [CreationDate], [ModificationDate]) VALUES (7, CAST(N'2022-04-16' AS Date), CAST(N'2022-06-17' AS Date), 520000000, 17, 14, 2, CAST(N'2022-06-17T16:28:00.863' AS DateTime), CAST(N'2022-06-17T16:28:00.863' AS DateTime))
INSERT [dbo].[Project] ([ProjectId], [StartDate], [EndDate], [Price], [NumberOfHours], [ClientId], [ProjectStateId], [CreationDate], [ModificationDate]) VALUES (8, CAST(N'2022-04-16' AS Date), CAST(N'2022-06-18' AS Date), 65000000000, 90, 12, 1, CAST(N'2022-06-17T16:28:31.573' AS DateTime), CAST(N'2022-06-17T16:28:31.573' AS DateTime))
INSERT [dbo].[Project] ([ProjectId], [StartDate], [EndDate], [Price], [NumberOfHours], [ClientId], [ProjectStateId], [CreationDate], [ModificationDate]) VALUES (9, CAST(N'2022-05-08' AS Date), CAST(N'2022-06-26' AS Date), 400000000, 36, 13, 2, CAST(N'2022-06-17T16:28:50.260' AS DateTime), CAST(N'2022-06-17T16:28:50.260' AS DateTime))
INSERT [dbo].[Project] ([ProjectId], [StartDate], [EndDate], [Price], [NumberOfHours], [ClientId], [ProjectStateId], [CreationDate], [ModificationDate]) VALUES (10, CAST(N'2022-04-14' AS Date), CAST(N'2022-06-26' AS Date), 5600000000, 56, 13, 2, CAST(N'2022-06-17T16:29:16.200' AS DateTime), CAST(N'2022-06-17T16:29:16.200' AS DateTime))
INSERT [dbo].[Project] ([ProjectId], [StartDate], [EndDate], [Price], [NumberOfHours], [ClientId], [ProjectStateId], [CreationDate], [ModificationDate]) VALUES (11, CAST(N'2022-06-11' AS Date), CAST(N'2022-06-19' AS Date), 470000000000, 30, 8, 2, CAST(N'2022-06-17T16:29:37.777' AS DateTime), CAST(N'2022-06-17T16:29:37.777' AS DateTime))
INSERT [dbo].[Project] ([ProjectId], [StartDate], [EndDate], [Price], [NumberOfHours], [ClientId], [ProjectStateId], [CreationDate], [ModificationDate]) VALUES (12, CAST(N'2022-06-11' AS Date), CAST(N'2022-06-26' AS Date), 300000000, 30, 7, 2, CAST(N'2022-06-17T16:29:59.370' AS DateTime), CAST(N'2022-06-17T16:29:59.370' AS DateTime))
SET IDENTITY_INSERT [dbo].[Project] OFF
GO
SET IDENTITY_INSERT [dbo].[ProjectLanguage] ON 

INSERT [dbo].[ProjectLanguage] ([ProjectLanguageId], [ProjectId], [ProgrammingLanguageId]) VALUES (3, 2, 1)
INSERT [dbo].[ProjectLanguage] ([ProjectLanguageId], [ProjectId], [ProgrammingLanguageId]) VALUES (4, 3, 2)
INSERT [dbo].[ProjectLanguage] ([ProjectLanguageId], [ProjectId], [ProgrammingLanguageId]) VALUES (5, 4, 3)
INSERT [dbo].[ProjectLanguage] ([ProjectLanguageId], [ProjectId], [ProgrammingLanguageId]) VALUES (6, 5, 1)
INSERT [dbo].[ProjectLanguage] ([ProjectLanguageId], [ProjectId], [ProgrammingLanguageId]) VALUES (8, 6, 1)
INSERT [dbo].[ProjectLanguage] ([ProjectLanguageId], [ProjectId], [ProgrammingLanguageId]) VALUES (9, 7, 2)
INSERT [dbo].[ProjectLanguage] ([ProjectLanguageId], [ProjectId], [ProgrammingLanguageId]) VALUES (10, 8, 3)
INSERT [dbo].[ProjectLanguage] ([ProjectLanguageId], [ProjectId], [ProgrammingLanguageId]) VALUES (11, 9, 1)
INSERT [dbo].[ProjectLanguage] ([ProjectLanguageId], [ProjectId], [ProgrammingLanguageId]) VALUES (13, 10, 2)
INSERT [dbo].[ProjectLanguage] ([ProjectLanguageId], [ProjectId], [ProgrammingLanguageId]) VALUES (14, 11, 3)
INSERT [dbo].[ProjectLanguage] ([ProjectLanguageId], [ProjectId], [ProgrammingLanguageId]) VALUES (16, 12, 3)
INSERT [dbo].[ProjectLanguage] ([ProjectLanguageId], [ProjectId], [ProgrammingLanguageId]) VALUES (22, 2, 2)
INSERT [dbo].[ProjectLanguage] ([ProjectLanguageId], [ProjectId], [ProgrammingLanguageId]) VALUES (23, 3, 1)
INSERT [dbo].[ProjectLanguage] ([ProjectLanguageId], [ProjectId], [ProgrammingLanguageId]) VALUES (24, 4, 1)
INSERT [dbo].[ProjectLanguage] ([ProjectLanguageId], [ProjectId], [ProgrammingLanguageId]) VALUES (25, 5, 3)
INSERT [dbo].[ProjectLanguage] ([ProjectLanguageId], [ProjectId], [ProgrammingLanguageId]) VALUES (26, 12, 1)
INSERT [dbo].[ProjectLanguage] ([ProjectLanguageId], [ProjectId], [ProgrammingLanguageId]) VALUES (27, 11, 1)
SET IDENTITY_INSERT [dbo].[ProjectLanguage] OFF
GO
SET IDENTITY_INSERT [dbo].[ProjectState] ON 

INSERT [dbo].[ProjectState] ([ProjectStateId], [State]) VALUES (1, N'En negociación')
INSERT [dbo].[ProjectState] ([ProjectStateId], [State]) VALUES (2, N'En proceso')
INSERT [dbo].[ProjectState] ([ProjectStateId], [State]) VALUES (3, N'Terminado')
INSERT [dbo].[ProjectState] ([ProjectStateId], [State]) VALUES (4, N'Anulado')
SET IDENTITY_INSERT [dbo].[ProjectState] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 17/06/2022 20:02:40 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 17/06/2022 20:02:40 ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 17/06/2022 20:02:40 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 17/06/2022 20:02:40 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 17/06/2022 20:02:40 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 17/06/2022 20:02:40 ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 17/06/2022 20:02:40 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Client]  WITH CHECK ADD  CONSTRAINT [FK_Client_IdentificationType] FOREIGN KEY([IdentificationTypeId])
REFERENCES [dbo].[IdentificationType] ([IdentificationTypeId])
GO
ALTER TABLE [dbo].[Client] CHECK CONSTRAINT [FK_Client_IdentificationType]
GO
ALTER TABLE [dbo].[ProgrammingLanguage]  WITH CHECK ADD  CONSTRAINT [FK_ProgrammingLanguage_ProgrammingLanguageLevel] FOREIGN KEY([ProgrammingLanguageLevelId])
REFERENCES [dbo].[ProgrammingLanguageLevel] ([ProgrammingLanguageLevelId])
GO
ALTER TABLE [dbo].[ProgrammingLanguage] CHECK CONSTRAINT [FK_ProgrammingLanguage_ProgrammingLanguageLevel]
GO
ALTER TABLE [dbo].[Project]  WITH CHECK ADD  CONSTRAINT [FK_Project_Client] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Client] ([ClientId])
GO
ALTER TABLE [dbo].[Project] CHECK CONSTRAINT [FK_Project_Client]
GO
ALTER TABLE [dbo].[Project]  WITH CHECK ADD  CONSTRAINT [FK_Project_ProjectState] FOREIGN KEY([ProjectStateId])
REFERENCES [dbo].[ProjectState] ([ProjectStateId])
GO
ALTER TABLE [dbo].[Project] CHECK CONSTRAINT [FK_Project_ProjectState]
GO
ALTER TABLE [dbo].[ProjectLanguage]  WITH CHECK ADD  CONSTRAINT [FK_ProjectLanguage_ProgrammingLanguage] FOREIGN KEY([ProgrammingLanguageId])
REFERENCES [dbo].[ProgrammingLanguage] ([ProgrammingLanguageId])
GO
ALTER TABLE [dbo].[ProjectLanguage] CHECK CONSTRAINT [FK_ProjectLanguage_ProgrammingLanguage]
GO
ALTER TABLE [dbo].[ProjectLanguage]  WITH CHECK ADD  CONSTRAINT [FK_ProjectLanguage_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Project] ([ProjectId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProjectLanguage] CHECK CONSTRAINT [FK_ProjectLanguage_Project]
GO
/****** Object:  StoredProcedure [dbo].[DeleteClient]    Script Date: 17/06/2022 20:02:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[DeleteClient]
				(@ClientId as int)
AS
BEGIN

	        delete from Client
			      where ClientId = @ClientId

END
GO
/****** Object:  StoredProcedure [dbo].[DeleteProject]    Script Date: 17/06/2022 20:02:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[DeleteProject]
				(@ProjectId as int)
AS
BEGIN

	        delete from Project
			      where ProjectId = @ProjectId

END
GO
/****** Object:  StoredProcedure [dbo].[DeleteProjectLanguage]    Script Date: 17/06/2022 20:02:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DeleteProjectLanguage]
				(@ProjectLanguageId as int)
AS
BEGIN

	        delete from ProjectLanguage
			      where ProjectLanguageId = @ProjectLanguageId

END
GO
/****** Object:  StoredProcedure [dbo].[InsertClient]    Script Date: 17/06/2022 20:02:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[InsertClient]
				(@FirstName as varchar(50),
				 @LastName as varchar(50),
				 @PhoneNumber as varchar(50),
				 @Address as varchar(50),
				 @IdentificationTypeId as int,
				 @IdentificationNumber as bigint)
AS
BEGIN

	insert into Client
			select @FirstName,
				   @LastName,
				   @PhoneNumber,
				   @Address,
				   @IdentificationTypeId,
				   @IdentificationNumber,
				   getdate(),
				   getdate()	

END
GO
/****** Object:  StoredProcedure [dbo].[InsertProject]    Script Date: 17/06/2022 20:02:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[InsertProject]
				(@StartDate as date,
				 @EndDate  as date,
				 @Price as bigint,
				 @NumberOfHours as int,
				 @ClientId as int,
				 @ProjectStateId as int)
AS
BEGIN

	insert into Project
			select @StartDate,
				   @EndDate,
				   @Price,
				   @NumberOfHours,
				   @ClientId,
				   @ProjectStateId,
				   getdate(),
				   getdate()	

END
GO
/****** Object:  StoredProcedure [dbo].[InsertProjectLanguage]    Script Date: 17/06/2022 20:02:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[InsertProjectLanguage]
				(@ProjectId as int,
				 @ProgrammingLanguageId as int)
AS
BEGIN

	        insert into ProjectLanguage
			select @ProjectId,
				   @ProgrammingLanguageId

END
GO
/****** Object:  StoredProcedure [dbo].[SelectClient]    Script Date: 17/06/2022 20:02:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SelectClient]
AS
BEGIN
	      select C.*,
		         IT.Type 
			from Client as C
			     inner join IdentificationType as IT
				    on IT.IdentificationTypeId = C.IdentificationTypeId

END
GO
/****** Object:  StoredProcedure [dbo].[SelectProject]    Script Date: 17/06/2022 20:02:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[SelectProject]
AS
BEGIN
	      select P.*,
		         C.IdentificationNumber,
				 C.FirstName,
				 C.LastName,
				 PS.State
		    from Project as P
			     inner join Client as C
				    on C.ClientId = P.ClientId
				 inner join ProjectState as PS
				    on PS.ProjectStateId = P.ProjectStateId

END
GO
/****** Object:  StoredProcedure [dbo].[SelectProjectLanguage]    Script Date: 17/06/2022 20:02:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SelectProjectLanguage]
						(@ProjectId as int)
AS
BEGIN
	      select PL.*,
				 PROGL.ProgrammingLanguage,
				 PLL.LevelDescription
			from ProjectLanguage as PL
			     inner join Project as P
				    on P.ProjectId = PL.ProjectId
				 inner join ProgrammingLanguage as PROGL
				    on PROGL.ProgrammingLanguageId = PL.ProgrammingLanguageId
				 inner join ProgrammingLanguageLevel as PLL
				    on PROGL.ProgrammingLanguageLevelId = PLL.ProgrammingLanguageLevelId
		   where (@ProjectId is null or PL.ProjectId = @ProjectId)

END
GO
/****** Object:  StoredProcedure [dbo].[UpdateClient]    Script Date: 17/06/2022 20:02:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateClient]
				(@ClientId as int,
				 @FirstName as varchar(50),
				 @LastName as varchar(50),
				 @PhoneNumber as varchar(50),
				 @Address as varchar(50),
				 @IdentificationTypeId as int,
				 @IdentificationNumber as bigint)
AS
BEGIN

	        update Client
			   set FirstName = @FirstName,
				   LastName = @LastName,
				   PhoneNumber = @PhoneNumber,
				   Client.Address = @Address,
				   IdentificationTypeId= @IdentificationTypeId,
				   IdentificationNumber= @IdentificationNumber,
				   ModificationDate = getdate()	
			 where ClientId = @ClientId

END
GO
/****** Object:  StoredProcedure [dbo].[UpdateProject]    Script Date: 17/06/2022 20:02:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[UpdateProject]
				(@ProjectId as int,
				 @StartDate as date,
				 @EndDate  as date,
				 @Price as bigint,
				 @NumberOfHours as int,
				 @ClientId as int,
				 @ProjectStateId as int)
AS
BEGIN

			update Project
			   set StartDate = @StartDate,
				   EndDate = @EndDate,
				   Price = @Price,
				   NumberOfHours = @NumberOfHours,
				   ClientId = @ClientId,
				   ProjectStateId= @ProjectStateId,
				   ModificationDate = getdate()	
			 where ProjectId = @ProjectId		

END
GO
USE [master]
GO
ALTER DATABASE [OLSoftwareSASProjects] SET  READ_WRITE 
GO
