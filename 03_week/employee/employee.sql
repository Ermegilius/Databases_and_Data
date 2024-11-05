
--mysql -u admin -p<employee.sql;
drop database if exists employeedb;

create database employeedb;
use employeedb;

CREATE TABLE `employee` (
  `employeeId` int(11) NOT NULL,
  `firstName` varchar(20) NOT NULL,
  `lastName` varchar(30) NOT NULL,
  `department` varchar(15) DEFAULT NULL,
  `salary` decimal(6,2) DEFAULT NULL,
  PRIMARY KEY (`employeeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--another way to create a table:
-- create table employee(
--     employeeId integer not null primary key,
--     firstName varchar(20) not null,
--     lastName varchar(30) not null,
--     department varchar(15),
--     salary decimal (6,2) -- maximum is 9999.99
--     describe employee;
--     show create table employee;
-- );

--inserts values in the order of columns in create table
insert into employee values(1,'Matt','River','ict',5000);
insert into employee values(2,'Vera','River',null,null);
--inserts values based on the list given
insert into employee (employeeId, firstName,lastName)
values(3,'Mary','Smith');
insert into employee (salary,firstName,employeeId,department,lastName)
values (4000,'Will',4,'ict','Brown');
insert into employee (employeeId,firstName,lastName,department,salary)
values (5,'Amanda','Green','admin',7000);
insert into employee (employeeId,firstName,lastName,department,salary)
values (6,'Bob','White','marketing',7000);

insert into employee values(7,'Vova','Green',null,5000);

-- SELECT
select firstName,lastName from employee;
select distinct lastName from employee;

--order
select distinct lastName from employee
order by lastName;

select distinct lastName from employee
order by lastName asc; --ascending order
select distinct lastName from employee
order by lastName desc; --descending order

select lastName,firstName from employee
order by lastName asc, firstName asc;

select lastName,firstName from employee
order by lastName desc, firstName asc;

select lastName,firstName from employee
order by lastName desc, firstName desc;

select lastName,firstName from employee
order by lastName asc, firstName desc;

select * from employee
order by salary asc;

--where
select * from employee
where lastName = 'River';
select * from employee
where department = 'ict';

--and
select * from employee
where department = 'ict' and lastName = 'River';

--or
select * from employee
where department = 'ict' or lastName = 'Green';

--is null, is not null
select employeeId,firstName,lastName from employee
where department is null;

select employeeId,firstName,lastName from employee
where department is not null;

--<>,!= 'doesn't equals'
select employeeId,firstName,lastName from employee
where lastName<>'River';
select employeeId,firstName,lastName from employee
where lastName!='River';

-- <,>,<=,>= all of these selectors don't include null values
select employeeId,firstName,lastName, salary from employee
where salary<7000;
select employeeId,firstName,lastName, salary from employee
where salary>=7000;

--count() 'counts rows including given value'
select count(*) from employee;--includes null values
select count(salary) from employee; --excludes null values
select count(employeeId) from employee;--not null column (primary key), no values

--count as. Next 3 lines are the same
select count(*) as numberOfRows from employee;
select count(*) as 'number of rows' from employee;
select count(*) 'number of rows' from employee;

--math operations inside select
select count(*)-count(salary) from employee;
select count(*)*count(salary) from employee;
select count(*) from employee where salary is null;
select count(*) as salaryIsMissing from employee where salary is null;

--group by
select lastName, count(*) from employee
group by lastname;

select lastName, count(*) as "number of people" from employee
group by lastname;

select lastName, count(*) as "number of people" from employee
group by lastName
order by "number of people" asc;

select lastName, count(*) as amount from employee
group by lastName
order by amount desc, lastName asc;

--having
select lastName, count(*) as amount from employee
group by lastName having amount>=2
order by amount desc, lastName asc;

--min, max, avg, sum
select min(salary) from employee;
select max(salary) from employee;
select round(avg(salary),2) as average from employee;

select sum(salary) as total from employee;

select
  min(salary) as minimum,
  max(salary) as maximum,
  max(salary)-min(salary) as difference
  from employee;

select max(employeeId)+1 from employee; --get the next free id;

select salary*1.1 as newSalary from employee;
select salary*1.1 as newSalary from employee where employeeId=1;

--rand
select rand();
select firstName,lastName,rand() as x from employee;
select firstName,lastName,rand() as x from employee
order by x asc;

--in, not in
select firstName,lastName from employee
where lastName in('Green','Brown');

select firstName,lastName from employee
where lastName ='Green' or lastName='Brown';--the same one

select firstName,lastName from employee
where lastName not in('Green','Brown');

--between
select employeeId, lastName, salary from employee
where salary between 4000 and 5000;

select employeeId, lastName, salary from employee
where salary >= 4000 <= 5000;--the same one

--like, % 'anu symbols', _ 'a whatever symbol'
select firstName, lastName from employee where firstName like 'M%';
select firstName, lastName from employee where firstName like 'M_t%';
select firstName, lastName from employee where firstName like 'M___';
select firstName, lastName from employee where firstName like 'Ma__';
select firstName, lastName from employee where firstName like 'Ma_y';

insert into employee (employeeId, firstName,lastName,department,salary)
values (8, "Mary_Ann", "Smith", "ict",4500);

insert into employee (employeeId, firstName,lastName,department,salary)
values (9, "Mary-Ann", "Smith", "ict",5500);

insert into employee (employeeId, firstName,lastName,department,salary)
values (10, "Mary%Ann", "Smith", "ict",6500);

select * from employee where firstName like 'Mary_Ann';-- _ still refers to any symbol
select * from employee where firstName like 'Mary\_Ann';-- \ makes it symbol "_"

insert into employee (employeeId, firstName,lastName,department,salary)
values (11, "Mary-Lou Ann", "Smith", "admin",7500);
select * from employee where firstName like 'Mary%Ann';--similar idea