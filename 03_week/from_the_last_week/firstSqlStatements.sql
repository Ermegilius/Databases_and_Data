show databases;
drop if exists database peopledb;
create database peopledb;

use peopledb;

create table person( 
    id integer not null primary key, 
    firstname varchar(20) not null, 
    lastname varchar(30) not null,
    hobby varchar(30), 
    age integer 
);

insert into person (id,firstname,lastname,hobby,age) values(1,'Matt','River',null,25);

select firstname,age from person;

exit
