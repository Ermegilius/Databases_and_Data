drop database if exists customerdb;
create database customerdb;

use customerdb;

create table customer(
    customerId integer not null primary key,
    firstname varchar(8) not null,
    lastname varchar(11) not null,
    customerclass varchar(17) not null,
    favouriteIceCream varchar(12) not null
);

insert into customer values(1, 'Sam', 'Lake', 'Class 1', 'Vanilla');
insert into customer values(1, 'Sami', 'Järvi', 'Class 2', 'Salmiakki');

drop user if exists 'michael'@'localhost';
create user 'michael'@'localhost' identified by 'BLLTlGxV';
grant all privileges on customerdb.* to 'michael'@'localhost'