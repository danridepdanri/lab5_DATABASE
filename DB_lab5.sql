USE [203TN]
GO
/****** Object:  Table [dbo].[Clients]    Script Date: 29.04.2023 11:49:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clients](
	[client_id] [int] NOT NULL,
	[name] [varchar](50) NOT NULL,
	[contact_phone] [varchar](20) NULL,
	[email] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[client_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Executors]    Script Date: 29.04.2023 11:49:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Executors](
	[executor_id] [int] NOT NULL,
	[name] [varchar](50) NOT NULL,
	[contact_phone] [varchar](20) NULL,
	[email] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[executor_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Service_Provision]    Script Date: 29.04.2023 11:49:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service_Provision](
	[service_provision_id] [int] NOT NULL,
	[client_id] [int] NULL,
	[executor_id] [int] NULL,
	[service_id] [int] NULL,
	[cost] [decimal](10, 2) NOT NULL,
	[provision_date] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[service_provision_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Service_Types]    Script Date: 29.04.2023 11:49:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service_Types](
	[service_type_id] [int] NOT NULL,
	[name] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[service_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Services]    Script Date: 29.04.2023 11:49:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Services](
	[service_id] [int] NOT NULL,
	[name] [varchar](50) NOT NULL,
	[price] [decimal](10, 2) NOT NULL,
	[service_type_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[service_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Service_Provision]  WITH CHECK ADD FOREIGN KEY([client_id])
REFERENCES [dbo].[Clients] ([client_id])
GO
ALTER TABLE [dbo].[Service_Provision]  WITH CHECK ADD FOREIGN KEY([executor_id])
REFERENCES [dbo].[Executors] ([executor_id])
GO
ALTER TABLE [dbo].[Service_Provision]  WITH CHECK ADD FOREIGN KEY([service_id])
REFERENCES [dbo].[Services] ([service_id])
GO
ALTER TABLE [dbo].[Services]  WITH CHECK ADD FOREIGN KEY([service_type_id])
REFERENCES [dbo].[Service_Types] ([service_type_id])
GO
