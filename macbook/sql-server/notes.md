This command is responsible for starting SSE: `docker run -d --name sql_server -e 'ACCEPT_EULA=Y' -e 'SA_PASSWORD=123' -p 1433:1433 mcr.microsoft.com/mssql/server:2019-latest`


** Azure data studio
Another hurdle with using SQL Server on macOS is the lack of SQL Server Management Studio (SSMS), a software tool that is used for configuring, managing, and administering all components within Microsoft SQL Server. It includes scripting tools for creating and running queries and graphical tools for use with objects and features within SQL Server.

However, Azure Data Studio has got you covered.

Click the "New connection" link and enter localhost for the "Server" input, sa for the "User name" input, and then your password for the "Password" input.

The SQL CLI tool is a convenient command-line tool for querying SQL databases and is cross-platform. It's also really useful for checking to see if the above worked!

To install it, run the following command in the terminal:
`npm i -g sql-cli`

Then, to connect to you database:

`mssql -u sa -p someThingComplicated1234`

You should receive a response similar to below:

```
Connecting to localhost...done

sql-cli version 0.6.2
Enter ".help" for usage hints.
mssql>
```