create procedure proc5
as
begin
alter table Supliment
add constraint fk_client_supliment foreign key(idClient) references Client(idClient)
end
go