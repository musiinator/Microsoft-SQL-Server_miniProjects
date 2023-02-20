use Produse

insert into Locatie values
('Targu Mures', 'Pandurilor', 42, 543216),
('Cluj Napoca', 'Observatorului', 88, 467822),
('Turda', 'Republicii', 5, 556234);

insert into Magazin values
('de piese auto', 2014, 1),
('mixt', 2019, 2),
('alimentar', 2021, 3);

insert into Client values
('Musat', 'Alin', 'masculin', '2002-10-21'),
('Suciu', 'Radu', 'masculin', '2002-09-09'),
('Farcas', 'Tudor', 'masculin', '2002-03-31'),
('Cindea', 'Radu', 'masculin', '2003-01-15');

insert into ProdusFavorit values
('cauciucuri de iarna', 850, 20, 1),
('prajitura cu mere', 10, 30, 2),
('kinder bueno', 3, 10, 3),
('aqua carpatica', 4, 30, 4),
('ciocan', 35, 20, 1),
('paleta de tenis', 130, 0, 1),
('hamac', 320, 50, 1);

insert into Achizitie values
(1, 1, '2022-11-10', 850),
(2, 2, '2023-01-02', 10),
(2, 3, '2021-12-21', 50),
(4, 3, '2015-07-20', 22);

select * from Locatie
select * from Magazin
select * from Client
select * from ProdusFavorit
select * from Achizitie