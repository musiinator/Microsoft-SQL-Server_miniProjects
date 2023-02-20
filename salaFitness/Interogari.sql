USE Sala_de_fitness

-- 5 interogari cu WHERE
SELECT idAbonament, tip
FROM Abonament
WHERE pret<=500

SELECT *
FROM Antrenor
WHERE varsta<30
ORDER BY nume

SELECT *
FROM Antrenor
WHERE idAntrenor<5
ORDER BY varsta

SELECT nume,prenume
FROM Client
WHERE nume like 'M%' OR prenume like 'R%'
ORDER BY nume DESC

SELECT denumire
FROM Furnizor
WHERE denumire like '%i%'

-- 2 interogari cu DISTINCT
SELECT DISTINCT idAbonament
FROM Client

SELECT DISTINCT varsta
FROM Antrenor

-- 3 interogari cu GROUP BY
SELECT AVG(varsta) AS varsta_medie
FROM Antrenor

SELECT idAbonament, AVG(pret) AS PretMediu, SUM(pret) AS PretTotal
FROM Abonament
GROUP BY idAbonament

SELECT COUNT(idAntrenor) AS NrAntrenori, varsta
FROM Antrenor
GROUP BY varsta

SELECT COUNT(idClient) AS NrClienti, idAntrenor
FROM Client
GROUP BY idAntrenor
HAVING COUNT(idClient) > 1;

SELECT COUNT(idAntrenor) AS NrAntrenori, varsta
FROM Antrenor
GROUP BY varsta
HAVING varsta > 30;

-- 7 interogari ce extrag informatii din mai mult de 2 tabele
SELECT A.idAntrenor, A.nume, A.prenume, A.varsta
FROM Antrenor A
INNER JOIN Client C
ON A.nume = C.nume OR A.prenume = C.prenume

SELECT C.idClient, A.idAntrenor
FROM Antrenor A
INNER JOIN Client C
ON A.idAntrenor = C.idAntrenor

SELECT A.tip, F.denumire
FROM Aparat A
INNER JOIN Furnizor F
ON A.idFurnizor = F.idFurnizor

--Afiseaza o singura data toate tipurile de abonament utilizate de catre clienti
SELECT Ab.tip as TipAbonament
FROM Abonament Ab
LEFT OUTER JOIN Client C
ON Ab.idAbonament = C.idAbonament
LEFT OUTER JOIN Antrenor An
ON C.idAntrenor = An.idAntrenor
GROUP BY Ab.tip



--Afiseaza antrenorii, clientii, si tipul de abonamente pe care le folosesc acestia
SELECT An.nume as NumeAntrenor, C.nume as NumeClient, Ab.tip as TipAbonament
FROM Antrenor An
INNER JOIN Client C
ON An.idAntrenor = C.idAntrenor
INNER JOIN Abonament Ab
ON C.idAbonament = Ab.idAbonament

--Afiseaza toti managerii care au mai mult de un angajat si adresa la care lucreaza, respectiv nr de angajati
SELECT M.nume as NumeManager, Ad.oras, Ad.strada, Ad.numar, COUNT(M.idManager) AS NumarAngajati
FROM Manager M
LEFT OUTER JOIN Angajat An
ON An.idManager = M.idManager
LEFT OUTER JOIN Adresa Ad
ON An.idAdresa = Ad.idAdresa
GROUP BY M.nume, Ad.oras, Ad.strada, Ad.numar
HAVING COUNT(M.idManager) > 1

--Afiseaza numele managerului si adresa din CJ sau MS la care lucreaza angajatii sai
SELECT M.nume as NumeManager, An.nume as NumeClient, Ad.oras, Ad.strada, Ad.numar
FROM Manager M
INNER JOIN Angajat An
ON An.idManager = M.idManager
INNER JOIN Adresa Ad
ON An.idAdresa = Ad.idAdresa
WHERE Ad.oras like 'Cluj' OR Ad.oras like 'TgMures'

--Afiseaza liniile distincte ce contin numele managerului si adresa la care lucreaza angajatii sai
SELECT DISTINCT M.nume as NumeManager, An.nume as NumeClient, Ad.oras, Ad.strada, Ad.numar
FROM Manager M
INNER JOIN Angajat An
ON An.idManager = M.idManager
INNER JOIN Adresa Ad
ON An.idAdresa = Ad.idAdresa

--Afiseaza toate aparatele si clientii care lucreaza la ele/NULL daca e liber
SELECT C.nume, A.tip AS NumeAparat
FROM Client C
RIGHT OUTER JOIN Exercitiu E
ON C.idClient = E.idClient
RIGHT OUTER JOIN Aparat A
ON E.idAparat = A.idAparat
WHERE A.idAparat > 1

--Afiseaza o singura data aparatele la care se lucreaza
SELECT DISTINCT A.tip AS NumeAparat
FROM Client C
INNER JOIN Exercitiu E
ON C.idClient = E.idClient
INNER JOIN Aparat A
ON E.idAparat = A.idAparat

--Afiseaza numele antrenorului si numarul de exercitii executate de clientii sai
SELECT An.nume AS NumeAntrenor, COUNT(An.idAntrenor) AS NumarExercitii
FROM Antrenor An
LEFT OUTER JOIN Client C
ON C.idAntrenor = An.idAntrenor
LEFT OUTER JOIN Exercitiu E
ON E.idClient = C.idClient
LEFT OUTER JOIN Aparat Ap
ON E.idAparat = Ap.idAparat
WHERE An.nume like 'Gorea'
GROUP BY An.nume
HAVING COUNT(An.idAntrenor) > 2

--Afiseaza doar clientii care lucreaza, respectiv aparatul
SELECT C.nume, A.tip
FROM Client C
INNER JOIN Exercitiu E
ON C.idClient = E.idClient
INNER JOIN Aparat A
ON E.idAparat = A.idAparat
WHERE A.tip like 'Abductor'

--Afiseaza toti clientii si aparatul la care lucreaza sau NULL
SELECT C.nume, A.tip
FROM Client C
LEFT OUTER JOIN Exercitiu E
ON C.idClient = E.idClient
LEFT OUTER JOIN Aparat A
ON E.idAparat = A.idAparat
WHERE C.nume like 'M%' OR C.nume like 'S%'


