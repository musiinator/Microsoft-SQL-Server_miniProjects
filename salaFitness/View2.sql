create view View_2 as
	select a.nume as NumeAntrenor, c.nume as NumeClient
	from Antrenor a inner join Client c ON a.idAntrenor=c.idAntrenor
go
