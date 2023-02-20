--insert into a table with a primary key only
create procedure insert1
as
begin
	declare @NoOfRows int
	declare @n int
	declare @t varchar(30)
	select top 1 @NoOfRows = noOfRows from dbo.TestTables where
	TestTables.TestID=1 and TestTables.TableID=1
	set @n=1
	while @n<=@NoOfRows
	begin
		set @t = 'Antrenor' + convert (varchar(5), @n)
		insert into Antrenor (nume, prenume, varsta) values (@t, @t, @n)
		set @n = @n + 1
	end
end
go