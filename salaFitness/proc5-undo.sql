create procedure proc5_undo
as
begin
alter table Supliment
drop constraint fk_client_supliment;
end
go