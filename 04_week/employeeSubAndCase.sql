use employeedb;

describe employee;

select * from employee;

select lastname,firstname,salary from employee
where salary=(select min(salary) from employee);

select lastname,firstname,salary from employee
where salary=(select max(salary) from employee);

select avg(salary) from employee;

select lastname,firstname,salary from employee
where salary>(select avg(salary) from employee);

select lastname,firstname,salary from employee
where salary<=(select avg(salary) from employee);

update employee set salary=(select coalesce(round(salary*1.1), 3000))
where employeeId in (1,2,7,9);

select employeeId, firstname,lastname, round(salary,1) as salary 
from employee;

select coalesce(round(salary*1.1 ,1), 3000) from employee;

update employee set salary=null where employeeId=9;

select firstname, lastname, salary, case
  when salary is null then 'salary missing'
  else 'ok' end as checkSalary
from employee;

select firstname,lastname,salary, case
  when salary is null then 'salary missing'
  when salary=(select min(salary) from employee) then 'min'
  when salary=(select max(salary) from employee) then 'max'
  else '' end as minmax 
from employee;

select employeeId, case
  when salary is null then 'salary missing'
  when salary=(select min(salary) from employee) then 'min'
  when salary=(select max(salary) from employee) then 'max'
  else '' end as minmax 
from employee;

select firstname,lastname,salary, 
    case
        when salary is null then 'salary missing'
        when salary=(select min(salary) from employee) then 'min'
        when salary=(select max(salary) from employee) then 'max'
        else '' end as minmax,
    case
        when salary>6000 then 'Top worker'
        else '' end as bonus
from employee;

select firstname,lastname,salary, 
    case
        when salary is null then 'salary missing'
        when salary>6000 then 'Top worker'
        when salary=(select min(salary) from employee) then 'min'
        when salary=(select max(salary) from employee) then 'max'
        else '' end as minmax
from employee;

select firstname,lastname,salary, 
    case
        when salary is null then 'salary missing'
        when salary=(select min(salary) from employee) then 'min'
        when salary=(select max(salary) from employee) then 'max'
        when salary>6000 then 'Top worker'
        else '' end as minmax
from employee;

select firstname, lastname, salary, case
  when salary is null then 'salary missing'
  end as checkSalary
from employee;

select firstname, lastname,salary, case
  when salary is null then 'no value'
  when salary<4000 then 'less than 4000'
  when salary<6000 then '4000<=salary<6000'
  when salary<8000 then '6000<=salary<8000'
  else 'salary>=8000' end as 'interval'
from employee;

select lastname,firstname, 
  case
    when salary is null then 'no value'
    when salary<4000 then 'less than 4000'
    when salary<6000 then '4000<=salary<6000'
    when salary<8000 then '6000<=salary<8000'
    else 'salary>=8000' end as 'interval',
  case
    when salary is null then 0
    when salary<4000 then 1
    when salary<6000 then 2
    when salary<8000 then 3
    else 4 end as 'type'
from employee
order by type asc, lastname asc, firstname asc;