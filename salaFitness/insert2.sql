create procedure insert2
as
begin
	declare @fk int
	declare @fk1 int
	declare @NoOfRows int
	declare @n int
	DECLARE @nume VARCHAR(30)
	DECLARE @prenume VARCHAR(30)
	select top 1 @NoOfRows = noOfRows from dbo.TestTables where
	TestTables.TestID=1 and TestTables.TableID=2
	set @n=1
	select top 1 @fk = idAntrenor from Antrenor
	select top 1 @fk1 = idAbonament from Abonament order by newid()
	while @n<=@NoOfRows
	begin
		set @nume = 'NumeClient' + CONVERT (VARCHAR(5), @n)
		set @prenume = 'PrenumeClient' + CONVERT (VARCHAR(5), @n)
		insert into Client (nume, prenume, idAntrenor, idAbonament)
		values (@nume, @prenume, @fk, @fk1)
		set @n = @n + 1
	end
end