USE [master]
GO
/****** Object:  Database [BibliotecaVirtual]    Script Date: 13/11/2019 19:34:04 ******/
CREATE DATABASE [BibliotecaVirtual]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BibliotecaVirtual', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\BibliotecaVirtual.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BibliotecaVirtual_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\BibliotecaVirtual_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [BibliotecaVirtual] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BibliotecaVirtual].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BibliotecaVirtual] SET ANSI_NULL_DEFAULT OFF 
ALTER DATABASE [BibliotecaVirtual] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BibliotecaVirtual] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BibliotecaVirtual] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BibliotecaVirtual] SET ARITHABORT OFF 
GO
ALTER DATABASE [BibliotecaVirtual] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BibliotecaVirtual] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BibliotecaVirtual] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BibliotecaVirtual] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BibliotecaVirtual] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BibliotecaVirtual] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BibliotecaVirtual] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BibliotecaVirtual] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BibliotecaVirtual] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BibliotecaVirtual] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BibliotecaVirtual] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BibliotecaVirtual] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BibliotecaVirtual] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BibliotecaVirtual] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BibliotecaVirtual] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BibliotecaVirtual] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BibliotecaVirtual] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BibliotecaVirtual] SET RECOVERY FULL 
GO
ALTER DATABASE [BibliotecaVirtual] SET  MULTI_USER 
GO
ALTER DATABASE [BibliotecaVirtual] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BibliotecaVirtual] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BibliotecaVirtual] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BibliotecaVirtual] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BibliotecaVirtual] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'BibliotecaVirtual', N'ON'
GO
ALTER DATABASE [BibliotecaVirtual] SET QUERY_STORE = OFF
GO
USE [BibliotecaVirtual]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [BibliotecaVirtual]
GO
/****** Object:  Table [dbo].[Autor]    Script Date: 13/11/2019 19:34:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Autor](
	[idAutor] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Apellido] [varchar](50) NULL,
	[Fecha_Nac] [nchar](10) NULL,
	[idNacionalidad] [int] NULL,
 CONSTRAINT [PK_Autor] PRIMARY KEY CLUSTERED 
(
	[idAutor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Contacto]    Script Date: 13/11/2019 19:34:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contacto](
	[idContacto] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Celular] [varchar](50) NULL,
	[Consulta] [varchar](200) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Libro]    Script Date: 13/11/2019 19:34:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Libro](
	[IdLibro] [int] IDENTITY(1,1) NOT NULL,
	[Titulo] [varchar](50) NULL,
	[Cantidad_Pag] [int] NULL,
	[Anho_Publicacion] [date] NULL,
	[Sinopsis] [varchar](200) NULL,
	[idAutor] [int] NULL,
 CONSTRAINT [PK_Libro] PRIMARY KEY CLUSTERED 
(
	[IdLibro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Nacionalidad]    Script Date: 13/11/2019 19:34:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nacionalidad](
	[idNacionalidad] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](50) NULL,
 CONSTRAINT [PK_Nacionalidad] PRIMARY KEY CLUSTERED 
(
	[idNacionalidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Autor]  WITH CHECK ADD  CONSTRAINT [FK_Autor_Nacionalidad] FOREIGN KEY([idNacionalidad])
REFERENCES [dbo].[Nacionalidad] ([idNacionalidad])
GO
ALTER TABLE [dbo].[Autor] CHECK CONSTRAINT [FK_Autor_Nacionalidad]
GO
ALTER TABLE [dbo].[Libro]  WITH CHECK ADD  CONSTRAINT [FK_Libro_Autor] FOREIGN KEY([idAutor])
REFERENCES [dbo].[Autor] ([idAutor])
GO
ALTER TABLE [dbo].[Libro] CHECK CONSTRAINT [FK_Libro_Autor]
GO
USE [master]
GO
ALTER DATABASE [BibliotecaVirtual] SET  READ_WRITE 
GO
