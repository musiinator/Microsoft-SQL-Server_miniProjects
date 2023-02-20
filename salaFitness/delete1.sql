create procedure delete1
as
begin
	declare @NoOfRows int
	select top 1 @NoOfRows = NoOfRows from dbo.TestTables where
	TestTables.TestID=2 and TestTables.TableID=1
	delete top (@NoOfRows) from Antrenor
end