create procedure proc2_undo
as begin
alter table Antrenor
drop constraint df_21
end
go
