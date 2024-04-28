USE $(DB_NAME);

-- Create user called sv1user for the contained database
-- Use the password that was set in the environment

IF NOT EXISTS (
  SELECT
    name,
    type_desc,
    authentication_type_desc
  FROM sys.database_principals
  WHERE authentication_type = 2 and name = '$(DB_USERNAME)'
)

 CREATE USER [$(DB_USERNAME)] WITH PASSWORD=N'$(DB_USER_PASSWORD)';
 ALTER AUTHORIZATION ON SCHEMA::[db_datareader] TO [$(DB_USERNAME)];
 ALTER AUTHORIZATION ON SCHEMA::[db_datawriter] TO [$(DB_USERNAME)];
 ALTER AUTHORIZATION ON SCHEMA::[db_owner] TO [$(DB_USERNAME)];
 ALTER ROLE [db_datareader] ADD MEMBER [$(DB_USERNAME)];
 ALTER ROLE [db_datawriter] ADD MEMBER [$(DB_USERNAME)];
 ALTER ROLE [db_owner] ADD MEMBER [$(DB_USERNAME)];
 GO

