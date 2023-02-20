use Gara
insert into TipuriTren(descriere) values
('marfar'), ('de calatori'), ('trenurile soarelui'), ('tren de jucarie');

insert into Tren(nume, id_tip_tren) values
('Thomas', 2), ('Toby', 1), ('Edward', 3), ('Gordon', 4);

insert into Rute(nume, id_tren) values
('Cluj-Mures', 1), ('Sighisoara-Costinesti', 2), ('Iasi-Cluj', 3), ('Bucuresti-Ploiesti', 4);

insert into Statii(nume) values
('Gara mica'), ('Gara mare'), ('Gara de nord'), ('Gara de sud'), ('Gara Brasov');

insert into StatiiRute(id_statie, id_ruta, ora_sosirii, ora_plecarii) values
(1, 2, '12:00:00', '12:10:00'),
(3, 4, '19:30:00', '19:45:00'),
(1, 3, '12:05:00', '12:20:00'),
(2, 2, '13:20:00', '13:45:00'),
(3, 2, '15:25:00', '15:35:00'),
(4, 2, '17:55:00', '18:00:00');

select * from StatiiRute