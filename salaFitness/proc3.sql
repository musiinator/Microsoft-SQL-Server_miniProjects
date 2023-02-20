create procedure proc3
as
begin
create table Supliment(
idSupliment int primary key identity,
nume nvarchar(30),
producator nvarchar(30),
nrProteine int,
idClient int);
end
go