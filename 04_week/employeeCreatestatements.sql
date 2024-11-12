drop database if exists employeedb;
create database employeedb;

use employeedb;

create table employee(
    employeeId integer not null primary key,
    firstname varchar(25) not null,
    lastname varchar(30) not null,
    department varchar(15),
    salary decimal(7,2) -- 99999.99
);

-- inserts in the order of colums in create table
insert into employee values(1,'Matt','River','ict',5000);
insert into employee values(2, 'Vera','River',null,null);

-- inserts value based on the list given
insert into employee (employeeId,firstname,lastname)
values(3,'Mary','Smith');

insert into employee 
(salary,firstname,employeeId, department,lastname)
values(4000, 'Will',4,'ict','Brown');

insert into employee 
(employeeId, firstname,lastname,department,salary)
values(5,'Amanda','Green','admin',7000);

insert into employee
(employeeId, firstname,lastname,department,salary)
values(6,'Matty','Green','marketing',7000);