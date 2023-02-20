create database Gara
go
use Gara
create table TipuriTren
(id_tip_tren int primary key identity,
descriere varchar(50));

create table Tren
(id_tren int primary key identity,
nume varchar(50),
id_tip_tren int foreign key references TipuriTren(id_tip_tren));

create table Rute
(id_ruta int primary key identity,
nume varchar(50),
id_tren int foreign key references Tren(id_tren));

create table Statii
(id_statie int primary key identity,
nume varchar(50));

create table StatiiRute
(id_statie int foreign key references Statii(id_statie),
id_ruta int foreign key references Rute(id_ruta),
ora_sosirii time,
ora_plecarii time
constraint pk_StatiiRute primary key (id_statie, id_ruta));



