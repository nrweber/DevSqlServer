#!/bin/bash 

set -e

/opt/mssql-tools/bin/sqlcmd -S $DB_SERVER_NAME -d master -i setup_db.sql
/opt/mssql-tools/bin/sqlcmd -S $DB_SERVER_NAME -d master -i setup_user.sql


echo "Done!"
