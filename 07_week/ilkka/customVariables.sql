select * from information_schema.USER_VARIABLES;
set @x=1;
select * from information_schema.USER_VARIABLES;
select @x;

set @y=2;
select * from information_schema.USER_VARIABLES order by VARIABLE_NAME;
select @y;

-- := operator within sql statement
use employeedb;

select round(avg(salary),2) from employee;

select @avg:=round(avg(salary),2) from employee;
select @avg;
select * from information_schema.USER_VARIABLES order by VARIABLE_NAME;

update employee set salary=@avg where salary<@avg;
delete from employee where salary=@avg;

-- select...into

select round(avg(salary),2) into @a from employee;

-- set
set @z:=(select avg(salary) from employee);
select @z;

select * from information_schema.USER_VARIABLES order by VARIABLE_NAME;
-- to remove variables
flush USER_VARIABLES;
select * from information_schema.USER_VARIABLES order by VARIABLE_NAME;

-- Transactions

select * from employee;
start transaction;
select @avg:=round(avg(salary),2) from employee;
update employee set salary=@avg where salary<@avg;
select * from employee;
rollback; --cancels all changes after start transaction
select * from employee;


start transaction;
select @avg:=round(avg(salary),2) from employee;
update employee set salary=@avg where salary<@avg;
select * from employee;
commit; -- finishes the transaction all changes become permanent
select * from employee;

-- to check if autocommit in on (0=off, 1=on)
select @@autocommit;

-- or (value ON/OFF)
show VARIABLES where Variable_name='autocommit';

set autocommit=0;
select @@autocommit;
set autocommit=1;
select @@autocommit;
show VARIABLES where Variable_name='autocommit';

-- "sub transaction"
start transaction;
select * from employee;
update employee set salary=1000 where salary is null;
select * from employee;
savepoint a;
update employee set department='x' where department is null;
select * from employee;
rollback to a; -- canceled the update after savepoint A
select * from employee;
commit;

-- creating savepoint outside transaction
savepoint a; --doesn't create savepoint
release savepoint a; --gives an error
