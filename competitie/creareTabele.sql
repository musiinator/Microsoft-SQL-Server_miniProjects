use Competitie

create table Oras
(idOras int primary key identity,
regiune varchar(50),
tara varchar(50));

create table TipCompetitie
(idTip int primary key identity,
denumire varchar(50),
descriere varchar(50));

create table Competitie
(idCompetitie int primary key identity,
dataIncepere date,
dataFinalizare date,
idTip int foreign key references TipCompetitie(idTip),
idOras int foreign key references Oras(idOras));

create table Participant
(idParticipant int primary key identity,
nume varchar(50),
prenume varchar(50),
gen varchar(50),
dataNastere date);

create table Participare
(idParticipant int foreign key references Participant(idParticipant),
idCompetitie int foreign key references Competitie(idCompetitie),
taxa int,
loc int,
constraint pk_participare primary key(idParticipant, idCompetitie));