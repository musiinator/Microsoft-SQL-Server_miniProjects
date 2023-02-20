create or alter view viewCompetitii
as
	select top 10 denumire as Denumire, count (*) as nrParticipanti from Participare p
	inner join Competitie c on p.idCompetitie = c.idCompetitie
	group by denumire, p.idCompetitie
	order by nrParticipanti desc