# Wait to be sure that SQL Server came up
sleep 20

/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P password123! -d master -i database/db.sql
sleep 5
/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P password123! -d master -i database/FillDB.sql