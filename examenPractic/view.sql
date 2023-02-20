create or alter view viewClienti
as
	select nume as NumeClient, prenume as PrenumeClient from ProdusFavorit pf
	inner join Client c on pf.idClient = c.idClient
	group by nume, prenume
	having count (pf.idClient) <= 3;
	