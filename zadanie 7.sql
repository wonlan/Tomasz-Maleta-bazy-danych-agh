--backup bazy danych
D:\postgre\bin>pg_dump -U postgres -F c -f /nowy firma>firma_backup.sql
--usuwanie bazy danych
drop database firma;
--przywracanie bazy danych
create database firma;
D:\postgre\bin>pg_restore -U postgres -d firma "D:\postgre\bin\nowy\firma_backup.sql"
--backup ssms
BACKUP DATABASE [AdventureWorks2017] TO  DISK = N'D:\Microsoft sql\MSSQL15.MSSQLSERVER\MSSQL\Backup\backup-adventure' WITH NOFORMAT, NOINIT,  NAME = N'AdventureWorks2017-Full Database Backup', SKIP, NOREWIND, NOUNLOAD,  STATS = 10
go
--zadanie 7
create view zadanie_7 as
select LoginID, "Name" from AdventureWorks2017.HumanResources.Employee
join AdventureWorks2017.HumanResources.EmployeeDepartmentHistory on Employee.BusinessEntityID = EmployeeDepartmentHistory.BusinessEntityID
join AdventureWorks2017.HumanResources.Department on Department.DepartmentID = EmployeeDepartmentHistory.DepartmentID;
select * from zadanie_7;