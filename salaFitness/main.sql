create procedure main
@newVersion1 varchar(6)
as
begin
	if ISNUMERIC(@newVersion1) = 0
	begin
		raiserror('Version must be an integer between 0 and 5', 0 ,1) with NOWAIT;
		return;
	end
	declare @newVersion int
	set @newVersion = cast(@newVersion1 as int);
	if @newVersion > 5 or @newVersion < 0 or @newVersion is null
	begin
		raiserror('Version must be between 0 and 5', 0 ,1) with NOWAIT;
		return;
	end
	declare @oldVersion int
	set @oldVersion = (Select idVersiune from dbo.Versiune where idVersiune >= 0 and idVersiune <= 5);
	delete from Versiune where idVersiune is not null
	insert into Versiune values(@newVersion);
	

	/*
	newVersion = 0
	*/
	if @newVersion = 0
	begin
		if @oldVersion = 0
		begin
			print('The database is already at this version id!')
		end
		if @oldVersion = 1
		begin
			exec proc1_undo
		end
		if @oldVersion = 2
		begin
			exec proc2_undo
			exec proc1_undo
		end
		if @oldVersion = 3
		begin
			exec proc3_undo
			exec proc2_undo
			exec proc1_undo
		end
		if @oldVersion = 4
		begin
			exec proc4_undo
			exec proc3_undo
			exec proc2_undo
			exec proc1_undo
		end
		if @oldVersion = 5
		begin
			exec proc5_undo
			exec proc4_undo
			exec proc3_undo
			exec proc2_undo
			exec proc1_undo
		end
	end

	/*
	newVersion = 1
	*/
	if @newVersion = 1
	begin
		if @oldVersion = 0
		begin
			exec proc1
		end
		if @oldVersion = 1
		begin
			print('The database is already at this version id!')
		end
		if @oldVersion = 2
		begin
			exec proc2_undo
		end
		if @oldVersion = 3
		begin
			exec proc3_undo
			exec proc2_undo
		end
		if @oldVersion = 4
		begin
			exec proc4_undo
			exec proc3_undo
			exec proc2_undo
		end
		if @oldVersion = 5
		begin
			exec proc5_undo
			exec proc4_undo
			exec proc3_undo
			exec proc2_undo
		end
	end

	/*
	newVersion = 2
	*/
	if @newVersion = 2
	begin
		if @oldVersion = 0
		begin
			exec proc1
			exec proc2
		end
		if @oldVersion = 1
		begin
			exec proc2
		end
		if @oldVersion = 2
		begin
			print('The database is already at this version id!')
		end
		if @oldVersion = 3
		begin
			exec proc3_undo
		end
		if @oldVersion = 4
		begin
			exec proc4_undo
			exec proc3_undo
		end
		if @oldVersion = 5
		begin
			exec proc5_undo
			exec proc4_undo
			exec proc3_undo
		end
	end

	/*
	newVersion = 3
	*/
	if @newVersion = 3
	begin
		if @oldVersion = 0
		begin
			exec proc1
			exec proc2
			exec proc3
		end
		if @oldVersion = 1
		begin
			exec proc2
			exec proc3
		end
		if @oldVersion = 2
		begin
			exec proc3
		end
		if @oldVersion = 3
		begin
			print('The database is already at this version id!')
		end
		if @oldVersion = 4
		begin
			exec proc4_undo
		end
		if @oldVersion = 5
		begin
			exec proc5_undo
			exec proc4_undo
		end
	end

	/*
	newVersion = 4
	*/
	if @newVersion = 4
	begin
		if @oldVersion = 0
		begin
			exec proc1
			exec proc2
			exec proc3
			exec proc4
		end
		if @oldVersion = 1
		begin
			exec proc2
			exec proc3
			exec proc4
		end
		if @oldVersion = 2
		begin
			exec proc3
			exec proc4
		end
		if @oldVersion = 3
		begin
			exec proc4
		end
		if @oldVersion = 4
		begin
			print('The database is already at this version id!')
		end
		if @oldVersion = 5
		begin
			exec proc5_undo
		end
	end

	/*
	newVersion = 5
	*/
	if @newVersion = 5
	begin
		if @oldVersion = 0
		begin
			exec proc1
			exec proc2
			exec proc3
			exec proc4
			exec proc5
		end
		if @oldVersion = 1
		begin
			exec proc2
			exec proc3
			exec proc4
			exec proc5
		end
		if @oldVersion = 2
		begin
			exec proc3
			exec proc4
			exec proc5
		end
		if @oldVersion = 3
		begin
			exec proc4
			exec proc5
		end
		if @oldVersion = 4
		begin
			exec proc5
		end
		if @oldVersion = 5
		begin
			print('The database is already at this version id!')
		end
	end
end