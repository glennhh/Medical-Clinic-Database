USE [master]
GO
/****** Object:  Database [ClinicDB]    Script Date: 3/20/2019 11:46:59 AM ******/
CREATE DATABASE [ClinicDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ClinicDB_Data', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\ClinicDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ClinicDB_Log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\ClinicDB.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ClinicDB] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ClinicDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ClinicDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ClinicDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ClinicDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ClinicDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ClinicDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [ClinicDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ClinicDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ClinicDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ClinicDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ClinicDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ClinicDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ClinicDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ClinicDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ClinicDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ClinicDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ClinicDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ClinicDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ClinicDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ClinicDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ClinicDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ClinicDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ClinicDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ClinicDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ClinicDB] SET  MULTI_USER 
GO
ALTER DATABASE [ClinicDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ClinicDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ClinicDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ClinicDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ClinicDB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ClinicDB', N'ON'
GO
ALTER DATABASE [ClinicDB] SET QUERY_STORE = OFF
GO
USE [ClinicDB]
GO
/****** Object:  Schema [Medical Clinic]    Script Date: 3/20/2019 11:46:59 AM ******/
CREATE SCHEMA [Medical Clinic]
GO
/****** Object:  Table [dbo].[APPOINTMENT]    Script Date: 3/20/2019 11:46:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[APPOINTMENT](
	[Appt_ID] [int] NOT NULL,
	[Appt_Doc_ID] [int] NOT NULL,
	[Appt_Pat_ID] [int] NOT NULL,
	[Appt_Office_ID] [int] NOT NULL,
	[Appt_Date] [date] NULL,
 CONSTRAINT [PK_APPOINTMENT] PRIMARY KEY CLUSTERED 
(
	[Appt_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[APPROVAL]    Script Date: 3/20/2019 11:46:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[APPROVAL](
	[App_ID] [int] NOT NULL,
	[App_Doc_ID] [int] NOT NULL,
	[App_Pat_ID] [int] NOT NULL,
	[App_Spec_ID] [int] NOT NULL,
	[App_Given] [bit] NULL,
 CONSTRAINT [PK_APPROVAL] PRIMARY KEY CLUSTERED 
(
	[App_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BLOOD_TEST]    Script Date: 3/20/2019 11:46:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BLOOD_TEST](
	[BT_ID] [int] NOT NULL,
	[BT_APPT_ID] [int] NOT NULL,
	[BT_RBC] [float] NULL,
	[BT_WBC] [float] NULL,
	[BT_Platelet_Cnt] [float] NULL,
	[BT_Hgb] [float] NULL,
	[BT_Hct] [float] NULL,
	[BT_MCV] [float] NULL,
 CONSTRAINT [PK_BLOOD_TEST] PRIMARY KEY CLUSTERED 
(
	[BT_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DIAGNOSIS]    Script Date: 3/20/2019 11:46:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIAGNOSIS](
	[Diag_ID] [int] NOT NULL,
	[Diag_Appt_ID] [int] NOT NULL,
	[Diag_Desc] [varbinary](50) NULL,
 CONSTRAINT [PK_DIAGNOSIS] PRIMARY KEY CLUSTERED 
(
	[Diag_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DOCTOR]    Script Date: 3/20/2019 11:46:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DOCTOR](
	[Doc_ID] [int] NOT NULL,
	[Doc_Name_F] [varchar](10) NULL,
	[Doc_Name_L] [varchar](10) NULL,
	[Doc_Email] [varchar](20) NULL,
	[Doc_DOB] [date] NULL,
	[Doc_Phone] [varchar](10) NULL,
	[Doc_Gender] [char](1) NULL,
	[Doc_Specialization] [varchar](40) NULL,
	[Doc_Addr_Street] [varchar](30) NULL,
	[Doc_Addr_2] [varchar](30) NULL,
	[Doc_Addr_City] [varchar](20) NULL,
	[Doc_Addr_State] [char](2) NULL,
	[Doc_Addr_Zip] [int] NULL,
 CONSTRAINT [PK_DOCTOR] PRIMARY KEY CLUSTERED 
(
	[Doc_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LOGIN]    Script Date: 3/20/2019 11:46:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOGIN](
	[Log_User_Name] [varchar](20) NOT NULL,
	[Log_Pass] [varchar](10) NOT NULL,
	[Log_Doc_ID] [int] NOT NULL,
	[Log_Pat_ID] [int] NOT NULL,
	[Log_OA_ID] [int] NOT NULL,
	[Log_User_Type] [char](1) NOT NULL,
 CONSTRAINT [PK_LOGIN] PRIMARY KEY CLUSTERED 
(
	[Log_User_Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OFFICE]    Script Date: 3/20/2019 11:46:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OFFICE](
	[Off_ID] [int] NOT NULL,
	[Off_Sched_Mon] [int] NULL,
	[Off_Sched_Tue] [int] NULL,
	[Off_Sched_Wed] [int] NULL,
	[Off_Sched_Thu] [int] NULL,
	[Off_Sched_Fri] [int] NULL,
	[Off_Sched_Sat] [int] NULL,
	[Off_Sched_Sun] [int] NULL,
	[Off_Addr_Street] [varchar](30) NOT NULL,
	[Off_Addr_2] [varchar](20) NULL,
	[Off_Addr_City] [varchar](10) NOT NULL,
	[Off_Addr_State] [varchar](10) NOT NULL,
	[Off_Addr_Zip] [int] NOT NULL,
 CONSTRAINT [PK_OFFICE] PRIMARY KEY CLUSTERED 
(
	[Off_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OFFICE_ADMIN]    Script Date: 3/20/2019 11:47:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OFFICE_ADMIN](
	[OA_ID] [int] NOT NULL,
	[OA_Role] [varchar](10) NOT NULL,
	[OA_Name_F] [varchar](10) NOT NULL,
	[OA_Name_L] [varchar](10) NOT NULL,
	[OA_Gender] [char](1) NULL,
	[OD_DOB] [date] NULL,
	[OA_Addr_Street] [varchar](30) NOT NULL,
	[OA_Addr_2] [varchar](20) NULL,
	[OA_Addr_City] [varchar](10) NOT NULL,
	[OA_Addr_State] [varchar](10) NOT NULL,
	[OA_Addr_Zip] [int] NOT NULL,
 CONSTRAINT [PK_OFFICE_ADMIN] PRIMARY KEY CLUSTERED 
(
	[OA_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PATIENT]    Script Date: 3/20/2019 11:47:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PATIENT](
	[Pat_ID] [int] NOT NULL,
	[Pat_Name_F] [varchar](20) NULL,
	[Pat_Name_L] [varchar](10) NULL,
	[Pat_Height] [float] NULL,
	[Pat_Weight] [float] NULL,
	[Pat_Gender] [char](1) NULL,
	[Pat_Email] [varchar](20) NULL,
	[Pat_Phone] [varchar](10) NULL,
	[Pat_DOB] [date] NULL,
	[Pat_Addr_Street] [varchar](30) NULL,
	[Pat_Addr_2] [varchar](20) NULL,
	[Pat_Addr_City] [varchar](10) NULL,
	[Pat_Addr_State] [char](2) NULL,
	[Pat_Addr_Zip] [int] NULL,
	[Pat_Created_By] [int] NOT NULL,
	[Pat_Updated_By] [int] NOT NULL,
	[Pat_Created_Date] [date] NULL,
	[Pat_Updated_Date] [date] NULL,
 CONSTRAINT [PK_PAITENT] PRIMARY KEY CLUSTERED 
(
	[Pat_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PRESCRIPTION]    Script Date: 3/20/2019 11:47:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRESCRIPTION](
	[Pre_ID] [int] NOT NULL,
	[Pre_Appt_ID] [int] NULL,
	[Pre_Name] [varchar](10) NULL,
	[Pre_Refills_Allowed] [int] NULL,
	[Pre_Refills_Filled] [int] NULL,
 CONSTRAINT [PK_PRESCRIPTION] PRIMARY KEY CLUSTERED 
(
	[Pre_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[APPROVAL]  WITH CHECK ADD  CONSTRAINT [FK_APPROVAL_DOCTOR] FOREIGN KEY([App_Doc_ID])
REFERENCES [dbo].[DOCTOR] ([Doc_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[APPROVAL] CHECK CONSTRAINT [FK_APPROVAL_DOCTOR]
GO
ALTER TABLE [dbo].[APPROVAL]  WITH CHECK ADD  CONSTRAINT [FK_APPROVAL_PATIENT] FOREIGN KEY([App_Pat_ID])
REFERENCES [dbo].[PATIENT] ([Pat_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[APPROVAL] CHECK CONSTRAINT [FK_APPROVAL_PATIENT]
GO
ALTER TABLE [dbo].[BLOOD_TEST]  WITH CHECK ADD  CONSTRAINT [FK_BLOOD_TEST_APPOINTMENT] FOREIGN KEY([BT_ID])
REFERENCES [dbo].[APPOINTMENT] ([Appt_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BLOOD_TEST] CHECK CONSTRAINT [FK_BLOOD_TEST_APPOINTMENT]
GO
ALTER TABLE [dbo].[DIAGNOSIS]  WITH CHECK ADD  CONSTRAINT [FK_DIAGNOSIS_APPOINTMENT] FOREIGN KEY([Diag_Appt_ID])
REFERENCES [dbo].[APPOINTMENT] ([Appt_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DIAGNOSIS] CHECK CONSTRAINT [FK_DIAGNOSIS_APPOINTMENT]
GO
ALTER TABLE [dbo].[LOGIN]  WITH CHECK ADD  CONSTRAINT [FK_LOGIN_DOCTOR] FOREIGN KEY([Log_Doc_ID])
REFERENCES [dbo].[DOCTOR] ([Doc_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LOGIN] CHECK CONSTRAINT [FK_LOGIN_DOCTOR]
GO
ALTER TABLE [dbo].[LOGIN]  WITH CHECK ADD  CONSTRAINT [FK_LOGIN_OA] FOREIGN KEY([Log_OA_ID])
REFERENCES [dbo].[OFFICE_ADMIN] ([OA_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LOGIN] CHECK CONSTRAINT [FK_LOGIN_OA]
GO
ALTER TABLE [dbo].[LOGIN]  WITH CHECK ADD  CONSTRAINT [FK_LOGIN_PATIENT] FOREIGN KEY([Log_Pat_ID])
REFERENCES [dbo].[PATIENT] ([Pat_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LOGIN] CHECK CONSTRAINT [FK_LOGIN_PATIENT]
GO
ALTER TABLE [dbo].[PRESCRIPTION]  WITH CHECK ADD  CONSTRAINT [FK_PRESCRIPTION_APPOINTMENT] FOREIGN KEY([Pre_Appt_ID])
REFERENCES [dbo].[APPOINTMENT] ([Appt_ID])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[PRESCRIPTION] CHECK CONSTRAINT [FK_PRESCRIPTION_APPOINTMENT]
GO
ALTER TABLE [dbo].[APPOINTMENT]  WITH CHECK ADD CHECK  (([Appt_ID]>(0)))
GO
ALTER TABLE [dbo].[APPROVAL]  WITH CHECK ADD CHECK  (([App_ID]>=(0)))
GO
ALTER TABLE [dbo].[BLOOD_TEST]  WITH CHECK ADD CHECK  (([BT_Hct]>(0)))
GO
ALTER TABLE [dbo].[BLOOD_TEST]  WITH CHECK ADD CHECK  (([BT_Hgb]>(0)))
GO
ALTER TABLE [dbo].[BLOOD_TEST]  WITH CHECK ADD CHECK  (([BT_MCV]>(0)))
GO
ALTER TABLE [dbo].[BLOOD_TEST]  WITH CHECK ADD CHECK  (([BT_Platelet_Cnt]>(0)))
GO
ALTER TABLE [dbo].[BLOOD_TEST]  WITH CHECK ADD CHECK  (([BT_RBC]>(0)))
GO
ALTER TABLE [dbo].[BLOOD_TEST]  WITH CHECK ADD CHECK  (([BT_WBC]>(0)))
GO
ALTER TABLE [dbo].[DIAGNOSIS]  WITH CHECK ADD CHECK  (([Diag_ID]>=(0)))
GO
ALTER TABLE [dbo].[DOCTOR]  WITH CHECK ADD CHECK  (([Doc_Addr_State]='WY' OR [Doc_Addr_State]='WV' OR [Doc_Addr_State]='WI' OR [Doc_Addr_State]='WA' OR [Doc_Addr_State]='VT' OR [Doc_Addr_State]='VA' OR [Doc_Addr_State]='UT' OR [Doc_Addr_State]='TX' OR [Doc_Addr_State]='TN' OR [Doc_Addr_State]='SD' OR [Doc_Addr_State]='SC' OR [Doc_Addr_State]='RI' OR [Doc_Addr_State]='PA' OR [Doc_Addr_State]='OR' OR [Doc_Addr_State]='OK' OR [Doc_Addr_State]='OH' OR [Doc_Addr_State]='NY' OR [Doc_Addr_State]='NV' OR [Doc_Addr_State]='NM' OR [Doc_Addr_State]='NJ' OR [Doc_Addr_State]='NH' OR [Doc_Addr_State]='NE' OR [Doc_Addr_State]='ND' OR [Doc_Addr_State]='NC' OR [Doc_Addr_State]='MT' OR [Doc_Addr_State]='MS' OR [Doc_Addr_State]='MO' OR [Doc_Addr_State]='MN' OR [Doc_Addr_State]='MI' OR [Doc_Addr_State]='ME' OR [Doc_Addr_State]='MD' OR [Doc_Addr_State]='MA' OR [Doc_Addr_State]='LA' OR [Doc_Addr_State]='KY' OR [Doc_Addr_State]='KS' OR [Doc_Addr_State]='IN' OR [Doc_Addr_State]='IL' OR [Doc_Addr_State]='ID' OR [Doc_Addr_State]='IA' OR [Doc_Addr_State]='HI' OR [Doc_Addr_State]='GA' OR [Doc_Addr_State]='FL' OR [Doc_Addr_State]='DE' OR [Doc_Addr_State]='CT' OR [Doc_Addr_State]='CO' OR [Doc_Addr_State]='CA' OR [Doc_Addr_State]='AZ' OR [Doc_Addr_State]='AR' OR [Doc_Addr_State]='AL' OR [Doc_Addr_State]='AK'))
GO
ALTER TABLE [dbo].[DOCTOR]  WITH CHECK ADD CHECK  (([Doc_Addr_Zip]>=(0) AND [Doc_Addr_Zip]<=(99999)))
GO
ALTER TABLE [dbo].[DOCTOR]  WITH CHECK ADD CHECK  (([Doc_Email] like '%@%'))
GO
ALTER TABLE [dbo].[DOCTOR]  WITH CHECK ADD CHECK  (([Doc_Gender]='F' OR [Doc_Gender]='M'))
GO
ALTER TABLE [dbo].[DOCTOR]  WITH CHECK ADD CHECK  (([Doc_ID]>(0)))
GO
ALTER TABLE [dbo].[DOCTOR]  WITH CHECK ADD CHECK  (([Doc_Phone] like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'))
GO
ALTER TABLE [dbo].[LOGIN]  WITH CHECK ADD  CONSTRAINT [CK__LOGIN__Log_Pass__5FB337D6] CHECK  ((len([Log_Pass])>=(8)))
GO
ALTER TABLE [dbo].[LOGIN] CHECK CONSTRAINT [CK__LOGIN__Log_Pass__5FB337D6]
GO
ALTER TABLE [dbo].[LOGIN]  WITH CHECK ADD  CONSTRAINT [CK__LOGIN__Log_User___60A75C0F] CHECK  ((len([Log_User_Name])>=(5) AND NOT [Log_User_Name] like '%/%' AND NOT [Log_User_Name] like '%|%' AND NOT [Log_User_Name] like '%\%' AND NOT [Log_User_Name] like '%?%' AND NOT [Log_User_Name] like '%<%' AND NOT [Log_User_Name] like '%>%' AND NOT [Log_User_Name] like '%(%' AND NOT [Log_User_Name] like '%)%' AND NOT [Log_User_Name] like '%[%' AND NOT [Log_User_Name] like '%]%' AND NOT [Log_User_Name] like '%{%' AND NOT [Log_User_Name] like '%}%' AND NOT [Log_User_Name] like '%*%' AND NOT [Log_User_Name] like '%&%' AND NOT [Log_User_Name] like '%$%' AND NOT [Log_User_Name] like '%%%' AND NOT [Log_User_Name] like '%#%' AND NOT [Log_User_Name] like '%^%' AND NOT [Log_User_Name] like '%!%' AND NOT [Log_User_Name] like '%+%' AND NOT [Log_User_Name] like '%=%' AND NOT [Log_User_Name] like '%~%' AND NOT [Log_User_Name] like '%`%' AND NOT [Log_User_Name] like '%,%'))
GO
ALTER TABLE [dbo].[LOGIN] CHECK CONSTRAINT [CK__LOGIN__Log_User___60A75C0F]
GO
ALTER TABLE [dbo].[LOGIN]  WITH CHECK ADD  CONSTRAINT [CK__LOGIN__Log_User___619B8048] CHECK  (([Log_User_Type]='A' OR [Log_User_Type]='D' OR [Log_User_Type]='P'))
GO
ALTER TABLE [dbo].[LOGIN] CHECK CONSTRAINT [CK__LOGIN__Log_User___619B8048]
GO
ALTER TABLE [dbo].[OFFICE]  WITH CHECK ADD  CONSTRAINT [CK_OFFICE_ZIP] CHECK  (([off_addr_zip]>=(0) AND [off_addr_zip]<=(99999) AND len([off_addr_zip])=(5)))
GO
ALTER TABLE [dbo].[OFFICE] CHECK CONSTRAINT [CK_OFFICE_ZIP]
GO
ALTER TABLE [dbo].[OFFICE_ADMIN]  WITH CHECK ADD  CONSTRAINT [CK_OFFICE_ADMIN] CHECK  (([oa_addr_zip]>=(0) AND [oa_addr_zip]<=(99999) AND len([oa_addr_zip])=(5)))
GO
ALTER TABLE [dbo].[OFFICE_ADMIN] CHECK CONSTRAINT [CK_OFFICE_ADMIN]
GO
ALTER TABLE [dbo].[PATIENT]  WITH CHECK ADD CHECK  (([Pat_Addr_State]='WY' OR [Pat_Addr_State]='WV' OR [Pat_Addr_State]='WI' OR [Pat_Addr_State]='WA' OR [Pat_Addr_State]='VT' OR [Pat_Addr_State]='VA' OR [Pat_Addr_State]='UT' OR [Pat_Addr_State]='TX' OR [Pat_Addr_State]='TN' OR [Pat_Addr_State]='SD' OR [Pat_Addr_State]='SC' OR [Pat_Addr_State]='RI' OR [Pat_Addr_State]='PA' OR [Pat_Addr_State]='OR' OR [Pat_Addr_State]='OK' OR [Pat_Addr_State]='OH' OR [Pat_Addr_State]='NY' OR [Pat_Addr_State]='NV' OR [Pat_Addr_State]='NM' OR [Pat_Addr_State]='NJ' OR [Pat_Addr_State]='NH' OR [Pat_Addr_State]='NE' OR [Pat_Addr_State]='ND' OR [Pat_Addr_State]='NC' OR [Pat_Addr_State]='MT' OR [Pat_Addr_State]='MS' OR [Pat_Addr_State]='MO' OR [Pat_Addr_State]='MN' OR [Pat_Addr_State]='MI' OR [Pat_Addr_State]='ME' OR [Pat_Addr_State]='MD' OR [Pat_Addr_State]='MA' OR [Pat_Addr_State]='LA' OR [Pat_Addr_State]='KY' OR [Pat_Addr_State]='KS' OR [Pat_Addr_State]='IN' OR [Pat_Addr_State]='IL' OR [Pat_Addr_State]='ID' OR [Pat_Addr_State]='IA' OR [Pat_Addr_State]='HI' OR [Pat_Addr_State]='GA' OR [Pat_Addr_State]='FL' OR [Pat_Addr_State]='DE' OR [Pat_Addr_State]='CT' OR [Pat_Addr_State]='CO' OR [Pat_Addr_State]='CA' OR [Pat_Addr_State]='AZ' OR [Pat_Addr_State]='AR' OR [Pat_Addr_State]='AL' OR [Pat_Addr_State]='AK'))
GO
ALTER TABLE [dbo].[PATIENT]  WITH CHECK ADD CHECK  (([Pat_Addr_Zip]>=(0) AND [Pat_Addr_Zip]<=(99999)))
GO
ALTER TABLE [dbo].[PATIENT]  WITH CHECK ADD CHECK  (([Pat_Email] like '%@%'))
GO
ALTER TABLE [dbo].[PATIENT]  WITH CHECK ADD CHECK  (([Pat_Gender]='F' OR [Pat_Gender]='M'))
GO
ALTER TABLE [dbo].[PATIENT]  WITH CHECK ADD CHECK  (([Pat_Height]>(0)))
GO
ALTER TABLE [dbo].[PATIENT]  WITH CHECK ADD CHECK  (([Pat_ID]>(0)))
GO
ALTER TABLE [dbo].[PATIENT]  WITH CHECK ADD CHECK  (([Pat_Phone] like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'))
GO
ALTER TABLE [dbo].[PATIENT]  WITH CHECK ADD CHECK  (([Pat_Weight]>(0)))
GO
ALTER TABLE [dbo].[PRESCRIPTION]  WITH CHECK ADD  CONSTRAINT [CK__PRESCRIPT__Pre_I__6D0D32F4] CHECK  (([Pre_ID]>(0)))
GO
ALTER TABLE [dbo].[PRESCRIPTION] CHECK CONSTRAINT [CK__PRESCRIPT__Pre_I__6D0D32F4]
GO
ALTER TABLE [dbo].[PRESCRIPTION]  WITH CHECK ADD  CONSTRAINT [CK__PRESCRIPT__Pre_R__6E01572D] CHECK  (([Pre_Refills_Allowed]>=(0)))
GO
ALTER TABLE [dbo].[PRESCRIPTION] CHECK CONSTRAINT [CK__PRESCRIPT__Pre_R__6E01572D]
GO
ALTER TABLE [dbo].[PRESCRIPTION]  WITH CHECK ADD  CONSTRAINT [CK__PRESCRIPT__Pre_R__6EF57B66] CHECK  (([Pre_Refills_Filled]>=(0)))
GO
ALTER TABLE [dbo].[PRESCRIPTION] CHECK CONSTRAINT [CK__PRESCRIPT__Pre_R__6EF57B66]
GO
USE [master]
GO
ALTER DATABASE [ClinicDB] SET  READ_WRITE 
GO
