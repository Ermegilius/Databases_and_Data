use companydb;

select * from department;

select * from employee;

-- 4 ways to do the same select from 2 tables in one db:

select firstname, departmentName, departmentFloor from employee
inner join department on departmentNumber=departmentId;

select firstname, departmentName, departmentFloor from employee
inner join department on employee.departmentNumber=department.departmentId;

select employee.firstname, department.departmentName, department.departmentFloor from employee
inner join department on employee.departmentNumber=department.departmentId;

select
    companydb.employee.firstname,
    companydb.department.departmentName,
    companydb.department.departmentFloor
from companydb.employee
inner join companydb.department on
    employee.departmentNumber=department.departmentId;

select firstname,lastname from employee
inner join department on departmentNumber=departmentId
where departmentName='ict';

select firstname,lastname from employee where departmentNumber=1;

select departmentName, departmentFloor from department
inner join employee on departmentNumber=departmentId
where firstname='Vera'and lastname='River';

select firstname,lastname from employee
inner join department on departmentNumber=departmentId
where departmentName='transportation';


select lastname, firstname from employee
inner join department on departmentNumber=departmentId
where departmentName='transportation'
order by lastname asc, firstname asc;

select lastname, firstname from employee, department
where departmentName='transportation' and departmentNumber=departmentId;

select departmentName, departmentFloor from department, employee
where departmentNumber=departmentId and firstname='Vera'and lastname='River';

select avg(salary) as ictAverage from employee
inner join department on departmentNumber=departmentId
where departmentName='ict';

select firstname,lastname,departmentName from employee
inner join department on departmentNumber=departmentId
where salary=(select max(salary)from employee);

select firstname,lastname,departmentName,salary from employee
inner join department on departmentNumber=departmentId
where salary=(select max(salary)from employee);

select firstname,lastname,departmentName,salary from employee
inner join department on departmentNumber=departmentId
where salary>(select avg(salary)from employee);

select departmentName, count(employeeId) as 'number of emps' from department
inner join employee on departmentNumber=departmentId
group by departmentName;

select departmentName, count(employeeId) as 'number of emps' from department
left join employee on departmentNumber=departmentId
group by departmentName;

select departmentName, count(employeeId) as NumOfEmp from department
left join employee on departmentNumber=departmentId
group by departmentName having NumOfEmp=0;

select departmentName, count(employeeId) as NumOfEmp from department
left join employee on departmentNumber=departmentId
group by departmentName having NumOfEmp>0;

select departmentName, count(employeeId) as NumOfEmp from department
left join employee on departmentNumber=departmentId
group by departmentName having NumOfEmp>0;

select departmentName, count(employeeId) as NumOfEmp from department
inner join employee on departmentNumber=departmentId
group by departmentName having NumOfEmp=0;

select firstname,lastname,departmentName,salary, case
    when salary>(select avg(salary) from employee) then 'above average'
    when salary<(select avg(salary) from employee) then 'below average'
    else 'average' end as 'salary level'
from employee
inner join department on departmentNumber=departmentId;