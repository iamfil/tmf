IF DB_ID('commercelite') IS NULL

BEGIN

CREATE DATABASE [commercelite]

END
ELSE
BEGIN
	PRINT 'DB Exists, stopping.'
END