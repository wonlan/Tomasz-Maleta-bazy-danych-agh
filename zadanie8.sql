--zadanie 1
begin
declare @avg int;
set @avg =(select avg(HumanResources.EmployeePayHistory.PayFrequency * HumanResources.EmployeePayHistory.Rate) from HumanResources.EmployeePayHistory);
select Employee.* from HumanResources.Employee
join HumanResources.EmployeePayHistory on HumanResources.EmployeePayHistory.BusinessEntityID = HumanResources.Employee.BusinessEntityID
where HumanResources.EmployeePayHistory.Rate * HumanResources.EmployeePayHistory.PayFrequency <@avg;
end;
--zadanie 2
create function zad2 (@id int) returns table as return
(Select Purchasing.PurchaseOrderHeader.ShipDate from Purchasing.PurchaseOrderHeader
where Purchasing.PurchaseOrderHeader.PurchaseOrderID = @id);
--zadanie 3
create procedure zad3
@nazwa VARCHAR(40) = null
as begin
select Production.Product.ProductID, Production.Product.ProductNumber, Production.Product.SafetyStockLevel from Production.Product
where Production.Product.Name = @nazwa;
end
--zadanie 4
create function zad4 (@id int) returns table as return
(select Sales.CreditCard.CardNumber from Sales.CreditCard
join Sales.SalesOrderHeader on Sales.SalesOrderHeader.CreditCardID = Sales.CreditCard.CreditCardID
where Sales.SalesOrderHeader.SalesOrderID = @id);
--zadanie 5
create procedure zad5
@num1 int = null,
@num2 int = null
as begin
if @num1 < @num2
print ' Niew³aœciwie zdefiniowa³eœ dane wejœciowe'
else
select @num1/@num2
end;