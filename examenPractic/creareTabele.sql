use Produse

create table Locatie
(idLocatie int primary key identity,
localitate varchar(50),
strada varchar(50),
numar int,
codPostal varchar(50));

create table Magazin
(idMagazin int primary key identity,
denumire varchar(50),
anDeschidere int,
idLocatie int foreign key references Locatie(idLocatie));

create table Client
(idClient int primary key identity,
nume varchar(50),
prenume varchar(50),
gen varchar(50),
dataNastere date);

create table ProdusFavorit
(idProdus int primary key identity,
denumire varchar(50),
pret int,
reducere int,
idClient int foreign key references Client(idClient));

create table Achizitie
(idClient int foreign key references Client(idClient),
idMagazin int foreign key references Magazin(idMagazin),
dataAchizitie date,
pret int,
constraint pk_achizitie primary key(idClient, idMagazin));
