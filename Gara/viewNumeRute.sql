create or alter view NumeRute
as
	select ruta.nume from Rute ruta inner join StatiiRute sr
	on sr.id_ruta = ruta.id_ruta
	group by ruta.nume
	having count (*) = (select count(*) from Statii)