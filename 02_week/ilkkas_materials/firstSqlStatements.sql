show databases;
create database peopledb;

use peopledb;

create table person( 
    id integer not null primary key, 
    firstname varchar(20) not null, 
    lastname varchar(30) not null, 
    age integer 
);

insert into person (id,firstname,lastname,age) values(1,'Matt','River',25);

select firstname,age from person;

exit
