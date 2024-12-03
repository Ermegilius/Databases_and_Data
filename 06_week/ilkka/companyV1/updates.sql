use companydb;

select * from department;
select * from employee;

select lastname,firstname, departmentName, departmentFloor 
from employee
inner join department on departmentNumber=departmentId;

update department set departmentName='AI' where departmentId=1;
select * from department;

select lastname,firstname, departmentName, departmentFloor 
from employee
inner join department on departmentNumber=departmentId;

update department set departmentFloor='floor 4' 
where departmentId in (1,2);

 
select * from department;

select lastname,firstname, departmentName, departmentFloor 
from employee
inner join department on departmentNumber=departmentId;
