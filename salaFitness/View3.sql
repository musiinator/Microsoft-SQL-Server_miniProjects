create view View_3 as
	select a.nume as NumeAntrenor, c.nume as NumeClient, ap.tip as NumeAparat
	from Antrenor a inner join Client c  on a.idAntrenor=c.idAntrenor
	cross join Aparat ap group by a.nume, c.nume, ap.tip
go
