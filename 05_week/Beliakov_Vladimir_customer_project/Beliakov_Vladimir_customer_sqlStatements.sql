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
select * from customer;

insert into customer values(1, 'Sam', 'Lake', 'Class_1', 'Vanilla');
select * from customer;

insert into customer values(2, 'Alex', 'Casey', 'Class_2', 'Salmiakki');
select * from customer;

update customer set firstname='Sami', lastname='Järvi'
where customerId = 1;
select * from customer;

delete from customer
where customerId = 1;
select * from customer;

select * from customer
where lastname='Casey';
select * from customer;

insert into customer values(5000, 'Abel', 'Smith', 'R.I.P', 'blueberry');
select * from customer;
insert into customer values(2000,'Sophie','Garcia','OrdinaryPenPusher','toffee');
select * from customer;
insert into customer values(6543,'Olivia','River','SolidGold','vanilla');
select * from customer;
insert into customer values(1000,'Matt','Irony','VIP','chocolate');
select * from customer;
insert into customer values(4123,'Layla','Lake','ToBeAwoided','caramel');
select * from customer;
insert into customer values(3000,'Paula','Hammer','KeyCustomer','strawberry');
select * from customer;
insert into customer values(7987,'Jeff','Bell','SuperBonus','raspberry');
select * from customer;

select * from customer;

select customerId, customerclass, favouriteIceCream from customer;
select * from customer;

select * from customer
where firstname = 'Layla';
select * from customer;

select * from customer
where favouriteIceCream = 'strawberry';
select * from customer;

select * from customer
where customerclass = 'KeyCustomer';
select * from customer;

update customer set lastname = 'Irony', customerclass = 'VIP'
where customerId=2000;
select * from customer;

update customer set lastname = 'Smith', customerclass = 'toBeAwoided'
where customerId=1000;
select * from customer;

update customer set lastname = 'Smith', customerclass = 'OrdinaryPenPusher', favouriteIceCream='raspberry'
where customerId=6543;
select * from customer;

update customer set firstname='Jeff', customerclass = 'R.I.P', favouriteIceCream='strawberry'
where customerId=4123;
select * from customer;

delete from customer
where customerId = 6543;
select * from customer;

delete from customer
where customerId = 4123;
select * from customer;

delete from customer
where favouriteIceCream = 'raspberry';
select * from customer;

delete from customer
where customerclass = 'SuperBonus' and favouriteIceCream = 'raspberry';
select * from customer;

delete from customer
where lastname = 'Smith' or favouriteIceCream = 'vanilla' or firstname = 'Paula';
select * from customer;