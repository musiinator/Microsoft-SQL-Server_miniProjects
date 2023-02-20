create procedure test @nume_test varchar(50)
as
begin
	if not exists(select top 1 TestID from Tests where Name = @nume_test)
	begin
			RAISERROR('Invalid test name!', 11, 1);
	end

	declare @test_id int
	declare @start datetime
	declare @finish datetime

	set @start = GETDATE()
	insert into TestRuns (Description, StartAt) values (@nume_test, @start)
	set @test_id = (select TestRunId from TestRuns where StartAt = @start)
	
	if(@nume_test = 'insert_table' or @nume_test = 'delete_table')
	begin
		if(@nume_test = 'insert_table')
		begin
			declare testTableCursor cursor scroll for select TestTables.TableID from TestTables
			where TestTables.TestID = (select Tests.TestID from Tests where Tests.Name = @nume_test)
			order by TestTables.Position ASC
		end
		else if(@nume_test = 'delete_table')
		begin
			declare testTableCursor cursor scroll for select TestTables.TableID from TestTables
			where TestTables.TestID = (select Tests.TestID from Tests where Tests.Name = @nume_test)
			order by TestTables.Position DESC
		end
		open testTableCursor

		declare @table_id int
		declare @table_name varchar(30)
		declare @procedure_name varchar(30)
		declare @insertStart datetime
		declare @insertFinish datetime

		fetch first from testTableCursor into @table_id
		while @@FETCH_STATUS = 0
		begin
			set @procedure_name = 'delete'+ cast(@table_id as varchar(12))
			exec @procedure_name
			fetch next from testTableCursor into @table_id
		end
		print 'Delete finished!'
		fetch last from testTableCursor into @table_id
		while @@FETCH_STATUS=0
		begin
			set @insertStart = GETDATE()
			set @procedure_name = 'insert'+ cast(@table_id as varchar(12))
			exec @procedure_name
			set @insertFinish = GETDATE()
			insert into TestRunTables (TestRunID, TableID, StartAt, EndAt) values
			(@test_id, @table_id, @insertStart, @insertFinish)
			fetch prior from testTableCursor into @table_id
		end
		close testTableCursor
		deallocate testTableCursor
		print 'Insert finished!'
	end
	else
	begin
		declare @viewID int
		declare @viewName varchar(30)
		declare @insertStartView datetime
		declare @insertFinishView datetime

		declare testViewCursor cursor scroll for select TestViews.ViewID from TestViews
		where TestViews.TestID = (select TestID from Tests where Name = @nume_test)
		order by TestViews.ViewID asc
		open testViewCursor
		fetch first from testViewCursor into @viewID
		while @@FETCH_STATUS = 0
		begin
			print @viewID
			set @insertStartView = GETDATE()
			set @viewName = (select top 1 Name from Views where Views.ViewID = @viewID)
			set @viewID = @viewID-10
			set @procedure_name = 'exec_view'+ cast(@viewID as varchar(12))
			set @viewID = @viewID+10
			set @insertStartView = GETDATE()
			exec @procedure_name
			set @insertFinishView = GETDATE()
			insert into TestRunViews (TestRunID, ViewID, StartAt, EndAt)
			values (@test_id, @viewID, @insertStartView, @insertFinishView)
			fetch next from testViewCursor into @viewID
		end
		close testViewCursor
		deallocate testViewCursor
		print 'Select view finished!'
	end
	set @finish = GETDATE()
	update TestRuns
	set EndAt = @finish where TestRunID = @test_id
end
go