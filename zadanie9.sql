--zad1
create function fibonacci(@n int)
returns @wynik table(wynik int)
as begin
	declare @jeden int = 1
	declare @dwa int = 1
	declare @i int = 1
	declare @t int
	insert into @wynik values(@jeden), (@dwa)
	while (@i <= @n - 2)
		begin
		insert into @wynik values (@jeden + @dwa)
		set @t=@dwa
		set @dwa += @jeden
		set @jeden = @t
		set @i += 1
		end
	return
end

create procedure fibonacci_proc @n int
as begin
select * from fibonacci(@n)
end

--zad2
create trigger nazwisko_upper on AdventureWorks2017.Person.Person
after insert
as begin
declare @id int
select @id=inserted.BusinessEntityID from inserted update Person.Person
set Person.LastName = UPPER(Person.LastName) where Person.BusinessEntityID = @id;
end

select * from AdventureWorks2017.Sales.SalesTaxRate
--zad3
create trigger taxRateMonitoring on AdventureWorks2017.Sales.SalesTaxRate
after update
as begin
declare @taxrate1 float
declare @taxrate2 float
select @taxrate1= deleted.TaxRate from deleted
select @taxrate2= inserted.TaxRate from inserted
if((@taxrate2-@taxrate1)/@taxrate1)*100 > 30
	print 'B³¹d : nast¹pi³a zmiana wartoœci podatku o ponad 30 %';
end;