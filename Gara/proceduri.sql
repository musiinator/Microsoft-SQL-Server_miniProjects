create or alter procedure procedura @ruta varchar(50), @statie varchar(50), @ora_sosire time, @ora_plecare time
as 
begin
	declare @id_statie int;
	declare @id_ruta int;
	select top 1 @id_statie = id_statie from Statii where nume = @statie
	select top 1 @id_ruta = id_ruta from Rute where nume = @ruta
	if(@id_statie is null or @id_ruta is null)
		throw 50005, 'Nu exista statia sau ruta!', 1;
	else if (exists (select * from StatiiRute where id_statie = @id_statie))
	begin
		update StatiiRute set ora_sosirii = @ora_sosire, ora_plecarii = @ora_plecare
		where id_ruta = @id_ruta and @id_statie = id_statie
	end
		else
		begin
			insert into StatiiRute values (@id_statie, @id_ruta, @ora_sosire, @ora_plecare);
		end

end