drop database if exists companydb;
create database companydb;

use companydb;

create table department(
    departmentId integer not null primary key,
    departmentName varchar(20) not null,
    departmentFloor varchar(15) not null
);

create table employee(
    employeeId integer not null primary key,
    firstname varchar(25) not null,
    lastname varchar(30) not null,
    salary decimal(7,2) not null,
    departmentNumber integer not null,
    foreign key (departmentNumber) references department(departmentId)
);

insert into department values(1,'ict','basement');
insert into department values(2,'admin','top floor');
insert into department values(3,'maitenance','workshop');
insert into department values(4,'marketing','fouth floor');
insert into department values(5,'transportation','garage');

insert into employee (employeeId,firstname,lastname,salary,departmentNumber)
values(1, 'Mary', 'River', 4000, 1);

insert into employee (employeeId,firstname,lastname,salary,departmentNumber)
values(2, 'Matt', 'River', 3000, 1);

insert into employee (employeeId,firstname,lastname,salary,departmentNumber)
values(3, 'Amanda', 'Smith', 7000, 2);

insert into employee (employeeId,firstname,lastname,salary,departmentNumber)
values(4,'Vera','River',5500,5);

insert into employee (employeeId,firstname,lastname,salary,departmentNumber)
values(5,'Peter','Bond',3000,3);

insert into employee (employeeId,firstname,lastname,salary,departmentNumber)
values(6,'Layla','Driver',4000,5);

insert into employee (employeeId,firstname,lastname,salary,departmentNumber)
values(7,'Joanna','Brown',7000,2);

drop user if exists 'bigboss'@'localhost';
create user 'bigboss'@'localhost' identified by '1234';

grant all privileges on companydb.* to 'bigboss'@'localhost';

