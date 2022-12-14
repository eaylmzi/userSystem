USE [master]
GO
/****** Object:  Database [userDatabase]    Script Date: 19.08.2022 12:23:53 ******/
CREATE DATABASE [userDatabase]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'userDatabase', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\userDatabase.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'userDatabase_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\userDatabase_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [userDatabase] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [userDatabase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [userDatabase] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [userDatabase] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [userDatabase] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [userDatabase] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [userDatabase] SET ARITHABORT OFF 
GO
ALTER DATABASE [userDatabase] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [userDatabase] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [userDatabase] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [userDatabase] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [userDatabase] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [userDatabase] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [userDatabase] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [userDatabase] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [userDatabase] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [userDatabase] SET  DISABLE_BROKER 
GO
ALTER DATABASE [userDatabase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [userDatabase] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [userDatabase] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [userDatabase] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [userDatabase] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [userDatabase] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [userDatabase] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [userDatabase] SET RECOVERY FULL 
GO
ALTER DATABASE [userDatabase] SET  MULTI_USER 
GO
ALTER DATABASE [userDatabase] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [userDatabase] SET DB_CHAINING OFF 
GO
ALTER DATABASE [userDatabase] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [userDatabase] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [userDatabase] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [userDatabase] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'userDatabase', N'ON'
GO
ALTER DATABASE [userDatabase] SET QUERY_STORE = OFF
GO
USE [userDatabase]
GO
/****** Object:  Table [dbo].[userTable]    Script Date: 19.08.2022 12:23:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[userTable](
	[Name] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Png] [nvarchar](500) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[addUser]    Script Date: 19.08.2022 12:23:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[addUser](@name nvarchar(50),@password nvarchar(50),@email nvarchar(50),@png nvarchar(500))
as
INSERT INTO dbo.userTable (Name,Password,Email,Png) VALUES (@name,@password,@email,@png)
GO
/****** Object:  StoredProcedure [dbo].[deleteUser]    Script Date: 19.08.2022 12:23:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[deleteUser](@email nvarchar(50))
as 
DELETE FROM dbo.userTable WHERE Email=@email
GO
/****** Object:  StoredProcedure [dbo].[readAll]    Script Date: 19.08.2022 12:23:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[readAll]
as
select * from dbo.userTable
GO
USE [master]
GO
ALTER DATABASE [userDatabase] SET  READ_WRITE 
GO
