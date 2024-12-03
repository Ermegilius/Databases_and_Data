-- Transactions;
select @@autocommit; -- is the engine commits after each line of sql?
show VARIABLES where Variable_name='autocommit'; -- show autocommit variable
set autocommit=0; -- switch off autocommit
set autocommit=0; -- switch on autocommit

select * from employee;
start transaction;
select @avg:=round(avg(salary), 2) from employee;
update employee set salary=@avg where salary<@avg;
select * from employee;
rollback; -- cancels all changes after start transaction
select * from employee;

start transaction;
select @avg:=round(avg(salary), 2) from employee;
update employee set salary=@avg where salary<@avg;
select * from employee;
commit; -- saves all changes after start transaction
select * from employee;

-- Subtransactions (savepoints)
-- https://mariadb.com/kb/en/savepoint/

start transaction;
select * from employee;
update employee ste salary=10000 where salary is null;
savepoint a;
update employee set department='x' where department is null;
select * from employee;
rollback to a; -- cancel the update after savepoint a
select * from employee;
commit;

-- If COMMIT or ROLLBACK is issued and no transaction was started, no error is reported
-- If SAVEPOINT is issued and no transaction was started, no error is reported but no savepoint is created
-- When ROLLBACK TO SAVEPOINT or RELEASE SAVEPOINT is called for a savepoint that does not exist, an error is issued



