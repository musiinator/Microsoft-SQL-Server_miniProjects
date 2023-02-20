create procedure delete3
as 
begin
	declare @NoOfRows int
	select top 1 @NoOfRows = noOfRows from dbo.TestTables where
	TestTables.TestID=2 and TestTables.TableID=3
	delete top (@NoOfRows) from Exercitiu
end