-------------------------------------------------LAB 1------------------------------------------------------------------

use labb_baze

create table Player
(
	pid int primary key,
	username varchar(200),
	player_level int
)

create table Class
(
	cid INT primary key,
	pid int references Player(pid),
	class_name VARCHAR(200),
	prim_attack VARCHAR(200),
	base_hp INT
)


create table Ability
(
	aid int primary key,
	cid int references Class(cid),
	ability_name varchar(200),
	mana_cost int
)

create table Item
(
	Iid int primary key,
	cid int references Class(cid),
	item_name varchar(200),
	price money
)

create table Helliquary
(
	hid int primary key,
	pid int references Player(pid),
	helli_name varchar(200),
	scoria_needed tinyint
)

create table Shadow
(
	rid int primary key,
	pid int references Player(pid),
	rank_name varchar(200),
	xp_needed int
)

create table ChallengeRift
(
	chalID int primary key,
	pid int references Player(pid),
	current_rank int
)

create table ElderRift
(
	elderID int primary key,
	pid int references Player(pid),
	elder_name varchar(200),
	selected_crests tinyint
)


create table Gem
(
	gid int primary key,
	Iid int references Item(Iid),
	gem_name varchar(200),
	gem_rarity varchar(200)
)

create table Clan
(
	clanID int primary key,
	pid int references Player(pid),
	clan_name varchar(200),
	clan_capacity tinyint
)

create table Loadout
(
	lid int primary key,
	pid int references Player(pid),
	cid int references Class(cid),
	loadout_name varchar(200),
	loadout_rating int
)

insert into Player(pid,username,player_level) values(1,'ProGamer',372)
insert into Player(pid,username,player_level) values(2,'MicuPrinZZ',342)
insert into Player(pid,username,player_level) values(3,'Promise',872)
insert into Player(pid,username,player_level) values(4,'Notice',736)
insert into Player(pid,username,player_level) values(5,'Fizica',523)

insert into Class(cid,pid,class_name,prim_attack,base_hp) values(1,1,'Barbarian','Lacerate',3200)
insert into Class(cid,pid,class_name,prim_attack,base_hp) values(2,2,'Necromancer','Soul Fire', 3000)
insert into Class(cid,pid,class_name,prim_attack,base_hp) values(3,3,'Crusader','Punish', 3150)
insert into Class(cid,pid,class_name,prim_attack,base_hp) values(4,4,'Monk','Fist of Thunder',3300)
insert into Class(cid,pid,class_name,prim_attack,base_hp) values(5,5,'Wizard','Maelstorm', 2800)
--insert violating referential integrity
insert into Class(cid,pid,class_name,prim_attack,base_hp) values(6,6,'Witch Doctor','Poison Dart',2800)

insert into Ability(aid,cid,ability_name,mana_cost) values(1,3,'Whirling Strike',50)
insert into Ability(aid,cid,ability_name,mana_cost) values(2,1,'Ragnarok',65)
insert into Ability(aid,cid,ability_name,mana_cost) values(3,4,'The prayer',75)
insert into Ability(aid,cid,ability_name,mana_cost) values(4,2,'Sacrifice',45)
insert into Ability(aid,cid,ability_name,mana_cost) values(5,5,'Mjolnir',30)

insert into Item(Iid,cid,item_name,price) values(1,1,'Helm of Juggernaut',5000)
insert into Item(Iid,cid,item_name,price) values(2,5,'Staff of Esben',7500)
insert into Item(Iid,cid,item_name,price) values(3,2,'Skull of Sacrifice',4000)

insert into Gem(gid,Iid,gem_name,gem_rarity) values(1,2,'Gem of clearance','Legendary')
insert into Gem(gid,Iid,gem_name,gem_rarity) values(2,1,'Gem of vitality','Epic')
insert into Gem(gid,Iid,gem_name,gem_rarity) values(3,3,'Gem of regeneration','Rare')

insert into Helliquary(hid,pid,helli_name,scoria_needed) values(1,2,'Hell IV', 5)
insert into Helliquary(hid,pid,helli_name,scoria_needed) values(2,1,'Hell II', 3)
insert into Helliquary(hid,pid,helli_name,scoria_needed) values(3,4,'Inferno I', 45)
insert into Helliquary(hid,pid,helli_name,scoria_needed) values(4,5,'Hell VI', 30)
insert into Helliquary(hid,pid,helli_name,scoria_needed) values(5,3,'Hell VII',35)

insert into Shadow(rid,pid,rank_name,xp_needed) values(1,1,'Apprentice I',500)
insert into Shadow(rid,pid,rank_name,xp_needed) values(3,2,'Shadow III', 2500)
insert into Shadow(rid,pid,rank_name,xp_needed) values(4,5,'Captain I', 5000)
insert into Shadow(rid,pid,rank_name,xp_needed) values(5,3,'Apprentice IV',1400)

insert into ChallengeRift(chalID,pid,current_rank) values(1,2,7)
insert into ChallengeRift(chalID,pid,current_rank) values(2,5,12)
insert into ChallengeRift(chalID,pid,current_rank) values(3,3,15)

insert into ElderRift(elderID,pid,elder_name,selected_crests) values(1,2,'Level 1',3)
insert into ElderRift(elderID,pid,elder_name,selected_crests) values(2,1,'Level 4',3)
insert into ElderRift(elderID,pid,elder_name,selected_crests) values(3,3,'Level 6',3)
insert into ElderRift(elderID,pid,elder_name,selected_crests) values(4,4,'Level 10',3)

insert into Clan(clanID,pid,clan_name,clan_capacity) values(1,5,'Destroyers',100)
insert into Clan(clanID,pid,clan_name,clan_capacity) values(2,3,'Informaticienii',75)
insert into Clan(clanID,pid,clan_name,clan_capacity) values(3,2,'Clanul Sportivilor',80)
insert into Clan(clanID,pid,clan_name,clan_capacity) values(4,4,'Clanul Duduienilor',90)
insert into Clan(clanID,pid,clan_name,clan_capacity) values(5,NULL,'ABCFD',50)

insert into Loadout(lid,pid,cid,loadout_name,loadout_rating) values(1,2,3,'PvE',18732)
insert into Loadout(lid,pid,cid,loadout_name,loadout_rating) values(2,3,1,'PvP',63183)
insert into Loadout(lid,pid,cid,loadout_name,loadout_rating) values(3,2,4,'PvE 2',32621)

update Clan set clan_capacity = 110 where clan_capacity > 90 AND clan_capacity < 120
update Player set username = 'ShadowSlayer' where pid = 2
update Item set price = 9000 where price BETWEEN 3000 AND 7500

delete from Loadout where lid = 1 OR lid = 3
delete from Class where base_hp > 3200

select * from Player
select * from Class
select * from Ability
select * from Item
select * from Gem
select * from ChallengeRift
select * from ElderRift
select * from Shadow
select * from Helliquary
select * from Clan
select * from Loadout

drop table Player
drop table Class
drop table Item
drop table Ability
drop table Gem
drop table ChallengeRift
drop table ElderRift
drop table Shadow
drop table Helliquary
drop table Clan
drop table Loadout

--------------------------------------------------------LAB 2-----------------------------------------------------------

-- Using UNION ALL all players, clans and their ids
SELECT pid, username FROM Player
UNION ALL
SELECT cid, class_name FROM Class;

-- Using UNION and OR
SELECT hid, helli_name FROM Helliquary WHERE scoria_needed < 10
UNION
SELECT TOP 3 elderID, elder_name FROM ElderRift WHERE selected_crests > 2;


-- Using INTERSECT  top 3 players in clans
SELECT pid FROM Player
INTERSECT
SELECT TOP 3 pid FROM Clan;

-- Using IN top 3 players with clans
SELECT TOP 3 pid, username FROM Player WHERE pid IN (SELECT pid FROM Clan);

-- Using EXCEPT all players in clans
SELECT clanID, clan_name FROM Clan
EXCEPT
SELECT clanID, clan_name FROM Clan WHERE pid IS NULL;

-- Using NOT IN  all clans without players
SELECT clanID, clan_name FROM Clan 
WHERE clanID NOT IN (SELECT clanID FROM Clan WHERE pid IS NOT NULL);

-- Using INNER JOIN
SELECT p.pid, p.username, c.class_name, a.ability_name FROM Player p
INNER JOIN Class c ON p.pid = c.pid
INNER JOIN Ability a ON c.cid = a.cid;

-- LEFT JOIN
SELECT P.pid, L.loadout_name
FROM Player P
LEFT JOIN Loadout L ON P.pid = L.pid;

-- RIGHT JOIN
SELECT L.loadout_name, C.class_name
FROM Loadout L
RIGHT JOIN Class C ON L.cid = C.cid;

-- FULL JOIN
SELECT P.username, C.class_name
FROM Player P
FULL JOIN Class C ON P.pid = C.pid;

-- Using IN with a subquery
SELECT username
FROM Player
WHERE pid IN (SELECT pid FROM Class);

-- Using IN with a subquery in its own WHERE clause   all abilities with mana cost greater than 50
SELECT ability_name
FROM Ability
WHERE ability_name IN (SELECT ability_name FROM Ability WHERE mana_cost > 50);

-- Using EXISTS with a subquery  
SELECT username
FROM Player P
WHERE EXISTS (SELECT * FROM Clan C WHERE P.pid = C.pid);

-- Using EXISTS with a subquery in its own WHERE clause  all classes with ability mana cost less than 50
SELECT class_name
FROM Class C
WHERE EXISTS (SELECT * FROM Ability A WHERE C.cid = A.cid AND A.mana_cost < 50);

-- Using a subquery in the FROM clause   all players username and their classes
SELECT T1.username, T2.class_name
FROM (SELECT * FROM Player) AS T1
JOIN (SELECT * FROM Class) AS T2 ON T1.pid = T2.pid;

-- Using a subquery in the FROM clause with aggregation    average base_hp of the classes
SELECT AVG(T1.base_hp) AS average_base_hp
FROM (SELECT * FROM Class) AS T1;

-- Using GROUP BY with HAVING     number of players with the class
SELECT cid, COUNT(*) AS class_count
FROM Class
GROUP BY cid
HAVING COUNT(*) > 0;

-- Using GROUP BY with HAVING and subquery   number of items 
SELECT pid, COUNT(*) AS item_count
FROM Item, Player
GROUP BY pid
HAVING COUNT(*) < (SELECT AVG(price) FROM Item);

-- Using GROUP BY with aggregation    classes ids with their base_hp
SELECT cid, MAX(base_hp) AS max_base_hp
FROM Class
GROUP BY cid;

-- Using GROUP BY with aggregation and subquery in HAVING    players ids with their base_hp less than the average
SELECT pid, MIN(base_hp) AS min_base_hp
FROM Class
GROUP BY pid
HAVING MIN(base_hp) < (SELECT AVG(base_hp) FROM Class);

-- Using ANY   all players ids in a clan with the capacity greater than 80
SELECT *
FROM Player
WHERE pid = ANY (SELECT pid FROM Clan WHERE clan_capacity > 80);


-- Using ALL   the class name and base hp, with the base hp greater than the class Barbarian
SELECT class_name, base_hp
FROM Class
WHERE base_hp > ALL (SELECT base_hp FROM Class WHERE class_name = 'Barbarian');


-- Using ANY with aggregation 
SELECT *
FROM Player
WHERE pid = ANY (SELECT pid FROM Clan 
				 GROUP BY pid
				 HAVING MAX(clan_capacity) > 80
				);


-- Using ALL with aggregation
SELECT class_name, MAX(base_hp) as max_base_hp
FROM Class
GROUP BY class_name
HAVING MAX(base_hp) > ALL (SELECT base_hp FROM Class WHERE class_name = 'Barbarian');

-- Using IN    all items with gems equipped
SELECT *
FROM Item
WHERE Iid IN (SELECT Iid FROM Gem);

-- Using NOT IN   all classes without items
SELECT *
FROM Class
WHERE cid NOT IN (SELECT cid FROM Item);


----------------------------------------------------------LAB 3----------------------------------------------------------

-- a. modify the type of a column;
-- modify player level from int to tiny int
CREATE OR ALTER PROCEDURE setPlayerLevelToBigInt
AS
	ALTER TABLE Player 
		ALTER COLUMN player_level BIGINT
GO

-- reverse operation: modify player level from tiny int to int

CREATE OR ALTER PROCEDURE setPlayerLevelToInt 
AS
	ALTER TABLE Player 
		ALTER COLUMN player_level INT
GO

-- b. add / remove a column;
-- add number of characters created

CREATE OR ALTER PROCEDURE addNoCharactersToPlayer 
AS
	ALTER TABLE Player 
		ADD no_characters INT
GO

-- remove number of characters from player

CREATE OR ALTER PROCEDURE removeNoCharactersFromPlayer 
AS
	ALTER TABLE Player
		DROP COLUMN no_characters
GO

-- c. add / remove a DEFAULT constraint;
-- add default level 0 to player

CREATE OR ALTER PROCEDURE addDefaultToPlayerLevelFromPlayer 
AS
	ALTER TABLE Player
		ADD CONSTRAINT default_level
			DEFAULT 0 FOR player_level
GO

-- remove default rank from player

CREATE OR ALTER PROCEDURE removeDefaultFromPlayerLevelFromPlayer
AS
	ALTER TABLE Player
		DROP CONSTRAINT default_level
GO

-- g. create / drop a table.
-- create table NPCs

CREATE OR ALTER PROCEDURE addTableNPCs
AS
	CREATE TABLE NPCs (
		id INT NOT NULL,
		npc_name VARCHAR(50),
		no_quests INT,
		cid INT
	)
GO

-- drop table NPCs

CREATE OR ALTER PROCEDURE dropTableNPCs
AS
	DROP TABLE IF EXISTS NPCs
GO

-- d. add / remove a primary key;
-- set id from NPCs as primary key

CREATE OR ALTER PROCEDURE addPrimaryKeyNPCs
AS
	ALTER TABLE NPCs
	ADD CONSTRAINT pk_id PRIMARY KEY(id)
GO

-- remove id primary key from NPCs

CREATE OR ALTER PROCEDURE removePrimaryKeyNPCs
AS
	ALTER TABLE NPCs
	DROP CONSTRAINT IF EXISTS pk_id
GO

-- e. add / remove a candidate key;
-- add candidate key to class

CREATE OR ALTER PROCEDURE addCandidateKeyToClass
AS
	ALTER TABLE Class
		ADD CONSTRAINT class_ck UNIQUE (cid, class_name, prim_attack, base_hp)
GO

-- remove candidate key from class

CREATE OR ALTER PROCEDURE removeCandidateKeyFromClass
AS
	ALTER TABLE Class
		DROP CONSTRAINT IF EXISTS class_ck
GO

-- f. add / remove a foreign key;
-- add cid from NPCs as foreign key

CREATE OR ALTER PROCEDURE addForeignKey
AS
	ALTER TABLE NPCs
		ADD CONSTRAINT fk_cid
			FOREIGN KEY(cid) REFERENCES Class(cid) ON DELETE CASCADE
GO

-- remove foreign key cid from NPCs

CREATE OR ALTER PROCEDURE removeForeignKey
AS
	ALTER TABLE NPCs
		DROP CONSTRAINT IF EXISTS fk_cid
GO

-- versions table

CREATE TABLE versionsTable (
	version INT
)

INSERT INTO versionsTable VALUES (1) --the initial version

CREATE TABLE proceduresTable (
	fromVersion INT,
	toVersion INT,
	PRIMARY KEY(fromVersion, toVersion),
	procedureName VARCHAR(100)
)

INSERT INTO proceduresTable
	(fromVersion, toVersion, procedureName)
VALUES
	(1, 2, 'setPlayerLevelToBigInt'),
	(2, 1, 'setPlayerLevelToInt'),
	(2, 3, 'addNoCharactersToPlayer'),
	(3, 2, 'removeNoCharactersFromPlayer'),
	(3, 4, 'addDefaultToPlayerLevelFromPlayer '),
	(4, 3, 'removeDefaultFromPlayerLevelFromPlayer'),
	(4, 5, 'addTableNPCs'),
	(5, 4, 'dropTableNPCs'),
	(5, 6, 'addPrimaryKeyNPCs'),
	(6, 5, 'removePrimaryKeyNPCs'),
	(6, 7, 'addCandidateKeyToClass'),
	(7, 6, 'removeCandidateKeyFromClass'),
	(7, 8, 'addForeignKey'),
	(8, 7, 'removeForeignKey');

CREATE OR ALTER PROCEDURE goToVersion(@newVersion INT) 
AS
	DECLARE @curr INT
	DECLARE @procedureName VARCHAR(100)
	SELECT @curr = version FROM versionsTable

	IF  @newVersion > (SELECT MAX(toVersion) FROM proceduresTable) OR  @newVersion < (SELECT MIN(toVersion) FROM proceduresTable)
		RAISERROR ('Bad version', 10, 1)
	ELSE
	BEGIN
		IF @newVersion = @curr
			PRINT('Already on this version!');
		ELSE
		BEGIN
			IF @curr > @newVersion
			BEGIN
				WHILE @curr > @newVersion
				BEGIN
					SELECT @procedureName = procedureName FROM proceduresTable 
					WHERE fromVersion = @curr AND toVersion = @curr - 1
					PRINT('executing: ' + @procedureName);
					EXEC(@procedureName)
					SET @curr = @curr - 1
				END
			END

			IF @curr < @newVersion
			BEGIN
				WHILE @curr < @newVersion
					BEGIN
						SELECT @procedureName = procedureName FROM proceduresTable
						WHERE fromVersion = @curr AND toVersion = @curr + 1
						PRINT('executing: ' + @procedureName);
						EXEC (@procedureName)
						SET @curr = @curr + 1
					END
			END

			UPDATE versionsTable SET version = @newVersion
		END
	END
GO

EXEC goToVersion 0
EXEC goToVersion 1
EXEC goToVersion 2
EXEC goToVersion 3
EXEC goToVersion 4
EXEC goToVersion 5
EXEC goToVersion 6
EXEC goToVersion 7
EXEC goToVersion 8
EXEC goToVersion 9


SELECT * FROM proceduresTable;
SELECT * FROM versionsTable;
SELECT * FROM Player;