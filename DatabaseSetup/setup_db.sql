USE master
GO

sp_configure 'show advanced options', 1
GO
RECONFIGURE
GO

sp_configure 'CONTAINED DATABASE AUTHENTICATION', 1
GO
RECONFIGURE
GO

IF NOT EXISTS (
    SELECT [name]
        FROM sys.databases
        WHERE [name] = N'$(DB_NAME)'
)

CREATE DATABASE $(DB_NAME)
	CONTAINMENT = PARTIAL;

GO
