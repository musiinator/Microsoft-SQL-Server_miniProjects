create procedure proc1_undo
as
begin
alter table Client
alter column nume varchar(100);
end
go