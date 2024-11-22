drop database if exists gamedb;
create database gamedb;

use gamedb;

create table game(
    number integer not null primary key,
    name varchar(36) not null,
    year integer not null,
    rating varchar(6) not null,
    genre varchar(17) not null
);
select * from game;

insert into game values(1, 'Alan Wake 2', 2023, '******', 'Survival horror');
select * from game;

update game set rating='*****'
where number = 1;
select * from game;

delete from game
where number = 1;
select * from game;

insert into game values (2,	'Ladybirds',	2000,	'***',	'platformer');
select * from game;
insert into game values (5,	'The Rise and Fall of an Empire 22',	2015,	'****',	'strategy');
select * from game;
insert into game values (7,	'U.F.O',	1995,	'**',	'brain-teaser');
select * from game;
insert into game values (4,	'Jigsaw puzzle',	1990,	'*',	'board game');
select * from game;
insert into game values (6,	'Future 2525',	2005,	'*',	'brain-twister');
select * from game;
insert into game values (3,	'Star Adventure',	2010,	'*****',	'FPS');
select * from game;
insert into game values (1,	'Amnesia 2030',	2018,	'**',	'adventure');
select * from game;

select * from game;

select rating, year, name from game;
select * from game;

select * from game
where rating='*****';
select * from game;

select * from game
where year=2011;
select * from game;

select * from game
where year=2000;
select * from game;

update game set rating='**', year=2015
where number = 2;
select * from game;

update game set rating='**', name='Star Adventure'
where number = 3;
select * from game;

update game set rating='**', name='Future 2525', genre='platformer'
where number = 3;
select * from game;

update game set genre='brain-twister', year=2012, rating='****'
where number = 5;
select * from game;

delete from game
where number = 5;
select * from game;

delete from game
where number = 2;
select * from game;

delete from game
where rating = '*';
select * from game;

delete from game
where genre = 'brain-teaser' or genre='board game'
select * from game;

delete from game
where genre = 'brain-teaser' or genre = 'board game';
select * from game;

delete from game
where name= 'Star Adventure' or year=2000 or year=2015;
select * from game;