--use Sala_de_fitness


--CLIENT VALIDARI + CRUD
create or alter function ValidareNumePrenumeClient(@nume varchar(50), @prenume varchar(50)) returns varchar(50)
as
begin
	if (@nume is not null and @prenume is not null)
	begin
		return 'valid';
	end
	return 'invalid';
end

create or alter procedure CreateClient(@nume varchar(50), @prenume varchar(50), @idAntrenor int, @idAbonament int)
as
begin
	if ( dbo.ValidareNumePrenumeClient(@nume, @prenume) = 'valid')
	begin
		insert into Client values (@nume, @prenume, @idAntrenor, @idAbonament)
		print 'S-a adaugat clientul ' + @nume + ' ' + @prenume;
	end
	else print 'Nu s-a putut efectua inserarea clientului!'
end

create or alter procedure ReadClient(@nume varchar(50), @prenume varchar(50))
as
begin
	select * from Client where @nume = nume and @prenume = prenume;
end

create or alter procedure UpdateClient(@nume varchar(50), @prenume varchar(50), @numeNou varchar(50), @prenumeNou varchar(50))
as
begin
	if((select count(nume) from Client where nume = @nume and prenume = @prenume) > 0 and [dbo].ValidareNumePrenumeClient(@numeNou, @prenumeNou) = 'valid')
	begin
		update Client set nume=@numeNou, prenume=@prenumeNou where @nume = nume and @prenume = prenume;
		print 'Clientul ' + @nume + ' ' + @prenume + ' a devenit ' + @numeNou + ' ' + @prenumeNou;
	end
	else
		print 'Nu s-a putut efectua update-ul';
end

create or alter procedure DeleteClient(@nume varchar(50), @prenume varchar(50))
as
begin
	declare @cnt1 int = 0;
	declare @cnt2 int = 0;
	set @cnt1 = (select count(idClient) from Client where @nume = nume and @prenume = prenume);
	delete from Client where nume = @nume and prenume = @prenume;
	set @cnt2 = (select count(idClient) from Client where @nume = nume and @prenume = prenume);
	if @cnt1 = @cnt2
	begin
		print 'Nu exista acest client!';
	end
	else print 'A fost sters clientul ' + @nume + ' ' + @prenume;
end


--APARAT VALIDARI + CRUD
create or alter function ValidareTipAparat(@tip nvarchar(50)) returns varchar(50)
as
begin
	if (@tip is not null)
	begin
		return 'valid';
	end
	return 'invalid';
end

create or alter procedure CreateAparat(@tip nvarchar(50), @idFurnizor int)
as
begin
	if (dbo.ValidareTipAparat(@tip) = 'valid')
	begin
		insert into Aparat values (@tip, @idFurnizor);
		print 'S-a adaugat aparatul ' + @tip;;
	end
	else print 'Nu s-a putut adauga aparatul!';
end

create or alter procedure ReadAparat(@tip nvarchar(50))
as
begin
	select * from Aparat where @tip = tip;
end

create or alter procedure UpdateAparat(@tip nvarchar(50), @tipNou nvarchar(50))
as
begin
	if((select count(tip) from Aparat where tip = @tip) > 0 and [dbo].ValidareTipAparat(@tipNou) = 'valid')
	begin
		update Aparat set tip = @tipNou where @tip = tip;
		print 'Aparatul ' + @tip + ' a devenit ' + @tipNou;
	end
	else
		print 'Nu s-a putut efectua update-ul';
end

create or alter procedure DeleteAparat(@tip nvarchar(50))
as
begin
	declare @cnt1 int = 0;
	declare @cnt2 int = 0;
	set @cnt1 = (select count(idAparat) from Aparat where @tip = tip);
	delete from Aparat where tip = @tip;
	set @cnt2 = (select count(idAparat) from Aparat where @tip = tip);
	if @cnt1 = @cnt2
	begin
		print 'Nu exista acest aparat!';
	end
	else print 'S-a sters aparatul ' + @tip;
end


--EXERCITIU CRUD
create or alter procedure CreateExercitiu(@idClient int, @idAparat int)
as
begin
	if ((select count(idClient) from Exercitiu where
	idClient = @idClient and idAparat = @idAparat) = 0)
	begin
		insert into Exercitiu values (@idClient, @idAparat)
		declare @numeClient varchar(50);
		declare @numeAparat varchar(50);
		set @numeClient = (select nume from Client where idClient = @idClient);
		set @numeAparat = (select tip from Aparat where idAparat = @idAparat);
		print 'S-a adaugat exercitiul dintre clientul ' + @numeClient + ' si aparatul ' +  @numeAparat; 
	end
	else print 'Nu s-a putut crea exercitiul deoarece exista unul identic deja!'
end

create or alter procedure ReadExercitiu(@idClient int, @idAparat int)
as
begin
	select idClient, idAparat from Exercitiu where idClient = @idClient and idAparat = @idAparat;
end

create or alter procedure UpdateExercitiu(@idClient int, @idAparat int, @idClientNou int, @idAparatNou int)
as
begin
	if((select count(idClient) from Exercitiu where idClient = @idClientNou
	and idAparat = @idAparatNou) = 0 and (select count(idClient) from Exercitiu where idClient = @idClient
	and idAparat = @idAparat) > 0)
	begin
		declare @numeClient varchar(50);
		declare @numeAparat nvarchar(50);
		declare @numeClientNou varchar(50);
		declare @numeAparatNou nvarchar(50);
		set @numeClient = (select nume from Client where idClient = @idClient);
		set @numeAparat = (select tip from Aparat where idAparat = @idAparat);
		set @numeClientNou = (select nume from Client where idClient = @idClientNou);
		set @numeAparatNou = (select tip from Aparat where idAparat = @idAparatNou);
		print 'S-a modificat exercitiul dintre clientul ' + @numeClient + ' si aparatul ' +  @numeAparat + ' cu valorile ' + @numeClientNou + ' si ' + @numeAparatNou;
		update Exercitiu set idClient = @idClientNou, idAparat = @idAparatNou where idClient = @idClient and idAparat = @idAparat;
	end
	else print 'Nu s-a putut efectua update-ul!';
end

create or alter procedure DeleteExercitiu(@idClient int, @idAparat int)
as
begin
	declare @cnt1 int
	declare @cnt2 int;
	set @cnt1 = (select count(idClient) from Exercitiu where idClient = @idClient and idAparat = @idAparat);
	delete from Exercitiu where @idClient = idClient and @idAparat = idAparat;
	set @cnt2 = (select count(idClient) from Exercitiu where idClient = @idClient and idAparat = @idAparat);
	if @cnt1 = @cnt2
	begin
		print 'Nu exista acest exercitiu!';
	end
	else
	begin
		declare @numeClient varchar(50);
		declare @numeAparat varchar(50);
		set @numeClient = (select nume from Client where idClient = @idClient);
		set @numeAparat = (select tip from Aparat where idAparat = @idAparat);
		print 'A fost sters exercitiul dintre clientul ' + @numeClient + ' si aparatul ' + @numeAparat;
	end
end

create or alter procedure ClientCRUD
as 
begin
	exec CreateClient @nume = 'Farcas', @prenume = 'Dan', @idAntrenor = 2540683, @idAbonament = 16;
	exec ReadClient @nume = 'Farcas', @prenume = 'Dan';
	exec UpdateClient @nume = 'Farcas', @prenume = 'Dan', @numeNou = 'Cindea', @prenumeNou = 'Radu';
	exec DeleteClient @nume = 'Cindea', @prenume = 'Radu';
end

create or alter procedure AparatCRUD
as
begin
	exec CreateAparat @tip = 'ChestPress', @idFurnizor = 4;
	exec ReadAparat @tip = 'ChestPress';
	exec UpdateAparat @tip = 'ChestPress', @tipNou = 'Abductor';
	exec DeleteAparat @tip = 'Abductor';
end

create or alter procedure ExercitiuCRUD
as
begin
	exec CreateExercitiu @idClient = 39016, @idAparat = 23013;
	exec ReadExercitiu @idClient = 39016, @idAparat = 23013;
	exec UpdateExercitiu @idClient = 39016, @idAparat = 23013, @idClientNou = 39019, @idAparatNou = 23016;
	exec DeleteExercitiu @idClient = 39019, @idAparat = 23016;
end

select * from Client
select * from Aparat
select * from Exercitiu

exec ClientCRUD
exec AparatCRUD
exec ExercitiuCRUD

--Afiseaza clientii al caror prenume incepe cu litera A
--NonClustered pe tabela Client dupa prenume
create or alter view vw1
as
	select * from Client c
	where c.prenume like 'A%'

--Afiseaza aparatele la care se lucreaza
--Clustered pe tabela Exercitiu dupa id-ul exercitiului
--NonClustered pe tabela Aparat dupa tipul aparatului
create or alter view vw2
as
	select ap.tip, ap.idAparat
	from Exercitiu ex
	inner join Aparat ap on
	ex.idAparat = ap.idAparat

if exists (select name from sys.indexes where name = 'index_client_prenume')
drop index index_client_prenume on Client;
create nonclustered index index_client_prenume on Client(prenume);
if exists (select name from sys.indexes where name = 'index_aparat_tip')
drop index index_aparat_tip on Aparat;
create nonclustered index index_aparat_tip on Aparat(tip);
if exists (select name from sys.indexes where name = 'index_idAparat_exercitiu')
drop index index_idAparat_exercitiu on Exercitiu;
create nonclustered index index_idAparat_exercitiu on Exercitiu(idAparat);

select * from Aparat
select * from Client

SELECT OBJECT_NAME(object_id) AS TableName, index_id, user_seeks, user_scans, user_lookups
FROM sys.dm_db_index_usage_stats
WHERE OBJECT_NAME(object_id) IN ('Client', 'Aparat', 'Exercitiu');

select * from vw1
select * from vw2

SELECT OBJECT_NAME(A.[OBJECT_ID]) AS [OBJECT NAME],
 I.[NAME] AS [INDEX NAME],
 A.LEAF_INSERT_COUNT,
 A.LEAF_UPDATE_COUNT,
 A.LEAF_DELETE_COUNT
FROM SYS.DM_DB_INDEX_OPERATIONAL_STATS (NULL,NULL,NULL,NULL ) A INNER JOIN SYS.INDEXES AS I
 ON I.[OBJECT_ID] = A.[OBJECT_ID] AND I.INDEX_ID = A.INDEX_ID
WHERE OBJECTPROPERTY(A.[OBJECT_ID],'IsUserTable') = 1


/*
create or alter procedure addClients
as
begin
	declare @count int = 0;
	while(@count<=1000000)
	begin
		insert into Client values ('Iortoman' + CAST(@count as varchar(50)), 'Alex' + CAST(@count as varchar(50)), 2540683, 16);
		set @count = @count + 1;
	end
end

create or alter procedure addExercices
as
begin
	declare @count int = 0;
	declare @id int;
	declare @tip varchar(50);
	while(@count<=1000)
	begin
		set @tip = 'Aparat' + CAST(1000000-@count as varchar(50));
		insert into Aparat values (@tip, 4);
		set @id = (select idAparat from Aparat where tip = @tip);
		insert into Exercitiu values (@id, 39016);
		set @count = @count + 1;
	end
end


create or alter procedure index1Efficiency
as
begin
	exec addClients
	declare @start1 datetime;
	declare @finish1 datetime;
	declare @start2 datetime;
	declare @finish2 datetime;
	set @start1 = getdate();
	select * from vw1;
	set @finish1 = getdate();
	print 'Durata executiei viewului 1 fara index non-clustered este de ' + CAST(DATEDIFF(millisecond, @start1, @finish1) as varchar(50)) + ' milisecunde';
	create nonclustered index index_client_prenume on Client(prenume);
	set @start2 = getdate();
	select * from vw1;
	set @finish2 = getdate();
	print 'Durata executiei viewului 1 cu index non-clustered este de ' + CAST(DATEDIFF(millisecond, @start2, @finish2) as varchar(50)) + ' milisecunde';
	delete from Client where prenume like 'Alex%'
	drop index index_client_prenume on Client;
end

create or alter procedure index2Efficiency
as
begin
	exec addExercices
	declare @start1 datetime;
	declare @finish1 datetime;
	declare @start2 datetime;
	declare @finish2 datetime;
	set @start1 = getdate();
	select * from vw2;
	set @finish1 = getdate();
	print 'Durata executiei viewului 2 fara index non-clustered este de ' + CAST(DATEDIFF(millisecond, @start1, @finish1) as varchar(50)) + ' milisecunde';
	create nonclustered index index_aparat_tip on Aparat(tip);
	set @start2 = getdate();
	select * from vw2;
	set @finish2 = getdate();
	print 'Durata executiei viewului 2 cu index non-clustered este de ' + CAST(DATEDIFF(millisecond, @start2, @finish2) as varchar(50)) + ' milisecunde';
	delete from Aparat where tip like 'Aparat%'
	delete from Exercitiu
	drop index index_aparat_tip on Aparat;
end

exec index1Efficiency
exec index2Efficiency*/
