create or alter function functieStatii() returns table
as
	return select distinct statie.nume from Statii statie inner join StatiiRute as sr
	on sr.id_statie = statie.id_statie inner join StatiiRute sr2 on sr2.id_statie = statie.id_statie and sr2.id_ruta != sr.id_ruta
	where (sr.ora_sosirii between sr2.ora_sosirii and sr2.ora_plecarii) or (sr.ora_plecarii 
	between sr2.ora_sosirii and sr2.ora_plecarii)