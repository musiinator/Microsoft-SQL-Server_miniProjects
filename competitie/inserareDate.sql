use Competitie

insert into TipCompetitie values
('triatlon', 'concurs de alergare'),
('ChessMate', 'mindgame'),
('Dreamhack', 'online games');

insert into Oras values
('Transilvania', 'Romania'),
('Debrecen', 'Ungaria'),
('Hessen', 'Germania');

insert into Competitie values
('competitie1', '2019-05-21', '2019-05-22', 1, 1),
('competitie2', '2020-10-23', '2020-10-27', 3, 3),
('competitie3', '2021-11-11', '2021-12-11', 2, 1);


insert into Participant values
('Musat', 'Alin', 'masculin', '2002-10-21'),
('Popescu', 'Radu', 'masculin', '2002-09-09'),
('Farcas', 'Alex', 'masculin', '2002-03-31'),
('Moldovan', 'Ovidiu', 'masculin', '2003-01-15');

insert into Participare values
(13, 1, 50, 2),
(14, 1, 30, 1),
(15, 2, 100, 1),
(16, 3, 70, 4);