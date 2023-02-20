create or alter procedure procedura @client varchar(50), @magazin varchar(50), @data date, @pret int
as
begin
	declare @idClient int = (select top 1 idClient from Client where nume = @client)
	declare @idMagazin int = (select top 1 idMagazin from Magazin where denumire = @magazin)
	if exists (select * from Achizitie where idClient = @idClient and idMagazin = @idMagazin)
		update Achizitie
		set dataAchizitie = @data, pret = @pret
		where idClient = @idClient and idMagazin = @idMagazin
	else
	begin
		insert into Achizitie values (@idClient, @idMagazin, @data, @pret)
	end
end