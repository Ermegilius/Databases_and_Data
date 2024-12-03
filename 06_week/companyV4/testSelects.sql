use companydb4;

show tables;

select * from department;
select * from workerPosition;
select * from employee;

select firstname,lastname,departmentName,positionName from employee
inner join department on department.departmentId=employee.departmentId
inner join workerPosition on workerPosition.positionId=employee.positionId;

select firstname,lastname,departmentName,positionName from employee
inner join department on employee.departmentId=department.departmentId
inner join workerPosition on employee.positionId=workerPosition.positionId;

select firstname,lastname,departmentName,positionName from employee
natural join department
natural join workerPosition;

select firstname,lastname,departmentName,positionName from employee
natural join department
natural join workerPosition
order by positionRank asc;

select firstname,lastname,departmentName,positionName from employee
natural join department
natural join workerPosition
order by positionName asc;

select firstname,lastname,departmentName,positionName from employee
natural join department
natural join workerPosition
order by departmentName asc, positionRank asc, lastname asc, firstname asc;

update employee set departmentId=1 where employeeId=1;
update employee set departmentId=2 where employeeId=5;

update workerPosition set positionName='Team leader' where positionName='leader';

select employeeId, firstname, departmentId, departmentName
from employee
natural join department;

select firstname,lastname,positionName from employee
natural join workerPosition
where positionRank<10
order by positionRank;



select avg(salary) as AverageSalary from employee
natural join department
natural join workerPosition
where positionRank<10;

select avg(salary) from employee
where positionId in (1,2);