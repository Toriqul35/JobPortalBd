USE [master]
GO
/****** Object:  Database [JobProtalBd]    Script Date: 12/7/2018 2:42:47 PM ******/
CREATE DATABASE [JobProtalBd]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Job', FILENAME = N'F:\sql\Program file\MSSQL14.TORIQULSQL\MSSQL\DATA\Job.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Job_log', FILENAME = N'F:\sql\Program file\MSSQL14.TORIQULSQL\MSSQL\DATA\Job_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [JobProtalBd] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [JobProtalBd].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [JobProtalBd] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [JobProtalBd] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [JobProtalBd] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [JobProtalBd] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [JobProtalBd] SET ARITHABORT OFF 
GO
ALTER DATABASE [JobProtalBd] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [JobProtalBd] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [JobProtalBd] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [JobProtalBd] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [JobProtalBd] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [JobProtalBd] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [JobProtalBd] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [JobProtalBd] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [JobProtalBd] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [JobProtalBd] SET  DISABLE_BROKER 
GO
ALTER DATABASE [JobProtalBd] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [JobProtalBd] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [JobProtalBd] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [JobProtalBd] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [JobProtalBd] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [JobProtalBd] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [JobProtalBd] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [JobProtalBd] SET RECOVERY FULL 
GO
ALTER DATABASE [JobProtalBd] SET  MULTI_USER 
GO
ALTER DATABASE [JobProtalBd] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [JobProtalBd] SET DB_CHAINING OFF 
GO
ALTER DATABASE [JobProtalBd] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [JobProtalBd] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [JobProtalBd] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'JobProtalBd', N'ON'
GO
ALTER DATABASE [JobProtalBd] SET QUERY_STORE = OFF
GO
USE [JobProtalBd]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 12/7/2018 2:42:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[Ad_Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[Ad_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApplyJob]    Script Date: 12/7/2018 2:42:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApplyJob](
	[Id] [int] NOT NULL,
	[FileName] [nvarchar](50) NULL,
	[Contact_N] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[FilePath] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Area]    Script Date: 12/7/2018 2:42:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Area](
	[Area_Id] [int] IDENTITY(1,1) NOT NULL,
	[Catagory] [varchar](50) NULL,
	[Area] [varchar](50) NULL,
	[Location] [varchar](50) NULL,
 CONSTRAINT [PK_Area] PRIMARY KEY CLUSTERED 
(
	[Area_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[C_Regi]    Script Date: 12/7/2018 2:42:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[C_Regi](
	[C_Id] [int] IDENTITY(1,1) NOT NULL,
	[C_Name] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Web_S] [varchar](50) NULL,
	[Establish_date] [date] NULL,
	[Entry_Date] [datetime] NULL,
	[Password] [varchar](50) NULL,
 CONSTRAINT [PK_C_Regi] PRIMARY KEY CLUSTERED 
(
	[C_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[City]    Script Date: 12/7/2018 2:42:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[Ci_Id] [int] IDENTITY(1,1) NOT NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](50) NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[Ci_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Company_p]    Script Date: 12/7/2018 2:42:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company_p](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[UserName] [nvarchar](50) NULL,
	[Contact] [nvarchar](50) NULL,
	[State] [nvarchar](50) NULL,
	[City] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[Details] [nvarchar](50) NULL,
 CONSTRAINT [PK_Company_p] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CompanyP]    Script Date: 12/7/2018 2:42:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompanyP](
	[C_Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Contact] [nvarchar](50) NOT NULL,
	[State] [nvarchar](50) NOT NULL,
	[City] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[Establish_Date] [date] NOT NULL,
	[Details] [varchar](max) NOT NULL,
 CONSTRAINT [PK_CompanyP] PRIMARY KEY CLUSTERED 
(
	[C_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Interview]    Script Date: 12/7/2018 2:42:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Interview](
	[In_Id] [int] IDENTITY(1,1) NOT NULL,
	[She_Id] [int] NULL,
	[Ad_Id] [int] NULL,
	[C_Id] [int] NULL,
	[Question] [varchar](50) NULL,
	[Answer] [varchar](50) NULL,
	[Time] [datetime2](7) NULL,
 CONSTRAINT [PK_Interview] PRIMARY KEY CLUSTERED 
(
	[In_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notice]    Script Date: 12/7/2018 2:42:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notice](
	[Not_Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[FileName] [nvarchar](50) NOT NULL,
	[FilePath] [varchar](max) NOT NULL,
	[Publish_Date] [date] NOT NULL,
 CONSTRAINT [PK_Notice] PRIMARY KEY CLUSTERED 
(
	[Not_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pdf]    Script Date: 12/7/2018 2:42:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pdf](
	[N_Id] [int] IDENTITY(1,1) NOT NULL,
	[C_Id] [nchar](10) NULL,
	[Ad_Id] [nchar](10) NULL,
	[File] [varchar](50) NULL,
	[Name] [varchar](50) NULL,
 CONSTRAINT [PK_Pdf] PRIMARY KEY CLUSTERED 
(
	[N_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[postjobs]    Script Date: 12/7/2018 2:42:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[postjobs](
	[J_Id] [int] NOT NULL,
	[Title] [varchar](50) NULL,
	[Name] [varchar](50) NULL,
	[Status] [varchar](50) NULL,
	[Educational] [varchar](50) NULL,
	[Experience] [varchar](50) NULL,
	[Location] [varchar](50) NULL,
	[Salary] [varchar](50) NULL,
	[Source] [varchar](50) NULL,
	[Vacancy] [varchar](50) NULL,
	[date] [date] NULL,
 CONSTRAINT [PK_postjobs] PRIMARY KEY CLUSTERED 
(
	[J_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Registration]    Script Date: 12/7/2018 2:42:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Registration](
	[Sheker_Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[State] [varchar](50) NULL,
	[City] [varchar](50) NULL,
	[Gender] [varchar](50) NULL,
	[Date_Of_Birth] [date] NULL,
	[Contact_Number] [int] NULL,
 CONSTRAINT [PK_Registration] PRIMARY KEY CLUSTERED 
(
	[Sheker_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Resume]    Script Date: 12/7/2018 2:42:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Resume](
	[Re_Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Gender] [varchar](50) NULL,
	[Qualification] [varchar](50) NULL,
	[Certification] [varchar](50) NULL,
 CONSTRAINT [PK_Resume] PRIMARY KEY CLUSTERED 
(
	[Re_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[She_Regi]    Script Date: 12/7/2018 2:42:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[She_Regi](
	[She_Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](50) NULL,
	[Name] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[Phone_N] [varchar](50) NULL,
	[Entry_Date] [date] NULL,
 CONSTRAINT [PK_She_Regi] PRIMARY KEY CLUSTERED 
(
	[She_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Table]    Script Date: 12/7/2018 2:42:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Table](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Contact_N] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[FilePath] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Admin] ON 

INSERT [dbo].[Admin] ([Ad_Id], [Email], [Password]) VALUES (2, N'toriqul@gmail.com', N'1234')
INSERT [dbo].[Admin] ([Ad_Id], [Email], [Password]) VALUES (4, N'toriqul.pdap@gmail.com', N'1234')
SET IDENTITY_INSERT [dbo].[Admin] OFF
SET IDENTITY_INSERT [dbo].[C_Regi] ON 

INSERT [dbo].[C_Regi] ([C_Id], [C_Name], [Email], [Web_S], [Establish_date], [Entry_Date], [Password]) VALUES (8, N'Toriqul', N'toriqul.pdap@gmail.com', N'toriqul.pdap@gmail.com', CAST(N'2018-11-25' AS Date), CAST(N'2018-12-25T00:00:00.000' AS DateTime), N'1234')
INSERT [dbo].[C_Regi] ([C_Id], [C_Name], [Email], [Web_S], [Establish_date], [Entry_Date], [Password]) VALUES (9, N'Mamun', N'toma@gmail.com', N'toma@gmail.com', CAST(N'2018-11-26' AS Date), CAST(N'2018-11-26T00:00:00.000' AS DateTime), N'1234')
INSERT [dbo].[C_Regi] ([C_Id], [C_Name], [Email], [Web_S], [Establish_date], [Entry_Date], [Password]) VALUES (10, N'Tomal', N'gfsgdfh@gmail.com', N'gfsgdfh@gmail.com', CAST(N'2018-11-26' AS Date), CAST(N'2018-11-26T00:00:00.000' AS DateTime), N'1234')
INSERT [dbo].[C_Regi] ([C_Id], [C_Name], [Email], [Web_S], [Establish_date], [Entry_Date], [Password]) VALUES (16, N'Diu', N'toriq@gmail.com', N'diu', CAST(N'2018-11-26' AS Date), CAST(N'2018-11-26T00:00:00.000' AS DateTime), N'1234')
INSERT [dbo].[C_Regi] ([C_Id], [C_Name], [Email], [Web_S], [Establish_date], [Entry_Date], [Password]) VALUES (18, N'gsgga', N'tori@gmail.com', N'toriqul.pdap@gmail.com', CAST(N'2018-11-27' AS Date), CAST(N'2018-11-27T00:00:00.000' AS DateTime), N'1234')
INSERT [dbo].[C_Regi] ([C_Id], [C_Name], [Email], [Web_S], [Establish_date], [Entry_Date], [Password]) VALUES (19, N'toriqul', N'tori@gmail.com', N'toriqul.pdap@gmail.com', CAST(N'2018-11-28' AS Date), CAST(N'2018-11-28T00:00:00.000' AS DateTime), N'1234')
INSERT [dbo].[C_Regi] ([C_Id], [C_Name], [Email], [Web_S], [Establish_date], [Entry_Date], [Password]) VALUES (20, N'Dafodil', N'toriqul@gmail.com', N'WWW.Diu.com', CAST(N'2018-11-28' AS Date), CAST(N'2018-11-28T00:00:00.000' AS DateTime), N'1234')
INSERT [dbo].[C_Regi] ([C_Id], [C_Name], [Email], [Web_S], [Establish_date], [Entry_Date], [Password]) VALUES (21, N'Pabna', N'tofa@gmail.com', N'WWW.pabna.com', CAST(N'2018-11-28' AS Date), CAST(N'2018-11-28T00:00:00.000' AS DateTime), N'12345')
INSERT [dbo].[C_Regi] ([C_Id], [C_Name], [Email], [Web_S], [Establish_date], [Entry_Date], [Password]) VALUES (22, N'toriqul', N'tori@gmail.com', N'toriqul.pdap@gmail.com', CAST(N'2018-11-29' AS Date), CAST(N'2018-11-29T00:00:00.000' AS DateTime), N'2345')
INSERT [dbo].[C_Regi] ([C_Id], [C_Name], [Email], [Web_S], [Establish_date], [Entry_Date], [Password]) VALUES (23, N'toriqul', N'tori@gmail.com', N'toriqul.pdap@gmail.com', CAST(N'2018-11-29' AS Date), CAST(N'2018-11-29T00:00:00.000' AS DateTime), N'1234')
SET IDENTITY_INSERT [dbo].[C_Regi] OFF
INSERT [dbo].[postjobs] ([J_Id], [Title], [Name], [Status], [Educational], [Experience], [Location], [Salary], [Source], [Vacancy], [date]) VALUES (0, N'MANAGER', N'Tiger it', N'partTime', N'B.S.C', N'2 years', N'dhaka', N'50000', N'jobprotalbd', N'39', CAST(N'2018-12-03' AS Date))
INSERT [dbo].[postjobs] ([J_Id], [Title], [Name], [Status], [Educational], [Experience], [Location], [Salary], [Source], [Vacancy], [date]) VALUES (1, N'manager', N'Tiger', N'FulTime', N'B.S.C', N'5Years', N'Dhanmondhi', N'40000', N'jobprotal', N'50', CAST(N'2018-11-11' AS Date))
INSERT [dbo].[postjobs] ([J_Id], [Title], [Name], [Status], [Educational], [Experience], [Location], [Salary], [Source], [Vacancy], [date]) VALUES (14, N'Manager', N'Tiger it', N'FullTime', N'B.S.C', N'2 years', N'Dhanmodhi', N'10000', N'www.jobprotalbd.com', N'40', CAST(N'2018-02-04' AS Date))
INSERT [dbo].[postjobs] ([J_Id], [Title], [Name], [Status], [Educational], [Experience], [Location], [Salary], [Source], [Vacancy], [date]) VALUES (25, N'Manager', N'Software it', N'FulTime', N'B.S.C', N'3Years', N'Dhanmondhi', N'18000', N'www.jobprotalbd.com', N'50', CAST(N'2018-12-03' AS Date))
INSERT [dbo].[postjobs] ([J_Id], [Title], [Name], [Status], [Educational], [Experience], [Location], [Salary], [Source], [Vacancy], [date]) VALUES (123, N'Swe', N'dafd', N'FullTime', N'B.S.C', N'2 years', N'dhaka', N'5000', N'jobprotalbd', N'39', CAST(N'2018-12-06' AS Date))
SET IDENTITY_INSERT [dbo].[Registration] ON 

INSERT [dbo].[Registration] ([Sheker_Id], [FirstName], [LastName], [State], [City], [Gender], [Date_Of_Birth], [Contact_Number]) VALUES (2, N'Toriqul', N'Islam', N'Dhaka', N'Dhanmondhi', N'Male', CAST(N'2018-11-30' AS Date), 1707518358)
INSERT [dbo].[Registration] ([Sheker_Id], [FirstName], [LastName], [State], [City], [Gender], [Date_Of_Birth], [Contact_Number]) VALUES (3, N'Toriqul', N'Islam', N'Pabna', N'Pabna', N'Male', CAST(N'2018-12-02' AS Date), 1707518358)
INSERT [dbo].[Registration] ([Sheker_Id], [FirstName], [LastName], [State], [City], [Gender], [Date_Of_Birth], [Contact_Number]) VALUES (4, N'Mantaka', N'Ornob', N'Bogura', N'Bogura', N'Male', CAST(N'2018-12-02' AS Date), 1795400475)
SET IDENTITY_INSERT [dbo].[Registration] OFF
SET IDENTITY_INSERT [dbo].[She_Regi] ON 

INSERT [dbo].[She_Regi] ([She_Id], [Email], [Name], [Password], [Phone_N], [Entry_Date]) VALUES (3, N'tori@gmail.com', N'tomal', N'1234', N'171077316812', CAST(N'2018-11-29' AS Date))
INSERT [dbo].[She_Regi] ([She_Id], [Email], [Name], [Password], [Phone_N], [Entry_Date]) VALUES (4, N'toriq@gmail.com', N'Md Toriqul islam', N'1234', N'01707518358', CAST(N'2018-11-29' AS Date))
INSERT [dbo].[She_Regi] ([She_Id], [Email], [Name], [Password], [Phone_N], [Entry_Date]) VALUES (5, N'toriq@gmail.com', N'Md Toriqul islam', N'1234', N'01707518358', CAST(N'2018-11-29' AS Date))
INSERT [dbo].[She_Regi] ([She_Id], [Email], [Name], [Password], [Phone_N], [Entry_Date]) VALUES (1004, N'toriq@gmail.com', N'Md Toriqul islam', N'1234', N'01707518358', CAST(N'2018-11-30' AS Date))
INSERT [dbo].[She_Regi] ([She_Id], [Email], [Name], [Password], [Phone_N], [Entry_Date]) VALUES (1005, N'mantaka.390ornob@gmail.com', N'Mantaka Ornob', N'1212', N'01795400475', CAST(N'2018-12-02' AS Date))
INSERT [dbo].[She_Regi] ([She_Id], [Email], [Name], [Password], [Phone_N], [Entry_Date]) VALUES (2004, N'mantaka.390ornob@gmail.com', N'Mantaka Ornob', N'1234', N'01795400475', CAST(N'2018-12-07' AS Date))
SET IDENTITY_INSERT [dbo].[She_Regi] OFF
ALTER TABLE [dbo].[Area]  WITH CHECK ADD  CONSTRAINT [FK_Area_CompanyP] FOREIGN KEY([Area_Id])
REFERENCES [dbo].[CompanyP] ([C_Id])
GO
ALTER TABLE [dbo].[Area] CHECK CONSTRAINT [FK_Area_CompanyP]
GO
ALTER TABLE [dbo].[City]  WITH CHECK ADD  CONSTRAINT [FK_City_CompanyP3] FOREIGN KEY([Ci_Id])
REFERENCES [dbo].[CompanyP] ([C_Id])
GO
ALTER TABLE [dbo].[City] CHECK CONSTRAINT [FK_City_CompanyP3]
GO
ALTER TABLE [dbo].[CompanyP]  WITH CHECK ADD  CONSTRAINT [FK_CompanyP_C_Regi1] FOREIGN KEY([C_Id])
REFERENCES [dbo].[C_Regi] ([C_Id])
GO
ALTER TABLE [dbo].[CompanyP] CHECK CONSTRAINT [FK_CompanyP_C_Regi1]
GO
ALTER TABLE [dbo].[Interview]  WITH CHECK ADD  CONSTRAINT [FK_Interview_Admin] FOREIGN KEY([Ad_Id])
REFERENCES [dbo].[Admin] ([Ad_Id])
GO
ALTER TABLE [dbo].[Interview] CHECK CONSTRAINT [FK_Interview_Admin]
GO
ALTER TABLE [dbo].[Interview]  WITH CHECK ADD  CONSTRAINT [FK_Interview_CompanyP] FOREIGN KEY([C_Id])
REFERENCES [dbo].[CompanyP] ([C_Id])
GO
ALTER TABLE [dbo].[Interview] CHECK CONSTRAINT [FK_Interview_CompanyP]
GO
/****** Object:  StoredProcedure [dbo].[Add_Admin]    Script Date: 12/7/2018 2:42:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[Add_Admin](

@Email varchar (50),
@Password Varchar (50)

)
AS
BEGIN
Insert into Admin values(@Email,@Password)

END
GO
/****** Object:  StoredProcedure [dbo].[Add_Interview]    Script Date: 12/7/2018 2:42:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[Add_Interview](

@She_Id int,
@Ad_Id int,
@C_Id int,
@Question Varchar (50),
@Contact int ,
@Answer varchar (50),
@Time time

)
AS
BEGIN
Insert into Interview values(@She_Id,@Ad_Id,@C_Id,@Question,@Answer,@Time)

END
GO
/****** Object:  StoredProcedure [dbo].[Add_Notice]    Script Date: 12/7/2018 2:42:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[Add_Notice](

@C_Id int,
@Ad_Id int,
@Subject Varchar (50),
@Title varchar (50),
@Publish_Date DATE
)
AS
BEGIN
Insert into Notice values(@C_Id,@Ad_Id,@Subject,@Title,@Publish_Date)

END
GO
/****** Object:  StoredProcedure [dbo].[Add_Registration]    Script Date: 12/7/2018 2:42:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[Add_Registration](
@E_Mail varchar (50),
@FastName varchar(50),
@LastName varchar(50),
@State varchar(50),
@City Varchar (50),
@Gender Varchar (50),
@Date_Of_Birth date,
@Date_Of_Entry date,
@Contact_Numbe image,
@Password int,
@IsEmailVerried bit,
@ActivationCode uniqueidentifier

)
AS
BEGIN
insert into Registration values (@E_Mail,@FastName,@LastName,@State,@City,@Gender,@Date_Of_Birth,@Date_Of_Entry,@Contact_Numbe,@Password,@IsEmailVerried,@ActivationCode)

END
GO
/****** Object:  StoredProcedure [dbo].[Add_Resume]    Script Date: 12/7/2018 2:42:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[Add_Resume](

@Name varchar(50),
@Gender Varchar (50),
@Qualification varchar (50),
@Certificate varchar(50)

)
AS
BEGIN
insert into Resume values (@Name,@Gender,@Qualification,@Certificate)

END
GO
/****** Object:  StoredProcedure [dbo].[AddC_Registar]    Script Date: 12/7/2018 2:42:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[AddC_Registar](

@C_Name varchar(50),
@Email varchar(50),
@Web_S Varchar (50),
@Establish_date date,
@Entry_date date,
@Password int

)
AS
BEGIN
Insert into C_Regi values(@C_Name,@Email,@Web_S,@Establish_date,@Entry_date,@Password)

END
GO
/****** Object:  StoredProcedure [dbo].[AddShee_Regi]    Script Date: 12/7/2018 2:42:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[AddShee_Regi](

@Email varchar(50),
@Name varchar(50),
@Password int ,
@Phone_N  varchar (50),
@Entry_Date date


)
AS
BEGIN
Insert into She_Regi values(@Email,@Name,@Password,@Phone_N,@Entry_Date)

END
GO
/****** Object:  StoredProcedure [dbo].[CompanyProfile]    Script Date: 12/7/2018 2:42:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[CompanyProfile](

@Name nvarchar(50),
@UserName nvarchar(50),
@Contact_Number nvarchar(50),
@State nvarchar(50),
@City nvarchar(50),
@Address nvarchar(50),
@Establish_Date nvarchar(50),
@Details nvarchar(50)
)
as
begin
Insert into CompanyP values(@Name,@UserName,@Contact_Number,@State,@City,@Address,@Establish_Date,@Details)
end
GO
/****** Object:  StoredProcedure [dbo].[CompanyProfileView]    Script Date: 12/7/2018 2:42:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[CompanyProfileView]
as

begin 
Select * FROM CompanyP
end
GO
/****** Object:  StoredProcedure [dbo].[Delete_Admin]    Script Date: 12/7/2018 2:42:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[Delete_Admin]
(

@Email Varchar
)
AS
BEGIN
 delete from Admin where Email=@Email
END
GO
/****** Object:  StoredProcedure [dbo].[Delete_Notice]    Script Date: 12/7/2018 2:42:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[Delete_Notice]
(

@C_Id Varchar
)
AS
BEGIN
 delete from Notice where C_Id=@C_Id
END
GO
/****** Object:  StoredProcedure [dbo].[Delete_Noticee]    Script Date: 12/7/2018 2:42:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[Delete_Noticee]
(

@Ad_Id Varchar
)
AS
BEGIN
 delete from Notice where Ad_Id=@Ad_Id
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteC_regi]    Script Date: 12/7/2018 2:42:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[DeleteC_regi]  
(  
   @C_Id INT 
)  
as   
begin  
   Delete from C_Regi where C_Id=@C_Id  
End
GO
/****** Object:  StoredProcedure [dbo].[Deletedsheekerprofile]    Script Date: 12/7/2018 2:42:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[Deletedsheekerprofile](

@Sheker_Id int
)
as 
begin
delete from Registration where Sheker_Id=@Sheker_Id

end
GO
/****** Object:  StoredProcedure [dbo].[Deletejobpost]    Script Date: 12/7/2018 2:42:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[Deletejobpost](
@J_Id int
)
as
begin
delete from postjobs where J_Id=@J_Id
end
GO
/****** Object:  StoredProcedure [dbo].[deletesheeker]    Script Date: 12/7/2018 2:42:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[deletesheeker](

@She_Id int

)
as
begin
delete  from She_Regi where She_Id=@She_Id
end
GO
/****** Object:  StoredProcedure [dbo].[job]    Script Date: 12/7/2018 2:42:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[job](
@J_Id int,
@Title varchar(50),
@Name varchar(50),
@Status varchar(50),
@Educational varchar(50),
@Experience varchar(50),
@Location varchar(50),
@Salary varchar(50),
@Source varchar(50),
@Vacancy varchar(50),
@date date

)
as
begin
insert into postjobs values(@J_Id,@Title,@Name,@Status,@Educational,@Experience,@Location,@Salary,@Source,@Vacancy,@date)
end
GO
/****** Object:  StoredProcedure [dbo].[postjobadmin]    Script Date: 12/7/2018 2:42:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[postjobadmin](

@Job_Title varchar(50),
@Company_Name varchar(50),
@Employee_Status varchar(50),
@Educational_R varchar(50),
@Experience_R varchar(50),
@Job_Location varchar(50),
@Salary varchar(50),
@Job_Source varchar(50),
@No_Vacancy varchar(50),
@L_date date

)
as
begin
insert into postjobs values (@Job_Title,@Company_Name,@Employee_Status,@Educational_R,@Experience_R,@Experience_R,@Job_Location,@Salary,@Job_Source,@No_Vacancy,@L_date)
end
GO
/****** Object:  StoredProcedure [dbo].[postjobcompany]    Script Date: 12/7/2018 2:42:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[postjobcompany](

@Title varchar(50),
@Name varchar(50),
@Status varchar(50),
@Educational varchar(50),
@Experience varchar(50),
@Location varchar(50),
@Salary varchar(50),
@Source varchar(50),
@Vacancy varchar(50),
@date date

)
as
begin
insert into postjobs values (@Title,@Name,@Status,@Educational,@Experience,@Experience,@Location,@Salary,@Source,@Vacancy,@date)
end
GO
/****** Object:  StoredProcedure [dbo].[sheeker]    Script Date: 12/7/2018 2:42:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[sheeker](

@FirstName varchar(50),
@LastName varchar(50),
@State varchar(50),
@City varchar(50),
@Gender varchar(50),
@Date_Of_Birth date,
@Contact_Number int


)
as
begin

insert into Registration values(@FirstName,@LastName,@State,@City,@Gender,@Date_Of_Birth,@Contact_Number)

end

GO
/****** Object:  StoredProcedure [dbo].[Update_InterviewAd]    Script Date: 12/7/2018 2:42:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[Update_InterviewAd](
@C_Id int,
@Ad_Id int,
@Question varchar(50),
@Answer varchar(50),
@Time datetime
)
AS
BEGIN
Update Interview set @C_Id=@C_Id,
                 Question=@Question,
				 Answer=@Answer,
				 Time=@Time
				 
		   
		  where  Ad_Id=@Ad_Id

END
GO
/****** Object:  StoredProcedure [dbo].[Update_InterviewC]    Script Date: 12/7/2018 2:42:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[Update_InterviewC](
@C_Id int,
@Ad_Id int,
@Question varchar(50),
@Answer varchar(50),
@Time datetime
)
AS
BEGIN
Update Interview set @Ad_Id=@Ad_Id,
                 Question=@Question,
				 Answer=@Answer,
				 Time=@Time
				 
		   
		  where  C_Id=@C_Id

END
GO
/****** Object:  StoredProcedure [dbo].[Update_JobPostC]    Script Date: 12/7/2018 2:42:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[Update_JobPostC](
@C_Id int,
@Ad_Id int,
@Job_Title varchar(50),
@post varchar(50),
@No_Vacancy int,
@S_Date date
)
AS
BEGIN
Update Job_Post set Ad_Id=@Ad_Id,
                 Job_Title=@Job_Title,
				 Post=@Post,
				 No_Vacancy=@No_Vacancy,
				 S_Date=@S_Date
				 
		  where  C_Id=@C_Id

END
GO
/****** Object:  StoredProcedure [dbo].[Update_NoticeAd]    Script Date: 12/7/2018 2:42:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[Update_NoticeAd](
@C_Id int,
@Ad_Id int,
@Subject varchar(50),
@Title varchar(50),
@Publish_Date date
)
AS
BEGIN
Update Notice set C_Id=@C_Id,
                 Subject=@Subject,
				 Title=@Title,
				 Publish_Date=@Publish_Date
		  where  Ad_Id=@Ad_Id

END
GO
/****** Object:  StoredProcedure [dbo].[Update_NoticeC]    Script Date: 12/7/2018 2:42:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[Update_NoticeC](
@C_Id int,
@Ad_Id int,
@Subject varchar(50),
@Title varchar(50),
@Publish_Date date
)
AS
BEGIN
Update Notice set Ad_Id=@Ad_Id,
                 Subject=@Subject,
				 Title=@Title,
				 Publish_Date=@Publish_Date
		  where  C_Id=@C_Id

END
GO
/****** Object:  StoredProcedure [dbo].[UpdateC_Regi]    Script Date: 12/7/2018 2:42:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[UpdateC_Regi](
@C_Id int,
@C_Name varchar(50),
@Email varchar(50),
@Web_S Varchar (50),
@Established_date date,
@Entry_date date,
@Password int

)
AS
BEGIN
Update C_Regi set C_Name=@C_Name,
           Email=@Email,
		   Web_S=@Web_S,
		 
		  Entry_date=@Entry_date,
		  Password=@Password
		  where C_Id=@C_Id

END
GO
/****** Object:  StoredProcedure [dbo].[UPDATECOMPANYS]    Script Date: 12/7/2018 2:42:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UPDATECOMPANYS](

@C_Id int,
@C_Name varchar(50),
@Email varchar(50),
@Web_S Varchar (50),
@Establish_date date,
@Entry_date date,
@Password int


)
AS 

BEGIN 
Update C_Regi set 
          C_Name=@C_Name,
           Email=@Email,
		   Web_S=@Web_S,
		  Establish_date=@Establish_date,
		  Entry_date=@Entry_date,
		  Password=@Password
		  where C_Id=@C_Id


END
GO
/****** Object:  StoredProcedure [dbo].[UpdateeC_Regi]    Script Date: 12/7/2018 2:42:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[UpdateeC_Regi](
@C_Id int,
@C_Name varchar(50),
@Email varchar(50),
@Web_S Varchar (50),
@Established_date date,
@Entry_date date,
@Password int

)
AS
BEGIN
Update C_Regi set C_Name=@C_Name,
           Email=@Email,
		   Web_S=@Web_S,
		   
		  Entry_date=@Entry_date,
		  Password=@Password
		  where C_Id=@C_Id

END
GO
/****** Object:  StoredProcedure [dbo].[Updateheekerprofile]    Script Date: 12/7/2018 2:42:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Updateheekerprofile](

@Sheker_Id int,
@FirstName varchar (50),
@LastName varchar (50),
@state varchar (50),
@City varchar (50),
@Gender varchar(50),
@Date_Of_Birth date,
@Contact_Number int

)
as 
begin
Update Registration set  FirstName=@FirstName,
                         LastName=@LastName,
						 State=@state,
						 City=@City,
						 Gender=@Gender,
						 Date_Of_Birth=@Date_Of_Birth,
						 Contact_Number=@Contact_Number
end
GO
/****** Object:  StoredProcedure [dbo].[updatejobpost]    Script Date: 12/7/2018 2:42:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[updatejobpost](
@J_Id int,
@Title varchar(50),
@Name varchar(50),
@Status varchar(50),
@Educational varchar(50),
@Experience varchar(50),
@Location varchar(50),
@Salary varchar(50),
@Source varchar(50),
@Vacancy varchar(50),
@date varchar(50)
)
as
begin
update postjobs set Title=@Title,
                    Name=@Name,
					Status=@Status,
					Educational=@Educational,
					Experience=@Experience,
					Location=@Location,
					Salary=@Salary,
				    Source=@Source,
					Vacancy=@Vacancy,
					date=@date

					where J_Id=@J_Id

end
GO
/****** Object:  StoredProcedure [dbo].[updatesheeker]    Script Date: 12/7/2018 2:42:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[updatesheeker](
@Email varchar(50),
@Name varchar (50),
@Password varchar (50),
@Phone_N varchar(50),
@Entry_Date date


)
as
begin
update She_Regi set Email=@Email,
                    Name=@Name,
					Password=@Password,
					Phone_N=@Phone_N,
					Entry_Date=@Entry_Date
					where She_Id=She_Id

end
GO
/****** Object:  StoredProcedure [dbo].[View_Companys]    Script Date: 12/7/2018 2:42:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[View_Companys]

AS
BEGIN
 Select * from CompanyP
END
GO
/****** Object:  StoredProcedure [dbo].[View_Interview]    Script Date: 12/7/2018 2:42:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[View_Interview]

AS
BEGIN
 Select * from Interview
END
GO
/****** Object:  StoredProcedure [dbo].[View_JobPst]    Script Date: 12/7/2018 2:42:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[View_JobPst]

AS
BEGIN
 Select * from Job_Post
END
GO
/****** Object:  StoredProcedure [dbo].[View_Notice]    Script Date: 12/7/2018 2:42:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[View_Notice]

AS
BEGIN
 Select * from Notice
END
GO
/****** Object:  StoredProcedure [dbo].[View_Notices]    Script Date: 12/7/2018 2:42:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[View_Notices]

AS
BEGIN
 Select * from Notice
END
GO
/****** Object:  StoredProcedure [dbo].[View_Registrations]    Script Date: 12/7/2018 2:42:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[View_Registrations]

AS
BEGIN
 Select * from Registration
END
GO
/****** Object:  StoredProcedure [dbo].[Viewc_Regi]    Script Date: 12/7/2018 2:42:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[Viewc_Regi]

AS
BEGIN
 Select * from C_Regi
END
GO
/****** Object:  StoredProcedure [dbo].[viewjobpost]    Script Date: 12/7/2018 2:42:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[viewjobpost]
as
begin
select * from postjobs
end
GO
/****** Object:  StoredProcedure [dbo].[ViewShe_Regi]    Script Date: 12/7/2018 2:42:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[ViewShe_Regi]

AS
BEGIN
 Select * from She_Regi
END
GO
/****** Object:  StoredProcedure [dbo].[Viewsheekerprofile]    Script Date: 12/7/2018 2:42:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[Viewsheekerprofile]
as 
begin
select * from Registration
end
GO
USE [master]
GO
ALTER DATABASE [JobProtalBd] SET  READ_WRITE 
GO
