--Creating a table with just attributes(no keys)
create table HockeyPlayer
(
PlayerID int not null,
LastName varchar(50) not null,
FirstName varchar(50) not null,
JerseyNumber char(2) null,
Team varchar(40) null,
DraftDate smalldatetime not null,
Salary money not null,
ShotPercentages decimal(5,2) null
)

--Drop a table
drop table HockeyPlayer
-- to make changes to a table you must drop it and recreate it.