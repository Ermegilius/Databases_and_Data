use employeedb;
select * from employee;
select firstname,lastname from employee;
select lastname,firstname from employee;

select lastname from employee;
select distinct lastname from employee;
select distinct lastname from employee order by lastname;
select distinct lastname from employee order by lastname asc;
select distinct lastname from employee order by lastname desc;

select lastname,firstname from employee
order by lastname asc, firstname asc;

select lastname,firstname from employee
order by lastname asc, firstname desc;

select lastname,firstname from employee
order by lastname desc, firstname desc;

select lastname,firstname from employee
order by lastname desc, firstname asc;

select lastname, firstname from employee order by salary asc;

select employeeId,firstname,lastname from employee where lastname='River';

select employeeId,firstname,lastname from employee 
where lastname='River'
order by firstname asc;

select employeeId,firstname,lastname from employee 
where department='ict';

select employeeId,firstname,lastname from employee 
where department='ict' and lastname='River';

select employeeId, firstname, lastname from employee
where department='ict' or lastname='Green';


select employeeId, firstname from employee
where department is null;

select employeeId, firstname from employee
where salary is null;

select employeeId, firstname from employee
where department is not null;

select firstname, lastname from employee where lastname<>'River';

select firstname, lastname from employee where lastname!='River';

select employeeId,firstname,salary from employee where salary<7000;

select employeeId,firstname,salary from employee where salary>7000;

select employeeId,firstname,salary from employee where salary>=7000;

select employeeId,firstname,salary from employee where salary<=7000;

select count(*) from employee; -- includes null values
select count(salary) from employee; -- excludes null 
-- employeeId column is not null so no null values in the column
select count(employeeId) from employee; 

select count(*) as numberOfRows from employee;
select count(*) as "number Of Rows" from employee;
select count(*) "number Of Rows" from employee;
select count(*)-count(salary) from employee;
select count(*) from employee where salary is null;
select count(*) as salaryMissing from employee where salary is null;
select count(*)-count(salary) as salaryMissing from employee;

select lastname, count(*) from employee
group by lastname;

select lastname, count(*) as amount from employee
group by lastname;

select lastname, count(*) as amount from employee
group by lastname order by amount asc;

select lastname, count(*) as amount from employee
group by lastname order by amount desc;

select lastname, count(*) as amount from employee
group by lastname 
order by amount desc, lastname asc;

select lastname, count(*) as amount from employee
where lastname in('River','Brown','Green')
group by lastname 
order by amount desc, lastname asc;

select lastname, count(*) as amount from employee
group by lastname having amount>=2 
order by amount desc, lastname asc;

select lastname, count(*) as amount from employee
where lastname in('River','Brown','Green')
group by lastname having amount>=2
order by amount desc, lastname asc;

select lastname, count(*) from employee
group by lastname having count(*)>=2;


insert into employee (employeeId,firstname,lastname,department)
values(7,'Mary','River','admin');

select min(salary) from employee;
select min(salary) as minimum from employee;

select max(salary) as maximum from employee;
select avg(salary) as average from employee;
select round(avg(salary),2) as average from employee;

select sum(salary) as total from employee;

select 
    min(salary) as minimum, 
    max(salary) as maximum, 
    max(salary)-min(salary) as difference
from employee;

select salary*1.1 as newSalary from employee;
select salary*1.1 as newSalary from employee where employeeId=1;

select rand();
select firstname,lastname,rand() as x from employee;

select firstname,lastname,rand() as x from employee
order by x asc;

select firstname,lastname from employee where lastname in('Green','Brown');

select firstname, lastname from employee
where lastname='Green' or lastname='Brown';

select firstname,lastname from employee 
where lastname not in('Green','Brown');

select employeeId, lastname,salary from employee
where salary between 4000 and 5000;

select employeeId, lastname,salary from employee
where salary>=4000 and salary<=5000;

select firstname,lastname from employee where firstname like 'M%';

select firstname,lastname from employee where firstname like 'M_t%';
select firstname,lastname from employee where firstname like 'Ma__';
select firstname,lastname from employee where firstname like 'Ma_y';
select firstname,lastname from employee where lastname like '%n';

insert into employee (employeeId,firstname,lastname,department,salary)
values(8,'Mary_Ann','Smith','ict',4500);

insert into employee (employeeId,firstname,lastname,department,salary)
values(9,'Mary-Ann','Smith','ict',5500);

insert into employee (employeeId,firstname,lastname,department,salary)
values(10,'Mary%Ann','Smith','ict',6500);

insert into employee (employeeId,firstname,lastname,department,salary)
values(11,'Mary-Lou Ann','Smith','admin',8500);

select * from employee where firstname like 'Mary_Ann';
select * from employee where firstname like 'Mary\_Ann';

select * from employee where firstname like 'Mary%Ann';
select * from employee where firstname like 'Mary\%Ann';

select * from employee where firstname like 'Mary'; -- Don't do this
select * from employee where firstname ='Mary'; -- Do this