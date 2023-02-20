use Restaurant

create table TipuriRestaurant
(idTip int primary key identity,
descriere varchar(50));

create table Oras
(idOras int primary key identity,
numeOras varchar(50));

create table Restaurant
(idRestaurant int primary key identity,
numeRestaurant varchar(50),
adresa varchar(50),
nrTelefon varchar(50),
idTip int foreign key references TipuriRestaurant(idTip),
idOras int foreign key references Oras(idOras));

create table Utilizator
(idUtilizator int primary key identity,
numeUtilizator varchar(50),
adresaMail varchar(50),
parola varchar(50));

create table Nota
(idUtilizator int foreign key references Utilizator(idUtilizator),
idRestaurant int foreign key references Restaurant(idRestaurant),
nota float,
constraint fk_nota primary key(idUtilizator, idRestaurant));



