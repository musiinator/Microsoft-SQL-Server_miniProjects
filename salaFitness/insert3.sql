create procedure insert3
as
begin
	declare @fk int
	declare @fk1 int
	declare @noOfRows int
	declare @n int
	select top 1 @fk = idAparat from Aparat
	select top 1 @NoOfRows = NoOfRows from dbo.TestTables where TestID = 1 and TableID = 3
	set @n = 1
	select top 1 @fk1 = min(idClient) from Client
	while @n<=@NoOfRows
	begin
		insert into Aparat values ('tip1', 4)
		insert into Exercitiu (idAparat, idClient) values (@fk, @fk1)
		set @fk1 = @fk1+1
		set @n = @n + 1
	end
end
