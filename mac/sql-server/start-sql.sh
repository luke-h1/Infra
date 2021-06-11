#!/bin/bash
docker run -d --name sql_server -e 'ACCEPT_EULA=Y' -e 'SA_PASSWORD=123' -p 1433:1433 mcr.microsoft.com/mssql/server:2019-latest