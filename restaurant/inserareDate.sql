use Restaurant

insert into Utilizator values
('musiinator', 'alin2002musat@gmail.com', 'parola1'),
('tudose', 'tudor2002farcas@gmail.com', 'parola2'),
('ditz', 'rares2002dit@gmail.com', 'parola3'),
('suciu', 'radu2002suciu@gmail.com', 'parola4')

insert into TipuriRestaurant values
('fast-food'),
('italienesc'),
('mexican'),
('romanesc');

insert into Oras values
('Targu Mures'),
('Cluj'),
('Brasov'),
('Bucuresti');

insert into Restaurant values
('Pizza rustic', 'gheorghe doja', '0798723450', 4, 1),
('Power fresh', 'piezisa', '0772258255', 1, 2),
('Taqueira', 'Michael Weiss', '0745655883', 3, 3),
('Il Peccato', 'Franceza', '0754189440', 2, 4);

insert into Nota values
(1, 1, 9.3),
(2, 4, 8.5),
(3, 2, 7.0),
(4, 3, 10),
(1, 2, 8),
(2, 2, 4.5);

select * from Oras
select * from TipuriRestaurant
select * from Utilizator
select * from Restaurant
select * from Nota
