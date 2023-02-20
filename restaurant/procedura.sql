create or alter procedure procedura @restaurant varchar(50), @utilizator varchar(50), @nota float
as
begin
	declare @idUtilizator int = (select top 1 idUtilizator from Utilizator where numeUtilizator = @utilizator)
	declare @idRestaurant int = (select top 1 idRestaurant from Restaurant where numeRestaurant = @restaurant)
	if(exists (select * from Nota where idUtilizator = @idUtilizator and idRestaurant = @idRestaurant))
	begin
		update Nota
		set nota = @nota
		where idUtilizator = @idUtilizator and idRestaurant = @idRestaurant
	end
	else
	begin
		insert into Nota values(@idUtilizator, @idRestaurant, @nota);
	end
end