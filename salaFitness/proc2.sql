create procedure proc2
as begin
alter table Antrenor
add constraint df_21 default 21 for varsta
end
go