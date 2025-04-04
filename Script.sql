-- Crear la base de datos
CREATE DATABASE RetoTecnico
GO
USE [RetoTecnico]
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 30/03/2025 15:57:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Producto] [varchar](50) NOT NULL,
	[CupoSolicitado] [varchar](20) NULL,
	[Franquicia] [varchar](50) NULL,
	[Tasa] [decimal](4, 2) NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[FechaActualizacion] [datetime] NOT NULL,
	[Usuario] [int] NOT NULL,
	[UsuarioModificacion] [int] NULL,
	[Estado] [varchar](50) NULL,
 CONSTRAINT [PK_Productos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 30/03/2025 15:57:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[TipoUsuarioId] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](250) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[TipoUsuarioId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 30/03/2025 15:57:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Clave] [varchar](455) NOT NULL,
	[TipoUsuarioId] [int] NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[FechaActualizacion] [datetime] NOT NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Productos] ON 

INSERT [dbo].[Productos] ([Id], [Producto], [CupoSolicitado], [Franquicia], [Tasa], [FechaCreacion], [FechaActualizacion], [Usuario], [UsuarioModificacion], [Estado]) VALUES (2, N'Tarjeta de Credito', N'1,200', N'MASTERCARD', CAST(0.00 AS Decimal(4, 2)), CAST(N'2025-03-30T18:53:01.710' AS DateTime), CAST(N'2025-03-30T18:53:01.710' AS DateTime), 2, NULL, N'Abierto')
INSERT [dbo].[Productos] ([Id], [Producto], [CupoSolicitado], [Franquicia], [Tasa], [FechaCreacion], [FechaActualizacion], [Usuario], [UsuarioModificacion], [Estado]) VALUES (3, N'Credito de Consumo', N'200', N'-', CAST(12.02 AS Decimal(4, 2)), CAST(N'2025-03-30T18:54:00.023' AS DateTime), CAST(N'2025-03-30T18:54:00.023' AS DateTime), 1, NULL, N'Abierto')
SET IDENTITY_INSERT [dbo].[Productos] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([TipoUsuarioId], [Nombre]) VALUES (1, N'Administrador')
INSERT [dbo].[Roles] ([TipoUsuarioId], [Nombre]) VALUES (2, N'Asesor')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuarios] ON 

INSERT [dbo].[Usuarios] ([Id], [Nombre], [Email], [Clave], [TipoUsuarioId], [FechaCreacion], [FechaActualizacion]) VALUES (1, N'Marcial', N'marcial.diazvels@gmail.com', N'$2a$12$oTTUELzmLMVke1vHe11Op.tM08W2cmHuZ.whZyGqNtLEkOFs/4wcC', 1, CAST(N'2025-03-29T00:00:00.000' AS DateTime), CAST(N'2025-03-29T00:00:00.000' AS DateTime))
INSERT [dbo].[Usuarios] ([Id], [Nombre], [Email], [Clave], [TipoUsuarioId], [FechaCreacion], [FechaActualizacion]) VALUES (2, N'Asesor', N'marcial.diaz@gmail.com', N'$2a$12$F/Q4gRpynirPSDSOdzE2Xu76wJz4NoHXc2hGgt34ldbSW2PDeOxHC', 2, CAST(N'2025-03-29T00:00:00.000' AS DateTime), CAST(N'2025-03-29T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
GO
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD  CONSTRAINT [FK_Productos_Usuarios] FOREIGN KEY([Usuario])
REFERENCES [dbo].[Usuarios] ([Id])
GO
ALTER TABLE [dbo].[Productos] CHECK CONSTRAINT [FK_Productos_Usuarios]
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_Usuarios_Roles] FOREIGN KEY([TipoUsuarioId])
REFERENCES [dbo].[Roles] ([TipoUsuarioId])
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [FK_Usuarios_Roles]
GO
