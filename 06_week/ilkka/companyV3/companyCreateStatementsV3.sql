drop database if exists companydb3;
create database companydb3;

use companydb3;

create table department(
    departmentId integer not null primary key,
    departmentName varchar(20) not null,
    departmentFloor varchar(15) not null
);

create table employee(
    employeeId integer not null primary key,
    firstname varchar(25) not null,
    lastname varchar(30) not null,
    salary decimal(7,2) not null
);

create table workerPosition(
    positionId integer not null primary key,
    positionName varchar(30) not null,
    positionDescription varchar(100)
);

create table workerOfDepartment(
    departmentNumber integer not null,
    employeeNumber integer not null,
    positionNumber integer not null,
    primary key(departmentNumber, employeeNumber,positionNumber),
    foreign key (departmentNumber) references department(departmentId),
    foreign key (employeeNumber) references employee(employeeId),
    foreign key (positionNumber) references workerPosition(positionId)
);

insert into department values(1,'ict','basement');
insert into department values(2,'admin','top floor');
insert into department values(3,'maitenance','workshop');
insert into department values(4,'marketing','fouth floor');
insert into department values(5,'transportation','garage');

insert into employee (employeeId,firstname,lastname,salary)
values(1, 'Mary', 'River', 4000);

insert into employee (employeeId,firstname,lastname,salary)
values(2, 'Matt', 'River', 3000);

insert into employee (employeeId,firstname,lastname,salary)
values(3, 'Amanda', 'Smith', 7000);

insert into employee (employeeId,firstname,lastname,salary)
values(4,'Vera','River',5500);

insert into employee (employeeId,firstname,lastname,salary)
values(5,'Peter','Bond',3000);

insert into employee (employeeId,firstname,lastname,salary)
values(6,'Layla','Driver',4000);

insert into employee (employeeId,firstname,lastname,salary)
values(7,'Joanna','Brown',7000);

insert into workerPosition values(1,'worker','worker is working hard...');
insert into workerPosition values(2,'leader','leader is leading a nice life...');

insert into workerOfDepartment (departmentNumber,employeeNumber,positionNumber)
values(1,1,1);

insert into workerOfDepartment values(1,2,1);
insert into workerOfDepartment values(1,3,2);
insert into workerOfDepartment values(2,3,1);
insert into workerOfDepartment values(5,4,1);
insert into workerOfDepartment values(5,6,2);
insert into workerOfDepartment values(3,5,1);
insert into workerOfDepartment values(2,7,2);

drop user if exists 'littleboss'@'localhost';
create user 'littleboss'@'localhost' identified by '6789';

grant all privileges on companydb3.* to 'littleboss'@'localhost';


