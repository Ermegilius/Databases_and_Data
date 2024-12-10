select * from information_schema.USER_VARIABLES;
set @x=1;
select * from information_schema.USER_VARIABLES;
set @x;

set @y=2;
select * from information_schema.USER_VARIABLES;
set @y;

--:= operator within sql statement
use employeedb;

select round(avg(salary),2) from employee;

select @avg:=round(avg(salary),2) from employee;
select @avg;
select * from information_schema.USER_VARIABLES order by VARIABLE_NAME;

update employee set salary=@avg where salary<@avg;
delete from employee where salary=@avg;


--select...into
select round(avg(salary),2) into @a from employee;

-- set
set @z=(select avg(salary) from employee);
select @z;

-- delete all custom variables
flush USER_VARIABLES;
select * from information_schema.USER_VARIABLES orderer by VARIABLE_NAME;