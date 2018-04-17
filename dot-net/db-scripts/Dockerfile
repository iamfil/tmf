FROM microsoft/aspnet:4.7.1-windowsservercore-1709

COPY CreateDatabase.sql CreateDatabase.sql 
COPY SchemaCreation.sql SchemaCreation.sql
COPY SeedData.sql SeedData.sql

CMD sqlcmd -S commercelite-sql -U SA -P 'Passw0rd!' -i CreateDatabase.sql
CMD sqlcmd -S commercelite-sql -U SA -P 'Passw0rd!' -i SchemaCreation.sql 
CMD sqlcmd -S commercelite-sql -U SA -P 'Passw0rd!' -i SeedData.sql
