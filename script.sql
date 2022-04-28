﻿CREATE TABLE [dbo].[USUARIO] (
    [IDUSUARIO]    UNIQUEIDENTIFIER NOT NULL,
    [NOME]         NVARCHAR (150)   NOT NULL,
    [LOGIN]        NVARCHAR (50)    NOT NULL,
    [SENHA]        NVARCHAR (40)    NOT NULL,
    [DATAINCLUSAO] DATETIME         NOT NULL,
    PRIMARY KEY CLUSTERED ([IDUSUARIO] ASC),
    UNIQUE NONCLUSTERED ([LOGIN] ASC)
);
GO

INSERT INTO USUARIO
VALUES(
	NEWID(),
	'Usuário API',
	'usuario_api',
	CONVERT(VARCHAR(32), 
HASHBYTES('MD5', '@admin2022'), 2),
	GETDATE()
)
GO

CREATE TABLE [dbo].[EMPRESA] (
    [IDEMPRESA]     UNIQUEIDENTIFIER NOT NULL,
    [NOMEFANTASIA]  NVARCHAR (150)   NOT NULL,
    [RAZAOSOCIAL]   NVARCHAR (150)   NOT NULL,
    [CNPJ]          NVARCHAR (40)    NOT NULL,
    [DATAINCLUSAO]  DATETIME         NOT NULL,
    [DATAALTERACAO] DATETIME         NOT NULL,
    [ATIVO]         INT              DEFAULT ((1)) NOT NULL,
    PRIMARY KEY CLUSTERED ([IDEMPRESA] ASC)
);
GO

CREATE TABLE [dbo].[FUNCIONARIO] (
    [IDFUNCIONARIO] UNIQUEIDENTIFIER NOT NULL,
    [NOME]          NVARCHAR (150)   NOT NULL,
    [CPF]           NVARCHAR (14)    NOT NULL,
    [MATRICULA]     NVARCHAR (10)    NOT NULL,
    [DATAADMISSAO]  DATE             NOT NULL,
    [IDEMPRESA]     UNIQUEIDENTIFIER NOT NULL,
    [ATIVO]         INT              DEFAULT ((1)) NOT NULL,
    [DATAINCLUSAO]  DATETIME         NOT NULL,
    [DATAALTERACAO] DATETIME         NOT NULL,
    PRIMARY KEY CLUSTERED ([IDFUNCIONARIO] ASC),
    UNIQUE NONCLUSTERED ([MATRICULA] ASC),
    UNIQUE NONCLUSTERED ([CPF] ASC),
    FOREIGN KEY ([IDEMPRESA]) REFERENCES [dbo].[EMPRESA] ([IDEMPRESA])
);
GO




