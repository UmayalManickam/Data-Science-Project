     -- TASK 1 CREATING DATABASE
create database if not exists ABC_Inc;
	 -- TASK 2 CREATING TABLE FOR 3 STARTUPS
use ABC_Inc;
create table if not exists A_SQL(Employee_ID int,Age int,Proficiency varchar(50));
create table if not exists B_Oracle like A_SQL;
create table if not exists C_HTML like A_SQL;
	 -- TASK 3 INSERTING DATA
insert into A_SQL(Employee_ID,Age,Proficiency) value(1,18,'LOW'),(2,20,'MEDIUM'),(3,25,'MEDIUM'),(4,28,'HIGH'),(5,30,'LOW');
insert into B_Oracle(Employee_ID,Age,Proficiency) value(1,17,'MEDIUM'),(2,19,'HIGH'),(3,22,'LOW'),(4,24,'MEDIUM'),(5,31,'HIGH');
insert into C_HTML(Employee_ID,Age,Proficiency) value(1,21,'HIGH'),(2,22,'LOW'),(3,23,'MEDIUM'),(4,26,'LOW'),(5,35,'HIGH');
describe A_SQL;select * from A_SQL;
describe B_Oracle;select * from B_Oracle;
describe C_HTML;select * from C_HTML;
	 -- TASK 4 RENAMING
alter table B_Oracle rename to B_SQL;
     -- TASK 5 DELETING AND INSERTING DATA
truncate B_SQL;
insert into B_SQL select * from A_SQL where Employee_ID<=3;
select * from B_SQL;
     -- TASK 6 DELETING TABLE
drop table C_HTML;
	-- TASK 7 MERGING AND RENAMING TABLE
insert into A_SQL select * from B_SQL;
drop table B_SQL;
alter table A_SQL rename to AB_SQL;
select * from AB_SQL;












