create procedure proc1
as
begin
alter table Client
alter column nume nvarchar(100);
end
go