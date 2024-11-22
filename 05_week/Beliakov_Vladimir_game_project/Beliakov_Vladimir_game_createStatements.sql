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

insert into game values(1, 'Max Payne', 2001, '*****', 'TPS');
insert into game values(2, 'Alan Wake 2', 2023, '******', 'Survival horror');

drop user if exists 'ava'@'localhost';
create user 'ava'@'localhost' identified by 'BBl6sE6x';
grant all privileges on gamedb.* to 'ava'@'localhost';