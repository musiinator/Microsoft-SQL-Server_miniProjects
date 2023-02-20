create or alter view viewRestaurant
as
	select numeRestaurant as NumeRestaurant, avg(n.nota) as MediaNotelor from
	Nota n inner join Restaurant r on r.idRestaurant = n.idRestaurant
	group by numeRestaurant
	having avg(n.nota)>=5