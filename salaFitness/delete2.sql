create procedure delete2
as 
begin
	declare @NoOfRows int
	select top 1 @NoOfRows = noOfRows from dbo.TestTables where
	TestTables.TestID=2 and TestTables.TableID=2
	delete top (@NoOfRows) from Client
end