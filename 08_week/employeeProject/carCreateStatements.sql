drop database if exists cardb;
create database cardb;

use cardb;

create table cars(
    carId integer not null primary key,
    model varchar(30) not null,
    price decimal(7,2) not null
);

insert into cars (carId, model, price) values (1, 'GT', 20000);
insert into cars (carId, model, price) values (2, 'Fast', 60000);

drop user if exists 'driver'@'localhost';
create user 'driver'@'localhost' identified by 'driver123';
grant all privileges on cardb.cars to 'driver'@'localhost';

select carId, model, price from cars;

select carId, model, price from cars
where carId=1;

update cars set model='newModel', price = 30000
where carId=1;

delete from cars
where carId=1;

insert into cars (carId, model, price) values (1, 'GT', 20000);

select * from cars;