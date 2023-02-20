create or alter procedure procedura @participant varchar(50), @competitie varchar(50), @taxa int , @loc int
as
begin
	declare @idParticipant int = (select top 1 idParticipant from Participant where nume = @participant)
	declare @idCompetitie int = (select top 1 idCompetitie from Competitie where denumire = @competitie)

	if exists (select * from Participare where idParticipant = @idParticipant and idCompetitie = @idCompetitie)
		update Participare
		set taxa = @taxa, loc = @loc
		where idParticipant = @idParticipant and idCompetitie = @idCompetitie
	else
	begin
		insert into Participare values (@idParticipant, @idCompetitie, @taxa, @loc)
	end
end