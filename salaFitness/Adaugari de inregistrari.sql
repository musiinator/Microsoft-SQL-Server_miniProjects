USE Sala_de_fitness
INSERT INTO Abonament(tip, durata, pret)
VALUES ('MAX-GOLD', '12 luni', 1000)
INSERT INTO Abonament(tip, durata, pret)
VALUES ('GOLD', '6 luni', 600)
INSERT INTO Abonament(tip, durata, pret)
VALUES ('Silver', '3 luni', 350)
INSERT INTO Abonament(tip, durata, pret)
VALUES ('Standard', '30 de zile', 130)
INSERT INTO Abonament(tip, durata, pret)
VALUES ('DayPass', 'o zi', 30)


USE Sala_de_fitness
INSERT INTO Antrenor(nume, prenume, varsta)
VALUES ('Gorea', 'Claudiu', 35)
INSERT INTO Antrenor(nume, prenume, varsta)
VALUES ('Moldovan', 'Cosmin', 20)
INSERT INTO Antrenor(nume, prenume, varsta)
VALUES ('Farcas', 'Ovidiu', 28)
INSERT INTO Antrenor(nume, prenume, varsta)
VALUES ('Muresan', 'Laurentiu', 32)
INSERT INTO Antrenor(nume, prenume, varsta)
VALUES ('Popescu', 'Tudor', 23)
INSERT INTO Antrenor(nume, prenume, varsta)
VALUES ('Mihai', 'Constantin', 28)
INSERT INTO Antrenor(nume, prenume, varsta)
VALUES ('Cozma', 'Vlad', 32)

USE Sala_de_fitness
INSERT INTO Client(nume, prenume, idAntrenor, idAbonament)
VALUES ('Musat', 'Alin', 5, 9)
INSERT INTO Client(nume, prenume, idAntrenor, idAbonament)
VALUES ('Moldovan', 'Rares', 1, 10)
INSERT INTO Client(nume, prenume, idAntrenor, idAbonament)
VALUES ('Suciu', 'Radu', 1, 12)
INSERT INTO Client(nume, prenume, idAntrenor, idAbonament)
VALUES ('Farcas', 'Tudor', 5, 9)
INSERT INTO Client(nume, prenume, idAntrenor, idAbonament)
VALUES ('Dit', 'Rares', 2, 11)

USE Sala_de_fitness
INSERT INTO Furnizor(denumire)
VALUES ('TechnoGym')
INSERT INTO Furnizor(denumire)
VALUES ('Matrix')
INSERT INTO Furnizor(denumire)
VALUES ('Ziva')

USE Sala_de_fitness
INSERT INTO Manager
VALUES ('Popa', 'Madalin', 1),('Bucur', 'Liviu', 1),('Stancu', 'Lorena', 2)

INSERT INTO Manager
VALUES ('Moldovan', 'Radu', 2)

ALTER TABLE Program
ALTER COLUMN oraDeschidere INT

USE Sala_de_fitness
INSERT INTO Aparat(tip, idFurnizor)
VALUES ('ChestPress', 1)
INSERT INTO Aparat(tip, idFurnizor)
VALUES ('Abductor', 1)
INSERT INTO Aparat(tip, idFurnizor)
VALUES ('ElipticalBike', 2)
INSERT INTO Aparat(tip, idFurnizor)
VALUES ('LegExtension', 3)
INSERT INTO Aparat(tip, idFurnizor)
VALUES ('BenchPress', 2)

USE Sala_de_fitness
INSERT INTO Exercitiu
VALUES(1,1),(1,3),(3,4),(2,2),(3,2);

INSERT INTO Adresa
VALUES ('Cluj', 'Observatorului', 12)
INSERT INTO Adresa
VALUES ('TgMures', 'Pandurilor', 2)
INSERT INTO Adresa
VALUES ('Oradea', 'Liliacului', 29)

INSERT INTO Angajat
VALUES ('Nedelcu', 'Alexandru', 1, 1)
INSERT INTO Angajat
VALUES ('Nastasa', 'Stefan', 2, 2)
INSERT INTO Angajat
VALUES ('Murariu', 'Tudor', 3, 3)
INSERT INTO Angajat
VALUES ('Neacsu', 'Stefan', 3, 3)
INSERT INTO Angajat
VALUES ('Neacsu', 'Stefan', 3, 3)


USE Sala_de_fitness
Select * from Abonament
Select * from Antrenor
Select * from Client
Select * from Furnizor
Select * from Manager
Select * from Adresa
Select * from Angajat
Select * from Aparat
Select * from Exercitiu